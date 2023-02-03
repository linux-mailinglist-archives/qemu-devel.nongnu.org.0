Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FF8689459
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 10:50:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNsh2-0000UN-NJ; Fri, 03 Feb 2023 04:49:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1pNsh0-0000Te-2w; Fri, 03 Feb 2023 04:49:14 -0500
Received: from proxmox-new.maurer-it.com ([94.136.29.106])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1pNsgy-0002zr-3X; Fri, 03 Feb 2023 04:49:13 -0500
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id B7C0045216;
 Fri,  3 Feb 2023 10:49:07 +0100 (CET)
Message-ID: <c35c0bc5-5d60-ad74-c1d3-6c50745201f3@proxmox.com>
Date: Fri, 3 Feb 2023 10:48:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] block/mirror: add 'write-blocking-after-ready' copy mode
Content-Language: en-US
To: "Denis V. Lunev" <den@virtuozzo.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-devel@nongnu.org
Cc: t.lamprecht@proxmox.com, jsnow@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com, eblake@redhat.com, armbru@redhat.com,
 qemu-block@nongnu.org, Alexander Ivanov <alexander.ivanov@virtuozzo.com>
References: <20221207132719.131227-1-f.ebner@proxmox.com>
 <c120932d-a1a7-5904-3f17-10a7c9ac69af@yandex-team.ru>
 <926be172-1d8a-e896-c051-3c37d048771b@virtuozzo.com>
 <c3982fa3-be00-9cb2-7d71-5f784ac80864@proxmox.com>
 <cac5cf55-b4ef-90d7-1598-f8118fa4018a@virtuozzo.com>
From: Fiona Ebner <f.ebner@proxmox.com>
In-Reply-To: <cac5cf55-b4ef-90d7-1598-f8118fa4018a@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=94.136.29.106; envelope-from=f.ebner@proxmox.com;
 helo=proxmox-new.maurer-it.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.09,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 02.02.23 um 12:09 schrieb Denis V. Lunev:
> On 2/2/23 11:19, Fiona Ebner wrote:
>> Am 31.01.23 um 19:18 schrieb Denis V. Lunev:
>>> Frankly speaking I do not like this. I'd better would not
>>> rely on the enable/disable of the whole bitmap but encode
>>> mode into MirrorOp and mark blocks dirty only for those
>>> operations for which in_active_mode was set at the
>>> operation start.
>>>
>> Do you mean "for which in_active_mode was *not* set at the operation
>> start"? Also, the dirty bitmap gets set by things like the
>> bdrv_co_pwritev() call in bdrv_mirror_top_do_write(), so how would we
>> prevent setting it? The dirty bitmap does get reset in
>> do_sync_target_write(), so maybe that already takes care of it, but I
>> didn't check in detail.
>>
> I thought about something like this
> 
> iris ~/src/qemu $ git diff
> diff --git a/block/mirror.c b/block/mirror.c
> index 634815d78d..9cf5f884ee 100644
> --- a/block/mirror.c
> +++ b/block/mirror.c
> @@ -230,7 +230,9 @@ static void coroutine_fn
> mirror_write_complete(MirrorOp *op, int ret)
>      if (ret < 0) {
>          BlockErrorAction action;
> 
> -        bdrv_set_dirty_bitmap(s->dirty_bitmap, op->offset, op->bytes);
> +        if (op->need_dirty) {
> +            bdrv_set_dirty_bitmap(s->dirty_bitmap, op->offset, op->bytes);
> +        }

I might be missing something, but what do we gain by making this
conditional? Doesn't this even mess up e.g. the case where the error
action is 'ignore'? AFAIU, the bitmap is reset in mirror_iteration() and
if there is a write error to the target, we need to set the bitmap here
to make sure we try again later.

What is the issue with disabling the bitmap when entering synchronous
mode? From that point on, we don't care about recording new writes to
the source in the bitmap, because they will be synced to the target
right away. We still need to set the bitmap here in the error case of
course, but that happens with the code as-is.

Best Regards,
Fiona

>          action = mirror_error_action(s, false, -ret);
>          if (action == BLOCK_ERROR_ACTION_REPORT && s->ret >= 0) {
>              s->ret = ret;
> @@ -437,6 +439,7 @@ static unsigned mirror_perform(MirrorBlockJob *s,
> int64_t offset,
>          .offset         = offset,
>          .bytes          = bytes,
>          .bytes_handled  = &bytes_handled,
> +        .need_dirty     = s->job->copy_mode !=
> MIRROR_COPY_MODE_WRITE_BLOCKING;
>      };
>      qemu_co_queue_init(&op->waiting_requests);
> 
> iris ~/src/qemu $
> 
> Den
> 
> 



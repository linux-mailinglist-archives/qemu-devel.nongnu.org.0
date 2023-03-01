Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C156A7127
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 17:32:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXPNF-0005EG-84; Wed, 01 Mar 2023 11:32:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pXPN9-0005DW-Q8; Wed, 01 Mar 2023 11:32:09 -0500
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pXPN8-0001vK-3h; Wed, 01 Mar 2023 11:32:07 -0500
Received: from mail-nwsmtp-smtp-corp-main-11.iva.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-11.iva.yp-c.yandex.net
 [IPv6:2a02:6b8:c0c:2cab:0:640:424b:0])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id AAA7E5FCA4;
 Wed,  1 Mar 2023 19:31:54 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b71b::1:14] (unknown
 [2a02:6b8:b081:b71b::1:14])
 by mail-nwsmtp-smtp-corp-main-11.iva.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id rVY6p60OmmI0-sVocgsE5; Wed, 01 Mar 2023 19:31:54 +0300
X-Yandex-Fwd: 1
Authentication-Results: mail-nwsmtp-smtp-corp-main-11.iva.yp-c.yandex.net;
 dkim=pass
Message-ID: <0e9d40ac-42c8-698f-ee75-4cbc5bfe7fa5@yandex-team.ru>
Date: Wed, 1 Mar 2023 19:31:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 8/9] mirror: return the remaining dirty bytes upon query
Content-Language: en-US
To: Fiona Ebner <f.ebner@proxmox.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com, jsnow@redhat.com, den@virtuozzo.com,
 t.lamprecht@proxmox.com, alexander.ivanov@virtuozzo.com
References: <20230224144825.466375-1-f.ebner@proxmox.com>
 <20230224144825.466375-9-f.ebner@proxmox.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20230224144825.466375-9-f.ebner@proxmox.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=178.154.239.136;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
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

On 24.02.23 17:48, Fiona Ebner wrote:
> This can be used by management applications starting with a job in
> background mode to determine when the switch to active mode should
> happen.
> 
> Suggested-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> Signed-off-by: Fiona Ebner <f.ebner@proxmox.com>
> ---
>   block/mirror.c       | 1 +
>   qapi/block-core.json | 4 +++-
>   2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/block/mirror.c b/block/mirror.c
> index 02b5bd8bd2..ac83309b82 100644
> --- a/block/mirror.c
> +++ b/block/mirror.c
> @@ -1259,6 +1259,7 @@ static void mirror_query(BlockJob *job, BlockJobInfo *info)
>   
>       info->u.mirror = (BlockJobInfoMirror) {
>           .actively_synced = s->actively_synced,
> +        .remaining_dirty = bdrv_get_dirty_count(s->dirty_bitmap),

Doesn't it duplicate info->len - info->offset in meaning?

>       };
>   }
>   
> diff --git a/qapi/block-core.json b/qapi/block-core.json
> index 07e0f30492..91594eace4 100644
> --- a/qapi/block-core.json
> +++ b/qapi/block-core.json
> @@ -1308,10 +1308,12 @@
>   # @actively-synced: Whether the source is actively synced to the target, i.e.
>   #                   same data and new writes are done synchronously to both.
>   #
> +# @remaining-dirty: How much of the source is dirty relative to the target.
> +#
>   # Since 8.0
>   ##
>   { 'struct': 'BlockJobInfoMirror',
> -  'data': { 'actively-synced': 'bool' } }
> +  'data': { 'actively-synced': 'bool', 'remaining-dirty': 'int64' } }
>   
>   ##
>   # @BlockJobInfo:

-- 
Best regards,
Vladimir



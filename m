Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3FA59D2B2
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 09:54:51 +0200 (CEST)
Received: from localhost ([::1]:41814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQOkM-0004mb-B1
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 03:54:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oQOUh-0007cZ-Qd; Tue, 23 Aug 2022 03:38:40 -0400
Received: from forwardcorp1j.mail.yandex.net ([2a02:6b8:0:1619::183]:59642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oQOUc-0005yu-3v; Tue, 23 Aug 2022 03:38:37 -0400
Received: from iva8-3a65cceff156.qloud-c.yandex.net
 (iva8-3a65cceff156.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:2d80:0:640:3a65:ccef])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 83EF52E0CAE;
 Tue, 23 Aug 2022 10:38:21 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b4ab::1:3b] (unknown
 [2a02:6b8:b081:b4ab::1:3b])
 by iva8-3a65cceff156.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 nc8iZSBtqT-cKP8N1C9; Tue, 23 Aug 2022 10:38:20 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1661240300; bh=1qWCu9F6Vvi1U6s4glM1pys+Pyx6+ukSrJlbw5/42vo=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=Cq7a2NMGBbp589CX6SKqbV8fQA6XFx3cnKpMfV69sTlqhE2431rWwUv+0tTDCmz3w
 NJTOVLIw/yplSBiAg+UVqhYSjwEyvzaQGPcSpSkaxoiBKDc1rDc3wjEhC4zwQqFudT
 Wo0V28xeALSmc3bzprIBhvRFnlOi20KPhouvVbKA=
Authentication-Results: iva8-3a65cceff156.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <63c13487-4987-7842-5c42-b0ae22955798@yandex-team.ru>
Date: Tue, 23 Aug 2022 10:38:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v5 2/9] parallels: Fix data_end field value in
 parallels_co_check()
Content-Language: en-US
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 kwolf@redhat.com, hreitz@redhat.com
References: <20220822090517.2289697-1-alexander.ivanov@virtuozzo.com>
 <20220822090517.2289697-3-alexander.ivanov@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20220822090517.2289697-3-alexander.ivanov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a02:6b8:0:1619::183;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1j.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/22/22 12:05, Alexander Ivanov wrote:
> Make data_end pointing to the end of the last cluster if a leak was fixed.
> Otherwise set the file size to data_end.
> 
> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
> ---
>   block/parallels.c | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/block/parallels.c b/block/parallels.c
> index c245ca35cd..2be56871bc 100644
> --- a/block/parallels.c
> +++ b/block/parallels.c
> @@ -513,7 +513,15 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
>               res->leaks_fixed += count;
>           }
>       }
> -
> +    /*
> +     * If res->image_end_offset less than the file size,
> +     * a leak was fixed and we should set the new offset to s->data_end.
> +     * Otherwise set the file size to s->data_end.

I'm not sure about English :) For me "set A to B" means A := B, but you use it visa versa..

> +     */
> +    if (res->image_end_offset < size && fix & BDRV_FIX_LEAKS) {
> +        size = res->image_end_offset;
> +    }
> +    s->data_end = size >> BDRV_SECTOR_BITS;

Hmm, actually, when size < data_end, you can shrink data_end only if (fix & BDRV_FIX_ERRORS), otherwise BAT is still not fixed.

>   out:
>       qemu_co_mutex_unlock(&s->lock);
>       return ret;


Actually I think we only need to modify s->data_end after successful BAT fixing above. Then, bdrv_truncate is formally unrelated to s->data_end and shouldn't touch it.

So, I think, more correct is something like

diff --git a/block/parallels.c b/block/parallels.c
index 2be56871bc..b268788974 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -479,20 +479,24 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
          prev_off = off;
      }
  
      ret = 0;
      if (flush_bat) {
          ret = bdrv_co_pwrite_sync(bs->file, 0, s->header_size, s->header, 0);
          if (ret < 0) {
              res->check_errors++;
              goto out;
          }
+
+        /* We have dropped some wrong clusters, update data_end */
+        assert(s->data_end * BDRV_SECTOR_SIZE >= high_off + s->cluster_size);
+        s->data_end = (high_off + s->cluster_size) / BDRV_SECTOR_SIZE;
      }
  
      res->image_end_offset = high_off + s->cluster_size;
      if (size > res->image_end_offset) {




-- 
Best regards,
Vladimir


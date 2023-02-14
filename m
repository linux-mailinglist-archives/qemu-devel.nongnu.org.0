Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83718696B05
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 18:14:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRys1-0008Cm-Fl; Tue, 14 Feb 2023 12:13:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pRyrw-0008CH-TX; Tue, 14 Feb 2023 12:13:28 -0500
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pRyru-0002Hn-Ub; Tue, 14 Feb 2023 12:13:28 -0500
Received: from myt6-23a5e62c0090.qloud-c.yandex.net
 (myt6-23a5e62c0090.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:1da3:0:640:23a5:e62c])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id C91766014C;
 Tue, 14 Feb 2023 20:13:15 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b433::1:3c] (unknown
 [2a02:6b8:b081:b433::1:3c])
 by myt6-23a5e62c0090.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 EDnP220Rd4Y1-8tH3c5tt; Tue, 14 Feb 2023 20:13:15 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1676394795; bh=lBhSZru9vYScv3WwmbgkUaB2tk01HgJ8t5GvRIH7nuI=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=qeNP7YZSBVl0oFuPFJGnJL28M2oKagT2rvvzaqCrlFD99VGPApKNGN7/ov0XC62HI
 R4PHBb0ZxWAT8AeEigTsqI1PjKtcj3CbEdXSJDC7RxFT1reYWjQ1oRjOlTrNwIuuPt
 Qea+y0blHQ/cMireM1j/N5KpuzSfKR68j1kjtnYE=
Authentication-Results: myt6-23a5e62c0090.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <6666af73-5038-bb6d-17b4-b18699d5f319@yandex-team.ru>
Date: Tue, 14 Feb 2023 20:13:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] hbitmap: fix hbitmap_status() return value for first
 dirty bit case
Content-Language: en-US
To: Andrey Zhadchenko <andrey.zhadchenko@virtuozzo.com>
Cc: hreitz@redhat.com, eblake@redhat.com, jsnow@redhat.com,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>
References: <20230202181523.423131-1-andrey.zhadchenko@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20230202181523.423131-1-andrey.zhadchenko@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=178.154.239.136;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.35,
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

On 02.02.23 21:15, Andrey Zhadchenko via wrote:
> The last return statement should return true, as we already evaluated that
> start == next_dirty
> 
> Also, fix hbitmap_status() description in header
> 
> Cc: qemu-stable@nongnu.org
> Fixes: a6426475a75 ("block/dirty-bitmap: introduce bdrv_dirty_bitmap_status()")

Ohh :/

> Signed-off-by: Andrey Zhadchenko <andrey.zhadchenko@virtuozzo.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

> ---
>   include/qemu/hbitmap.h | 2 +-
>   util/hbitmap.c         | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/qemu/hbitmap.h b/include/qemu/hbitmap.h
> index af4e4ab746..8136e33674 100644
> --- a/include/qemu/hbitmap.h
> +++ b/include/qemu/hbitmap.h
> @@ -330,7 +330,7 @@ bool hbitmap_next_dirty_area(const HBitmap *hb, int64_t start, int64_t end,
>                                int64_t *dirty_start, int64_t *dirty_count);
>   
>   /*
> - * bdrv_dirty_bitmap_status:
> + * hbitmap_status:
>    * @hb: The HBitmap to operate on
>    * @start: The bit to start from
>    * @count: Number of bits to proceed
> diff --git a/util/hbitmap.c b/util/hbitmap.c
> index 297db35fb1..6d6e1b595d 100644
> --- a/util/hbitmap.c
> +++ b/util/hbitmap.c
> @@ -331,7 +331,7 @@ bool hbitmap_status(const HBitmap *hb, int64_t start, int64_t count,
>   
>       assert(next_zero > start);
>       *pnum = next_zero - start;
> -    return false;
> +    return true;
>   }
>   
>   bool hbitmap_empty(const HBitmap *hb)

-- 
Best regards,
Vladimir



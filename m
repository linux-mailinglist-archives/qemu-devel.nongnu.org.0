Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE0E586E24
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 17:57:04 +0200 (CEST)
Received: from localhost ([::1]:43670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIXmx-0004H4-BU
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 11:57:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oIXfD-0006gV-MC; Mon, 01 Aug 2022 11:49:05 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:35831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oIXfA-0008SN-Di; Mon, 01 Aug 2022 11:49:01 -0400
Received: by mail-yb1-xb36.google.com with SMTP id n8so19632742yba.2;
 Mon, 01 Aug 2022 08:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=/SViBVymZFNEjwkY3M2WenSz+eunaY06JK5SYDRxAFY=;
 b=o9LqUwQoNFry+fm7gjOavopXFZFUfFPofGCEP6S9auNYMU7h30zZQIp4qh0i6OO8XR
 g/4s8BB8gG/r94/nzgsq6w+cZzrLXGv6Ku25EJewTcWrhPI8pdRgmW5hsg42FB6pVtc5
 dkR8MfHpvJ/zEXxBFztzBVqa+VFIiWpO6/x/rRRaTpVNGJSgi6DneJ8E4/XUONiMM90m
 5HbAM+QN9WRkvfHhPkoYs4UmIaKQhpVjmEVH3w4s7QiRmySpRst9f1Lu3wO7CMl9k7Hg
 aF6YQ1Zoro5RMRiMoj5y+pEcTO2lprMHeF1+NbwmDMUTpXdFR9hgbFIR5TD/jYsn1Tcc
 WFGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=/SViBVymZFNEjwkY3M2WenSz+eunaY06JK5SYDRxAFY=;
 b=8RvYbahEUtc/bWWtJ9oEj2qX+9J4kSiPtUilR9r2SGvcSzju0mFBLiEk8rr2n1FpLw
 4gmmCbg+SNR0wQ0XtFSwKLEg1yCQtd/oc7F/s+l1B1Nz8RXIflUEFgjlgwAIx5lMWiGh
 uov9QOxMVInourDgfu1EuvIsWvy1R/wFbiqPnsX939qxpdccuAZu2i0tf9vT4OyNmeuQ
 9x6VFNfQ1Bcu31QhEnGimZ8aRtu7+blE9ny82dZAtdeTg1p6dYik4rkksKHGd39ncwG8
 d3w/uZ/udpqsOZVISYRLZn9AV9jXTSUgpGrMpMPPYCNG9cEJvXK32i1WsLYCeNp0Og6F
 1VSg==
X-Gm-Message-State: ACgBeo3P0+o9AbRv655FHlZI5hgD9xaomGemR/iVcMtnwSPoA5WnP5EM
 xWPuP03v2RETsoWKFgcUc+GUWwnoGaU0FDiG/HI=
X-Google-Smtp-Source: AA6agR5RKF2ehd+x51H/4XhaTqvzuNPL6VNVPKN1NjZs/5eD8a5oB6Cg5wtkGYLtYPt3EvIAwZl4HyjulAQPD+5sZos=
X-Received: by 2002:a25:428c:0:b0:676:a2fa:4d9f with SMTP id
 p134-20020a25428c000000b00676a2fa4d9fmr10865242yba.366.1659368938999; Mon, 01
 Aug 2022 08:48:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220801013359.10702-1-faithilikerun@gmail.com>
In-Reply-To: <20220801013359.10702-1-faithilikerun@gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 1 Aug 2022 11:48:47 -0400
Message-ID: <CAJSP0QXhvp2YoYN9jdfMPjmRDR2ZtQiXi_Vdrv=9283GsO48gg@mail.gmail.com>
Subject: Re: [RFC v5 09/11] qemu-io: add zoned block device operations.
To: Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel@nongnu.org, damien.lemoal@opensource.wdc.com, 
 dmitry.fomichev@wdc.com, hare@suse.de, stefanha@redhat.com, mst@redhat.com, 
 armbru@redhat.com, qemu-block@nongnu.org, fam@euphon.net, kwolf@redhat.com, 
 hreitz@redhat.com, eblake@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Sun, 31 Jul 2022 at 21:42, Sam Li <faithilikerun@gmail.com> wrote:
>
> Add zoned storage commands of the device: zone_report(zrp), zone_open(zo),
> zone_close(zc), zone_reset(zrs), zone_finish(zf).
>
> For example, to test zone_report, use following command:
> $ ./build/qemu-io --image-opts driver=zoned_host_device, filename=/dev/nullb0
> -c "zrp offset nr_zones"
>
> Signed-off-by: Sam Li <faithilikerun@gmail.com>
> ---
>  block/io.c     |  24 ++-------
>  qemu-io-cmds.c | 144 +++++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 148 insertions(+), 20 deletions(-)
>
> diff --git a/block/io.c b/block/io.c
> index a4625fb0e1..de9ec1d740 100644
> --- a/block/io.c
> +++ b/block/io.c
> @@ -3209,19 +3209,11 @@ int bdrv_co_zone_report(BlockDriverState *bs, int64_t offset,
>      IO_CODE();
>
>      bdrv_inc_in_flight(bs);
> -    if (!drv || (!drv->bdrv_co_zone_report)) {
> +    if (!drv || !drv->bdrv_co_zone_report) {
>          co.ret = -ENOTSUP;
>          goto out;
>      }
> -
> -    if (drv->bdrv_co_zone_report) {
> -        co.ret = drv->bdrv_co_zone_report(bs, offset, nr_zones, zones);
> -    } else {
> -        co.ret = -ENOTSUP;
> -        goto out;
> -        qemu_coroutine_yield();
> -    }
> -
> +    co.ret = drv->bdrv_co_zone_report(bs, offset, nr_zones, zones);
>  out:
>      bdrv_dec_in_flight(bs);
>      return co.ret;
> @@ -3237,19 +3229,11 @@ int bdrv_co_zone_mgmt(BlockDriverState *bs, BlockZoneOp op,
>      IO_CODE();
>
>      bdrv_inc_in_flight(bs);
> -    if (!drv || (!drv->bdrv_co_zone_mgmt)) {
> +    if (!drv || !drv->bdrv_co_zone_mgmt) {
>          co.ret = -ENOTSUP;
>          goto out;
>      }
> -
> -    if (drv->bdrv_co_zone_mgmt) {
> -        co.ret = drv->bdrv_co_zone_mgmt(bs, op, offset, len);
> -    } else {
> -        co.ret = -ENOTSUP;
> -        goto out;
> -        qemu_coroutine_yield();
> -    }
> -
> +    co.ret = drv->bdrv_co_zone_mgmt(bs, op, offset, len);
>  out:
>      bdrv_dec_in_flight(bs);
>      return co.ret;

Please squash these changes into the earlier patch that introduced
these functions.

Otherwise:

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>


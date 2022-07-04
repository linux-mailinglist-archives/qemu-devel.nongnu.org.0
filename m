Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 698CF56574E
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 15:33:06 +0200 (CEST)
Received: from localhost ([::1]:33892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8MCG-0003rq-W2
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 09:33:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8Lk9-0000Ab-BL
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:04:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8Lk7-0008PI-Ug
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:04:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656939839;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3gP1cW1gLyWxw7ppx11hA7nwTP0yV6ivBV12FdZVTN4=;
 b=hxfcbiKl/B5RvABWDG7b4/L7jnMArrEa45UdeVcUpH6WZCw3HMhFLlZfeOU//JHm9ya8ju
 wSzuEG0bgv8mhZYWfDKvcN0RwWP5+Uf40GwAUXwTS1roTTfPMd3hjag3C8U3qh6Dy/FMeR
 PX28c3VbqxpIlQ6HJPXNZGC+lMtsTh8=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-265-84TWal-NP2yS4phxRByFUw-1; Mon, 04 Jul 2022 09:03:58 -0400
X-MC-Unique: 84TWal-NP2yS4phxRByFUw-1
Received: by mail-io1-f69.google.com with SMTP id
 r18-20020a6bd912000000b00675a6c915c9so5601507ioc.10
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 06:03:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3gP1cW1gLyWxw7ppx11hA7nwTP0yV6ivBV12FdZVTN4=;
 b=5LZrJPCateFy22gHF2JdGL3OF6X8Zb1WrBV9hG16Do6izX5cGs+4derpN7+L7gTFp+
 V9qgcEPK8j/u9u560In5s08wuTCmoraQxC0NPpKEAVGPv+3bJ4tKmrEdJJJY1U8QktwG
 0zJ0NMq245YLqr4l0vL/f/MBtiLEiOe3zng3zPOzi//4+5jz+85VdC+XnRpJ1PshvbjR
 fGbM1QzNKPknOKwWAKnfrY5RLBfKNrAHYS48QhbufF8nGIuNJ0OD2KgDcktegJNzdkzo
 SfevyxNi5mRF+RWWzCW6hME/vyPlaHfWxyBJdBOVl7FLy3eA8UyGCyEdOyetlIaRDQn9
 EiQw==
X-Gm-Message-State: AJIora+RqaUZ+uixDnwZ12J/2TTPjJhP10Gl9V3+jA4liNwgRMisl8m+
 i7vpYuAzkiSD6JXZ52SJ6lF7dIIXRJn+ZwhUH5lgBPigTxAS2X9kQ6yAfH3e1eQklk0jbIdZ76I
 gLy0Bsl0Jt5L0+2YPreuol1OW5qrLQfw=
X-Received: by 2002:a05:6638:1346:b0:33e:c430:9575 with SMTP id
 u6-20020a056638134600b0033ec4309575mr6014174jad.129.1656939837493; 
 Mon, 04 Jul 2022 06:03:57 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tm9WT2Xi2RwJZNqXGePhFd3576CHEh7cbxoAf45oNazBvIitsYU97rc2OXTdd5Y8trFBko4aOEMuhV6Gom6SQ=
X-Received: by 2002:a05:6638:1346:b0:33e:c430:9575 with SMTP id
 u6-20020a056638134600b0033ec4309575mr6014166jad.129.1656939837290; Mon, 04
 Jul 2022 06:03:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220509103019.215041-1-pbonzini@redhat.com>
 <20220509103019.215041-24-pbonzini@redhat.com>
In-Reply-To: <20220509103019.215041-24-pbonzini@redhat.com>
From: Alberto Faria <afaria@redhat.com>
Date: Mon, 4 Jul 2022 14:03:21 +0100
Message-ID: <CAELaAXwLpr_s5X9qxuDBZ7hL_1Z98ZzBYaSDw6V3fx48hBt2Lg@mail.gmail.com>
Subject: Re: [PATCH v2 23/26] raw-format: add missing coroutine_fn annotations
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Mon, May 9, 2022 at 12:08 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  block/raw-format.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/block/raw-format.c b/block/raw-format.c
> index 69fd650eaf..45440345b6 100644
> --- a/block/raw-format.c
> +++ b/block/raw-format.c
> @@ -411,7 +411,7 @@ static void raw_lock_medium(BlockDriverState *bs, bool locked)
>      bdrv_lock_medium(bs->file->bs, locked);
>  }
>
> -static int raw_co_ioctl(BlockDriverState *bs, unsigned long int req, void *buf)
> +static int coroutine_fn raw_co_ioctl(BlockDriverState *bs, unsigned long int req, void *buf)

Overly long line.

>  {
>      BDRVRawState *s = bs->opaque;
>      if (s->offset || s->has_size) {
> --
> 2.35.1

Reviewed-by: Alberto Faria <afaria@redhat.com>



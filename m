Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 764B42F6ADC
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 20:24:17 +0100 (CET)
Received: from localhost ([::1]:55350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l08EC-0006dj-HF
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 14:24:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jdillama@redhat.com>)
 id 1l08A0-0004Tu-Bn
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 14:19:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jdillama@redhat.com>)
 id 1l089y-0001yj-Q7
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 14:19:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610651991;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=RY4t4BO9W8BNpUttr0R5hs3/bDLeXyW0xEGveurcRvU=;
 b=ZliHL5elrqB08WVtAywDo+pe32rpddSgudcz0rELCmPcTSmkYa41Hl499Xgep3+HOSSDJJ
 srI7G9vgXzZ33MaZ95/iBTOCertwpb0o7vd7uBWwNYYMHelHp7smDKvoP4m09oNXoBYRN/
 P6hHejg4OF3NtNoMIOVI/H6Tf7ddeL0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-55-WKciFQCoPuuNzbrf0nSfKg-1; Thu, 14 Jan 2021 14:19:49 -0500
X-MC-Unique: WKciFQCoPuuNzbrf0nSfKg-1
Received: by mail-wr1-f70.google.com with SMTP id j5so3031936wro.12
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 11:19:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=RY4t4BO9W8BNpUttr0R5hs3/bDLeXyW0xEGveurcRvU=;
 b=aryzMN7UBZJugDY2LOqSay5/Ze/cLN1NNga52PBy3NIc+UIfdw6ph8uzXG0e8BxyXi
 hVeeoE+LAskgVS8mkdCkeNEyky6vt71zbXIdEDG591cHTqh0sxa82/9epsBHC2KfOx1+
 Eqs+EFHW4VKDuk8RiWNIWy3xsDMpE1tt/X8TV47rU18ALqKcwgk9atiOmtPu5Wc+AVFK
 jJBisD1fB2fI4TIi9cXr6hyMu6VpuCSxhhIbIi94aYXPl5iJbS4VkdfINFVVRgQfffK+
 CCss+l2f0ehzvO2DTWFQ9hVbeQe6BHkDNpTvquOC5tAK5pdQWSonXNaDvC3jIHfX0d5h
 4KFw==
X-Gm-Message-State: AOAM530znu7g1AS79lLLtbpeXZXf/mtKV8dJWsGIFjoJriVdmjrtwYkW
 mbGM/5uxQSgphQu91FXG/oOWIrUKLcuei8BbrMB8mfQ/y1E+aaiybgyZZjb2BgQb6qOXRhxRsH1
 nB5uv2i9TiEHDvxU2ql29I1kx1Pij70o=
X-Received: by 2002:adf:e541:: with SMTP id z1mr9483804wrm.143.1610651988649; 
 Thu, 14 Jan 2021 11:19:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwtErWGhpbcGnGEO/BrOLH6x4Kda4/45bGwmq0w0eHo2xO3tHX1ZX9rA9SiVhKh8FZArN5T27PmquuqGin4HC8=
X-Received: by 2002:adf:e541:: with SMTP id z1mr9483787wrm.143.1610651988491; 
 Thu, 14 Jan 2021 11:19:48 -0800 (PST)
MIME-Version: 1.0
References: <20201227164236.10143-1-pl@kamp.de>
 <20201227164236.10143-8-pl@kamp.de>
In-Reply-To: <20201227164236.10143-8-pl@kamp.de>
From: Jason Dillaman <jdillama@redhat.com>
Date: Thu, 14 Jan 2021 14:19:35 -0500
Message-ID: <CA+aFP1AJ1cMdMGr-Odq+qzgZo9FF89mVy1KzNcoKifjQFwDvJA@mail.gmail.com>
Subject: Re: [PATCH 7/7] block/rbd: change request alignment to 1 byte
To: Peter Lieven <pl@kamp.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jdillama@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jdillama@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: dillaman@redhat.com
Cc: Kevin Wolf <kwolf@redhat.com>, Christian Theune <ct@flyingcircus.io>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-block <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Dec 27, 2020 at 11:42 AM Peter Lieven <pl@kamp.de> wrote:
>
> since we implement byte interfaces and librbd supports aio on byte granularity we can lift
> the 512 byte alignment.
>
> Signed-off-by: Peter Lieven <pl@kamp.de>
> ---
>  block/rbd.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/block/rbd.c b/block/rbd.c
> index 27b4404adf..8673e8f553 100644
> --- a/block/rbd.c
> +++ b/block/rbd.c
> @@ -223,8 +223,6 @@ done:
>  static void qemu_rbd_refresh_limits(BlockDriverState *bs, Error **errp)
>  {
>      BDRVRBDState *s = bs->opaque;
> -    /* XXX Does RBD support AIO on less than 512-byte alignment? */
> -    bs->bl.request_alignment = 512;

Just a suggestion, but perhaps improve discard alignment, max discard,
optimal alignment (if that's something QEMU handles internally) if not
overridden by the user.


>  #ifdef LIBRBD_SUPPORTS_WRITE_ZEROES
>      bs->bl.pwrite_zeroes_alignment = s->object_size;
>  #endif
> --
> 2.17.1
>
>


--
Jason



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 851C55260D4
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 13:17:45 +0200 (CEST)
Received: from localhost ([::1]:41830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npTIl-00052E-LK
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 07:17:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1npTHu-0004Kk-1x
 for qemu-devel@nongnu.org; Fri, 13 May 2022 07:16:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1npTHq-0003pC-4p
 for qemu-devel@nongnu.org; Fri, 13 May 2022 07:16:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652440604;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hhSm1geC1sPmH3JVkqjHvzOLuXdL4KmkdOsuh+K7zMU=;
 b=bGXpn4o6QmUNz8gTbg8+2UYQpb5r0JGTtxmCFW+pfBxD1PSpDOspaOCVInupBDcv2Xr5IJ
 n5eUIj52zR/gkH/3eV7MOUOM1AfA1GD9lGsd1mLh6LpnDptnQtsw1OQUi8Xudpw+J9aqIl
 AYDIftzH7gooX/rcLoZlrsh/r4aoRzY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-336-Xy0MTgN6NOWSjObbB6WI5A-1; Fri, 13 May 2022 07:16:43 -0400
X-MC-Unique: Xy0MTgN6NOWSjObbB6WI5A-1
Received: by mail-wr1-f70.google.com with SMTP id
 s14-20020adfa28e000000b0020ac7532f08so2821394wra.15
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 04:16:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hhSm1geC1sPmH3JVkqjHvzOLuXdL4KmkdOsuh+K7zMU=;
 b=Ao69hVZfMS1jOLNK+NR+pKjc9BdNDBsW9tbdF0dNQXMDqGBWF+jeHkOm6pYu/etqnp
 xJ4ZrtjGmtYxTUiV72G5AVqwbKxlV7OE85ASXvne49JPELvfMeRKmCpvgD790QgW2hnx
 +bKlNxEt0pFov0oIOdnOpHcdF8pPaw5X0MTZXC3wVLzf+PevsYKdPtH1XMfQTn90Wa8z
 lrBlAt+rwqARqAzihcXl9iSunakWEbE0KSYIgmbJI1dfxY+FbUPMdC0gbnsXHPEksNvz
 HmlgY13GLN067TiH5UGGVI5+SphiCwY+cuAvTq66JaQvh05UNLmWWJ7si8Zqd53axaix
 mAnQ==
X-Gm-Message-State: AOAM532fojMACYFYz/BN3QRaZM7rM65SD9NMmvav8a14rcTmWssFoOD6
 TpVyonmB8NeQr6fWggYYX4V2yzb80gJ3sGnBFOauu3FcLHuVnKKT3fXzyremmn8+nFPz/C8IK6t
 oWL+hYMPrU+46AhA=
X-Received: by 2002:adf:ee90:0:b0:20a:de35:14b4 with SMTP id
 b16-20020adfee90000000b0020ade3514b4mr3553103wro.558.1652440601015; 
 Fri, 13 May 2022 04:16:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzytz5E8Ndv86dkZT57NDUSDemmZ8zp6b+YXJS5SYFKuSBt5404joZJCuXHhC1a9hV9XxR2qg==
X-Received: by 2002:adf:ee90:0:b0:20a:de35:14b4 with SMTP id
 b16-20020adfee90000000b0020ade3514b4mr3553082wro.558.1652440600745; 
 Fri, 13 May 2022 04:16:40 -0700 (PDT)
Received: from redhat.com ([2.53.15.195]) by smtp.gmail.com with ESMTPSA id
 l20-20020a1c7914000000b00394538d039esm5150842wme.6.2022.05.13.04.16.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 04:16:40 -0700 (PDT)
Date: Fri, 13 May 2022 07:16:37 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Subject: Re: [PATCH] vhost-user-scsi: avoid unlink(NULL) with fd passing
Message-ID: <20220513071607-mutt-send-email-mst@kernel.org>
References: <20220427100116.30453-1-stefanha@redhat.com>
 <CAFEAcA_1cFLDK+oE8=VQaX-FQqTtVH=WP6C47Xo+f99SLin2EQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA_1cFLDK+oE8=VQaX-FQqTtVH=WP6C47Xo+f99SLin2EQ@mail.gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Thu, May 12, 2022 at 04:57:13PM +0100, Peter Maydell wrote:
> On Wed, 27 Apr 2022 at 11:04, Stefan Hajnoczi <stefanha@redhat.com> wrote:
> >
> > Commit 747421e949fc1eb3ba66b5fcccdb7ba051918241 ("Implements Backend
> > Program conventions for vhost-user-scsi") introduced fd-passing support
> > as part of implementing the vhost-user backend program conventions.
> >
> > When fd passing is used the UNIX domain socket path is NULL and we must
> > not call unlink(2).
> >
> > Fixes: Coverity CID 1488353
> > Fixes: 747421e949fc1eb3ba66b5fcccdb7ba051918241 ("Implements Backend Program conventions for vhost-user-scsi")
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> >  contrib/vhost-user-scsi/vhost-user-scsi.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/contrib/vhost-user-scsi/vhost-user-scsi.c b/contrib/vhost-user-scsi/vhost-user-scsi.c
> > index b2c0f98253..08335d4b2b 100644
> > --- a/contrib/vhost-user-scsi/vhost-user-scsi.c
> > +++ b/contrib/vhost-user-scsi/vhost-user-scsi.c
> > @@ -433,7 +433,9 @@ out:
> >      if (vdev_scsi) {
> >          g_main_loop_unref(vdev_scsi->loop);
> >          g_free(vdev_scsi);
> > -        unlink(opt_socket_path);
> > +        if (opt_socket_path) {
> > +            unlink(opt_socket_path);
> > +        }
> >      }
> 
> Shouldn't this check-and-unlink be one level up, outside the
> "if (vdev_scsi)" ? There are error exit paths which get us to
> the 'out:' label where we have called unix_sock_new() but
> not yet done the g_new0() of vdev_scsi(). The only thing
> that needs to be guarded by "if (vdev_scsi)" is the
> g_main_loop_unref() (the g_free of vdev_scsi itself could
> be inside or outside, since g_free(NULL) is a nop).
> 
> thanks
> -- PMM

Stefan, want to respond?

-- 
MST



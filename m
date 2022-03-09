Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 773964D2D44
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 11:41:49 +0100 (CET)
Received: from localhost ([::1]:40348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRtlM-0000J9-AZ
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 05:41:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nRth5-00078U-Mi
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 05:37:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nRth3-0000OV-Qq
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 05:37:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646822240;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5oBUMOBK2c9Uk8b2dnDWVZDcEd66B6YasDr1/h5HO8o=;
 b=SbS2ko2gkFU6jElBswRZ8p8Ur1x/t0hZ2BkQSs6XW29Q84nDUwBOtMzonAimETDGru0HZp
 k7xTxZycQQNgN94T1uJvLPEgxOyD4vejT20n5/f7WrDVCMDm/UjPRlerTOmMggoVTUM0l0
 qBp7E70zm6CMJzVFLA91kVeKjChvC44=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-277--lCo77HvM22SAXMRiuA1Lw-1; Wed, 09 Mar 2022 05:37:19 -0500
X-MC-Unique: -lCo77HvM22SAXMRiuA1Lw-1
Received: by mail-yb1-f199.google.com with SMTP id
 l16-20020a25bf90000000b00628c3a412cdso1375328ybk.10
 for <qemu-devel@nongnu.org>; Wed, 09 Mar 2022 02:37:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5oBUMOBK2c9Uk8b2dnDWVZDcEd66B6YasDr1/h5HO8o=;
 b=KaEJo174qY33aPqoOWe5/9O2SMNO8bVw3FcJdzi+DPZWM0rzcH9kYRQWM56dE/p1dD
 AOEUSAR2l2F3Poyzq5FBuNGKAoYZAbwP6l/IOe9v8PXG9FO4GzaWsBVQJmu7+wHm7+Vc
 HUBsfezUB6NKI4zLrLNnByot4f6sARseNs+ixXTdhYnLtdNeGBiFXDvvUr4mB7okDICX
 9oCFb/gsEq53JgvnR58fRRasIFnlaITCG37FwNgmLyNxLtIF/Z0ucNxDFUNAMAQWOP3X
 j9y3Fq74ufQtZWpF6fF6TU5cvtFsMohavXxfin3kc6Mt2Q2niX2VQ2Dkg26Qxo+aD1M2
 qS3g==
X-Gm-Message-State: AOAM533xws5g0QCp1ORtpqSZBg2AkARikPModkN9sPNs9TVdi7V5v8oX
 pgdAA8d6qO6IgzPfe2wEOT/71DwZVQindcJDCStfk1t9dsgePpfJxtgNLmzNUg2wxFKJH02mj9i
 dMhFKIZvhc3ncRmTzuPI6Akf604yv1Ug=
X-Received: by 2002:a81:5dd5:0:b0:2dc:19cf:17ac with SMTP id
 r204-20020a815dd5000000b002dc19cf17acmr16328195ywb.312.1646822238708; 
 Wed, 09 Mar 2022 02:37:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJymuxpzuu61z6zGJnZ6fXFtr12N5z0TkDtLZ/uHcyThIqsm787cpxjFCWx3Wt5d03uvoy6sexw7do58GAHs3PQ=
X-Received: by 2002:a81:5dd5:0:b0:2dc:19cf:17ac with SMTP id
 r204-20020a815dd5000000b002dc19cf17acmr16328181ywb.312.1646822238459; Wed, 09
 Mar 2022 02:37:18 -0800 (PST)
MIME-Version: 1.0
References: <20220307042108.296428-1-vivek.kasireddy@intel.com>
 <CAMxuvawcUYkjPt-iopJhJ8seO_3tJJGqkECqZfEPb3_7SSWpkg@mail.gmail.com>
 <8a19aa5fbfca434a9b1ddd57566e00ad@intel.com>
In-Reply-To: <8a19aa5fbfca434a9b1ddd57566e00ad@intel.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 9 Mar 2022 14:37:07 +0400
Message-ID: <CAMxuvay_aj3roDHtbPBgwi=dxpA5u65bt-KL1Pk-qTpZKRirJg@mail.gmail.com>
Subject: Re: [PATCH v1] ui/gtk-egl: Check for a valid context before making
 EGL calls
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "Kim, Dongwon" <dongwon.kim@intel.com>, qemu-devel <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Mon, Mar 7, 2022 at 10:00 PM Kasireddy, Vivek
<vivek.kasireddy@intel.com> wrote:
>
> Hi Marc-Andre,
>
> >
> > Hi Vivek
> >
> > On Mon, Mar 7, 2022 at 8:39 AM Vivek Kasireddy
> > <vivek.kasireddy@intel.com> wrote:
> > >
> > > Since not all listeners (i.e VirtualConsoles) of GL events have
> > > a valid EGL context, make sure that there is a valid context
> > > before making EGL calls.
> > >
> > > This fixes the following crash seen while launching the VM with
> > > "-device virtio-gpu-pci,max_outputs=1,blob=true -display gtk,gl=on"
> > >
> > > No provider of eglCreateImageKHR found.  Requires one of:
> > > EGL_KHR_image
> > > EGL_KHR_image_base
> > >
> > > Fixes: 7cc712e9862ff ("ui: dispatch GL events to all listeners")
> >
> > I am not able to reproduce on current master.
> [Kasireddy, Vivek] I can still see it with current master. I think this issue
> is only seen when running Qemu in an Xorg based Host environment and
> cannot be reproduced in a Wayland based environment -- as Qemu UI
> uses the GLArea widget in the Wayland case where the EGL context
> is managed by GTK.
>
> >
> > Isn't it fixed with commit a9fbce5e9 ("ui/console: fix crash when
> > using gl context with non-gl listeners") ?
> [Kasireddy, Vivek] No, it unfortunately does not fix the issue I am seeing. In
> my case, there are three VirtualConsoles created ("parallel0", "compatmonitor0",
> "virtio-gpu-pci") and all three of them seem to have a valid dpy_gl_scanout_dmabuf()
> but only virtio-gpu-pci has a valid EGL context.
>
> >
> > Could you also check after "[PATCH v3 00/12] GL & D-Bus display related fixes" ?
> [Kasireddy, Vivek] I can check but I don't think this issue can be fixed in ui/console.c
> as all three VirtualConsoles pass the console_has_gl() check and one of the only things
> that distinguishes them is whether they have a valid EGL context.
>

Under X11, I get the same error on v6.2.0 and master:
qemu-system-x86_64  -m 4G -object
memory-backend-memfd,id=mem,size=4G,share=on -machine
q35,accel=kvm,memory-backend=mem -device
virtio-gpu-pci,max_outputs=1,blob=true -display gtk,gl=on -cdrom
rawhide.iso
No provider of eglCreateImageKHR found.  Requires one of:
    EGL_KHR_image
    EGL_KHR_image_base

Note that with virtio-gpu-gl-pci I get:
qemu-system-x86_64: ../src/dispatch_common.c:868:
epoxy_get_proc_address: Assertion `0 && "Couldn't find current GLX or
EGL context.\n"' failed.



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBEF487864
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 14:43:18 +0100 (CET)
Received: from localhost ([::1]:40204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5pWX-0002XA-36
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 08:43:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1n5pU2-0008Ga-S8
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 08:40:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1n5pTc-0003tk-F3
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 08:40:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641562801;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KgxXFdPUKasysck506t3xoCvPuhpnh+nkwK4rN3KXck=;
 b=YeUxBCnupQ7g5+LcyuAePNUw1KHmz+7dpPqQSflqG7Y9AAb0OIFC8/WWVSiORBtuGCrOm7
 yZDy+q3GaUdW+Dm8jN6PtniNp7DStkznGo9TQ556F4TwpUiMrnTZPAL/dTw8CalZ3qqHGK
 Ak1SrXf5M1/rgsYzxptbiZTgJ5mSerA=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-675-bvCv7RkyMqCWY-kYfBphYg-1; Fri, 07 Jan 2022 08:39:58 -0500
X-MC-Unique: bvCv7RkyMqCWY-kYfBphYg-1
Received: by mail-yb1-f198.google.com with SMTP id
 s84-20020a254557000000b0060ac37f4bb1so11695066yba.5
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 05:39:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:references:mime-version:in-reply-to:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KgxXFdPUKasysck506t3xoCvPuhpnh+nkwK4rN3KXck=;
 b=UNzP+FHgxhMbPSH3n8BrDr09pwoj+d3CN1hsW77RsIklu7RU77dCwM2/O/xET7lurv
 1oaMnMFaF5R2U4uGjY+SUDrAHPSjtZA68oMl5d6A4M/LdWwHxpsQ5HeNv8/hKByky4C9
 qDFk1JDeirNv+cHodTIl4J2vnc5Dqh8MmU+L+ibrQ+i1E0qairSqAwmOxIuVk/b3qyTY
 KfE9v5uZ0t/Om4zx4V/pics9AoL8aV9yJEZClMt5DI3PNFDiOTCqqXg1pxfPRNNNvGsX
 NLttIKLttU9esYm9SQpHuiFncbJIvFql+o1w89rvkwxZq1LgWk5/euQNmr6ucUJ2sYb6
 6Cbg==
X-Gm-Message-State: AOAM531Vt7a4u8RWfvEp1j+jYb7KCbNg7eSkOLiAX5b3S4B91LbsGwOq
 tD+imXeePmyhJWJrIyibu36C5Xbd57SOGgkdDo/ey2J/l+6RAEXcu4pmyefQ8gb4tWolNhmElrE
 qFPW/bDo6ZaWPidCbH6ZmB1v0MMFXegs=
X-Received: by 2002:a05:6902:1107:: with SMTP id
 o7mr14252185ybu.465.1641562798082; 
 Fri, 07 Jan 2022 05:39:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyyhELKJHgQsXqW8ETM7l1+Ej/rd/mW5ApzosTAdRqkkzzpc50kTq2mqYJmryicc+P52SRLgI8rmMpTN1FU+O4=
X-Received: by 2002:a05:6902:1107:: with SMTP id
 o7mr14252161ybu.465.1641562797841; 
 Fri, 07 Jan 2022 05:39:57 -0800 (PST)
Received: from 744723338238 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 7 Jan 2022 05:39:57 -0800
From: Andrea Bolognani <abologna@redhat.com>
References: <1567068782-371028-1-git-send-email-zhe.he@windriver.com>
 <20190829091505.GB17141@redhat.com>
 <CABJz62M1o7Vof3LSG0BNY506jEdB1S110mMOVbu-ZpQfPJCWfQ@mail.gmail.com>
 <8fc873a8-9bda-09f2-4344-24f8331dba7c@redhat.com>
 <Ydgs18kw3Ettwmro@redhat.com>
MIME-Version: 1.0
In-Reply-To: <Ydgs18kw3Ettwmro@redhat.com>
Date: Fri, 7 Jan 2022 05:39:57 -0800
Message-ID: <CABJz62PMFFVOETw+fW9ehYTJaQgA+JP5=b5EEJ7E2atRO3rdDg@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH] configure: Add pkg-config handling for
 libgcrypt
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=abologna@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=abologna@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: pbonzini@redhat.com, Thomas Huth <thuth@redhat.com>, zhe.he@windriver.com,
 laurent@vivier.eu, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 07, 2022 at 12:06:47PM +0000, Daniel P. Berrang=C3=A9 wrote:
> On Fri, Jan 07, 2022 at 12:55:42PM +0100, Thomas Huth wrote:
> > On 07/01/2022 12.43, Andrea Bolognani wrote:
> > > On Thu, Aug 29, 2019 at 10:15:05AM +0100, Daniel P. Berrang=C3=A9 wro=
te:
> > > > Where are you seeing pkg-config files for libgcrypt ?
> > > >
> > > > The upstream project has (frustratingly) been hostile to any propos=
al to
> > > > add pkg-config support saying people should stick with their custom
> > > > libgcrypt-config tool
> > > >
> > > >     https://dev.gnupg.org/T2037
> > >
> > > Resurrecting an old thread to point out that the upstream stance
> > > seems to have changed since that discussion:
> > >
> > >    https://git.gnupg.org/cgi-bin/gitweb.cgi?p=3Dlibgcrypt.git;a=3Dcom=
mit;h=3D97194b422bc89a6137f4e218d4cdee118c63e96e
> > >
> > > libgcrypt 1.9.0, released almost exactly a year ago, comes with a
> > > pkg-config file out of the box. With that in mind, I think it would
> > > make sense to re-evaluate this patch for inclusion.
> >
> > Maybe ... but we switched to Meson in between, so the patch needs to be
> > rewritten to use meson.build instead, I think.

Right. I didn't mean that the patch should be merged as-is, and I
wouldn't expect it to even apply two years later :)

> > Also it seems like version
> > 1.9 is not available in all distros yet, so someone needs to do an
> > assessment whether the distros that use an older version of libgrypt pr=
ovide
> > a .pc file or not...

The original approach used the .pc file where present and used
libgcrypt-config as a fallback. Once QEMU stopped targeting all
operating system that have libgcrypt < 1.9, the fallback path could
have been dropped.

> Comes back to my question of what is the benefit of using the .pc file
> when what we have already works and is known to be portable.
>
> When using meson there is essentially zero burden to using the
> libgcrypt-config approach, because that's all handled transparently
> by meson.  This is different from the situation with configure,
> where libgcrypt-config required extra work on our side.

I didn't realize that was the case! I see now that Meson implements
special handling for libgcrypt, which is very nice indeed :)

> Overall I don't see any need to change it.

IIUC, the fact that the call currently looks like

  gcrypt =3D dependency('libgcrypt', version: '>=3D1.8',
                      method: 'config-tool', ...)

means that Meson will not use the .pc file even when it's present. I
think changing method to "auto" would cause it to use the .pc file
when it's available, which is likely a better behavior.

--=20
Andrea Bolognani / Red Hat / Virtualization



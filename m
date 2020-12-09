Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8632D489E
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 19:09:55 +0100 (CET)
Received: from localhost ([::1]:49034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn3uU-0002NG-3D
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 13:09:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3qW-00005e-Mk
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:05:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3qU-0007HA-AB
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:05:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607537144;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KE3CLdis7ScZH3NV2+gwOVuLFjj091+S5NbLFOycIYA=;
 b=TqgPKfC7xjs2CRQ0m6WKdRL0sgzJLy4YgTi0RUkI5C/E5ZAR4rTvPvX/AGEBgvpLMKXMpk
 6mz3loJqWHuSxOEHre6NKMjJpShDaTgDRVrv3m5H2lpGNptlqaLSbZBi7hDK7VTREYbMvU
 yX1FyMOmMCtupcxERss6lwIkTPZQD08=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-j3MJHRFMO4mTUK92yiVsjQ-1; Wed, 09 Dec 2020 13:05:42 -0500
X-MC-Unique: j3MJHRFMO4mTUK92yiVsjQ-1
Received: by mail-wr1-f69.google.com with SMTP id p18so943103wro.9
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 10:05:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KE3CLdis7ScZH3NV2+gwOVuLFjj091+S5NbLFOycIYA=;
 b=VMCtrEGoKZ7ZPtAy03Cn5un2HkK8h1mtZ94juys8q/8ehg042EAWZ/KXNTT+CvPkrY
 BpkBenFleojVxyVEAuCazUfCZujrp/tA64x1lgHNae51TQHBcUifXIjfVTEsZiY78KFe
 5gUml7pTrIFpfAgV4yr28MuSCXDzn1qLhjsKn6VoCM8/FAwTPLqj+t4ful52PHwZXUAm
 aMfHqZ56GK8LhpBoYaDWwxbX4B4oCHJFK7M7fypvsX0MZXSp2/BcNCN/Xvu+U2tyyV8P
 T2CIgXdUgho3rmRoVBiGMdRHafWfIexdRFxuoT1Y27ixBR4y8tBzCtwQ1f9U2yEycQNa
 1kjA==
X-Gm-Message-State: AOAM530b8+1uDXAJl1yB4KM/hFFGHGCQbg1fIlak+ilYyQttpV5hxkx1
 J7Du0CbM+For7JbsWsgDbFuL0HWP1/hfH8eHqAZ+UlK7bRRrqLGOhOupNMvwOMoEQH0Gh3swNhj
 8EIBqF/G9fKxKilM=
X-Received: by 2002:adf:a4cc:: with SMTP id h12mr1719695wrb.391.1607537141541; 
 Wed, 09 Dec 2020 10:05:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwHjwmhIqJbQqejSDpgwNg1tyFPuffw2uati3aIWS4ciNaLbf3C2rPWudqN3KCrh9n/68adVw==
X-Received: by 2002:adf:a4cc:: with SMTP id h12mr1719683wrb.391.1607537141380; 
 Wed, 09 Dec 2020 10:05:41 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id y2sm4548490wrn.31.2020.12.09.10.05.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 10:05:40 -0800 (PST)
Date: Wed, 9 Dec 2020 13:05:37 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 00/66] pc,pci,virtio: fixes, cleanups
Message-ID: <20201209130446-mutt-send-email-mst@kernel.org>
References: <20201208193307.646726-1-mst@redhat.com>
 <CAFEAcA_F7F_FHFmKvDbcrKE=5cr7-3KqBbTti1kA2N+xQPX=Kg@mail.gmail.com>
 <CAFEAcA97wx5DdyJHy-SCs1G5vR_YpY9rOsem-M0Vn6A7revvaA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA97wx5DdyJHy-SCs1G5vR_YpY9rOsem-M0Vn6A7revvaA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 09, 2020 at 04:20:59PM +0000, Peter Maydell wrote:
> On Wed, 9 Dec 2020 at 14:37, Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > On Tue, 8 Dec 2020 at 19:33, Michael S. Tsirkin <mst@redhat.com> wrote:
> > >
> > > The following changes since commit 553032db17440f8de011390e5a1cfddd13751b0b:
> > >
> > >   Update version for v5.2.0 release (2020-12-08 15:55:19 +0000)
> > >
> > > are available in the Git repository at:
> > >
> > >   git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
> > >
> > > for you to fetch changes up to 023e57b93a24f2e7901cf460a45cb5058fa23549:
> > >
> > >   hw/virtio-pci Added AER capability. (2020-12-08 13:48:58 -0500)
> > >
> > > ----------------------------------------------------------------
> > > pc,pci,virtio: fixes, cleanups
> > >
> > > Lots of fixes, cleanups.
> > > CPU hot-unplug improvements.
> > > A new AER property for virtio devices, adding a dummy AER capability.
> > >
> > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> >
> > Fails to compile on ppc64:
> 
> You can see the same failure also if you run it through the gitlab CI:
> https://gitlab.com/qemu-project/qemu/-/jobs/900063570
> 
> -- PMM

Dropped the offending patch.



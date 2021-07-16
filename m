Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 732173CB97C
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 17:14:40 +0200 (CEST)
Received: from localhost ([::1]:46122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4PXz-0008Dh-HL
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 11:14:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m4PWi-0007XW-K3
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 11:13:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m4PWg-0002cP-EK
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 11:13:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626448397;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vRnndFo0lscgsz4dC1Xrr3UqKD9lkf/tbCQe8Aoonzc=;
 b=cpdsgsGgz4YqUTPSKbOy3il2eM5ndZj73NN3nutR0hA/0PxYjSdG17ez7a1H+nbj9sOPUU
 VO8vDEIoJUAgZUGCsNOjWmBI7WNnOAccQ5Re5yXYwSRpXNbAAm2GkTNPr9yH+c1Xy2NEYX
 mbF6I6gcJtcZgCD91ue3jKnAYgf89Ts=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359-tddYldCfPx22MT2hROnJWQ-1; Fri, 16 Jul 2021 11:13:16 -0400
X-MC-Unique: tddYldCfPx22MT2hROnJWQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 k8-20020a05600c1c88b02901b7134fb829so1303191wms.5
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 08:13:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vRnndFo0lscgsz4dC1Xrr3UqKD9lkf/tbCQe8Aoonzc=;
 b=B7k3VAVWll45ZUZbfLwHZEKq7rLNJBqzwGMPiSeOKyWsLXJK4bNpA8SuAx4iDZTcvX
 WvonxpEwIUjgCnzGB/khds/OSmsTqOkirjUcy7llljNunmz8ew0TiBwr64E1OG8UUyzs
 OxKg9aNhKBHDYfbjYpVidbV1+ORSahhpiLz+gcB9STShVcDwcmjOzZ1yuiRs1viQ1yW6
 IwaXKQk5HfnWrP3BTF5BaH9pun0hJf8hJ9nHs+fkHESkN+lHbyDVZmJrJXNYFsn3t1G1
 lTBxI9l8lYa79sYanH30cySEdAf+NMZLc2rePEXrTSvmGWLHm1K+p67ayhp8gLQopISW
 +Nmg==
X-Gm-Message-State: AOAM532Cc5zIzbtGL54e+YP2XSkx9X9MF3rJzpatp/BrNoQKsmLojBn+
 RE7MCSA6DONrEhHPNlAAvhx3GZCzJMiuMI3NDWVIWKA7ZXJEvTx1nO9Z/0wnqU/filfImouNJsJ
 Hy8AZQ2I1egC0FU8=
X-Received: by 2002:adf:c409:: with SMTP id v9mr13239509wrf.102.1626448395152; 
 Fri, 16 Jul 2021 08:13:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzOWJLwfdkvAmj0ynT4vou39rpkLypY+AUjC69FYpXB2wFx0XcNzfkoKLUnTYVOvwWliY6K0g==
X-Received: by 2002:adf:c409:: with SMTP id v9mr13239484wrf.102.1626448394947; 
 Fri, 16 Jul 2021 08:13:14 -0700 (PDT)
Received: from redhat.com ([2a10:8004:6ff2:0:a1b1:b3d8:4c4e:4825])
 by smtp.gmail.com with ESMTPSA id m4sm10347005wrs.14.2021.07.16.08.13.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jul 2021 08:13:14 -0700 (PDT)
Date: Fri, 16 Jul 2021 11:13:12 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 00/23] pc,pci,virtio: lots of new features
Message-ID: <20210716111218-mutt-send-email-mst@kernel.org>
References: <20210713220946.212562-1-mst@redhat.com>
 <CAFEAcA_ykJOv0s_44VKWFa3ti9pVD_u_3_G1MpAFdLRZ9oPH5w@mail.gmail.com>
 <20210715172049-mutt-send-email-mst@kernel.org>
 <CAFEAcA8g+gJRX8CxhQ193PjcU8Ypsg1JDXou1RZaXmOyS5btPw@mail.gmail.com>
 <20210716043525-mutt-send-email-mst@kernel.org>
 <CAFEAcA8hudZMeddSZ+R5JW97_T8R6tV31_i=Q=BwMbMegW-Rrg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8hudZMeddSZ+R5JW97_T8R6tV31_i=Q=BwMbMegW-Rrg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Fri, Jul 16, 2021 at 03:12:53PM +0100, Peter Maydell wrote:
> On Fri, 16 Jul 2021 at 09:41, Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Fri, Jul 16, 2021 at 07:41:16AM +0100, Peter Maydell wrote:
> > > On Thu, 15 Jul 2021 at 22:21, Michael S. Tsirkin <mst@redhat.com> wrote:
> > > >
> > > > On Wed, Jul 14, 2021 at 09:31:21PM +0100, Peter Maydell wrote:
> > > > > On Tue, 13 Jul 2021 at 23:10, Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > > >
> > > > > > The following changes since commit 708f50199b59476ec4b45ebcdf171550086d6292:
> > > > > >
> > > > > >   Merge remote-tracking branch 'remotes/ericb/tags/pull-nbd-2021-07-09-v2' into staging (2021-07-13 14:32:20 +0100)
> > > > > >
> > > > > > are available in the Git repository at:
> > > > > >
> > > > > >   git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
> > > > > >
> > > > > > for you to fetch changes up to cf171f90d5e41730ad3e0ce23f1990f34b7e63ef:
> > > > > >
> > > > > >   vhost-vsock: SOCK_SEQPACKET feature bit support (2021-07-13 16:59:12 -0400)
> > > > > >
> > > > > > ----------------------------------------------------------------
> > > > > > pc,pci,virtio: lots of new features
> > > > > >
> > > > > > Lots of last minute stuff.
> > > > > >
> > > > > > vhost-user-rng.
> > > > > > vhost-user-i2c.
> > > > > > vhost-vsock SOCK_SEQPACKET support.
> > > > > > IOMMU bypass.
> > > > > > ACPI based pci hotplug.
> > > > > >
> > > > > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > > > >
> > > > > This seems to produce a new meson warning:
> > > > >
> > > > > Configuring 50-qemu-gpu.json using configuration
> > > > > Configuring 50-qemu-virtiofsd.json using configuration
> > > > > Configuring 50-qemu-rng.json using configuration
> > > > > ../../tools/vhost-user-rng/meson.build:7: WARNING: The variable(s)
> > > > > 'libexecdir' in the input file
> > > > > 'tools/vhost-user-rng/50-qemu-rng.json.in' are not present in the
> > > > > given configuration data.
> > > > > Configuring 50-edk2-i386-secure.json using configuration
> > > > > Configuring 50-edk2-x86_64-secure.json using configuration
> > > > > Configuring 60-edk2-aarch64.json using configuration
> > > > >
> > > > > (the build then seems to go on to complete OK).
> > > > >
> > > > > -- PMM
> > > >
> > > >
> > > > I sent an email about a fix. Do you prefer PULLv2 then?
> > >
> > > Same tag, right? I've put this back on my list, but I'm still
> > > working through a backlog of other pullreqs before I get back
> > > to this one.
> > >
> > > -- PMM
> >
> > Yes. If you merge it there's a trivial conflict.
> >
> > If you'd rather see it rebased here it is: for_upstream2
> 
> I tried the for_upstream2 tag, but it fails to compile on
> some of the gitlab jobs:
> https://gitlab.com/qemu-project/qemu/-/jobs/1430322920
> https://gitlab.com/qemu-project/qemu/-/jobs/1430323102
> 
> /usr/bin/ld: tools/vhost-user-rng/vhost-user-rng.p/main.c.o: in
> function `vu_rng_queue_set_started':
> /builds/qemu-project/qemu/build/../tools/vhost-user-rng/main.c:198:
> undefined reference to `vu_get_queue'
> 
> and various other missing symbols at link time.
> 
> thanks
> -- PMM

OK for_upstream3 is now without vhost-user-rng - we found too many
issues for the last minute pull.

-- 
MST



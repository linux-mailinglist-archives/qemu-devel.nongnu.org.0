Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3AB23C1FD2
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 09:04:40 +0200 (CEST)
Received: from localhost ([::1]:57764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1kYy-0003zB-39
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 03:04:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m1kX1-0008Sg-Ki
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 03:02:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m1kWz-0001XU-Ju
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 03:02:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625814156;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LjYLxe/GxBWLB0nix79BxQzaHW1jfxU3xFg4mLHfbXY=;
 b=BcvdLPQqJmsSyXQHolQnS0AKhubY4UiMUdNk2RU7cAKyzM22FEyPZGtBT49cukYRas1tiy
 P2wjMnsGPCfV3OCD7UDamfz+rh38RPJwRVdmAKw4LG96toertwEHO9JCSpAJNMEQDAW0gl
 XZpON2NDFzAKgfyuc7XiATfZqPDl4XM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168-brBFU_OpOEKjmDY00E7d8Q-1; Fri, 09 Jul 2021 03:02:35 -0400
X-MC-Unique: brBFU_OpOEKjmDY00E7d8Q-1
Received: by mail-wr1-f71.google.com with SMTP id
 h15-20020adffd4f0000b0290137e68ed637so2464048wrs.22
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 00:02:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LjYLxe/GxBWLB0nix79BxQzaHW1jfxU3xFg4mLHfbXY=;
 b=Oi7iz2+F/Ex5GrAJ64XgVr7cgt9aNFAb8bkiUHa4WwOxGY04GhZhFCB7YkZJA7d+Nq
 eJTDFnZNFhNbV34OEySdSnCTg/P9E38gJ63DxkpoZ8cjYR4outANo28CMyIczAegFIk3
 qSZAVOUjkFnB/T035kvWy2ELoRImrwRI3nkSqmYgvB/cCo3Um8yMFWslnx7EKCrOKpXE
 nwIB+1mrODYCom55ByWIj8C8KC9Lo5k8muL2OgGwIpbVme8Ymq6K3nLPR1bqXPxJlEUG
 lkrDP8Gj48zxwKsxhBq/rBEx9/VvC7dNVppVoRijXd1N1qH3KjmfutKc66fsYOXu6Uex
 T4Zw==
X-Gm-Message-State: AOAM5326Tl1O0ugY81HmyDSEALCOFhSgr0i7qpb/kXgFhqYdpXg4lO45
 R1H3i4dqlDxiwdG3SqCFhQuWi8uWEejeiZoSxrjAATYK+WuaJWUXn6vFCT75odstDPAtvU9gq4Q
 6CTea77Zq4Ve6eUk=
X-Received: by 2002:a5d:5143:: with SMTP id u3mr40110676wrt.51.1625814154187; 
 Fri, 09 Jul 2021 00:02:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxzFnw1FRM7jDrt9HpJFPt+Lau5f/Ks6UftTAY1QfZ5vXLoGJ40VfxVLBL4CivIDY2P2SnakQ==
X-Received: by 2002:a5d:5143:: with SMTP id u3mr40110661wrt.51.1625814154049; 
 Fri, 09 Jul 2021 00:02:34 -0700 (PDT)
Received: from redhat.com ([2.55.150.102])
 by smtp.gmail.com with ESMTPSA id v30sm4470841wrv.85.2021.07.09.00.02.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 00:02:33 -0700 (PDT)
Date: Fri, 9 Jul 2021 03:02:26 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH v2 0/5] virtio: Add vhost-user based RNG
Message-ID: <20210709025909-mutt-send-email-mst@kernel.org>
References: <20210614202842.581640-1-mathieu.poirier@linaro.org>
 <20210702122652-mutt-send-email-mst@kernel.org>
 <20210706202057.GA1540522@p14s>
MIME-Version: 1.0
In-Reply-To: <20210706202057.GA1540522@p14s>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
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
Cc: alex.bennee@linaro.org, qemu-devel@nongnu.org,
 stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 06, 2021 at 02:20:57PM -0600, Mathieu Poirier wrote:
> Good day Michael,
> 
> On Fri, Jul 02, 2021 at 12:27:08PM -0400, Michael S. Tsirkin wrote:
> > On Mon, Jun 14, 2021 at 02:28:37PM -0600, Mathieu Poirier wrote:
> > > This sets adds a vhost-user based random number generator (RNG),
> > > similar to what has been done for i2c and virtiofsd, with the
> > > implementation following the patterns already set forth in those.
> > > 
> > > Applies cleanly to git://git.qemu.org/qemu.git master(1ea06abceec6).
> > 
> > 
> > I get
> > 
> > /scm/qemu/docs/tools/vhost-user-rng.rst:document isn't included in any toctree
> > 
> 
> I assume this is because vhost-user-rng isn't listed in
> docs/tools/index.rst but I would like to test my theory before sending another
> revision.  What build command did you use to generate this?  I tried "make html"
> and "make man" as shown in the Documenation section of "make help" but those
> targets don't seem to be valid anymore.
> 
> Thanks,
> Mathieu

I just used configure then make.

So this is why the patches got dropped from the pull request.
I remember now.


> > any idea?
> > 
> > > Thanks,
> > > Mathieu
> > > 
> > > -----
> > > New for V2:
> > > - Replaced "antropy" for "entropy" (Joakim).
> > > 
> > > Mathieu Poirier (5):
> > >   vhost-user-rng: Add vhost-user-rng implementation
> > >   vhost-user-rng-pci: Add vhost-user-rng-pci implementation
> > >   vhost-user-rng: backend: Add RNG vhost-user daemon implementation
> > >   docs: Add documentation for vhost based RNG implementation
> > >   MAINTAINERS: Add maintainer for vhost-user RNG implementation
> > > 
> > >  MAINTAINERS                              |   9 +
> > >  docs/tools/vhost-user-rng.rst            |  74 +++++
> > >  hw/virtio/Kconfig                        |   5 +
> > >  hw/virtio/meson.build                    |   2 +
> > >  hw/virtio/vhost-user-rng-pci.c           |  79 +++++
> > >  hw/virtio/vhost-user-rng.c               | 294 +++++++++++++++++
> > >  include/hw/virtio/vhost-user-rng.h       |  33 ++
> > >  tools/meson.build                        |   8 +
> > >  tools/vhost-user-rng/50-qemu-rng.json.in |   5 +
> > >  tools/vhost-user-rng/main.c              | 403 +++++++++++++++++++++++
> > >  tools/vhost-user-rng/meson.build         |  10 +
> > >  11 files changed, 922 insertions(+)
> > >  create mode 100644 docs/tools/vhost-user-rng.rst
> > >  create mode 100644 hw/virtio/vhost-user-rng-pci.c
> > >  create mode 100644 hw/virtio/vhost-user-rng.c
> > >  create mode 100644 include/hw/virtio/vhost-user-rng.h
> > >  create mode 100644 tools/vhost-user-rng/50-qemu-rng.json.in
> > >  create mode 100644 tools/vhost-user-rng/main.c
> > >  create mode 100644 tools/vhost-user-rng/meson.build
> > > 
> > > -- 
> > > 2.25.1
> > 



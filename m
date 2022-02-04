Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B10124A9981
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 13:55:04 +0100 (CET)
Received: from localhost ([::1]:59066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFy7D-0005jJ-AS
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 07:55:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nFxsO-0002yH-LY
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 07:39:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nFxsK-0005xf-Kg
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 07:39:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643978378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SdIzy7UM4kl6UKXLGR3KWInAe1rl2NNJmwxf0yuz4TA=;
 b=C+Iq5r7NYK3/RThGv/k1YDgU61/QK9Vdd90162YEBg+QzA/WukHakHJn/Pv8j5ylX9ZWe0
 KcEYL0QAgSit0GxaX+BLW4TuRDd4xFVs1tLOq9EybuwhmnRZ8tP3TvI/i2siOM7/4/zh5q
 epo+GowPjQl/hE8B59Eurp5rQvVI/dI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-447-rcl323p4MbiSWswCW-DofA-1; Fri, 04 Feb 2022 07:39:37 -0500
X-MC-Unique: rcl323p4MbiSWswCW-DofA-1
Received: by mail-wm1-f72.google.com with SMTP id
 bg16-20020a05600c3c9000b0034bea12c043so7517150wmb.7
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 04:39:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SdIzy7UM4kl6UKXLGR3KWInAe1rl2NNJmwxf0yuz4TA=;
 b=4UIICd+axKx691HuAtQFKw0edaI4VIsgfm7m+OMMOus3QOCMtpSH11WhFqC93RcVWt
 wbGaqCMdraBdpmp8YCWA4+4rQ2vgUOBc9Bxh6XlBNzROabIRWFX8Lp1jUlaa7jDgE2Cx
 pmSqNrTts39RIcQ2qd2Ahf2SX0OHqazXbPFNiccWgVQC0FDcUiAoImNwdf/PdBinvpGV
 y2CHLQwPBTmeHrY9mJl2dNj8BxcSt6eHpuDBsZQJBSnK9ut+frYozLYecwoiYhcBe3po
 Jnum+RZxbLeUsQ40R+4yTiXC1IvytVz2BZ2CSxShkTDhfeFy+O4A1MGHXEppPM3YIm4l
 nRhg==
X-Gm-Message-State: AOAM531TOhf9I2k6+WSG1ht7sNewLh6nftJQe+ga8tth7g/aHdkzfdIi
 4rUReQWv9uA+PzT8gRRmsr73VDg2I1xCcYaN9T6m1DyfL2Y0jfGkTDZbPXUqA7eV143XlXGdip8
 0hzaw6SSCnk0H1GQ=
X-Received: by 2002:a05:600c:3005:: with SMTP id
 j5mr2085542wmh.35.1643978376602; 
 Fri, 04 Feb 2022 04:39:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwqO9MmuK1szmxWl41FLMFsk1y1qSwj0C87lU69QJiEK1mnbbIu0I/oJm3BYNhLpKb2eA12/Q==
X-Received: by 2002:a05:600c:3005:: with SMTP id
 j5mr2085511wmh.35.1643978376286; 
 Fri, 04 Feb 2022 04:39:36 -0800 (PST)
Received: from redhat.com ([2a10:8005:331d:0:5c51:c095:613e:277c])
 by smtp.gmail.com with ESMTPSA id j13sm1873062wrw.116.2022.02.04.04.39.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 04:39:34 -0800 (PST)
Date: Fri, 4 Feb 2022 07:39:31 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Matthew Rosato <mjrosato@linux.ibm.com>
Subject: Re: [PATCH v2 0/9] s390x/pci: zPCI interpretation support
Message-ID: <20220204073806-mutt-send-email-mst@kernel.org>
References: <20220114203849.243657-1-mjrosato@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20220114203849.243657-1-mjrosato@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.092,
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
Cc: thuth@redhat.com, alex.williamson@redhat.com, kvm@vger.kernel.org,
 pmorel@linux.ibm.com, schnelle@linux.ibm.com, cohuck@redhat.com,
 richard.henderson@linaro.org, farman@linux.ibm.com, qemu-devel@nongnu.org,
 pasic@linux.ibm.com, qemu-s390x@nongnu.org, pbonzini@redhat.com,
 david@redhat.com, borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 14, 2022 at 03:38:40PM -0500, Matthew Rosato wrote:
> For QEMU, the majority of the work in enabling instruction interpretation
> is handled via new VFIO ioctls to SET the appropriate interpretation and
> interrupt forwarding modes, and to GET the function handle to use for
> interpretive execution.  
> 
> This series implements these new ioctls, as well as adding a new, optional
> 'intercept' parameter to zpci to request interpretation support not be used
> as well as an 'intassist' parameter to determine whether or not the
> firmware assist will be used for interrupt delivery or whether the host
> will be responsible for delivering all interrupts.
> 
> The ZPCI_INTERP CPU feature is added beginning with the z14 model to
> enable this support.
> 
> As a consequence of implementing zPCI interpretation, ISM devices now
> become eligible for passthrough (but only when zPCI interpretation is
> available).
> 
> >From the perspective of guest configuration, you passthrough zPCI devices
> in the same manner as before, with intepretation support being used by
> default if available in kernel+qemu.
> 
> Associated kernel series:
> https://lore.kernel.org/kvm/20220114203145.242984-1-mjrosato@linux.ibm.com/

I took a quick look and don't see much to object to, but
I don't know much about the topic either.

Acked-by: Michael S. Tsirkin <mst@redhat.com>

Pls use the s390 tree for this.

> Changes v1->v2:
> 
> - Update kernel headers sync                                                    
> - Drop some pre-req patches that are now merged                                 
> - Add some R-bs (Thanks!)                                                       
> - fence FEAT_ZPCI_INTERP for QEMU 6.2 and older (Christian)                     
> - switch from container_of to VFIO_PCI and drop asserts (Thomas)                
> - re-arrange g_autofree so we malloc at time of declaration (Thomas) 
> 
> Matthew Rosato (9):
>   Update linux headers
>   target/s390x: add zpci-interp to cpu models
>   fixup: force interp off for QEMU machine 6.2 and older
>   s390x/pci: enable for load/store intepretation
>   s390x/pci: don't fence interpreted devices without MSI-X
>   s390x/pci: enable adapter event notification for interpreted devices
>   s390x/pci: use I/O Address Translation assist when interpreting
>   s390x/pci: use dtsm provided from vfio capabilities for interpreted
>     devices
>   s390x/pci: let intercept devices have separate PCI groups
> 
>  hw/s390x/s390-pci-bus.c                       | 121 ++++++++++-
>  hw/s390x/s390-pci-inst.c                      | 168 ++++++++++++++-
>  hw/s390x/s390-pci-vfio.c                      | 204 +++++++++++++++++-
>  hw/s390x/s390-virtio-ccw.c                    |   1 +
>  include/hw/s390x/s390-pci-bus.h               |   8 +-
>  include/hw/s390x/s390-pci-inst.h              |   2 +-
>  include/hw/s390x/s390-pci-vfio.h              |  45 ++++
>  include/standard-headers/asm-x86/kvm_para.h   |   1 +
>  include/standard-headers/drm/drm_fourcc.h     |  11 +
>  include/standard-headers/linux/ethtool.h      |   1 +
>  include/standard-headers/linux/fuse.h         |  60 +++++-
>  include/standard-headers/linux/pci_regs.h     |   4 +
>  include/standard-headers/linux/virtio_iommu.h |   8 +-
>  linux-headers/asm-mips/unistd_n32.h           |   1 +
>  linux-headers/asm-mips/unistd_n64.h           |   1 +
>  linux-headers/asm-mips/unistd_o32.h           |   1 +
>  linux-headers/asm-powerpc/unistd_32.h         |   1 +
>  linux-headers/asm-powerpc/unistd_64.h         |   1 +
>  linux-headers/asm-s390/kvm.h                  |   1 +
>  linux-headers/asm-s390/unistd_32.h            |   1 +
>  linux-headers/asm-s390/unistd_64.h            |   1 +
>  linux-headers/linux/kvm.h                     |   1 +
>  linux-headers/linux/vfio.h                    |  22 ++
>  linux-headers/linux/vfio_zdev.h               |  51 +++++
>  target/s390x/cpu_features_def.h.inc           |   1 +
>  target/s390x/gen-features.c                   |   2 +
>  target/s390x/kvm/kvm.c                        |   1 +
>  27 files changed, 693 insertions(+), 27 deletions(-)
> 
> -- 
> 2.27.0



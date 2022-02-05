Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB2D4AA598
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Feb 2022 03:17:10 +0100 (CET)
Received: from localhost ([::1]:41214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGAdR-0000hI-8q
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 21:17:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGA7N-0003xX-2f
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 20:44:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGA7K-0003Q1-Mt
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 20:44:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644025438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fC9KHCSiNtpEeHGAnMKTZjdHnII3b++HtWsRpnS6cZY=;
 b=clxx3DdBuvlJjf2C7f8Nogur2sJJjjcCYI+hxJ+KoLSd3kkB/tcBwQUwFHKHA/xqoLbLv9
 DgCAW645EKaty+uZqlIL6EWnr4Suhcnz6Iy5ednbgOh98GA4pZdQC+2xwx7DSdLbvQDkAE
 BykckeV6X3Kcxje9D9tHyWjNCVl2n2c=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-303-d6bLqrqsNGm-9ZRADjpFUg-1; Fri, 04 Feb 2022 20:43:55 -0500
X-MC-Unique: d6bLqrqsNGm-9ZRADjpFUg-1
Received: by mail-wm1-f69.google.com with SMTP id
 j18-20020a05600c1c1200b0034aeea95dacso8368617wms.8
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 17:43:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fC9KHCSiNtpEeHGAnMKTZjdHnII3b++HtWsRpnS6cZY=;
 b=d9oc481fdMNAp5eg7F34uEc1X6sOliCIAUC8IwPxd57X7sVqh7iSKu3cO7JZGd1vyD
 uyGgySR0AfkcQL4ItjnGRvk7KCsJ/b7pmgatm3pTK7a1szLqdPEko8Fi4dNlyH1DGc0a
 s+jmattXcomFsyWVNCXzw3BESIHnKQwjgeuVoADgf1wbgW3QZuryl40PG1V+YC4rdPeI
 YuKmirqsZiIbTMhuzP4FMgfIT6qraL2cY6cAcnLTFAydF09d1AG3m4blf9bbfdeW8cua
 M+eWwIHo9cKrQtQum9k6yZb8yiSiTcqdj6SbKD4UvW1vkfdk6BTPgpgdspcetQXBNSSd
 ntHw==
X-Gm-Message-State: AOAM532toxMmBhG5pzFFt5NKMEpaYYjh+Q0UTJu+VGCM+W+JB912K+Et
 YfvXvkryk2fXV2QEYi+CRMYbmDElzPTTUo4uEBMst0XenYX8iNw+cR/D0/dfYRiHXsGcMnPGIlQ
 o+jq5qNHsBWhaXgk=
X-Received: by 2002:a05:600c:1c87:: with SMTP id
 k7mr4517917wms.60.1644025434040; 
 Fri, 04 Feb 2022 17:43:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwGTZv6tGusi2gQgFuFeFkGZu18FEyZ01z+KIBBspkToXlUmMdjTudz8ibejl96BddoeX/Mvg==
X-Received: by 2002:a05:600c:1c87:: with SMTP id
 k7mr4517901wms.60.1644025433870; 
 Fri, 04 Feb 2022 17:43:53 -0800 (PST)
Received: from redhat.com ([2a10:8005:331d:0:5c51:c095:613e:277c])
 by smtp.gmail.com with ESMTPSA id n8sm12228146wmq.42.2022.02.04.17.43.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 17:43:51 -0800 (PST)
Date: Fri, 4 Feb 2022 20:43:48 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v2 0/6] qtests/libqos: Allow PCI tests to be run with
 virt-machine
Message-ID: <20220204204301-mutt-send-email-mst@kernel.org>
References: <20220118203833.316741-1-eric.auger@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220118203833.316741-1-eric.auger@redhat.com>
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
Cc: lvivier@redhat.com, peter.maydell@linaro.org, thuth@redhat.com,
 jean-philippe@linaro.org, eesposit@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, clg@kaod.org, pbonzini@redhat.com,
 david@gibson.dropbear.id.au, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 18, 2022 at 09:38:27PM +0100, Eric Auger wrote:
> Up to now the virt-machine node only contains a virtio-mmio
> driver node but no driver that eventually produces any pci-bus
> interface.
> 
> Hence, PCI libqos tests cannot be run with aarch64 binary.
> 
> This series brings the pieces needed to be able to run PCI tests
> with the aarch64 binary: a generic-pcihost driver node gets
> instantiated by the machine. This later contains a pci-bus-generic
> driver which produces a pci-bus interface. Then all tests
> consuming the pci-bus interface can be run with the libqos arm
> virt machine.
> 
> One of the first goal was to be able to run the virtio-iommu-pci
> tests as the virtio-iommu was initially targetting ARM and it
> was awkard to be run the test with the pc machine. This is now
> possible.
> 
> Only the tests doing hotplug cannot be run yet as hotplug is
> not possible on the root bus. This will be dealt with separately
> by adding a root port to the object tree.
> 
> Best Regards
> 
> Eric
> 
> This series can be found at:
> https://github.com/eauger/qemu/tree/libqos-pci-arm-v2
> 
> History


I dropped this due to make check failures. Pls make sure
to make and test all targets. Thanks!

> v1 -> v2:
> - copyright updated to 2022
> - QPCIBusARM renamed into QGenericPCIBus
> - QGenericPCIHost declarations and definitions moved in the same
>   place as the generic pci implementation
> - rename pci-arm.c/h in generic-pcihost.c/h and remove any ref to
>   ARM there
> - remove qos_node_produces_opts, qpci_new_arm, qpci_free_arm
> - ecam_alloc_ptr now is a field of QGenericPCIBus and not QPCIBus
> - new libqos_init to create generic-pcihost driver that contains
>   pci-bus-generic
> - QGenericPCIHost moved in the same place as the generic pci
>   bindings
> - collected Thomas A-b/R-b
> 
> 
> Eric Auger (6):
>   tests/qtest/vhost-user-test.c: Use vhostforce=on
>   tests/qtest/libqos/pci: Introduce pio_limit
>   tests/qtest/libqos: Skip hotplug tests if pci root bus is not
>     hotpluggable
>   tests/qtest/vhost-user-blk-test: Setup MSIx to avoid error on aarch64
>   tests/qtest/vhost-user-blk-test: Factorize vq setup code
>   tests/qtest/libqos: Add generic pci host bridge in arm-virt machine
> 
>  tests/qtest/e1000e-test.c             |   6 +
>  tests/qtest/libqos/arm-virt-machine.c |  18 +-
>  tests/qtest/libqos/generic-pcihost.c  | 231 ++++++++++++++++++++++++++
>  tests/qtest/libqos/generic-pcihost.h  |  54 ++++++
>  tests/qtest/libqos/meson.build        |   1 +
>  tests/qtest/libqos/pci-pc.c           |   1 +
>  tests/qtest/libqos/pci-spapr.c        |   1 +
>  tests/qtest/libqos/pci.c              |  78 +++++----
>  tests/qtest/libqos/pci.h              |   6 +-
>  tests/qtest/vhost-user-blk-test.c     |  39 ++++-
>  tests/qtest/vhost-user-test.c         |   2 +-
>  tests/qtest/virtio-blk-test.c         |   5 +
>  tests/qtest/virtio-net-test.c         |   5 +
>  tests/qtest/virtio-rng-test.c         |   5 +
>  14 files changed, 408 insertions(+), 44 deletions(-)
>  create mode 100644 tests/qtest/libqos/generic-pcihost.c
>  create mode 100644 tests/qtest/libqos/generic-pcihost.h
> 
> -- 
> 2.26.3



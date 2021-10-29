Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7838E43F519
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 04:55:41 +0200 (CEST)
Received: from localhost ([::1]:41002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgI3Q-0004y1-3t
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 22:55:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mgI1I-0004CN-JW
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 22:53:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mgI1E-00078C-Jb
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 22:53:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635476000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2PBnghD5A92d9V/EXsB8wlxmUegvFaNrQoKFpKqztVY=;
 b=UOIvIKsDN8B38HFjmWGMZ7GIKwmjLZQ3TXfEJIrTsntTEzhdbYhJzbjH3yUizgUt3WPeNw
 PbVlM7bEZ1lrWCkWIlTo9FD2k+rG0DK+q7y0uXAN6k1tu7ko6JG/afd27rOd0We2D82twB
 j3Q6YoJNam9LyzTgbeAX7GoPxGGh9QQ=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-407-ZUiE6gdrMvW33ghTjx8jzw-1; Thu, 28 Oct 2021 22:53:16 -0400
X-MC-Unique: ZUiE6gdrMvW33ghTjx8jzw-1
Received: by mail-pl1-f199.google.com with SMTP id
 w12-20020a170902d70c00b0014028fd6402so3650246ply.6
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 19:53:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2PBnghD5A92d9V/EXsB8wlxmUegvFaNrQoKFpKqztVY=;
 b=mtgfUXB4rdqbnRP/1xmlt1uRO9OkiDrtPf+I57UZAVrp7D0NpyA/V/j/8eXhheGYvh
 LFJjFouQQEHzgGoMtrzJu/jlATQg7dWDDeAypmERoGu0+Qphf9n7K5MQqunSYAENmTQU
 fF+CL1lNyvoN1hI3a+VCjMqttu3nNb7Ha1U+s4Uluy623uL1dVmYRzxAk0225E9xr9zF
 Tenz0E3ik/S5AqykJksf55wNdaWji5ovYiLdor6QC0RIvvsTCOuRxAgVmEkn9WeI0dbX
 Hc+Ovxypx3Fg7WXgx5iKqxvS7IrRTXrsWwDX5gZ1BMEdeKqgEEfh1xW53pVh0PZ9XDq0
 KiWg==
X-Gm-Message-State: AOAM532QxNTJNaCLberrOJ4lKAD3gz2Oot2PJR1D53D7q+NLlScvNLmI
 Dw1lJqwF9bkzeo5KlE9kw9WBD6HMESVPSmfv12X42BVcU8l9uW6IhXKeLouTDP0JNcvWw8Eh9DP
 HfJGQcOmiUIh7E0w=
X-Received: by 2002:a17:90b:3846:: with SMTP id
 nl6mr8711982pjb.53.1635475995062; 
 Thu, 28 Oct 2021 19:53:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzjD63D6X37rDt0vr0xp0j4SwzCALB+bHjJHftfr/43IpQ60xXLXHaCV8zo5qJ0ukdtTL5lEA==
X-Received: by 2002:a17:90b:3846:: with SMTP id
 nl6mr8711940pjb.53.1635475994778; 
 Thu, 28 Oct 2021 19:53:14 -0700 (PDT)
Received: from xz-m1.local ([191.101.132.51])
 by smtp.gmail.com with ESMTPSA id y13sm3950565pgc.46.2021.10.28.19.53.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 19:53:13 -0700 (PDT)
Date: Fri, 29 Oct 2021 10:53:07 +0800
From: Peter Xu <peterx@redhat.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH v2 5/5] pc/q35: Add pre-plug hook for x86-iommu
Message-ID: <YXtiE9iInfHcTLwm@xz-m1.local>
References: <20211028043129.38871-1-peterx@redhat.com>
 <20211028043129.38871-6-peterx@redhat.com>
 <20211028085242.770a9dde.alex.williamson@redhat.com>
 <YXrDgeembpIiJ0BE@xz-m1.local>
 <20211028101135.72672e80.alex.williamson@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211028101135.72672e80.alex.williamson@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 Jason Wang <jasowang@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 28, 2021 at 10:11:35AM -0600, Alex Williamson wrote:
> Better.  Like the class layering proposal, a downside is that the
> driver needs to be aware that it's imposing this requirement to be able
> to mark it in the class init function rather than some automatic means,
> like an "as_object_consumed" flag set automatically on the device
> structure via accessors like pci_device_iommu_address_space().  Thanks,

Do you mean something like this?

---8<---
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 258290f4eb..969f4c85fd 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -2729,6 +2729,10 @@ AddressSpace *pci_device_iommu_address_space(PCIDevice *dev)
     PCIBus *iommu_bus = bus;
     uint8_t devfn = dev->devfn;

+    if (!dev->address_space_consumed) {
+        dev->address_space_consumed = true;
+    }
+
     while (iommu_bus && !iommu_bus->iommu_fn && iommu_bus->parent_dev) {
         PCIBus *parent_bus = pci_get_bus(iommu_bus->parent_dev);

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 6813f128e0..704c9bdc6e 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -268,6 +268,13 @@ typedef struct PCIReqIDCache PCIReqIDCache;
 struct PCIDevice {
     DeviceState qdev;
     bool partially_hotplugged;
+    /*
+     * This will be set after the 1st time the device implementation fetches
+     * its dma address space from pci_device_iommu_address_space().  It's used
+     * as a sanity check for platform devices like vIOMMU to detect incorrect
+     * ordering of device realization.
+     */
+    bool address_space_consumed;

     /* PCI config space */
     uint8_t *config;
---8<---

Then sanity check in pre-plug of vIOMMU.

The flag will be a bit more "misterious" than the previous approach, imho, as
the name of it will be even further from the problem it's going to solve.
However it looks at least clean on the changeset and it looks working too.

Thanks,

-- 
Peter Xu



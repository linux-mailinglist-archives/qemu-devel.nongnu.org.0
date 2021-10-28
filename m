Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7D043E550
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 17:39:05 +0200 (CEST)
Received: from localhost ([::1]:58758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg7Ue-00061J-Qo
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 11:39:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mg7SP-00043v-TB
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 11:36:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32134)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mg7SN-0003Tf-Rj
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 11:36:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635435403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DR5Wt/0sJ+J8k8RxYYoYLtd58LH3JUy6/Z0JwrkNf5k=;
 b=LGcEF1jjGfy/SVtcQ0u3+ezm6uQD6QA6+9pb+cu4EQ9W0dz4X9IsETb2UFO+DEu0uA7sxX
 i7pkwL1MzsqDIGAXiVmd+iumLGc0a4k4iZANI9Dm1/1lBO+uATI3vC8NIstbVmiuR8pq2n
 y8L7BJ9QT/1fFcbITnkcxIwibmf5Zow=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-H8FCsUn_OQemWWj1yXuahQ-1; Thu, 28 Oct 2021 11:36:42 -0400
X-MC-Unique: H8FCsUn_OQemWWj1yXuahQ-1
Received: by mail-pj1-f69.google.com with SMTP id
 jz9-20020a17090b14c900b001a6198de66fso466914pjb.4
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 08:36:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DR5Wt/0sJ+J8k8RxYYoYLtd58LH3JUy6/Z0JwrkNf5k=;
 b=UjKlmXZusTOjJ/+fPlI82/0B82JCHRlWt/jf4MXhJEBEyvvE7fHJF14om6uli8TImm
 ul6eTf6sNWZlmknZ1TZxsDe4QcVlqjqe+6WZsHw5PLAzie3weRudlrb78+CpAkF59mfd
 /0Om2ZYWDN4HyFuzQjf6UEfh6QBIqCxbIvZgfz2F4XWpGp5Bg29NvFSXnh7AOUdGn42f
 0Btz+uPKjY8jyyd4uP/satmMkjpDx3zq9MNN6Q24wdiBiAHMTXPOXLcXH4jOXoHUmN9m
 X/QVeUToqSHrebVwqHXaCt5BDi0QhA1JLowrOlZqfuvHzM5+LgApyn86R+SeuJnY8kHt
 a/UQ==
X-Gm-Message-State: AOAM533mSfw3e9NE8r8W6xxLQhZ+k5cdg+Rwj8l7hhLGLUyEALQRp45Y
 ON0rIMmxzZryDzdazQ9xTXj+Sx8LQIMaRLDjouHMaur7oeev2MezKVDSv1zandALrZYSJnZu887
 GT3pRztzlxZQXquo=
X-Received: by 2002:aa7:9250:0:b0:44c:27d1:7f0f with SMTP id
 16-20020aa79250000000b0044c27d17f0fmr4947871pfp.41.1635435400849; 
 Thu, 28 Oct 2021 08:36:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/JizLMRC4ISoPyXa8R2Fq/TQrCaHsZil5lOt4EQRPlaQViBaQgb4i39EKbkmnVSMlf2tmiQ==
X-Received: by 2002:aa7:9250:0:b0:44c:27d1:7f0f with SMTP id
 16-20020aa79250000000b0044c27d17f0fmr4947843pfp.41.1635435400531; 
 Thu, 28 Oct 2021 08:36:40 -0700 (PDT)
Received: from xz-m1.local ([191.101.132.51])
 by smtp.gmail.com with ESMTPSA id v12sm3415874pjs.0.2021.10.28.08.36.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 08:36:39 -0700 (PDT)
Date: Thu, 28 Oct 2021 23:36:33 +0800
From: Peter Xu <peterx@redhat.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH v2 5/5] pc/q35: Add pre-plug hook for x86-iommu
Message-ID: <YXrDgeembpIiJ0BE@xz-m1.local>
References: <20211028043129.38871-1-peterx@redhat.com>
 <20211028043129.38871-6-peterx@redhat.com>
 <20211028085242.770a9dde.alex.williamson@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211028085242.770a9dde.alex.williamson@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

On Thu, Oct 28, 2021 at 08:52:42AM -0600, Alex Williamson wrote:
> > +void x86_iommu_pre_plug(X86IOMMUState *iommu, Error **errp)
> > +{
> > +    bool ambiguous = false;
> > +    Object *object;
> > +
> > +    object = object_resolve_path_type("", TYPE_VFIO_PCI, &ambiguous);
> > +    if (object || ambiguous) {
> > +        /* There're one or more vfio-pci devices detected */
> > +        error_setg(errp, "Please specify all the vfio-pci devices to be after "
> > +                   "the vIOMMU device");
> > +    }
> 
> I still really don't buy the argument that vfio-pci is the only driver
> that does "this thing", therefore we can just look for vfio-pci devices
> by name rather than try to generically detect devices that have this
> dependency.  That seems short sighted.
> 
> I've already suggested that pci-core could record on the PCIDevice
> structure if the device address space has been accessed.  We could also
> do something like create a TYPE_PCI_AS_DEVICE class derived from
> TYPE_PCI_DEVICE and any PCI drivers that make use of the device address
> space before machine-init-done would be of this class.  That could even
> be enforced by pci_device_iommu_address_space() and would allow the
> same sort of object resolution as used here.  Thanks,

Sorry Alex, I didn't receive any follow up so I thought you were fine with it.

I was always fine with either way, though I think another parent class would be
an overkill just for this.  Would you think below acceptable?

---8<---
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 5cdf1d4298..2156b5d3ed 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -3266,6 +3266,7 @@ static void vfio_pci_dev_class_init(ObjectClass *klass, void *data)
     pdc->exit = vfio_exitfn;
     pdc->config_read = vfio_pci_read_config;
     pdc->config_write = vfio_pci_write_config;
+    pdc->require_consolidated_iommu_as = true;
 }

 static const TypeInfo vfio_pci_dev_info = {
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 6813f128e0..ffddc766ba 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -239,6 +239,14 @@ struct PCIDeviceClass {
      */
     bool is_bridge;

+    /*
+     * Set this to true when a pci device needs consolidated result from the
+     * pci_device_iommu_address_space() in its realize() fn.  This also means
+     * when specified in cmdline, this "-device" parameter needs to be put
+     * before the vIOMMU devices so as to make it work.
+     */
+    bool require_consolidated_iommu_as;
+
     /* rom bar */
     const char *romfile;
 };
---8<---

Then I'll need to pick the dropped patch back on pci scanning, since then I
won't be able to use object_resolve_path_type() anymore, and I'll need to check
up PCIDeviceClass instead.

Michael, Igor, others - any objections?

-- 
Peter Xu



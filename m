Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 221603CB9AE
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 17:23:26 +0200 (CEST)
Received: from localhost ([::1]:42854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4PgT-0008TI-7F
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 11:23:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m4PYp-00014M-Jb
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 11:15:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m4PYn-00046g-Al
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 11:15:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626448528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=umcXGg1ajUcx6yGPrHNc9sdCDLC76+6T/qWiwvzG+eo=;
 b=X5lH541dmgDJ+yyKPcg0nVly+Kr9wGIOvvYoJO2Bj7Ytd8EY8aECrTgBmrL5/8kf3qcyVr
 oWM6G7Vt5tGQdaoEm1CKG8+ssC5y8DDHubYIPM4WyPxUJyDRyBHWdVNI6cPsH033Xok6Ro
 0v38Nj10QUoTccT06bW3rjSOPAthsyc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-187-cXcCLAaSN06-8H2e0S4MeA-1; Fri, 16 Jul 2021 11:15:26 -0400
X-MC-Unique: cXcCLAaSN06-8H2e0S4MeA-1
Received: by mail-wr1-f70.google.com with SMTP id
 y15-20020a5d614f0000b029013cd60e9baaso4939715wrt.7
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 08:15:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=umcXGg1ajUcx6yGPrHNc9sdCDLC76+6T/qWiwvzG+eo=;
 b=FxIKctRa8SNq+yYb5f6BxywU5Z0BZWv54ASCiO4ykW6HndgLqwNk2+ehDxaEpr32H4
 bqk6uKsOa4u0HuPUOdui6AWVRf0y0o4a2UBf2opVYR1WbqvhqdfH9q7mocoM660tYntd
 81gGHY6mVg8q837B7Tp3ajLpNIT781mcopN24wvJGlsY9VNNTng65uEOfc3G4SqPxAV/
 UqvsSiqbY1jQLOTzoUmWR4pjJXm6SPuw4sPHj83Wht+y83kl6vGEldPqHRrVJtW0h880
 KNXDqUt79Ah4nxrKikmiOc9H5HmZdySeHN2HnHhW/9pMBuJWjvVTP6bk4xlPYZ+w7N92
 5cOA==
X-Gm-Message-State: AOAM532WKxzJaxIOGPi7BsMMv48GNlFPpuGAwZtxIdZiWQ4plKXfeDqr
 3VtStQ7yU4XuGZtcwq2JnvijNtIyut23jNyYl2aA80p7cYFNTQ3RB11++r+MSiFXe4t+YWnN3WP
 B04ltXlvKzgLrofXkOrGGJN28MvQ91eLwnHJL0EMDeN2lmEOYYjdKE1U0MQfw
X-Received: by 2002:a05:600c:4e8f:: with SMTP id
 f15mr11391395wmq.174.1626448525074; 
 Fri, 16 Jul 2021 08:15:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwS95IQCfIxAx04E0C5296m5STU8EYCPd09dJfjBsgVEai7bCrZBkwwsolbB4/QTtrbFNAq9w==
X-Received: by 2002:a05:600c:4e8f:: with SMTP id
 f15mr11391351wmq.174.1626448524833; 
 Fri, 16 Jul 2021 08:15:24 -0700 (PDT)
Received: from redhat.com ([2a10:8004:6ff2:0:a1b1:b3d8:4c4e:4825])
 by smtp.gmail.com with ESMTPSA id o11sm11228033wmc.2.2021.07.16.08.15.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jul 2021 08:15:24 -0700 (PDT)
Date: Fri, 16 Jul 2021 11:15:22 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v3 09/19] docs: Add '-device intel-iommu' entry
Message-ID: <20210716151416.155127-10-mst@redhat.com>
References: <20210716151416.155127-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210716151416.155127-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Yi Liu <yi.l.liu@intel.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Peter Xu <peterx@redhat.com>,
 Maxim Levitsky <mlevitsk@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, Jing Zhao <jinzhao@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Lei Yang <leiyang@redhat.com>, Chao Yang <chayang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Xu <peterx@redhat.com>

The parameters of intel-iommu device are non-trivial to understand.  Add an
entry for it so that people can reference to it when using.

There're actually a few more options there, but I hide them explicitly because
they shouldn't be used by normal QEMU users.

Cc: Chao Yang <chayang@redhat.com>
Cc: Lei Yang <leiyang@redhat.com>
Cc: Jing Zhao <jinzhao@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Alex Williamson <alex.williamson@redhat.com>
Reviewed-by: Jason Wang <jasowang@redhat.com>
Reviewed-by: Yi Liu <yi.l.liu@intel.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
Message-Id: <20210707154114.197580-1-peterx@redhat.com>
Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 qemu-options.hx | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/qemu-options.hx b/qemu-options.hx
index 214c477dcc..0c9ddc0274 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -939,6 +939,39 @@ SRST
 
 ``-device pci-ipmi-bt,bmc=id``
     Like the KCS interface, but defines a BT interface on the PCI bus.
+
+``-device intel-iommu[,option=...]``
+    This is only supported by ``-machine q35``, which will enable Intel VT-d
+    emulation within the guest.  It supports below options:
+
+    ``intremap=on|off`` (default: auto)
+        This enables interrupt remapping feature.  It's required to enable
+        complete x2apic.  Currently it only supports kvm kernel-irqchip modes
+        ``off`` or ``split``, while full kernel-irqchip is not yet supported.
+        The default value is "auto", which will be decided by the mode of
+        kernel-irqchip.
+
+    ``caching-mode=on|off`` (default: off)
+        This enables caching mode for the VT-d emulated device.  When
+        caching-mode is enabled, each guest DMA buffer mapping will generate an
+        IOTLB invalidation from the guest IOMMU driver to the vIOMMU device in
+        a synchronous way.  It is required for ``-device vfio-pci`` to work
+        with the VT-d device, because host assigned devices requires to setup
+        the DMA mapping on the host before guest DMA starts.
+
+    ``device-iotlb=on|off`` (default: off)
+        This enables device-iotlb capability for the emulated VT-d device.  So
+        far virtio/vhost should be the only real user for this parameter,
+        paired with ats=on configured for the device.
+
+    ``aw-bits=39|48`` (default: 39)
+        This decides the address width of IOVA address space.  The address
+        space has 39 bits width for 3-level IOMMU page tables, and 48 bits for
+        4-level IOMMU page tables.
+
+    Please also refer to the wiki page for general scenarios of VT-d
+    emulation in QEMU: https://wiki.qemu.org/Features/VT-d.
+
 ERST
 
 DEF("name", HAS_ARG, QEMU_OPTION_name,
-- 
MST



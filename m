Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7E73C7995
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 00:23:57 +0200 (CEST)
Received: from localhost ([::1]:45974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Qom-00012C-9f
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 18:23:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m3QcA-0007cH-TZ
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 18:10:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m3Qc9-00082c-1e
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 18:10:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626214252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3J1FzfuBru52M0OTYvHXT9ubbEEIGS4eMsEdSAk30s8=;
 b=d7fBYREpCM6hXRdWD1q1f52Pa9HVBfzTD3fGjRYZfXoz4FWNNZ2qBY0l//DJUaWt6ZwAr2
 XhifXzZ4ZdgqD5DPpdNW0RRsZaJ4CM0Km6YW6E/3HvnodxBw71sFBvQyeiuzgoPz+lwd9A
 hfaDTkEHOkTz5t86T8GEyybt6aAcuVk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-594-yz9r0FBhPf-NLov82dvbNg-1; Tue, 13 Jul 2021 18:10:49 -0400
X-MC-Unique: yz9r0FBhPf-NLov82dvbNg-1
Received: by mail-wm1-f72.google.com with SMTP id
 x6-20020a7bc2060000b0290218ad9a8d4aso968940wmi.1
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 15:10:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3J1FzfuBru52M0OTYvHXT9ubbEEIGS4eMsEdSAk30s8=;
 b=eLxBKdi4nEACRI6bKSgrd92xwtXjbyNNnmtJJ+ImN64DTfwSi60Ex1La8xeR6Z9gzN
 6ITD/t0U4VqPyZktYaE7FMIMTNk+bswZ+mgs2Z5FOKjdJc8OlD8hG29pewXWBO5qzs6y
 exFgtLaLYTGS2k/lEgkPwFxJ4DiJx3p0qOK1gxu4afRss20dtgI88h8eC8KD/S0soWNK
 33aPJyTn+fGPwbeL4c14A2J0leQEBLhk3KxB/o41y0iarAVPTWFTSqbHauWlDu+oNMpz
 zgQfzdDaXy1yCMbx6pSyFnNFor/3qkoLUj0+eTLaK2Bq2uNCvlrE+IOPkaq7QCzAPgVA
 gViA==
X-Gm-Message-State: AOAM531DeEG4MWzbOEOElhgf1/5RiWmDXBp5+4AwPRRYtVZ7M+7OPdNq
 X+l7i4a7SgqNHEIGTSXdEBa0mhNWwSHaPRDIuYnoTyxrLsX5KA9tBq6wsb2wBJeDcg0hALE428x
 LsqydsdzM0IZx4jco0JM8o9+S7mof5QrbGyxVqG+Yal1c3F0cmuTF3JA/HlKO
X-Received: by 2002:a05:600c:224a:: with SMTP id
 a10mr416444wmm.7.1626214248358; 
 Tue, 13 Jul 2021 15:10:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxACicG0Ga3JT3SAf/SoV6G0ZgLyLOOmAOaYGPZjKEllmOr4blPI5kdQpkkwA+t1Z4Do+bE4w==
X-Received: by 2002:a05:600c:224a:: with SMTP id
 a10mr416417wmm.7.1626214248167; 
 Tue, 13 Jul 2021 15:10:48 -0700 (PDT)
Received: from redhat.com ([2.55.15.23])
 by smtp.gmail.com with ESMTPSA id r19sm118068wrg.74.2021.07.13.15.10.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 15:10:47 -0700 (PDT)
Date: Tue, 13 Jul 2021 18:10:44 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/23] docs: Add '-device intel-iommu' entry
Message-ID: <20210713220946.212562-14-mst@redhat.com>
References: <20210713220946.212562-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210713220946.212562-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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
index 8965dabc83..0fcc8973dd 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -926,6 +926,39 @@ SRST
 
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



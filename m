Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A8E3A48E8
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 20:56:11 +0200 (CEST)
Received: from localhost ([::1]:33846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrmK9-00047b-T8
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 14:56:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lrmJG-0003RE-4y
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 14:55:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lrmJC-0005ps-5X
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 14:55:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623437708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Hk/eAgwiatVo8nZCbTe6DFwcBQ4vjw2wLk+xjXU05CE=;
 b=HgJh4EdNWPydIVxPpannDswYdmiPzG+/jdttk4Z/CqObmcfW5D/sC3883oV55Xep4U0jPQ
 BjeaKJwjt3RNYnTnNc8MihLRxwSRqjLlNRFJeHHy9jKFRZR6kGny0ZfGV0TDt9OW85Z8wF
 UV/q6mg6Pz9SLGVWLgBb/lVgCyVXfxQ=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-505-4NZ8ZpAhPgu2SgO1HHPcCQ-1; Fri, 11 Jun 2021 14:55:05 -0400
X-MC-Unique: 4NZ8ZpAhPgu2SgO1HHPcCQ-1
Received: by mail-qv1-f70.google.com with SMTP id
 i6-20020a0cd8460000b029022689c68e72so16332368qvj.5
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 11:55:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Hk/eAgwiatVo8nZCbTe6DFwcBQ4vjw2wLk+xjXU05CE=;
 b=KjMeOeSrfJS6ZhsPRbyW1dakm+GZFG7xeqnj5x0HXSa4M0FfW8Mv/0nnZ9y1zghynK
 sxh4+SVuNeExESIBVNUGNbSIppCVuosI2snbUS10xENr+dnukBDEYHhBA0bq+DpNbxGP
 sWm85G6XGpD6YbsGu1GScFZ0fgVaYSUFQIIROsYOtS307QD5ODU8waeFTPBec+c6N9gT
 5rVuQdUA17fS7JVAhzwlyOG/ExUMl+lH7psTlpiZRJVoC1PAy4xcDs5CNNhxhT76T99e
 LeNnl9Wssawa+MNhUQqS4p0LyBMRzBXztCwv/AeT4MQDDxSzPY/7NyoPKylwzq31lttb
 dv1Q==
X-Gm-Message-State: AOAM532CNxScT5Sch7GXtWmSS6K+fLSGpGr9UPWKQj5XAflrsOnNZPiD
 ZM8CaBWG06QiP45QklAS0lNstGMqfW74nuj5VYZr11Ssf9d5I68W68596W7+a7ByJn4JONphNbn
 LDxY35WlsZh+6Vc4Z23IdCWmFWQ9NTXo+IiYnHD0fE1tR6Juy11VndDZEJ3/0v+F9
X-Received: by 2002:ac8:574c:: with SMTP id 12mr5303353qtx.93.1623437704075;
 Fri, 11 Jun 2021 11:55:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+QnEtz//JMQNs72UdsA0SMPExhAltk9qf64WdwPJCFoAqSMDyKjUgp79V6LrXN9jmaL0g8A==
X-Received: by 2002:ac8:574c:: with SMTP id 12mr5303325qtx.93.1623437703798;
 Fri, 11 Jun 2021 11:55:03 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-toroon474qw-grc-88-174-93-75-200.dsl.bell.ca. [174.93.75.200])
 by smtp.gmail.com with ESMTPSA id w28sm4943905qtt.88.2021.06.11.11.55.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 11:55:03 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] docs: Add '-device intel-iommu' entry
Date: Fri, 11 Jun 2021 14:55:00 -0400
Message-Id: <20210611185500.343525-1-peterx@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 peterx@redhat.com, Alex Williamson <alex.williamson@redhat.com>,
 Jing Zhao <jinzhao@redhat.com>, Lei Yang <leiyang@redhat.com>,
 Chao Yang <chayang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 qemu-options.hx | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/qemu-options.hx b/qemu-options.hx
index 14258784b3a..4bb04243907 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -926,6 +926,38 @@ SRST
 
 ``-device pci-ipmi-bt,bmc=id``
     Like the KCS interface, but defines a BT interface on the PCI bus.
+
+``-device intel-iommu[,option=...]``
+    This is only supported by ``-machine q35``, which will enable Intel VT-d
+    emulation within the guest.  It supports below options:
+
+    ``intremap=on|off`` (default: auto)
+        This enables interrupt remapping feature in the guest.  It's required
+        to enable complete x2apic.  Currently it only supports kvm
+        kernel-irqchip modes ``off`` or ``split``.  Full kernel-irqchip is not
+        yet supported.
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
2.31.1



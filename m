Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B85406EDD19
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 09:48:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prDOU-0002QP-Jv; Tue, 25 Apr 2023 03:47:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1prDNp-0001rK-J8
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:46:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1prDNn-0006uh-Ot
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:46:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682408799;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i/SAGLle76FTyq9rNigXzvwryqMTCWn4q7DLUw9suUA=;
 b=RXfV/maPE4Iebf0W3yQitf03adiW87jDkSu2kYDMtSzTYC6wQNvGrYeBxKHdnr0dk0i8iU
 tcXyS2pvS1YpE5neI8eX3NU3snmmXZAAHDKRCnXx4RCrI3NsTQT7ocKVgfEXDW1t+oKFvj
 QdoYwMp4p2+pLKYT/SheWwOoUrUIb44=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-65-UsLekdiqNlamJXyQIex0VA-1; Tue, 25 Apr 2023 03:46:37 -0400
X-MC-Unique: UsLekdiqNlamJXyQIex0VA-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-2f40f52c604so3040329f8f.0
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 00:46:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682408796; x=1685000796;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i/SAGLle76FTyq9rNigXzvwryqMTCWn4q7DLUw9suUA=;
 b=HeEMf1pVoZ34sAwwcYNgtjPQbuAKG2jTN2/0dFAsZCDTfYEL2kD0yl9g0GDo7xSgQZ
 PsTzLHLDuVJZeP+SvcjJUnknzzun3jWN4bgb1gIaTjg1Z8zVQfuqiMi+Th3VWtiNVQmJ
 J2VhZ66n6FGc0b7+CUEsggPYtviKwDV8c8lazYFuZvFHZ5tLt9wCjIm/LvKmetYtEr0p
 emVaB8nmI3SgwnkEy1qlZvyTPwSBMV70tFU2ccGrcOwanRp48GHVTuBVFh1q/4dHUy8Z
 EsZKTrQZFIZhx8QjRg8w2NFdRPYy84Y3xecSwmKazqOwK/U+iFdI0KkNT4FCqlAXtppn
 XHtQ==
X-Gm-Message-State: AAQBX9d/SnUZG5ZBC33tDGB0JgHaQu4OUQC0Ah0b9hSe4hYVda1VlrBx
 blFHSU0IPC/7BX9mJidhoChNTAV788H7qJVSHSJbYqQ9yiV4WSqmKn0lkVPB9CLjbLGlHBJOSww
 Yjfz0Yfj7PhSLIfZypdAnJaxtuDU//Mj1+34zLdfB3IHTWq0EfSNke12rEP1CoJNVrea5
X-Received: by 2002:adf:e391:0:b0:2dc:cad4:87b9 with SMTP id
 e17-20020adfe391000000b002dccad487b9mr11635790wrm.68.1682408795926; 
 Tue, 25 Apr 2023 00:46:35 -0700 (PDT)
X-Google-Smtp-Source: AKy350a/AZ3b/+/GVycJPvbobZAzZE2pZ3zo0jwqaHP+OzEDrlP5xsjGBiBr8Cg1xaQXfSBQVbze2A==
X-Received: by 2002:adf:e391:0:b0:2dc:cad4:87b9 with SMTP id
 e17-20020adfe391000000b002dccad487b9mr11635773wrm.68.1682408795606; 
 Tue, 25 Apr 2023 00:46:35 -0700 (PDT)
Received: from redhat.com ([2.55.61.39]) by smtp.gmail.com with ESMTPSA id
 t15-20020adfe10f000000b00304832cd960sm2553024wrz.10.2023.04.25.00.46.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 00:46:35 -0700 (PDT)
Date: Tue, 25 Apr 2023 03:46:33 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 29/31] docs/specs: Convert pci-testdev.txt to rst
Message-ID: <4d58309388003837f8eba72c5643722060a5656a.1682408661.git.mst@redhat.com>
References: <cover.1682408661.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1682408661.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Peter Maydell <peter.maydell@linaro.org>

Convert pci-testdev.txt to reStructuredText. Includes
some minor wordsmithing.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20230420160334.1048224-4-peter.maydell@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 docs/specs/pci-testdev.txt | 31 ------------------------------
 docs/specs/index.rst       |  1 +
 docs/specs/pci-ids.rst     |  2 +-
 docs/specs/pci-testdev.rst | 39 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 41 insertions(+), 32 deletions(-)
 delete mode 100644 docs/specs/pci-testdev.txt
 create mode 100644 docs/specs/pci-testdev.rst

diff --git a/docs/specs/pci-testdev.txt b/docs/specs/pci-testdev.txt
deleted file mode 100644
index 4280a1e73c..0000000000
--- a/docs/specs/pci-testdev.txt
+++ /dev/null
@@ -1,31 +0,0 @@
-pci-test is a device used for testing low level IO
-
-device implements up to three BARs: BAR0, BAR1 and BAR2.
-Each of BAR 0+1 can be memory or IO. Guests must detect
-BAR types and act accordingly.
-
-BAR 0+1 size is up to 4K bytes each.
-BAR 0+1 starts with the following header:
-
-typedef struct PCITestDevHdr {
-    uint8_t test;  <- write-only, starts a given test number
-    uint8_t width_type; <- read-only, type and width of access for a given test.
-                           1,2,4 for byte,word or long write.
-                           any other value if test not supported on this BAR
-    uint8_t pad0[2];
-    uint32_t offset; <- read-only, offset in this BAR for a given test
-    uint32_t data;    <- read-only, data to use for a given test
-    uint32_t count;  <- for debugging. number of writes detected.
-    uint8_t name[]; <- for debugging. 0-terminated ASCII string.
-} PCITestDevHdr;
-
-All registers are little endian.
-
-device is expected to always implement tests 0 to N on each BAR, and to add new
-tests with higher numbers.  In this way a guest can scan test numbers until it
-detects an access type that it does not support on this BAR, then stop.
-
-BAR2 is a 64bit memory bar, without backing storage.  It is disabled
-by default and can be enabled using the membar=<size> property.  This
-can be used to test whether guests handle pci bars of a specific
-(possibly quite large) size correctly.
diff --git a/docs/specs/index.rst b/docs/specs/index.rst
index dfa136073c..e58be38c41 100644
--- a/docs/specs/index.rst
+++ b/docs/specs/index.rst
@@ -10,6 +10,7 @@ guest hardware that is specific to QEMU.
 
    pci-ids
    pci-serial
+   pci-testdev
    ppc-xive
    ppc-spapr-xive
    ppc-spapr-numa
diff --git a/docs/specs/pci-ids.rst b/docs/specs/pci-ids.rst
index 7bc7168fb6..e302bea484 100644
--- a/docs/specs/pci-ids.rst
+++ b/docs/specs/pci-ids.rst
@@ -69,7 +69,7 @@ PCI devices (other than virtio):
 1b36:0004
   PCI Quad-port 16550A adapter (:doc:`pci-serial`)
 1b36:0005
-  PCI test device (``docs/specs/pci-testdev.txt``)
+  PCI test device (:doc:`pci-testdev`)
 1b36:0006
   PCI Rocker Ethernet switch device
 1b36:0007
diff --git a/docs/specs/pci-testdev.rst b/docs/specs/pci-testdev.rst
new file mode 100644
index 0000000000..4b6d36543b
--- /dev/null
+++ b/docs/specs/pci-testdev.rst
@@ -0,0 +1,39 @@
+====================
+QEMU PCI test device
+====================
+
+``pci-testdev`` is a device used for testing low level IO.
+
+The device implements up to three BARs: BAR0, BAR1 and BAR2.
+Each of BAR 0+1 can be memory or IO. Guests must detect
+BAR types and act accordingly.
+
+BAR 0+1 size is up to 4K bytes each.
+BAR 0+1 starts with the following header:
+
+.. code-block:: c
+
+  typedef struct PCITestDevHdr {
+      uint8_t test;        /* write-only, starts a given test number */
+      uint8_t width_type;  /*
+                            * read-only, type and width of access for a given test.
+                            * 1,2,4 for byte,word or long write.
+                            * any other value if test not supported on this BAR
+                            */
+      uint8_t pad0[2];
+      uint32_t offset;     /* read-only, offset in this BAR for a given test */
+      uint32_t data;       /* read-only, data to use for a given test */
+      uint32_t count;      /* for debugging. number of writes detected. */
+      uint8_t name[];      /* for debugging. 0-terminated ASCII string. */
+  } PCITestDevHdr;
+
+All registers are little endian.
+
+The device is expected to always implement tests 0 to N on each BAR, and to add new
+tests with higher numbers.  In this way a guest can scan test numbers until it
+detects an access type that it does not support on this BAR, then stop.
+
+BAR2 is a 64bit memory BAR, without backing storage.  It is disabled
+by default and can be enabled using the ``membar=<size>`` property.  This
+can be used to test whether guests handle PCI BARs of a specific
+(possibly quite large) size correctly.
-- 
MST



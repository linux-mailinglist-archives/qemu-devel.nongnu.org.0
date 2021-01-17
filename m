Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F5F2F922A
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jan 2021 12:56:03 +0100 (CET)
Received: from localhost ([::1]:58166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l16f4-0006cf-Rx
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 06:56:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l16Vu-0001YU-JN
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 06:46:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l16Vs-0008CM-GB
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 06:46:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610883991;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wtBD/fOgceuFjvjkkNCQvIfgVbHnsWCgQv6uWu9glD4=;
 b=XNLCVs7sY2AmMaDAe5VebZ2Ba65MJb47UMyc6lE+o/mIJmuMlv/XRMe20b6YDiGlAyqE4b
 KbRuG13W4hdUhLoG+215e1D+f2WbwbyjbHG5im2+zjKwmmTuauSg3/g6E351EoTm0QUCJ2
 Effr6GC5c2Q+9MAs9mguWrW7AWbfn00=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192-2NVVfRssOdC0lsoI80lpiw-1; Sun, 17 Jan 2021 06:46:29 -0500
X-MC-Unique: 2NVVfRssOdC0lsoI80lpiw-1
Received: by mail-wr1-f71.google.com with SMTP id u29so6797443wru.6
 for <qemu-devel@nongnu.org>; Sun, 17 Jan 2021 03:46:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wtBD/fOgceuFjvjkkNCQvIfgVbHnsWCgQv6uWu9glD4=;
 b=GwrbgH24o6OZLRVO8lkc48wcwWMUqTRc9GKokT7uP6MWzdqCAifxwhxUAq/SQEixgR
 FydFNp3VTxy1nZH7lwvFXES9drb3vixson8ZpdWCqgSt8LYetZbgxlY6jzVh+QWjyxix
 iwEOIoTFyVwUV0Ws/ZSc3exE8fG/Rheg+sNsaSUhB32gquc74WRFpPhUjcb2+Lll1buz
 aawmse7wvm8L2J908A67GjK+FcPWn9xuWUYayYd9w21vHyR5i/Gv5NAvVxJLMdbgwgBr
 8YAmnoymiAULKs23sxoMU6TN7kNHD1r7zZA60ZonxuNS2UuO0RyNj+aJmBMFn/EJNVpG
 62wQ==
X-Gm-Message-State: AOAM532/FIRCAjPhkMFWwbVSOSsjveCDwg1gybxgri67Xhfu3RDvaatR
 SYjiVyHt/KL7O2TrIAcWjOyTcO001X7qPVPtXT/jot4BVFH+NpAduahplTBEmUpTAhZbLGSrCdn
 6MSXitEn4paZCUW0wor82NPQpCTwcUB6SStxX1RzIVuc3/z/3aKvHZHsTCDOI
X-Received: by 2002:a1c:a7c5:: with SMTP id
 q188mr16249509wme.108.1610883987777; 
 Sun, 17 Jan 2021 03:46:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxKqY0j7vI12F70My5AC2OBes/mT7jXru+Vs/V91FemuWaKBlzydZFLanscoNGR1/1/0NMVhA==
X-Received: by 2002:a1c:a7c5:: with SMTP id
 q188mr16249497wme.108.1610883987605; 
 Sun, 17 Jan 2021 03:46:27 -0800 (PST)
Received: from redhat.com (bzq-79-176-30-58.red.bezeqint.net. [79.176.30.58])
 by smtp.gmail.com with ESMTPSA id
 r13sm22742018wrt.10.2021.01.17.03.46.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jan 2021 03:46:26 -0800 (PST)
Date: Sun, 17 Jan 2021 06:46:25 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/10] acpi: Fix unmatched expected DSDT.pxb file
Message-ID: <20210117114519.539647-5-mst@redhat.com>
References: <20210117114519.539647-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210117114519.539647-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jiahui Cen <cenjiahui@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jiahui Cen <cenjiahui@huawei.com>

Commit fe1127da11 ("unit-test: Add the binary file and clear diff.h") does
not use the up-to-date expected file for pxb for ARM virt.

Fix the expected DSDT.pxb file.

Full diff of changed file disassembly:

@@ -5,13 +5,13 @@
  *
  * Disassembling to symbolic ASL+ operators
  *
- * Disassembly of tests/data/acpi/virt/DSDT.pxb, Thu Jan 14 09:33:09 2021
+ * Disassembly of tests/data/acpi/virt/DSDT.pxb, Thu Jan 14 13:34:47 2021
  *
  * Original Table Header:
  *     Signature        "DSDT"
- *     Length           0x00001E7A (7802)
+ *     Length           0x00001DF9 (7673)
  *     Revision         0x02
- *     Checksum         0x57
+ *     Checksum         0x42
  *     OEM ID           "BOCHS "
  *     OEM Table ID     "BXPCDSDT"
  *     OEM Revision     0x00000001 (1)
@@ -45,32 +45,6 @@
             })
         }

-        Device (FLS0)
-        {
-            Name (_HID, "LNRO0015")  // _HID: Hardware ID
-            Name (_UID, Zero)  // _UID: Unique ID
-            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
-            {
-                Memory32Fixed (ReadWrite,
-                    0x00000000,         // Address Base
-                    0x04000000,         // Address Length
-                    )
-            })
-        }
-
-        Device (FLS1)
-        {
-            Name (_HID, "LNRO0015")  // _HID: Hardware ID
-            Name (_UID, One)  // _UID: Unique ID
-            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
-            {
-                Memory32Fixed (ReadWrite,
-                    0x04000000,         // Address Base
-                    0x04000000,         // Address Length
-                    )
-            })
-        }
-
         Device (FWCF)
         {
             Name (_HID, "QEMU0002")  // _HID: Hardware ID
@@ -665,9 +639,6 @@
         {
             Name (_HID, "PNP0A08" /* PCI Express Bus */)  // _HID: Hardware ID
             Name (_CID, "PNP0A03" /* PCI Bus */)  // _CID: Compatible ID
-            Name (_ADR, Zero)  // _ADR: Address
-            Name (_CCA, One)  // _CCA: Cache Coherency Attribute
-            Name (_SEG, Zero)  // _SEG: PCI Segment
             Name (_BBN, 0x80)  // _BBN: BIOS Bus Number
             Name (_UID, 0x80)  // _UID: Unique ID
             Name (_STR, Unicode ("pxb Device"))  // _STR: Description String
@@ -1857,7 +1828,7 @@
             Name (_CID, "PNP0A03" /* PCI Bus */)  // _CID: Compatible ID
             Name (_SEG, Zero)  // _SEG: PCI Segment
             Name (_BBN, Zero)  // _BBN: BIOS Bus Number
-            Name (_UID, "PCI0")  // _UID: Unique ID
+            Name (_UID, Zero)  // _UID: Unique ID
             Name (_STR, Unicode ("PCIe 0 Device"))  // _STR: Description String
             Name (_CCA, One)  // _CCA: Cache Coherency Attribute
             Name (_PRT, Package (0x80)  // _PRT: PCI Routing Table
@@ -2983,41 +2954,37 @@
                 Return (0x0000004010000000)
             }

-            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
+            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
             {
-                Return (ResourceTemplate ()
-                {
-                    WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
-                        0x0000,             // Granularity
-                        0x0000,             // Range Minimum
-                        0x007F,             // Range Maximum
-                        0x0000,             // Translation Offset
-                        0x0080,             // Length
-                        ,, )
-                    DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
-                        0x00000000,         // Granularity
-                        0x10000000,         // Range Minimum
-                        0x3EFEFFFF,         // Range Maximum
-                        0x00000000,         // Translation Offset
-                        0x2EFF0000,         // Length
-                        ,, , AddressRangeMemory, TypeStatic)
-                    DWordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
-                        0x00000000,         // Granularity
-                        0x00000000,         // Range Minimum
-                        0x0000FFFF,         // Range Maximum
-                        0x3EFF0000,         // Translation Offset
-                        0x00010000,         // Length
-                        ,, , TypeStatic, DenseTranslation)
-                    QWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
-                        0x0000000000000000, // Granularity
-                        0x0000008000000000, // Range Minimum
-                        0x000000FFFFFFFFFF, // Range Maximum
-                        0x0000000000000000, // Translation Offset
-                        0x0000008000000000, // Length
-                        ,, , AddressRangeMemory, TypeStatic)
-                })
-            }
-
+                WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
+                    0x0000,             // Granularity
+                    0x0000,             // Range Minimum
+                    0x007F,             // Range Maximum
+                    0x0000,             // Translation Offset
+                    0x0080,             // Length
+                    ,, )
+                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
+                    0x00000000,         // Granularity
+                    0x10000000,         // Range Minimum
+                    0x3EFEFFFF,         // Range Maximum
+                    0x00000000,         // Translation Offset
+                    0x2EFF0000,         // Length
+                    ,, , AddressRangeMemory, TypeStatic)
+                DWordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
+                    0x00000000,         // Granularity
+                    0x00000000,         // Range Minimum
+                    0x0000FFFF,         // Range Maximum
+                    0x3EFF0000,         // Translation Offset
+                    0x00010000,         // Length
+                    ,, , TypeStatic, DenseTranslation)
+                QWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
+                    0x0000000000000000, // Granularity
+                    0x0000008000000000, // Range Minimum
+                    0x000000FFFFFFFFFF, // Range Maximum
+                    0x0000000000000000, // Translation Offset
+                    0x0000008000000000, // Length
+                    ,, , AddressRangeMemory, TypeStatic)
+            })
             Name (SUPP, Zero)
             Name (CTRL, Zero)
             Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities

Fixes: fe1127da11 ("unit-test: Add the binary file and clear diff.h")
Acked-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
Message-Id: <20210114100643.10617-3-cenjiahui@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/data/acpi/virt/DSDT.pxb | Bin 7802 -> 7673 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/tests/data/acpi/virt/DSDT.pxb b/tests/data/acpi/virt/DSDT.pxb
index d5f0533a02d62bc2ae2db9b9de9484e5c06652fe..76f5f1c2fd487644c6b4f827a70ad770edb9fdc9 100644
GIT binary patch
delta 70
zcmV-M0J;DAJo!5cL{mgm`5gcN0z#1r8v=ygktblW?YIa6OPZ6X2_m!G35f{>PNz^q
cNt3DxACrg^53`&Ttq27OUqez;vr-%=0*oRUFaQ7m

delta 217
zcmexq{mX{SCD<jTN{)enDSRTAG*j!-iRuaUhHgH=1|0Doo-VvTenI{Q28N~#9Py!^
zE<n;bC|FRCi?5B7fsp|MSSlH!n?PC&v1wsM*TMqS1=eEW7Vhi@(GuwD8){%+U<5Qj
zIK*+|g83XwzOyGgaw_pVx&(nNb#?@r6YT1~If1i>lgWL><aa`bth@ovo(7xch1YU$
Qia3I;VOX;HqO=AR0CN5_Pyhe`

-- 
MST



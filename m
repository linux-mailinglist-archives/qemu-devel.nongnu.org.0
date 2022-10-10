Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C965FA368
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 20:34:02 +0200 (CEST)
Received: from localhost ([::1]:44070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohxbE-0004AH-Br
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 14:34:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwdG-00041B-H2
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:32:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24105)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwd6-0007UI-Nd
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:32:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665423110;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/uDuOboLUbGT8ltfg6VbHHBLEZD3jPfpwj8L5f+Uk+4=;
 b=ASHsuqvBQEjajF1Tl3yVcggAh93g4PHH+S/DflawQdLVe+iIyckdtYrvkLmRUa3BRBUX76
 dFKtXIt/Y/GhKvEvMlnpQi637DrvHl43A2RIfFlcWEltEgiT3mTmq+9Op3x1d/zf5Ds+ln
 yfQkyVOVhtSRtC071WoAGAckHdI3+4I=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-505-hHUYGD2FN4uV7i5OrKuZCQ-1; Mon, 10 Oct 2022 13:31:49 -0400
X-MC-Unique: hHUYGD2FN4uV7i5OrKuZCQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 l16-20020adfc790000000b00230c2505f96so785879wrg.4
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 10:31:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/uDuOboLUbGT8ltfg6VbHHBLEZD3jPfpwj8L5f+Uk+4=;
 b=7X3g/JwkwRVud1y35YjgnEi6AfMxTUc78mxtvW8EpqMf9JE2h7FW0/o2CX4lJN+ywW
 3doQL6IZRjSKKPDqzNnMlKhYbZmfAyTbgam9EdHxFGUs/nUGAoH+XHrHvKjfpym3ICRc
 yat/y1dRLRkXvA7BY39ipBAHCdhz1VV5/Oue/2Bawq2xMCOC0xLIloDuPP21t1rFZ7mV
 GfLmcWBDdwFh20rCu+QfdQzSy3RsfmisjorRDPbEbSUxYxewF1W4sb6u2HvoQXduVA6b
 0WvFVO1cN+rBs+VZ9KMU5CtGs8JYf0Og+71To8+EslXziOhe2i+9z94JcFG2uPrX3N4m
 vGhg==
X-Gm-Message-State: ACrzQf0DGhtzrIv8435xuTCK6Rs5EHLfsUkYTSOBUOC6Ra6dWZb6Efay
 RO3iT3OcrYKdAquarbKPjZYMTc8szv5b1L1dotdFft9qfnFxfxkHyfbE6pal37qwo3+eP3Q5Vbl
 jOK6widUi51WQHdIXuKyev/RtnZb+8Djv0LORmv0651F7DJJkT4RdmYGqW6sz
X-Received: by 2002:adf:e198:0:b0:22e:ab4d:935b with SMTP id
 az24-20020adfe198000000b0022eab4d935bmr11105195wrb.306.1665423107379; 
 Mon, 10 Oct 2022 10:31:47 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4Opn7GF8JHUD6RdmGa3m7CB/NBIwcd2sjX0hj7WduTbc7phlP8w2jgZ+XpvCE02MoHiQ6wFg==
X-Received: by 2002:adf:e198:0:b0:22e:ab4d:935b with SMTP id
 az24-20020adfe198000000b0022eab4d935bmr11105169wrb.306.1665423106923; 
 Mon, 10 Oct 2022 10:31:46 -0700 (PDT)
Received: from redhat.com ([2.55.183.131]) by smtp.gmail.com with ESMTPSA id
 l12-20020a05600c2ccc00b003b47e8a5d22sm13636450wmc.23.2022.10.10.10.31.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 10:31:46 -0700 (PDT)
Date: Mon, 10 Oct 2022 13:31:42 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 41/55] tests: acpi: update expected blobs after HPET move
Message-ID: <20221010172813.204597-42-mst@redhat.com>
References: <20221010172813.204597-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221010172813.204597-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

HPET AML moved after PCI host bridge description (no functional change)

diff example for PC machine:

@@ -54,47 +54,6 @@ DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPC    ", 0x00000001)
         }
     }

-    Scope (_SB)
-    {
-        Device (HPET)
-        {
-            Name (_HID, EisaId ("PNP0103") /* HPET System Timer */)  // _HID: Hardware ID
-            Name (_UID, Zero)  // _UID: Unique ID
-            OperationRegion (HPTM, SystemMemory, 0xFED00000, 0x0400)
-            Field (HPTM, DWordAcc, Lock, Preserve)
-            {
-                VEND,   32,
-                PRD,    32
-            }
-
-            Method (_STA, 0, NotSerialized)  // _STA: Status
-            {
-                Local0 = VEND /* \_SB_.HPET.VEND */
-                Local1 = PRD /* \_SB_.HPET.PRD_ */
-                Local0 >>= 0x10
-                If (((Local0 == Zero) || (Local0 == 0xFFFF)))
-                {
-                    Return (Zero)
-                }
-
-                If (((Local1 == Zero) || (Local1 > 0x05F5E100)))
-                {
-                    Return (Zero)
-                }
-
-                Return (0x0F)
-            }
-
-            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
-            {
-                Memory32Fixed (ReadOnly,
-                    0xFED00000,         // Address Base
-                    0x00000400,         // Address Length
-                    )
-            })
-        }
-    }
-
     Scope (_SB.PCI0)
     {
         Device (ISA)
@@ -529,6 +488,47 @@ DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPC    ", 0x00000001)
         }
     }

+    Scope (_SB)
+    {
+        Device (HPET)
+        {
+            Name (_HID, EisaId ("PNP0103") /* HPET System Timer */)  // _HID: Hardware ID
+            Name (_UID, Zero)  // _UID: Unique ID
+            OperationRegion (HPTM, SystemMemory, 0xFED00000, 0x0400)
+            Field (HPTM, DWordAcc, Lock, Preserve)
+            {
+                VEND,   32,
+                PRD,    32
+            }
+
+            Method (_STA, 0, NotSerialized)  // _STA: Status
+            {
+                Local0 = VEND /* \_SB_.HPET.VEND */
+                Local1 = PRD /* \_SB_.HPET.PRD_ */
+                Local0 >>= 0x10
+                If (((Local0 == Zero) || (Local0 == 0xFFFF)))
+                {
+                    Return (Zero)
+                }
+
+                If (((Local1 == Zero) || (Local1 > 0x05F5E100)))
+                {
+                    Return (Zero)
+                }
+
+                Return (0x0F)
+            }
+
+            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
+            {
+                Memory32Fixed (ReadOnly,
+                    0xFED00000,         // Address Base
+                    0x00000400,         // Address Length
+                    )
+            })
+        }
+    }
+
     Scope (_SB)
     {
         Device (\_SB.PCI0.PRES)

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20220701133515.137890-4-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h |  32 --------------------
 tests/data/acpi/pc/DSDT                     | Bin 5987 -> 5987 bytes
 tests/data/acpi/pc/DSDT.acpierst            | Bin 5954 -> 5954 bytes
 tests/data/acpi/pc/DSDT.acpihmat            | Bin 7312 -> 7312 bytes
 tests/data/acpi/pc/DSDT.bridge              | Bin 8653 -> 8653 bytes
 tests/data/acpi/pc/DSDT.cphp                | Bin 6451 -> 6451 bytes
 tests/data/acpi/pc/DSDT.dimmpxm             | Bin 7641 -> 7641 bytes
 tests/data/acpi/pc/DSDT.hpbridge            | Bin 5954 -> 5954 bytes
 tests/data/acpi/pc/DSDT.hpbrroot            | Bin 3069 -> 3069 bytes
 tests/data/acpi/pc/DSDT.ipmikcs             | Bin 6059 -> 6059 bytes
 tests/data/acpi/pc/DSDT.memhp               | Bin 7346 -> 7346 bytes
 tests/data/acpi/pc/DSDT.numamem             | Bin 5993 -> 5993 bytes
 tests/data/acpi/pc/DSDT.roothp              | Bin 6195 -> 6195 bytes
 tests/data/acpi/q35/DSDT                    | Bin 8274 -> 8274 bytes
 tests/data/acpi/q35/DSDT.acpierst           | Bin 8291 -> 8291 bytes
 tests/data/acpi/q35/DSDT.acpihmat           | Bin 9599 -> 9599 bytes
 tests/data/acpi/q35/DSDT.applesmc           | Bin 8320 -> 8320 bytes
 tests/data/acpi/q35/DSDT.bridge             | Bin 10988 -> 10988 bytes
 tests/data/acpi/q35/DSDT.cphp               | Bin 8738 -> 8738 bytes
 tests/data/acpi/q35/DSDT.cxl                | Bin 9600 -> 9600 bytes
 tests/data/acpi/q35/DSDT.dimmpxm            | Bin 9928 -> 9928 bytes
 tests/data/acpi/q35/DSDT.ipmibt             | Bin 8349 -> 8349 bytes
 tests/data/acpi/q35/DSDT.ipmismbus          | Bin 8363 -> 8363 bytes
 tests/data/acpi/q35/DSDT.ivrs               | Bin 8291 -> 8291 bytes
 tests/data/acpi/q35/DSDT.memhp              | Bin 9633 -> 9633 bytes
 tests/data/acpi/q35/DSDT.mmio64             | Bin 9404 -> 9404 bytes
 tests/data/acpi/q35/DSDT.multi-bridge       | Bin 8568 -> 8568 bytes
 tests/data/acpi/q35/DSDT.numamem            | Bin 8280 -> 8280 bytes
 tests/data/acpi/q35/DSDT.pvpanic-isa        | Bin 8375 -> 8375 bytes
 tests/data/acpi/q35/DSDT.tis.tpm12          | Bin 8880 -> 8880 bytes
 tests/data/acpi/q35/DSDT.tis.tpm2           | Bin 8906 -> 8906 bytes
 tests/data/acpi/q35/DSDT.viot               | Bin 9383 -> 9383 bytes
 tests/data/acpi/q35/DSDT.xapic              | Bin 35637 -> 35637 bytes
 33 files changed, 32 deletions(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index a7aa428fab..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,33 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/pc/DSDT",
-"tests/data/acpi/pc/DSDT.acpierst",
-"tests/data/acpi/pc/DSDT.acpihmat",
-"tests/data/acpi/pc/DSDT.bridge",
-"tests/data/acpi/pc/DSDT.cphp",
-"tests/data/acpi/pc/DSDT.dimmpxm",
-"tests/data/acpi/pc/DSDT.hpbridge",
-"tests/data/acpi/pc/DSDT.hpbrroot",
-"tests/data/acpi/pc/DSDT.ipmikcs",
-"tests/data/acpi/pc/DSDT.memhp",
-"tests/data/acpi/pc/DSDT.numamem",
-"tests/data/acpi/pc/DSDT.roothp",
-"tests/data/acpi/q35/DSDT",
-"tests/data/acpi/q35/DSDT.acpierst",
-"tests/data/acpi/q35/DSDT.acpihmat",
-"tests/data/acpi/q35/DSDT.applesmc",
-"tests/data/acpi/q35/DSDT.bridge",
-"tests/data/acpi/q35/DSDT.cphp",
-"tests/data/acpi/q35/DSDT.cxl",
-"tests/data/acpi/q35/DSDT.dimmpxm",
-"tests/data/acpi/q35/DSDT.ipmibt",
-"tests/data/acpi/q35/DSDT.ipmismbus",
-"tests/data/acpi/q35/DSDT.ivrs",
-"tests/data/acpi/q35/DSDT.memhp",
-"tests/data/acpi/q35/DSDT.mmio64",
-"tests/data/acpi/q35/DSDT.multi-bridge",
-"tests/data/acpi/q35/DSDT.numamem",
-"tests/data/acpi/q35/DSDT.pvpanic-isa",
-"tests/data/acpi/q35/DSDT.tis.tpm12",
-"tests/data/acpi/q35/DSDT.tis.tpm2",
-"tests/data/acpi/q35/DSDT.viot",
-"tests/data/acpi/q35/DSDT.xapic",
diff --git a/tests/data/acpi/pc/DSDT b/tests/data/acpi/pc/DSDT
index e80bef30317b5ef3bf0d2fb7aaabd6def109adb6..2d543fbf94e42f03814019c146b49f94e76bf15d 100644
GIT binary patch
delta 19
bcmaE?_gHVjq|FM9s%#S{^=)=#mlFU0Q=bPS

delta 19
bcmaE?_gHVjq{-Xa`Zi8dW!vn^E++s0T|@`I

diff --git a/tests/data/acpi/pc/DSDT.acpierst b/tests/data/acpi/pc/DSDT.acpierst
index d5a2ca51652dfc3637a817bac4a02d6ff6dc8ac2..798349aa3f85e0803396471237e94604d00a1f90 100644
GIT binary patch
delta 19
bcmX@4cSvu-q|FM9s%#S{^=)=#|H}^mP`C%a

delta 19
bcmX@4cSvu-q{-Xa`Zi8dW!vn^{+AyBT3rZQ

diff --git a/tests/data/acpi/pc/DSDT.acpihmat b/tests/data/acpi/pc/DSDT.acpihmat
index f86c743c4d64041c7fbd9999cc700e88416770b7..2b0fd3433b586fd7665b9a0b5b2f8bb3fcc09b44 100644
GIT binary patch
delta 19
bcmbPWIl*$mq|FM9s%#S{^=)=#_Z9^JNyrAo

delta 19
bcmbPWIl*$mq{-Xa`Zi8dW!vn^?kx%cQ*8%e

diff --git a/tests/data/acpi/pc/DSDT.bridge b/tests/data/acpi/pc/DSDT.bridge
index 14ed0d995a9f6540deae5a25a7853ed4493a6e06..56398fc0147c9ab9d59947e24cddb08380b6a13e 100644
GIT binary patch
delta 19
bcmX@>eAaowq|FM9s%#S{^=)=#?~nojR4)gV

delta 19
bcmX@>eAaowq{-Xa`Zi8dW!vn^-XR45UDOCL

diff --git a/tests/data/acpi/pc/DSDT.cphp b/tests/data/acpi/pc/DSDT.cphp
index c653302a84a42d063a74a22c6adf910beeba7c60..38cb47c675edb6d4797b008d2deae656739230ef 100644
GIT binary patch
delta 19
bcmdmNwApCFq|FM9s%#S{^=)=#e<uh4PY4H_

delta 19
bcmdmNwApCFq{-Xa`Zi8dW!vn^{!S18Sgi;*

diff --git a/tests/data/acpi/pc/DSDT.dimmpxm b/tests/data/acpi/pc/DSDT.dimmpxm
index 247a1796b1cf31c24b1a981e48937609f84fe2cb..06a7aa59465238bfbf715ae83540f68b1f2f3ea5 100644
GIT binary patch
delta 19
bcmca<ebaivq|FM9s%#S{^=)=#pCSeTRO1Jv

delta 19
bcmca<ebaivq{-Xa`Zi8dW!vn^K1B=wUWf=l

diff --git a/tests/data/acpi/pc/DSDT.hpbridge b/tests/data/acpi/pc/DSDT.hpbridge
index d5a2ca51652dfc3637a817bac4a02d6ff6dc8ac2..798349aa3f85e0803396471237e94604d00a1f90 100644
GIT binary patch
delta 19
bcmX@4cSvu-q|FM9s%#S{^=)=#|H}^mP`C%a

delta 19
bcmX@4cSvu-q{-Xa`Zi8dW!vn^{+AyBT3rZQ

diff --git a/tests/data/acpi/pc/DSDT.hpbrroot b/tests/data/acpi/pc/DSDT.hpbrroot
index ec99b1622934a0fd8bc316291c33231e4c57dce0..dd2c8c0c8c5bf9895eb524e094d5597515b4803e 100644
GIT binary patch
delta 19
bcmew>{#Sg$q|FM9Y^)O}^=(#TyUq##Q{o4f

delta 19
bcmew>{#Sg$q{%Z_`!-HuW8JLAcAXUfTxbXq

diff --git a/tests/data/acpi/pc/DSDT.ipmikcs b/tests/data/acpi/pc/DSDT.ipmikcs
index f0d9e75841ea3d69fed9384e439bc4e94c7a4c4e..be7f22f1c29f25351bcb5620dcfe8f955bd083d7 100644
GIT binary patch
delta 19
bcmZ3jzgmC7q|FM9xoi_B^=<BDmlFU0PtgZN

delta 19
bcmZ3jzgmC7q{;u;`Zi9=W!v1#E++s0TmA?r

diff --git a/tests/data/acpi/pc/DSDT.memhp b/tests/data/acpi/pc/DSDT.memhp
index d0a7c462094fea9a457cbf537784735e74f7d7d5..b81e3dd8ecd89f4690d69a90096df095fe218425 100644
GIT binary patch
delta 19
bcmdmFxyf?Eq|FM9s%#S{^=)=#&lLp#PSgh~

delta 19
bcmdmFxyf?Eq{-Xa`Zi8dW!vn^o+}CfSa}D=

diff --git a/tests/data/acpi/pc/DSDT.numamem b/tests/data/acpi/pc/DSDT.numamem
index 2f512cfbe158f1739803c0c7009fe5e907bdec54..230aaae37169ec2f78ebeae735ccc905a112d284 100644
GIT binary patch
delta 19
bcmaE<_fl`dq|FM9s%#S{^=)=#R}laJRD%aJ

delta 19
bcmaE<_fl`dq{-Xa`Zi8dW!vn^t|9;cUML69

diff --git a/tests/data/acpi/pc/DSDT.roothp b/tests/data/acpi/pc/DSDT.roothp
index 46e03d39e00ea70e55d6a12333ca2b98c5e5bb53..7091ee019191d822869f9a9f35ebd635eea4a9eb 100644
GIT binary patch
delta 19
bcmdmNu-Rb3q|FM9s%#S{^=)=#e<uI{PQwS5

delta 19
bcmdmNu-Rb3q{-Xa`Zi8dW!vn^{!Rb@SZD|`

diff --git a/tests/data/acpi/q35/DSDT b/tests/data/acpi/q35/DSDT
index 2cd8d5fc470fc3159fbc464af97e76c8de2136e3..a85c608022b9e0878bcedc785b9bdf27e50a760b 100644
GIT binary patch
delta 21
dcmccQaLHjqDC6eGjEoYKLmB%vKatF10{~?<2zCGf

delta 21
dcmccQaLHjqDC6WX$-d2@jEoYSpGfAh0RUn62mt^9

diff --git a/tests/data/acpi/q35/DSDT.acpierst b/tests/data/acpi/q35/DSDT.acpierst
index 0bc5de80652ae7328fdc07ccda34afff39ade56f..f768380c1c2aa8fcd6ff6bc1048e0ccd2037eb2c 100644
GIT binary patch
delta 21
dcmaFt@YrEPDC6eGjEoYKLmB%vKas3w0|00M2&n)7

delta 21
dcmaFt@YrEPDC6WX$-d2@jEoYSpGelT0RUve2s8iy

diff --git a/tests/data/acpi/q35/DSDT.acpihmat b/tests/data/acpi/q35/DSDT.acpihmat
index af10345e8806c78a0074b3a8819b5cfca4d70c01..51e79b3b0754224aa6cd1e1257b404182506f1d1 100644
GIT binary patch
delta 21
dcmezG_1|klDC6eGjEoYKLmB%vKarfx4FGN#2^IhV

delta 21
dcmezG_1|klDC6WX$-d2@jEoYSpGeN;1^{Z?2%!J~

diff --git a/tests/data/acpi/q35/DSDT.applesmc b/tests/data/acpi/q35/DSDT.applesmc
index 00092aacc6ce44dd8792b00a0fa183e5b06d33c6..33ca7ee26fee6718c72dd63374bea98e858066c2 100644
GIT binary patch
delta 21
ccmZp0Y;fEV%DDM4qrSxCP{zK^LQ;8b09Qc=F#rGn

delta 21
ccmZp0Y;fEV$~d`2vTt)JqrSvuA*nnz09By|>Hq)$

diff --git a/tests/data/acpi/q35/DSDT.bridge b/tests/data/acpi/q35/DSDT.bridge
index d820098355e0b79dc69d714817fe906064852f4d..40457ec74d272f4ce971b66a1b19a397ed9af770 100644
GIT binary patch
delta 21
dcmaD8`X+QkDC6eGjEoYKLmB%vKau1R1ORKJ2zdYi

delta 21
dcmaD8`X+QkDC6WX$-d2@jEoYSpGa~D0sv@b2m}BC

diff --git a/tests/data/acpi/q35/DSDT.cphp b/tests/data/acpi/q35/DSDT.cphp
index ac8456a43d54209d77917163b282954d7429b331..fe87e060d5cf41b20cf1a37928ed31ca9b15ed66 100644
GIT binary patch
delta 21
dcmZ4FvdCpaDC6eGjEoYKLmB%vKasTK003R^2k-y@

delta 21
dcmZ4FvdCpaDC6WX$-d2@jEoYSpGewq003ID2YUbj

diff --git a/tests/data/acpi/q35/DSDT.cxl b/tests/data/acpi/q35/DSDT.cxl
index 369ae90196113ec666a4acec7bb7a93be5b60e75..82d7563a73f6b7a4ead15ca0933d0e57ae8be48e 100644
GIT binary patch
delta 21
dcmZqhZt&g^%DDM4BcsIRP{zK^PbBAX0{~iS2pa$Z

delta 21
ccmZqhZt&g^$~ZYpvTt)JBcsITCz5lx0aq&rrT_o{

diff --git a/tests/data/acpi/q35/DSDT.dimmpxm b/tests/data/acpi/q35/DSDT.dimmpxm
index bb0eadf869fe366fc139f8b0fd2ed811d3b16814..304c8229d81e333ed7564423cf50ad2b963b0a2e 100644
GIT binary patch
delta 21
dcmX@%d%|}^DC6eGjEoYKLmB%vKaqUG0{~`*2>1X1

delta 21
dcmX@%d%|}^DC6WX$-d2@jEoYSpGZF80RUr22!j9s

diff --git a/tests/data/acpi/q35/DSDT.ipmibt b/tests/data/acpi/q35/DSDT.ipmibt
index bb258279506e78b50545f6f9030bd25afe433c29..b9a5ae240c62f29d952d94a280bc97d608b3c2e5 100644
GIT binary patch
delta 21
dcmbR1IM;DQDC6eGj6M>RLmB%v>r3Ua0RUZm2c-Z2

delta 21
dcmbR1IM;DQDC6XXl6{*)8GR%+>r3Ua0RUX#2YUbj

diff --git a/tests/data/acpi/q35/DSDT.ipmismbus b/tests/data/acpi/q35/DSDT.ipmismbus
index 15000c357fdabf1bceef6f860bd35e9a33024927..a0eeae95c07fe3708509c3e652c3aeff9c21ac82 100644
GIT binary patch
delta 21
dcmZ4OxY}_;DC6eGj8PJkLmB%v+e+oJ0RUir2i*Vw

delta 21
dcmZ4OxY}_;DC6Yyl6{*)8KWdN+e+oJ0RUiO2f+XU

diff --git a/tests/data/acpi/q35/DSDT.ivrs b/tests/data/acpi/q35/DSDT.ivrs
index 0bc5de80652ae7328fdc07ccda34afff39ade56f..f768380c1c2aa8fcd6ff6bc1048e0ccd2037eb2c 100644
GIT binary patch
delta 21
dcmaFt@YrEPDC6eGjEoYKLmB%vKas3w0|00M2&n)7

delta 21
dcmaFt@YrEPDC6WX$-d2@jEoYSpGelT0RUve2s8iy

diff --git a/tests/data/acpi/q35/DSDT.memhp b/tests/data/acpi/q35/DSDT.memhp
index 663456fc0d3c71a51b541f5ab952e05c9dac01e6..b4a9f5a0fe5cf3b44ebe7659a2bf3687e1073482 100644
GIT binary patch
delta 21
dcmZ4Jz0i9@DC6eGjEoYKLmB%vKat$a4FF%$2z~$n

delta 21
dcmZ4Jz0i9@DC6WX$-d2@jEoYSpGfZI1^`@@2nhfH

diff --git a/tests/data/acpi/q35/DSDT.mmio64 b/tests/data/acpi/q35/DSDT.mmio64
index 91afd01d598c7c2c733387dfb5140d0fcad54adb..3af5ef2ea473322d8697281d3a20f7282f3238ac 100644
GIT binary patch
delta 21
dcmdnvxyN%uDC6eGjEoYKLmB%vKasq_1ps682+9Be

delta 21
dcmdnvxyN%uDC6WX$-d2@jEoYSpGe-|0svsP2vq<8

diff --git a/tests/data/acpi/q35/DSDT.multi-bridge b/tests/data/acpi/q35/DSDT.multi-bridge
index afde339a181628ae9153251eee026b437ab685bc..238668b95f33e831d66e2e2fa5e952f00ea7260b 100644
GIT binary patch
delta 21
dcmez2^uuXGDC6eGjEoYKLmB%vKarfm4ghPv2<-p>

delta 21
dcmez2^uuXGDC6WX$-d2@jEoYSpGZz&2LNb+2zUSh

diff --git a/tests/data/acpi/q35/DSDT.numamem b/tests/data/acpi/q35/DSDT.numamem
index e537669949a07adbaa4255021ea14bb4a9dc672f..37fa4c3a45b0d7db0d3d368df5e027e7e1acf9d2 100644
GIT binary patch
delta 21
dcmccNaKm9kDC6eGjEoYKLmB%vKanh90{~_+2#5dx

delta 21
dcmccNaKm9kDC6WX$-d2@jEoYSpGcOl0RUq32onGR

diff --git a/tests/data/acpi/q35/DSDT.pvpanic-isa b/tests/data/acpi/q35/DSDT.pvpanic-isa
index cc545b5d2505246d33f83d2482273968aa1be032..8705309748d1d7352c6623b32c28eab7fbbce2a4 100644
GIT binary patch
delta 21
dcmdn)xZQC>DC6eGjA;^+LmB%vdrIZ80RUqX2n_%L

delta 21
dcmdn)xZQC>DC6Yal6{*)8Pg;-drIZ80RUrR2mJs5

diff --git a/tests/data/acpi/q35/DSDT.tis.tpm12 b/tests/data/acpi/q35/DSDT.tis.tpm12
index a97d884c50485f848054c6ac95ecfa055ff59e5b..7408f03e4b571c352f9fdf2afc8718aa7b37da06 100644
GIT binary patch
delta 21
dcmdnsy1{irDC6eGjKNZqLmB%vo5@tM0RUmA2k`&^

delta 21
dcmdnsy1{irDC6W6(tVpl8H1%Zo5@tM0RUlJ2hacj

diff --git a/tests/data/acpi/q35/DSDT.tis.tpm2 b/tests/data/acpi/q35/DSDT.tis.tpm2
index 1f5392919b5ea69696b49ff13aab5c37d0615919..134c2fbccacd0e9383df094f9b4deb03b4e46abb 100644
GIT binary patch
delta 21
dcmX@*ddhV}DC6eGjJZ;iLmB%w2g+2k0RU%32wDID

delta 21
dcmX@*ddhV}DC6Wq(*2vm7;~gH2gp>h0RU&{2vYz6

diff --git a/tests/data/acpi/q35/DSDT.viot b/tests/data/acpi/q35/DSDT.viot
index e20e4ee5e92e11ccf890a18fbdd78181c43f3b5c..be4a254e93a9cb360f42a25121c5fcefbd47480f 100644
GIT binary patch
delta 21
dcmZ4Px!iL@DC6eGjEoYKLmB%vKao7l1pr`z2#Wv!

delta 21
dcmZ4Px!iL@DC6WX$-d2@jEoYSpGY3&0svh^2o?YU

diff --git a/tests/data/acpi/q35/DSDT.xapic b/tests/data/acpi/q35/DSDT.xapic
index 3cab5956eee60363251a6fab0cc981bbbda64443..2327152da1b7d777c1f3da358ae5ae1406384d11 100644
GIT binary patch
delta 23
fcmdlwjcMyNrVXKtn;$bWN=y!A?A!cAGO!Q;anuPq

delta 23
fcmdlwjcMyNrVXKtlfxwYHit4YN^E{28CVDaZk7ne

-- 
MST



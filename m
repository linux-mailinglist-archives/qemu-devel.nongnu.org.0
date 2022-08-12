Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B08A591066
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 13:55:06 +0200 (CEST)
Received: from localhost ([::1]:38680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMTFp-0001kx-HU
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 07:55:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMT6d-0000NA-Me
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 07:45:40 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:42698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMT6b-0002PB-PI
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 07:45:35 -0400
Received: by mail-wr1-x432.google.com with SMTP id z12so921215wrs.9
 for <qemu-devel@nongnu.org>; Fri, 12 Aug 2022 04:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc;
 bh=vbWfB9CjU9z+tqDUQgDaE2aZH/5w51IwbVjV5htTk/w=;
 b=IZNvGP+RRqEbXEXmWRrKMEVTNO9lJoEiXHwx3EmWRgXkpJKHTtr+lXZqbPGIjiRVND
 SHXJt6e59K9QIdMJ0nfRIaExUhAduK3MK7Ad5gEhkFVUYi7a7P1PYD3O7rLHRtjNd9SY
 RHozYpeVGoEQhnidV7P+A6r1m2eyLgJ4KkSaT9Mbp1e6l6H232KErr1EyyKxs20TooNh
 /dTIadar/s6a9DKvnuRz230tR9G0vyKgToHqwaZ3v/+KZAYyq5bginc8Ad66hMu7Ob0e
 /4mLdk4HKnzg8tiDQKohhgp/yn2sU8Gds4Mcf6PVqoBfiluelI2RTBC5Egp9jF7sMmIO
 EjMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
 bh=vbWfB9CjU9z+tqDUQgDaE2aZH/5w51IwbVjV5htTk/w=;
 b=coBa46hibUrrxezPDCdUJjjMm4fJzw4CBjNL6VAa0tAG0azFD/w9GMD/2mRKH90CnX
 MayhWHWuFU5xHDqve1jEPgnoyZ1+054U/ToYmMo2HSI/+gmzy2h+bDlmoCCaLKkgb/BC
 aRYy8IdKJr6SnulFE8rkE5mhwCj0P13nRom0HuiHqIX6XVdXybVE7QzntxPbMynRWPrQ
 03LACIHlaV+IHdKp66zon58N0PL+YtXz2MuW9l3NfQwj56LZMvKjxhNVWRVeF8EqjLT2
 dpGiD5dDtqGKtETgkQxYoZD5PerRbe+KkZGPO98x8bWCyMOJsgEjV+X9s3yx8v7S1GuR
 xucw==
X-Gm-Message-State: ACgBeo0FHCS7R9EguKB9hFJJbnuqOv5e3UplRBR6ZEudzhHK9wca5W2Z
 v+soiXjPQV2L9yjrKHZMdiF+Oc3WIfKhvw==
X-Google-Smtp-Source: AA6agR5zHmvV4gp2EDHGeOnSJ4240O9A1WHVzgp9lcQc9ksfL+qms3LvfEq1S4kCtHdpTBMvEpK1fw==
X-Received: by 2002:a05:6000:1f07:b0:21f:1403:a59d with SMTP id
 bv7-20020a0560001f0700b0021f1403a59dmr1856805wrb.46.1660304731813; 
 Fri, 12 Aug 2022 04:45:31 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 n8-20020a05600c3b8800b003a5418245b9sm11257797wms.19.2022.08.12.04.45.30
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Aug 2022 04:45:31 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 2/5] Fix some typos in documentation (most of them found by
 codespell)
Date: Fri, 12 Aug 2022 12:45:24 +0100
Message-Id: <20220812114527.1336370-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220812114527.1336370-1-peter.maydell@linaro.org>
References: <20220812114527.1336370-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Weil <sw@weilnetz.de>

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Hongren (Zenithal) Zheng <i@zenithal.me>
Message-id: 20220812075642.1200578-1-sw@weilnetz.de
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/about/deprecated.rst       |  2 +-
 docs/specs/acpi_erst.rst        |  4 ++--
 docs/system/devices/canokey.rst |  8 ++++----
 docs/system/devices/cxl.rst     | 12 ++++++------
 4 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 7ee26626d5c..91b03115ee2 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -297,7 +297,7 @@ by using ``-machine graphics=off``.
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
 In QEMU versions 6.1, 6.2 and 7.0, the ``nvme-ns`` generates an EUI-64
-identifer that is not globally unique. If an EUI-64 identifer is required, the
+identifier that is not globally unique. If an EUI-64 identifier is required, the
 user must set it explicitly using the ``nvme-ns`` device parameter ``eui64``.
 
 ``-device nvme,use-intel-id=on|off`` (since 7.1)
diff --git a/docs/specs/acpi_erst.rst b/docs/specs/acpi_erst.rst
index a8a9d22d254..2339b60ad74 100644
--- a/docs/specs/acpi_erst.rst
+++ b/docs/specs/acpi_erst.rst
@@ -108,7 +108,7 @@ Slot 0 contains a backend storage header that identifies the contents
 as ERST and also facilitates efficient access to the records.
 Depending upon the size of the backend storage, additional slots will
 be designated to be a part of the slot 0 header. For example, at 8KiB,
-the slot 0 header can accomodate 1021 records. Thus a storage size
+the slot 0 header can accommodate 1021 records. Thus a storage size
 of 8MiB (8KiB * 1024) requires an additional slot for use by the
 header. In this scenario, slot 0 and slot 1 form the backend storage
 header, and records can be stored starting at slot 2.
@@ -196,5 +196,5 @@ References
 [2] "Unified Extensible Firmware Interface Specification",
     version 2.1, October 2008.
 
-[3] "Windows Hardware Error Architecture", specfically
+[3] "Windows Hardware Error Architecture", specifically
     "Error Record Persistence Mechanism".
diff --git a/docs/system/devices/canokey.rst b/docs/system/devices/canokey.rst
index c2c58ae3e7c..cfa6186e483 100644
--- a/docs/system/devices/canokey.rst
+++ b/docs/system/devices/canokey.rst
@@ -28,9 +28,9 @@ With the same software configuration as a hardware key,
 the guest OS can use all the functionalities of a secure key as if
 there was actually an hardware key plugged in.
 
-CanoKey QEMU provides much convenience for debuging:
+CanoKey QEMU provides much convenience for debugging:
 
-* libcanokey-qemu supports debuging output thus developers can
+* libcanokey-qemu supports debugging output thus developers can
   inspect what happens inside a secure key
 * CanoKey QEMU supports trace event thus event
 * QEMU USB stack supports pcap thus USB packet between the guest
@@ -102,8 +102,8 @@ and find CanoKey QEMU there:
 
 You may setup the key as guided in [6]_. The console for the key is at [7]_.
 
-Debuging
-========
+Debugging
+=========
 
 CanoKey QEMU consists of two parts, ``libcanokey-qemu.so`` and ``canokey.c``,
 the latter of which resides in QEMU. The former provides core functionality
diff --git a/docs/system/devices/cxl.rst b/docs/system/devices/cxl.rst
index 36031325cca..f25783a4ecf 100644
--- a/docs/system/devices/cxl.rst
+++ b/docs/system/devices/cxl.rst
@@ -83,7 +83,7 @@ CXL Fixed Memory Windows (CFMW)
 A CFMW consists of a particular range of Host Physical Address space
 which is routed to particular CXL Host Bridges.  At time of generic
 software initialization it will have a particularly interleaving
-configuration and associated Quality of Serice Throtling Group (QTG).
+configuration and associated Quality of Service Throttling Group (QTG).
 This information is available to system software, when making
 decisions about how to configure interleave across available CXL
 memory devices.  It is provide as CFMW Structures (CFMWS) in
@@ -98,7 +98,7 @@ specification defined register interface called CXL Host Bridge
 Component Registers (CHBCR). The location of this CHBCR MMIO
 space is described to system software via a CXL Host Bridge
 Structure (CHBS) in the CEDT ACPI table.  The actual interfaces
-are identical to those used for other parts of the CXL heirarchy
+are identical to those used for other parts of the CXL hierarchy
 as CXL Component Registers in PCI BARs.
 
 Interfaces provided include:
@@ -143,7 +143,7 @@ CXL Memory Devices - Type 3
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~
 CXL type 3 devices use a PCI class code and are intended to be supported
 by a generic operating system driver. They have HDM decoders
-though in these EP devices, the decoder is reponsible not for
+though in these EP devices, the decoder is responsible not for
 routing but for translation of the incoming host physical address (HPA)
 into a Device Physical Address (DPA).
 
@@ -209,7 +209,7 @@ Notes:
     ranges of the system physical address map.  Each CFMW has
     particular interleave setup across the CXL Host Bridges (HB)
     CFMW0 provides uninterleaved access to HB0, CFW2 provides
-    uninterleaved acess to HB1. CFW1 provides interleaved memory access
+    uninterleaved access to HB1. CFW1 provides interleaved memory access
     across HB0 and HB1.
 
 (2) **Two CXL Host Bridges**. Each of these has 2 CXL Root Ports and
@@ -282,7 +282,7 @@ Example topology involving a switch::
             ---------------------------------------------------
            |    Switch 0  USP as PCI 0d:00.0                   |
            |    USP has HDM decoder which direct traffic to    |
-           |    appropiate downstream port                     |
+           |    appropriate downstream port                    |
            |    Switch BUS appears as 0e                       |
            |x__________________________________________________|
             |                  |               |              |
@@ -366,7 +366,7 @@ An example of 4 devices below a switch suitable for 1, 2 or 4 way interleave::
 Kernel Configuration Options
 ----------------------------
 
-In Linux 5.18 the followings options are necessary to make use of
+In Linux 5.18 the following options are necessary to make use of
 OS management of CXL memory devices as described here.
 
 * CONFIG_CXL_BUS
-- 
2.25.1



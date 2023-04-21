Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F57C6EAF4C
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 18:37:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pptkg-0000sh-7F; Fri, 21 Apr 2023 12:36:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pptkd-0000oX-VG
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 12:36:47 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pptkc-0002Ay-CJ
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 12:36:47 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f1738d0d4cso13194885e9.1
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 09:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682095005; x=1684687005;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=Q7PgoVYlwe5ZZNw1v9VJab3oIq9RhWdsj7zvVqAUNgg=;
 b=FhLC5puug9JuaNPDHn9nB6lW1SzeXh5RtQbLEhI9qb29gGVtUuYu9ogMIIngiK9HRO
 LEzqaU61KpVU2SXzhDPfXY8dEKAi06hgOYZBIry7GwZf4d9g1/TaLsDuiSZSx/r8WfCJ
 2kTlBHNa4OuhVtjVBlYBWnJJOpoF6TaffWYwa+T8hgY+BQ3lR/cGQVn90NTRPnCGOOAK
 NC9dWQutS4Oywmy0kTsS+w1CdfMRTebydYtFyDLDwrfGbg0DUugdtTzdRk8MVdIPCF1B
 LqDXFFoWL63DYX02ME+QWaoU8T9/VDV+BPqFpsSOYgi97ZRNdw+ESFzPaGHXfPGBb7EU
 yR7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682095005; x=1684687005;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Q7PgoVYlwe5ZZNw1v9VJab3oIq9RhWdsj7zvVqAUNgg=;
 b=AZhYm6NNruLOoaFStNZ5DcG8mqtCn0gkb4I55jo9dwfwV+SGobHDOmZ/iQIMCGrbZR
 k77yNiYz/FBx2WhEnVjD446RyTNESZGlkI1/kHROeLp6Sugutonx8dOIC5MNT/s2oj1d
 hXwFu04PA2gCvUMKmDa97+CUKl8sPEvy78i0N4ncRv+xFqkE8XFFmZbXzJNblnv69nkM
 CigIGwi0PQfsmDpFMbDmwNriLLUn0ZGWudLo97wW6W5vIoq2N6NGAxoLa5btkdYh7rnd
 cWqcXiPjJn/BuuECBZVFciw8G00iWKL9gUC5N/+TZaIql68EzEQe4Yw7LtR+Dq5wwzqX
 9fDA==
X-Gm-Message-State: AAQBX9dppK33ybl3e1keej3gAf5X3W4EA6qqoSGexE12hd4rep9AiXTl
 nQX/J7/LWTKdtUQIC4Z4XflcIEaBL3x7IrZ2k9Q=
X-Google-Smtp-Source: AKy350YKfBoEwFD1Dy9xgTKLsCj1LdkFyjsCUt+ecSEqjctczCVFcp2GMhD1F9q2mIzqSdcs2h9QYw==
X-Received: by 2002:a7b:c7d4:0:b0:3f1:952a:4bf3 with SMTP id
 z20-20020a7bc7d4000000b003f1952a4bf3mr1548329wmk.32.1682095004700; 
 Fri, 21 Apr 2023 09:36:44 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 n10-20020a1c720a000000b003edef091b17sm5183231wmc.37.2023.04.21.09.36.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 09:36:44 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Subject: [PATCH] docs: Remove unused weirdly-named cross-reference targets
Date: Fri, 21 Apr 2023 17:36:42 +0100
Message-Id: <20230421163642.1151904-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

In the doc sources, we have a few cross-reference targets with odd
names "pcsys_005fxyz".  These are the legacy of the semi-automated
conversion of the old info docs to rST (the '005f' is because ASCII
0x5f is '_' and the old info link names had underscores in them).

Remove the targets which nothing links to, and rename the two targets
which are used to something a bit more descriptive.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/devices/igb.rst     | 2 +-
 docs/system/devices/ivshmem.rst | 2 --
 docs/system/devices/net.rst     | 2 +-
 docs/system/devices/usb.rst     | 2 --
 docs/system/keys.rst            | 2 +-
 docs/system/linuxboot.rst       | 2 +-
 docs/system/target-i386.rst     | 4 ----
 7 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/docs/system/devices/igb.rst b/docs/system/devices/igb.rst
index 70edadd5743..0bcdd857473 100644
--- a/docs/system/devices/igb.rst
+++ b/docs/system/devices/igb.rst
@@ -29,7 +29,7 @@ Using igb
 =========
 
 Using igb should be nothing different from using another network device. See
-:ref:`pcsys_005fnetwork` in general.
+:ref:`Network_emulation` in general.
 
 However, you may also need to perform additional steps to activate SR-IOV
 feature on your guest. For Linux, refer to [4]_.
diff --git a/docs/system/devices/ivshmem.rst b/docs/system/devices/ivshmem.rst
index b03a48afa3a..e7aaf34c200 100644
--- a/docs/system/devices/ivshmem.rst
+++ b/docs/system/devices/ivshmem.rst
@@ -1,5 +1,3 @@
-.. _pcsys_005fivshmem:
-
 Inter-VM Shared Memory device
 -----------------------------
 
diff --git a/docs/system/devices/net.rst b/docs/system/devices/net.rst
index 4b2640c448e..2ab516d4b09 100644
--- a/docs/system/devices/net.rst
+++ b/docs/system/devices/net.rst
@@ -1,4 +1,4 @@
-.. _pcsys_005fnetwork:
+.. _Network_Emulation:
 
 Network emulation
 -----------------
diff --git a/docs/system/devices/usb.rst b/docs/system/devices/usb.rst
index 37cb9b33aea..74166810731 100644
--- a/docs/system/devices/usb.rst
+++ b/docs/system/devices/usb.rst
@@ -1,5 +1,3 @@
-.. _pcsys_005fusb:
-
 USB emulation
 -------------
 
diff --git a/docs/system/keys.rst b/docs/system/keys.rst
index e596ae6c4e7..0fc17b994d3 100644
--- a/docs/system/keys.rst
+++ b/docs/system/keys.rst
@@ -1,4 +1,4 @@
-.. _pcsys_005fkeys:
+.. _GUI_keys:
 
 Keys in the graphical frontends
 -------------------------------
diff --git a/docs/system/linuxboot.rst b/docs/system/linuxboot.rst
index 228650abc5e..5db2e560dc5 100644
--- a/docs/system/linuxboot.rst
+++ b/docs/system/linuxboot.rst
@@ -27,4 +27,4 @@ virtual serial port and the QEMU monitor to the console with the
                     -append "root=/dev/hda console=ttyS0" -nographic
 
 Use Ctrl-a c to switch between the serial console and the monitor (see
-:ref:`pcsys_005fkeys`).
+:ref:`GUI_keys`).
diff --git a/docs/system/target-i386.rst b/docs/system/target-i386.rst
index 77c2f3b9799..1b8a1f248ab 100644
--- a/docs/system/target-i386.rst
+++ b/docs/system/target-i386.rst
@@ -3,8 +3,6 @@
 x86 System emulator
 -------------------
 
-.. _pcsys_005fdevices:
-
 Board-specific documentation
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
@@ -32,8 +30,6 @@ Architectural features
    i386/sgx
    i386/amd-memory-encryption
 
-.. _pcsys_005freq:
-
 OS requirements
 ~~~~~~~~~~~~~~~
 
-- 
2.34.1



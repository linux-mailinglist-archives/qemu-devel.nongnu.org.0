Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9766698D8
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 14:41:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGKHM-0007q8-QJ; Fri, 13 Jan 2023 08:39:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pGKHK-0007pR-7t
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 08:39:30 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pGKHH-000530-BT
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 08:39:29 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 j34-20020a05600c1c2200b003da1b054057so3082868wms.5
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 05:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZkjvImv3urfubQ/CIur/IuzDRXVAlRae10Z3LaYvYZ8=;
 b=KQ98xfT4n3kDO82kAcafmt+RWC82neT/zuoienwDEIKc+hodyjnVHMesHlHXT+z4ts
 J8fGsmP/vYXoH/tfIKlAvS1Zl83xA4SPOmhN5voZaqYzEaX4GAHOkiML02CfPk7xOfLr
 BCHTihKYUFp2Eo8INa0P6eJd3p2CteOPOtlUO0vN2IEBdTiCZWcN3xySXW6qYmL6TUd1
 gAYnXpWaZadpZ2HNbj60wj+5UMGvTzfCp04efohWd8ZSom/9+cHBJOZR/wwx12quaG9i
 mBNtYSGxiJ6vEuCbMCsDpcSflaztJA9XFOdzP4g9bQe27YdJh4c68b+zVFvrQC63sTs/
 XFxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZkjvImv3urfubQ/CIur/IuzDRXVAlRae10Z3LaYvYZ8=;
 b=q3ccmp5cH0g6h8VD8mXGpcBdFYqQgrq/EftFCmBx0Dzzb3cA/i1l3S69jcRVztQ7vX
 Y6Wrh+iBfztXPcIc0AdvoLJfGnxAOYT6gIL2AmZOMud1P+20W8ABGGgjGUcnpgJq4GQ8
 LLpxdBr4zmUu+5Hm52nH9EM3J80WkR5yV0rXHJBodrWgtJtjpTkCGY6kWzn/ZaOYR4M0
 v265LocJBu4lGAR8MmvuAYnr+52P6exeMUbzgDGV+gxL7AP8Z7kPgem92JDDyeIBf7p1
 FCyp/bdRqS5HoRHwu7zwDofKkAwlrxeFLyEw3+VWiHzrWlXO5fG07Vbg/9bmsXh7rSyz
 VmCA==
X-Gm-Message-State: AFqh2kpPTg/+ksax5ogkVAhBmQKgAoms5x7g2KFJGVHhOaFRKj5fQKWF
 eEqIE5Xlzhsr3pxk38ZPzQPwHw==
X-Google-Smtp-Source: AMrXdXuuhgpT9Aa6+pY/IZB9DBTFPtKdoyUB0ap/VBz4vh0hE9UqOKMYPnDVU8nZsl86bb4OjUsDoA==
X-Received: by 2002:a05:600c:4fc6:b0:3d3:4a47:52e9 with SMTP id
 o6-20020a05600c4fc600b003d34a4752e9mr57953781wmq.15.1673617166105; 
 Fri, 13 Jan 2023 05:39:26 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 e18-20020a05600c4e5200b003d9876aa04asm29736196wmq.41.2023.01.13.05.39.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 05:39:25 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9BF251FFBA;
 Fri, 13 Jan 2023 13:39:23 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alexandre Iooss <erdnaxe@crans.org>, peter.maydell@linaro.org,
 Markus Armbruster <armbru@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 John G Johnson <john.g.johnson@oracle.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>
Subject: [PATCH 2/4] docs: add a new section to outline emulation support
Date: Fri, 13 Jan 2023 13:39:21 +0000
Message-Id: <20230113133923.1642627-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230113133923.1642627-1-alex.bennee@linaro.org>
References: <20230113133923.1642627-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This affects both system and user mode emulation so we should probably
list it up front.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/about/emulation.rst      | 103 ++++++++++++++++++++++++++++++++++
 docs/about/index.rst          |   1 +
 docs/devel/tcg-plugins.rst    |   2 +
 docs/system/arm/emulation.rst |   2 +
 4 files changed, 108 insertions(+)
 create mode 100644 docs/about/emulation.rst

diff --git a/docs/about/emulation.rst b/docs/about/emulation.rst
new file mode 100644
index 0000000000..d919175b5e
--- /dev/null
+++ b/docs/about/emulation.rst
@@ -0,0 +1,103 @@
+Emulation
+=========
+
+QEMU's Tiny Code Generator (TCG) gives it the ability to emulate a
+number of CPU architectures on any supported platform. Both
+:ref:`System Emulation` and :ref:`User Mode Emulation` are supported
+depending on the guest architecture.
+
+.. list-table:: Supported Guest Architectures for Emulation
+  :widths: 30 10 10 50
+  :header-rows: 1
+
+  * - Architecture (qemu name)
+    - System
+    - User-mode
+    - Notes
+  * - Alpha
+    - Yes
+    - Yes
+    - Legacy 64 bit RISC ISA developed by DEC
+  * - Arm (arm, aarch64)
+    - Yes
+    - Yes
+    - Wide range of features, see :ref:`Arm Emulation` for details
+  * - AVR
+    - Yes
+    - No
+    - 8 bit micro controller, often used in maker projects
+  * - Cris
+    - Yes
+    - Yes
+    - Embedded RISC chip developed by AXIS
+  * - Hexagon
+    - No
+    - Yes
+    - Family of DSPs by Qualcomm
+  * - PA-RISC (hppa)
+    - Yes
+    - Yes
+    - A legacy RISC system used in HPs old minicomputers
+  * - x86 (i386, x86_64)
+    - Yes
+    - Yes
+    - The ubiquitous desktop PC CPU architecture, 32 and 64 bit.
+  * - Loongarch
+    - Yes
+    - Yes
+    - A MIPs-like 64bit RISC architecture developed in China
+  * - m68k
+    - Yes
+    - Yes
+    - Motorola 68000 variants and ColdFire
+  * - Microblaze
+    - Yes
+    - Yes
+    - RISC based soft-core by Xilinx
+  * - MIPS (mips, mipsel, mips64, mips64el)
+    - Yes
+    - Yes
+    - Venerable RISC architecture originally out of Stanford University
+  * - Nios2
+    - Yes
+    - Yes
+    - 32 bit embedded soft-core by Altera
+  * - OpenRISC
+    - Yes
+    - Yes
+    - Open source RISC architecture developed by the OpenRISC community
+  * - Power (ppc, ppc64)
+    - Yes
+    - Yes
+    - A general purpose RISC architecture now managed by IBM
+  * - RISC-V
+    - Yes
+    - Yes
+    - An open standard RISC ISA maintained by RISC-V International
+  * - RX
+    - Yes
+    - No
+    - A 32 bit micro controller developed by Renesas
+  * - s390x
+    - Yes
+    - Yes
+    - A 64 bit CPU found in IBM's System Z mainframes
+  * - sh4
+    - Yes
+    - Yes
+    - A 32 bit RISC embedded CPU developed by Hitachi
+  * - SPARC (sparc, sparc64)
+    - Yes
+    - Yes
+    - A RISC ISA originally developed by Sun Microsystems
+  * - Tricore
+    - Yes
+    - No
+    - A 32 bit RISC/uController/DSP developed by Infineon
+  * - Xtensa
+    - Yes
+    - Yes
+    - A configurable 32 bit soft core now owned by Cadence
+
+A number of features are are only available when running under
+emulation including :ref:`Record/Replay<replay>` and :ref:`TCG Plugins`.
diff --git a/docs/about/index.rst b/docs/about/index.rst
index bae1309cc6..b00b584b31 100644
--- a/docs/about/index.rst
+++ b/docs/about/index.rst
@@ -23,6 +23,7 @@ allows you to create, convert and modify disk images.
    :maxdepth: 2
 
    build-platforms
+   emulation
    deprecated
    removed-features
    license
diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst
index 9740a70406..81dcd43a61 100644
--- a/docs/devel/tcg-plugins.rst
+++ b/docs/devel/tcg-plugins.rst
@@ -3,6 +3,8 @@
    Copyright (c) 2019, Linaro Limited
    Written by Emilio Cota and Alex Bennée
 
+.. _TCG Plugins:
+
 QEMU TCG Plugins
 ================
 
diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index b33d7c28dc..b87e064d9d 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -1,3 +1,5 @@
+.. _Arm Emulation:
+
 A-profile CPU architecture support
 ==================================
 
-- 
2.34.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D71A67C9CE
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 12:25:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL0LW-0002yJ-SR; Thu, 26 Jan 2023 06:23:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pL0LS-0002jI-Hc
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 06:23:06 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pL0LQ-00044a-DG
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 06:23:06 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 l41-20020a05600c1d2900b003daf986faaeso892472wms.3
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 03:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SSF1EEW5P8K/ZY5KGpCY9LUtrhXdSdbhv1qq20jYFBc=;
 b=EPpwEbYH1ukoq2zOoXwFTYhPtGxnyD5BSpIUk+vtHisbiITJQfjnte+21i5SkeOi3I
 ApZSvEMsbe7CVHPIw9PpkuIJbr9G02lvFBRAfQnlmVY3AJd27NlOVUfIKqLzMMtmcuIp
 iaqYrxLULGyn0pG45dEdOnqWg1wOV7sqtiRNIByrJK2xPqCp2niIdR6WnFk/qn8POTVX
 A6HP0wsAfDgk+mvsxgF/p+QS2BEib4L2ksiJ0aEHjiZuGEDxhNZm7up/Gm0QLukaYYgC
 6fXIPlkbk/TD/2SM6NDD0do99i2MZvPiqlv+9DWgYTck/txOZQ2LeOGx6d4cmFutfcu4
 eUvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SSF1EEW5P8K/ZY5KGpCY9LUtrhXdSdbhv1qq20jYFBc=;
 b=JISHoMuDx+DqraCB63I2Kqmh9M5aqVkaBNuxNmaLFUm2H6AQpbyTNhlCOiXlj8gv4j
 8WESH4lMqC27a3nQ+DCuSPlgEU2/qO/0KSWrIP/Y5G+7OQ7UJMlW8jaDTg3zPA2fBVs2
 urRt8osJDF1ynhbWFXZFP27kwMlFaSxDI3XtDH6FS5SkyJAK8O/hR5fkcQ7CeJ/94CxC
 w/P9ggRf3ZR/BFPeP9wfcwZ6sKh+cT4zZdV/Buc+bXopU75D+56zfkNlYD+HIwj4Pm3H
 qQ8Utk41/v7ZEC3i596RpYwE4YMo5GgOKxwOi9SFb7esUqxRU2MlhiEUteCoye74Zdnf
 zZdg==
X-Gm-Message-State: AFqh2krdRXWdYjJbiRb6BMdi4JrUzbajyBpLI8O/bbisgU+RS1ejECZg
 1HJqyK+vK4T2LvgPWJ238k/7jzPN/NSM7oZq
X-Google-Smtp-Source: AMrXdXsX5hxGi4palg8/mS02X0ktiUVNO7rICYnpcwfNs/ozAZDZSu9MFYKGEpjoFJUttwn92c2MVw==
X-Received: by 2002:a05:600c:3d98:b0:3d6:ecc4:6279 with SMTP id
 bi24-20020a05600c3d9800b003d6ecc46279mr32010331wmb.27.1674732182707; 
 Thu, 26 Jan 2023 03:23:02 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 n24-20020a7bcbd8000000b003daf7721bb3sm4156811wmi.12.2023.01.26.03.22.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 03:23:01 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B67971FFBE;
 Thu, 26 Jan 2023 11:22:56 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 20/35] docs: add a new section to outline emulation support
Date: Thu, 26 Jan 2023 11:22:35 +0000
Message-Id: <20230126112250.2584701-21-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230126112250.2584701-1-alex.bennee@linaro.org>
References: <20230126112250.2584701-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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

Acked-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230124180127.1881110-21-alex.bennee@linaro.org>

diff --git a/docs/about/emulation.rst b/docs/about/emulation.rst
new file mode 100644
index 0000000000..7ec7e09381
--- /dev/null
+++ b/docs/about/emulation.rst
@@ -0,0 +1,103 @@
+Emulation
+=========
+
+QEMU's Tiny Code Generator (TCG) provides the ability to emulate a
+number of CPU architectures on any supported host platform. Both
+:ref:`System Emulation` and :ref:`User Mode Emulation` are supported
+depending on the guest architecture.
+
+.. list-table:: Supported Guest Architectures for Emulation
+  :widths: 30 10 10 50
+  :header-rows: 1
+
+  * - Architecture (qemu name)
+    - System
+    - User
+    - Notes
+  * - Alpha
+    - Yes
+    - Yes
+    - Legacy 64 bit RISC ISA developed by DEC
+  * - Arm (arm, aarch64)
+    - :ref:`Yes<ARM-System-emulator>`
+    - Yes
+    - Wide range of features, see :ref:`Arm Emulation` for details
+  * - AVR
+    - :ref:`Yes<AVR-System-emulator>`
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
+    - A legacy RISC system used in HP's old minicomputers
+  * - x86 (i386, x86_64)
+    - :ref:`Yes<QEMU-PC-System-emulator>`
+    - Yes
+    - The ubiquitous desktop PC CPU architecture, 32 and 64 bit.
+  * - Loongarch
+    - Yes
+    - Yes
+    - A MIPS-like 64bit RISC architecture developed in China
+  * - m68k
+    - :ref:`Yes<ColdFire-System-emulator>`
+    - Yes
+    - Motorola 68000 variants and ColdFire
+  * - Microblaze
+    - Yes
+    - Yes
+    - RISC based soft-core by Xilinx
+  * - MIPS (mips*)
+    - :ref:`Yes<MIPS-System-emulator>`
+    - Yes
+    - Venerable RISC architecture originally out of Stanford University
+  * - Nios2
+    - Yes
+    - Yes
+    - 32 bit embedded soft-core by Altera
+  * - OpenRISC
+    - :ref:`Yes<OpenRISC-System-emulator>`
+    - Yes
+    - Open source RISC architecture developed by the OpenRISC community
+  * - Power (ppc, ppc64)
+    - :ref:`Yes<PowerPC-System-emulator>`
+    - Yes
+    - A general purpose RISC architecture now managed by IBM
+  * - RISC-V
+    - :ref:`Yes<RISC-V-System-emulator>`
+    - Yes
+    - An open standard RISC ISA maintained by RISC-V International
+  * - RX
+    - :ref:`Yes<RX-System-emulator>`
+    - No
+    - A 32 bit micro controller developed by Renesas
+  * - s390x
+    - :ref:`Yes<s390x-System-emulator>`
+    - Yes
+    - A 64 bit CPU found in IBM's System Z mainframes
+  * - sh4
+    - Yes
+    - Yes
+    - A 32 bit RISC embedded CPU developed by Hitachi
+  * - SPARC (sparc, sparc64)
+    - :ref:`Yes<Sparc32-System-emulator>`
+    - Yes
+    - A RISC ISA originally developed by Sun Microsystems
+  * - Tricore
+    - Yes
+    - No
+    - A 32 bit RISC/uController/DSP developed by Infineon
+  * - Xtensa
+    - :ref:`Yes<Xtensa-System-emulator>`
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



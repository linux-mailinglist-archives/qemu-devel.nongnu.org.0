Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4327467A0E2
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 19:08:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKNi9-0006LZ-Vc; Tue, 24 Jan 2023 13:07:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pKNhQ-0005Bc-MN
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 13:07:13 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pKNhK-00073s-5J
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 13:07:12 -0500
Received: by mail-wr1-x431.google.com with SMTP id q5so10059353wrv.0
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 10:07:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2syl4zXwyfrmZKhL1MJxF36oWxj0Qk4agWJnSvmTKC4=;
 b=QZHAlE2B8XafNnRxN73tLKkLYtZp9/gUyUBbyy+LVQnCEpI8nt8qZo4iR8nYclb1Hs
 CaPZFqngqrGlN/r+E3n54xpIe7Tsp7mCmUegb/wdQPqLGJXErJohXpTsrOK0j22OoWwI
 /fqsEHgYRWeOIVF5bHCimuQODgHoTC3rOu+3bpetGAXlZOG2FHbgktF9AkQAv0NTn6DZ
 seSk1kU9Mdbk55jZR4JGXHsTjC7coZhWmfgSG3MnWHYHeO8QxZbbHuI1RSQc93Fm72BF
 hqxxEWjrjV8+IksVOryLOsVoSqBYccHYYWQsNRSgByXrrNRgqNJUuds2LSu3m2nJcMqC
 hPNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2syl4zXwyfrmZKhL1MJxF36oWxj0Qk4agWJnSvmTKC4=;
 b=4NlXwL3OpamNZMhgQm5tcraLluS5l17e9K1Ef1M5DVMtaS0R6G3TswmfL/DRVaXlHm
 74BaEQxRu2Mnlpn2SCt+FpFAligAB6KHyvH/KLVcyoiJnUkQO8NnmHFDyfJI6T2+YABU
 eTAJZWR98cIyD6GCzucaT/o7n/jcLZFS+uSxnXLjgcmcRLozHDMjbsGAqrRM+UJf6+kI
 iWQHH2vFY4TDbjr7I2VQ7kgbMEarD1bTRst+exjFFObEhrKCViz91bjHUM3Yg5rbQoIM
 ELSNB+gAVovehN396H9L+ddHmLYeqCzHW/KZqgje6lqrjuXmgSXbI+k+siiml0FhP7Dn
 FOwQ==
X-Gm-Message-State: AO0yUKXpt4oPibvQnHKnBbnNORzxAi+lLpo9RP2rR+3dubhVVP9A6RSj
 C7UlsMgqYXnwvVpXvJ7YO695mg==
X-Google-Smtp-Source: AK7set/zoaF8K1F1le5HbsyksSoggexXbqzNrqfv5Qsf1fKJ3iCDPE3vRmB1bEJzoGRYRRG9+1YNRA==
X-Received: by 2002:a5d:42cd:0:b0:2bf:81eb:dc26 with SMTP id
 t13-20020a5d42cd000000b002bf81ebdc26mr5977586wrr.37.1674583625405; 
 Tue, 24 Jan 2023 10:07:05 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 g16-20020adffc90000000b002882600e8a0sm2545747wrr.12.2023.01.24.10.06.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 10:07:04 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 23E681FFC9;
 Tue, 24 Jan 2023 18:01:30 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Ed Maste <emaste@freebsd.org>, Thomas Huth <thuth@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Markus Armbruster <armbru@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Bandan Das <bsd@redhat.com>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Michael Roth <michael.roth@amd.com>, Eduardo Habkost <eduardo@habkost.net>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, qemu-arm@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 20/35] docs: add a new section to outline emulation support
Date: Tue, 24 Jan 2023 18:01:12 +0000
Message-Id: <20230124180127.1881110-21-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124180127.1881110-1-alex.bennee@linaro.org>
References: <20230124180127.1881110-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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

---
v2
  - HPs -> HP's
  - MIPs-like -> MIPS-like
---
 docs/about/emulation.rst      | 103 ++++++++++++++++++++++++++++++++++
 docs/about/index.rst          |   1 +
 docs/devel/tcg-plugins.rst    |   2 +
 docs/system/arm/emulation.rst |   2 +
 4 files changed, 108 insertions(+)
 create mode 100644 docs/about/emulation.rst

diff --git a/docs/about/emulation.rst b/docs/about/emulation.rst
new file mode 100644
index 0000000000..bdc0630b35
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
+    - A legacy RISC system used in HP's old minicomputers
+  * - x86 (i386, x86_64)
+    - Yes
+    - Yes
+    - The ubiquitous desktop PC CPU architecture, 32 and 64 bit.
+  * - Loongarch
+    - Yes
+    - Yes
+    - A MIPS-like 64bit RISC architecture developed in China
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



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5838941379C
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 18:33:04 +0200 (CEST)
Received: from localhost ([::1]:51674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSihZ-0002jQ-5r
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 12:33:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSido-0008Lt-GX
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 12:29:08 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:41603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSidl-00029D-Kk
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 12:29:08 -0400
Received: by mail-wr1-x431.google.com with SMTP id w29so40987954wra.8
 for <qemu-devel@nongnu.org>; Tue, 21 Sep 2021 09:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=StI9Wbs/qW2+W/kpKxKP65tcisHwg/BCZQKgVwHdxFI=;
 b=poKbrtZ75QCFRPGSZET0Z9lRQYP6MBoc694tkn05MT6x4MeIV4dNxYerGiJ1SPtzaA
 Mv3tNlQVrRdfEX6ojqO/8aISZRZaCAFzNQ5Apptg92VGlmwd5HEftYlZd1xs3n8REwhI
 aVWHOX3F5kSSDhfJupjEOZZ09sUi/Vo6zbls0ylRSP3u93EmrpUAmjI9ZXW72RYL5YKr
 N6+cMQP3eJntug0Y3PPGVvF4oURv4EA3jAySgzTy83cZ/gilNNgJwelK1cCXrmErdq6v
 1ThnovNqB453l5MxXlgCSMmneXP/5pBCIQex+R5hHyNC7VnWZVc3afY5CRqgd44xXzxN
 LrbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=StI9Wbs/qW2+W/kpKxKP65tcisHwg/BCZQKgVwHdxFI=;
 b=LG8R7OYF9US5S+ufwY2/0h8p7uh7lgKiIY8MVrl4uheCGdSbR25eBZJSm0XkFhpQZz
 DWEaPRt8VWcyfvLKLaW6HHz4hCZa3pKHZcVYLZLGuOfbcNzAMOQeZtdp2dwsh5ZcIEiI
 Y84PxWvG3VxcsB129xF9A1JiEr5Plxoa1Wg8vw/bfXyHiPh/16Rat6M5dKaxRR3N3N2y
 3ThqKYdnIBhu+9+4/dKYcZamyZrmUCyh609scUWsULYwqP4DCEljCtYqQCj2KIm2WZdN
 k+cy1JeKKO6HcT/296kcoaQOE2xWMNX5WcKp76tmqfKFDYJAX+lqG7/U6GI21K4/8OhF
 8O3w==
X-Gm-Message-State: AOAM532Sp5enFwhgqwBeznleYIlrIL4D3m6SkZpNyZ0auLmiKv/otzbi
 z8Vv9p+RCsqtDkVVtBRofxN2hw==
X-Google-Smtp-Source: ABdhPJyc7JZXTXjRalnb4HP7twyUWUCbgA0YaxIPom5uOgyXieW2hpVO6PrHB4YcN7/w47ACkGxLmg==
X-Received: by 2002:a1c:403:: with SMTP id 3mr5669011wme.161.1632241744204;
 Tue, 21 Sep 2021 09:29:04 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q7sm19841014wru.56.2021.09.21.09.29.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 09:29:03 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 1/5] configs: Don't include 32-bit-only GDB XML in aarch64
 linux configs
Date: Tue, 21 Sep 2021 17:28:57 +0100
Message-Id: <20210921162901.17508-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210921162901.17508-1-peter.maydell@linaro.org>
References: <20210921162901.17508-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Luis Machado <luis.machado@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The aarch64-linux QEMU usermode binaries can never run 32-bit
code, so they do not need to include the GDB XML for it.
(arm_cpu_register_gdb_regs_for_features() will not use these
XML files if the CPU has ARM_FEATURE_AARCH64, so we will not
advertise to gdb that we have them.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 configs/targets/aarch64-linux-user.mak    | 2 +-
 configs/targets/aarch64_be-linux-user.mak | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/targets/aarch64-linux-user.mak b/configs/targets/aarch64-linux-user.mak
index 4713253709f..d0c603c54ec 100644
--- a/configs/targets/aarch64-linux-user.mak
+++ b/configs/targets/aarch64-linux-user.mak
@@ -1,5 +1,5 @@
 TARGET_ARCH=aarch64
 TARGET_BASE_ARCH=arm
-TARGET_XML_FILES= gdb-xml/aarch64-core.xml gdb-xml/aarch64-fpu.xml gdb-xml/arm-core.xml gdb-xml/arm-vfp.xml gdb-xml/arm-vfp3.xml gdb-xml/arm-neon.xml gdb-xml/arm-m-profile.xml
+TARGET_XML_FILES= gdb-xml/aarch64-core.xml gdb-xml/aarch64-fpu.xml
 TARGET_HAS_BFLT=y
 CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
diff --git a/configs/targets/aarch64_be-linux-user.mak b/configs/targets/aarch64_be-linux-user.mak
index fae831558da..d3ee10c00f3 100644
--- a/configs/targets/aarch64_be-linux-user.mak
+++ b/configs/targets/aarch64_be-linux-user.mak
@@ -1,6 +1,6 @@
 TARGET_ARCH=aarch64
 TARGET_BASE_ARCH=arm
 TARGET_WORDS_BIGENDIAN=y
-TARGET_XML_FILES= gdb-xml/aarch64-core.xml gdb-xml/aarch64-fpu.xml gdb-xml/arm-core.xml gdb-xml/arm-vfp.xml gdb-xml/arm-vfp3.xml gdb-xml/arm-neon.xml gdb-xml/arm-m-profile.xml
+TARGET_XML_FILES= gdb-xml/aarch64-core.xml gdb-xml/aarch64-fpu.xml
 TARGET_HAS_BFLT=y
 CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
-- 
2.20.1



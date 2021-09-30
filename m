Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A373E41DD80
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 17:31:16 +0200 (CEST)
Received: from localhost ([::1]:37552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVy1i-0003Hx-Rv
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 11:31:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mVxjP-0000Hu-N0
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 11:12:21 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:46018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mVxjL-00041Q-FK
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 11:12:19 -0400
Received: by mail-wr1-x433.google.com with SMTP id d21so10619428wra.12
 for <qemu-devel@nongnu.org>; Thu, 30 Sep 2021 08:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=+7xcBw3AnVLKXJaypxFNhcX1MNAtuWFGLoGLnPrZ0nM=;
 b=zSC2VNSZdQvDR4Azw4+4ynOJbizWiGGfOCOBW2nKCP2hk08jwHNXnBSIYjleup6grW
 JvZ1Q1LhQPyy83m3I5E8j2G4Ti0XIDk+WprRMWhXQHwQ2MsfOy/iezG+Co8VJoXO2n9s
 ItDLLOpYfQflhIR/fwI0kBpKEYblTGapQSM/00jpgsXVDpYd1fD1dwBDZtTKP6p34MiZ
 c7evtzuq+HYrQjuBaq8WYmJq1sV4I3bX0XVAp4XZDhARcy3cA8IgVKKDmxaNMagm8pyS
 SP1adk8Vc5HxKfkEy/YVWDDTEv2mnvbhSIs46kbPJrjQzDQRWnToQTb5Npwr7ABjCH5Y
 ynIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+7xcBw3AnVLKXJaypxFNhcX1MNAtuWFGLoGLnPrZ0nM=;
 b=qhTEOt9w2P8jzUWCGMZSiUElcxUJisAdJqU1B6+/eawqYHeC9JSXKN/DpreLJGBVgm
 lqkTzw6XVnbn7TClJ+sKK72Ww1whId444Zn/4ymVERx4V2n3kyfwLqWtubvv0jvpdMXj
 k9GWaxaqoF8LDd+CnK5dd5j//A15cdKfw5LFaY403/HltDijBt4V1rf+uQUKoKPyUrZ7
 J5DU678si2P8gNyOdaWGD32NsczPOsqIQS4imF6piTZ3LzGQF2t6w8KEcQsTDOVI6vL2
 r0DiGRqxbTfgptxggCD3zJ0qC4lR7szrGn5LjQMNeW3CskxodyHj0zHNSzM85I8KtGgR
 6CuA==
X-Gm-Message-State: AOAM5326WBepGwJ839iD+50KJKT++RlWBbUGHEP2RPOUTZAu7LgO9xr/
 4fmbrv+rV99mXNGioOAHIzY0WOF1lyWbvg==
X-Google-Smtp-Source: ABdhPJw2SPzd/Wi8wO4QOr1XZ8+JZ34E/glxPQm6U0R12S2c4LXIz48diMNrpGqA+YaLS415dxwHqA==
X-Received: by 2002:adf:a19e:: with SMTP id u30mr4423778wru.326.1633014733952; 
 Thu, 30 Sep 2021 08:12:13 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g8sm1952098wrm.46.2021.09.30.08.12.13
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 08:12:13 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/22] configs: Don't include 32-bit-only GDB XML in aarch64
 linux configs
Date: Thu, 30 Sep 2021 16:11:51 +0100
Message-Id: <20210930151201.9407-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210930151201.9407-1-peter.maydell@linaro.org>
References: <20210930151201.9407-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The aarch64-linux QEMU usermode binaries can never run 32-bit
code, so they do not need to include the GDB XML for it.
(arm_cpu_register_gdb_regs_for_features() will not use these
XML files if the CPU has ARM_FEATURE_AARCH64, so we will not
advertise to gdb that we have them.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210921162901.17508-2-peter.maydell@linaro.org
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



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E27F76AC562
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 16:35:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZCrP-00041v-40; Mon, 06 Mar 2023 10:34:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZCrK-0003ye-OU
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 10:34:42 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZCrI-000282-Rm
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 10:34:42 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 fm20-20020a05600c0c1400b003ead37e6588so8464513wmb.5
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 07:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678116879;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=8pZNSlYZUhjpU3KiX8JJtXqrL7cmbP2NKCT1L8eto8M=;
 b=TsasPpompzW0mfG7eMwo4DHYiJezGDsyiK8ppkTy3fVSNGAs557SlAL4X+lSIEV9vK
 0fVjHnetIJNt2IZgas7V4NDiAL9czYZfRsGXpaLdbHOs/kYlqaWweHxQiUbIllIok8uX
 9vmyFo23huG8Ty6pag9G/GGQWOvANRFOU1ckKyzqYphMgC/wTz1XWLXmE6pywNyeiIuY
 ulx7bjJCuzWXa+tbNA5YOxvMQRoYDsPWRTBHSj3n4w7ZNqpFEKhhHGlL5H/CUUK9tYKq
 kX6XR3WHC9zjg8wXacK1luSaJLuHdZ1M8Uuxy1NkVSHMd4ZtiyfUtUeqxt9eDlUwJ7JF
 0jTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678116879;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8pZNSlYZUhjpU3KiX8JJtXqrL7cmbP2NKCT1L8eto8M=;
 b=4XAC4elTTYhmcAut+G1sjeyisDzvqyY/ClNZWC4NHnoscABEiMldxTTaEWJlQXxe7C
 v33kLOS4xIDcv/PHpsbjV0OU7um+es6jBBUnfOzNQUVnhhw7qrZ53GaqHXdVV6TOZPfk
 5QHhkmuSXMHU/lvrMpQNQ0Vlnu4DaaSUPDw3Uj0RN/evOV5jo2W/2UlG5IjQQVv6WqFN
 wuAQXuV543QRsU96dRwxCt4riOeIDobyeNR06sQ0T8ro3ZS+QHFbw9SmHuivei+AJCqV
 wd6l84msK6LoO8kzciSLMK3s+gZUpvNkW83ZWMgS/514gT8btJNLYPorZfM5Tzg+pvxP
 aa5g==
X-Gm-Message-State: AO0yUKU92q4T/yzVpiv+z0z9TigmTkEmc+xUuhwmXy4au8C4s9YdTd5F
 QyFp1hR5cSpE7hNy0RYVNNmXV8w872q4OKXk9Eg=
X-Google-Smtp-Source: AK7set9Jthh7+o7U+REuZACUKDFFrBKPpwRPk5TGGkHE0vd+Z+PW+PovDRd+x/ki2rA0ZJfM/nw/Lw==
X-Received: by 2002:a05:600c:468b:b0:3df:fcbd:3159 with SMTP id
 p11-20020a05600c468b00b003dffcbd3159mr7488934wmo.3.1678116879255; 
 Mon, 06 Mar 2023 07:34:39 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 v7-20020a05600c444700b003eb0d6f48f3sm15287432wmn.27.2023.03.06.07.34.38
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 07:34:38 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/21] target/arm: Unexport arm_gen_dynamic_sysreg_xml
Date: Mon,  6 Mar 2023 15:34:16 +0000
Message-Id: <20230306153435.490894-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306153435.490894-1-peter.maydell@linaro.org>
References: <20230306153435.490894-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

This function is not used outside gdbstub.c.

Reviewed-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230227213329.793795-3-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h     | 1 -
 target/arm/gdbstub.c | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 787121694c5..209800d50df 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1116,7 +1116,6 @@ int arm_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
  * Helpers to dynamically generates XML descriptions of the sysregs
  * and SVE registers. Returns the number of registers in each set.
  */
-int arm_gen_dynamic_sysreg_xml(CPUState *cpu, int base_reg);
 int arm_gen_dynamic_svereg_xml(CPUState *cpu, int base_reg);
 
 /* Returns the dynamically generated XML for the gdb stub.
diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index cf1c01e3cf5..52581e9784c 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -305,7 +305,7 @@ static void arm_register_sysreg_for_xml(gpointer key, gpointer value,
     }
 }
 
-int arm_gen_dynamic_sysreg_xml(CPUState *cs, int base_reg)
+static int arm_gen_dynamic_sysreg_xml(CPUState *cs, int base_reg)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     GString *s = g_string_new(NULL);
-- 
2.34.1



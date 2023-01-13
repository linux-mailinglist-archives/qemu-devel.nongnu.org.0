Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3A6669E18
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 17:29:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGMGX-0001pa-5P; Fri, 13 Jan 2023 10:46:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGMGT-0001np-9t
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:46:46 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGMGR-00066B-Oz
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:46:45 -0500
Received: by mail-wr1-x433.google.com with SMTP id bs20so21462698wrb.3
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 07:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J0uzoxyewG1CZd1qWugKwgkYzf3Ypnm7BiOFvHDY2zE=;
 b=LB6hXVzkjzaI5ZlsZ7G/6yCU+EKu+Qp7QcCn9SYK/bJkaxz53Pdau4aPsentQWbTMD
 ao2tbCaLOzoLfwkUklS4Ie3VgXpDj1xE+YMe7DhoB4cXjl+XctTfENRPH3hykU43HBS1
 Py0NYys2lYXLm/Jey6/cus/wNGFMBx1JcvJl4dY0d7QJW766ttYLTOBBNE9+2q652lOI
 NtRqNOUyoUp/XnPVuqolbBN0CKlVP445hJ44IGw4HEa9gc4bhOGsSZwbnoHVS8xv5ClM
 4HVoVa/9G0fstVo0w/f1UFkq9q9rLFEKcgVu3Rnx1z+unKw+3G4phl5WeGccOT1CT5PX
 Ny2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J0uzoxyewG1CZd1qWugKwgkYzf3Ypnm7BiOFvHDY2zE=;
 b=Kq08dLI7xH0j3LxWIzaJo4K4SESvQyDUKSwuf8OcM9Zle9jpMyrZApb3z5yHmnpIwC
 p+qO3w5jPsiz2QbBE6MaAciJF3lwlo3ep1D48MP8cC/Ruf9w7C2PjAi8QmXloufN5yPO
 E+A6Wutfnh+5i2DJrVLW8AzvctBXWunsQh1lLcsS7ETb+WQI1Q6raJSmwMdV9ll9IG7l
 lCtnhkrq2FbfbIrMsn4mpj//3gUjrVEXnV8XoFtDIZIZ3HW17bCwKqFFwH3wz7HOI7XR
 FAX6LirjbR3NAsgWqkB5/vJWRx6g1uc9iUOfK141CT+Jh7Jf6grswbK78hqLijY8s4bG
 5Frg==
X-Gm-Message-State: AFqh2kpDt+7uZmqmVPLL4ka8fOXNG6xTcWVc2L6AB48vN+/uZrdMz1jf
 rBXW2OFe4VW2AlhElBUduio6GGwSTz5pfVt1
X-Google-Smtp-Source: AMrXdXvjlfrjXG93fdbPiApqSekDM+Lf3LCDkEZRajTh6H2O6da3bT91v+qWLyr8bHBRveraoQoLvw==
X-Received: by 2002:a05:6000:a19:b0:2bd:c477:8d6b with SMTP id
 co25-20020a0560000a1900b002bdc4778d6bmr8143745wrb.42.1673624801640; 
 Fri, 13 Jan 2023 07:46:41 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 b2-20020a056000054200b0022584c82c80sm19288392wrf.19.2023.01.13.07.46.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Jan 2023 07:46:41 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 14/46] hw/mips/bootloader: Implement nanoMIPS NOP opcode
 generator
Date: Fri, 13 Jan 2023 16:45:00 +0100
Message-Id: <20230113154532.49979-15-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230113154532.49979-1-philmd@linaro.org>
References: <20230113154532.49979-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221211204533.85359-3-philmd@linaro.org>
---
 hw/mips/bootloader.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/hw/mips/bootloader.c b/hw/mips/bootloader.c
index 21ffd4d772..0035f37335 100644
--- a/hw/mips/bootloader.c
+++ b/hw/mips/bootloader.c
@@ -54,14 +54,30 @@ static bool bootcpu_supports_isa(uint64_t isa_mask)
     return cpu_supports_isa(&MIPS_CPU(first_cpu)->env, isa_mask);
 }
 
+static void st_nm32_p(void **ptr, uint32_t insn)
+{
+    uint16_t *p = *ptr;
+
+    stw_p(p, insn >> 16);
+    p++;
+    stw_p(p, insn >> 0);
+    p++;
+
+    *ptr = p;
+}
+
 /* Base types */
 static void bl_gen_nop(void **ptr)
 {
-    uint32_t *p = *ptr;
+    if (bootcpu_supports_isa(ISA_NANOMIPS32)) {
+        st_nm32_p(ptr, 0x8000c000);
+    } else {
+        uint32_t *p = *ptr;
 
-    stl_p(p, 0);
-    p++;
-    *ptr = p;
+        stl_p(p, 0);
+        p++;
+        *ptr = p;
+    }
 }
 
 static void bl_gen_r_type(void **ptr, uint8_t opcode,
-- 
2.38.1



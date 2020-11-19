Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5A02B9D53
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 23:06:07 +0100 (CET)
Received: from localhost ([::1]:39038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfs46-0002vW-BG
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 17:06:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfrv5-0000mV-4v
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 16:56:47 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:56108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfrut-0004BS-1q
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 16:56:43 -0500
Received: by mail-wm1-x344.google.com with SMTP id c9so8564843wml.5
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 13:56:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=/mxHZqml/sxi9C4g39lKbtODJz0/J/tLjXqLI1lW7vU=;
 b=nxFyYulYsF0yBXz4oR+n7HTloQyiEsdWnpMjmtkNqhZ7RiyQr/IVUIQ47c0KBTdMxw
 7wlAeEU8T9Z650FIqyM3efubhYLJMj6eu1QjmGoWmMPdsN5O3NWusKVLAK6RY7Tol3xn
 S39BMvhSoufmnNwfUXy/RnFLC6tOvAf2+xy3YtwGgFz7R8Ch9U8yjhJQJOTyqASF2YYu
 8A4203+JnTJl+4ZnO6i14+3NYPUgeEU5QtMVd738URvTMSTRJYogWaMYidGh9Lt/s/oj
 IzPySAnxvoTUUUQL6c1gj50QUNfq8sLn8YIpjLW3SH2jKUOSnqnyiwcLZPesBmzcJQRK
 TxfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/mxHZqml/sxi9C4g39lKbtODJz0/J/tLjXqLI1lW7vU=;
 b=n5fLMNYL1F5CIKOAXp4EbXywoUc6BEhhB/0v18d+KjGQYOKb/Lctb5nkL3YqamvhHb
 SKf8YEKGixUDbETRm+XBy4QcR6gkx88lc8KbIv9D8lD5ablMuiM+sCjQMKTc2kGyU4Vc
 olxe6dLD8vT9li/g/O6cCDMGSxS41ZR+PjCxT+Um71lFgY8cWM7XmIPtjBDWG0Eu7xdS
 5sYHvZ38/p9IJg1zl+phzbq9mrUb7luGqrH9mYqCn+6K6QI6LhHPHIYyk5OMXUdmyMa9
 3lajGqFUA8uW+UIgSA1Fi7kFn8TCa5z81P82c3iRoA25CBTegchsYmMKl12ZY6cxfzLt
 3bUQ==
X-Gm-Message-State: AOAM532rCgkiodzjPFcRU5qS0iFT5+G4QHXZlI5MEfTVE3VxxkLleKoo
 GlMYfpcpMW4rOu25KyO+NuUYrhWxyDPXYA==
X-Google-Smtp-Source: ABdhPJz6b0uIYJvjiAKagJNV+iygmsbR5CdmKyo93UtlCBqj6USvrvn3BbwJ54aqyFqN4pnbxsRiUQ==
X-Received: by 2002:a1c:7c02:: with SMTP id x2mr6247348wmc.64.1605822992994;
 Thu, 19 Nov 2020 13:56:32 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j15sm1934851wrm.62.2020.11.19.13.56.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 13:56:32 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 11/28] target/arm: Use new FPCR_NZCV_MASK constant
Date: Thu, 19 Nov 2020 21:56:00 +0000
Message-Id: <20201119215617.29887-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201119215617.29887-1-peter.maydell@linaro.org>
References: <20201119215617.29887-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x344.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

We defined a constant name for the mask of NZCV bits in the FPCR/FPSCR
in the previous commit; use it in a couple of places in existing code,
where we're masking out everything except NZCV for the "load to Rt=15
sets CPSR.NZCV" special case.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-vfp.c.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate-vfp.c.inc b/target/arm/translate-vfp.c.inc
index 6c4b7db8213..6bc327e9819 100644
--- a/target/arm/translate-vfp.c.inc
+++ b/target/arm/translate-vfp.c.inc
@@ -743,7 +743,7 @@ static bool gen_M_fp_sysreg_read(DisasContext *s, int regno,
          * helper call for the "VMRS to CPSR.NZCV" insn.
          */
         tmp = load_cpu_field(vfp.xregs[ARM_VFP_FPSCR]);
-        tcg_gen_andi_i32(tmp, tmp, 0xf0000000);
+        tcg_gen_andi_i32(tmp, tmp, FPCR_NZCV_MASK);
         storefn(s, opaque, tmp);
         break;
     default:
@@ -884,7 +884,7 @@ static bool trans_VMSR_VMRS(DisasContext *s, arg_VMSR_VMRS *a)
         case ARM_VFP_FPSCR:
             if (a->rt == 15) {
                 tmp = load_cpu_field(vfp.xregs[ARM_VFP_FPSCR]);
-                tcg_gen_andi_i32(tmp, tmp, 0xf0000000);
+                tcg_gen_andi_i32(tmp, tmp, FPCR_NZCV_MASK);
             } else {
                 tmp = tcg_temp_new_i32();
                 gen_helper_vfp_get_fpscr(tmp, cpu_env);
-- 
2.20.1



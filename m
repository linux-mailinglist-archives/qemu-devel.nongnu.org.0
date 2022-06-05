Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0AD53DCF0
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Jun 2022 18:18:08 +0200 (CEST)
Received: from localhost ([::1]:39088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxsx5-0001Dw-FI
	for lists+qemu-devel@lfdr.de; Sun, 05 Jun 2022 12:18:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxsqH-0004Wj-Es
 for qemu-devel@nongnu.org; Sun, 05 Jun 2022 12:11:07 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:55207)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxsqE-0000Ti-Qw
 for qemu-devel@nongnu.org; Sun, 05 Jun 2022 12:11:04 -0400
Received: by mail-pj1-x1032.google.com with SMTP id j7so10999479pjn.4
 for <qemu-devel@nongnu.org>; Sun, 05 Jun 2022 09:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BiCy+cPE5Fp9O9R0zWpEP/6dC1PqcMNp2AcNLHCUCp0=;
 b=d1L4lCEgThGbpoyUeAz9yp1S+/oerstTHGDhWx2Fq+NQlyb6TXlBrhXjv2WBdBeP5o
 /tb9QHIGIKdZfaoRlsqzhOM3UEnq0W4zq8bXa2YUWxuFch6P4KyBwHOy7vSHGj+jjFxS
 eqDnFqWmBFV00krWPbRTJ/K2zLt23WcaeYo32YirjITkdTHBydlRYfs49vnNOtpBia7e
 m85QVjTAaNa9KKPaVJjMyL4zkj9IWdu5s/ABy17AeUfqIrw2WnYRWK8h2J8xrH1FLy+2
 lYnjuY3Rhx+ccMKRcJY2e3X9nllmqJfT70Jt35zfBPiahJSMbxKX80Kmlra1ceBJcTCZ
 l0NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BiCy+cPE5Fp9O9R0zWpEP/6dC1PqcMNp2AcNLHCUCp0=;
 b=C8XO7icHIvfqujU/2JUi6tmaicUWSjb+PPV8uOKhE8Ov46Itposeg4jg6TEmDVnGNO
 9jeLRhifPr9XPw1gZPrg7SR3yIi88BnI0x3KHjz523mjUvQg8WqqC44UgL53OTEpxnRs
 /OviNmXqMDgLTcy3I61om4kuihIMn2J4jGqHQYgGdpfiLcyp8FROD6b/tWQCx1SMe/aN
 SH1Bb2uYn/f4L/XDDFN1Q1x8JkAOWZ9vfxLZ9JKvGKc/DulggvO/ONLVcqw1GtD6MjdP
 eOdr7xi5XZmicJ/9jRVw8JUWMQH1Ldv+sekEGyh6oHjpUm83WrBfrJthbCHmTalessDI
 t2Tw==
X-Gm-Message-State: AOAM530lrU4YV3+AznFu5qsMwFGQf68ioX//XHY+O6qke7zoKFZUf8Oz
 Y2n9vZJAuZryLo/F5Kg2FzKWiNjwhNH8Rg==
X-Google-Smtp-Source: ABdhPJxhAlqTLLpDEKftTxcvQ9saGLIkkboPPZm0BfuXxaHljz5KlRy8me0328bZ+MW/drDFIMH/Og==
X-Received: by 2002:a17:902:ef45:b0:155:cede:5a9d with SMTP id
 e5-20020a170902ef4500b00155cede5a9dmr20010175plx.93.1654445461455; 
 Sun, 05 Jun 2022 09:11:01 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3fb8:a3e1:bf34:75a2])
 by smtp.gmail.com with ESMTPSA id
 q133-20020a632a8b000000b003c14af505fesm8932165pgq.22.2022.06.05.09.11.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jun 2022 09:11:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 2/2] target/arm: SCR_EL3.RW is RAO/WI without AArch32 EL[12]
Date: Sun,  5 Jun 2022 09:10:56 -0700
Message-Id: <20220605161056.293920-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220605161056.293920-1-richard.henderson@linaro.org>
References: <20220605161056.293920-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Since DDI0487F.a, the RW bit is RAO/WI.  When specifically
targeting such a cpu, e.g. cortex-a76, it is legitimate to
ignore the bit within the secure monitor.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1062
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h    | 5 +++++
 target/arm/helper.c | 4 ++++
 2 files changed, 9 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index c1865ad5da..a7c45d0d66 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3947,6 +3947,11 @@ static inline bool isar_feature_aa64_aa32_el1(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, EL1) >= 2;
 }
 
+static inline bool isar_feature_aa64_aa32_el2(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, EL2) >= 2;
+}
+
 static inline bool isar_feature_aa64_ras(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, RAS) != 0;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index c262b00c3c..84232a6437 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1755,6 +1755,10 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
         value |= SCR_FW | SCR_AW;      /* RES1 */
         valid_mask &= ~SCR_NET;        /* RES0 */
 
+        if (!cpu_isar_feature(aa64_aa32_el1, cpu) &&
+            !cpu_isar_feature(aa64_aa32_el2, cpu)) {
+            value |= SCR_RW;           /* RAO/WI*/
+        }
         if (cpu_isar_feature(aa64_ras, cpu)) {
             valid_mask |= SCR_TERR;
         }
-- 
2.34.1



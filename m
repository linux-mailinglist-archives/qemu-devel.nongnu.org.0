Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 385844CC5F9
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 20:24:23 +0100 (CET)
Received: from localhost ([::1]:44528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPr3m-0003Qf-AC
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 14:24:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPqvr-00020Y-3T
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 14:16:11 -0500
Received: from [2607:f8b0:4864:20::62b] (port=36571
 helo=mail-pl1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPqvl-0007TU-Gf
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 14:16:10 -0500
Received: by mail-pl1-x62b.google.com with SMTP id e13so5579567plh.3
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 11:16:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+BD96XfV2twTSXl72v5Agr1at/ZBm5w6SA0tYUmlFcg=;
 b=OkqH6XdZCMAUqMXMoosmx8OP1jNJz9JOhlFOMxrRGnMlEjAh2Zycj/h1VcVCEu3GV2
 1PL/zulSrvn1WAhjmoWfJw5X5bYEDI/adxdv+coPJfS1vNW6iPmSDWCGTR7SKa/41Ul9
 LqwYtKFmYi2FbUEW4PYprJwsgNzn36XZIUs9gnFR5j+2uQlFxcjZF0eh7yQSSxL4CXd6
 S9e5dBOv+7z2cLzaw7J3mMAXnE7cb+twe/wT2pucjIrhq74VMIwG9bRhdeldKj+8Ughf
 59rsZDAPGN4EJHpiydbB+toPOysQOSnPC2x4joK9r5GMQfl1puwd43DZRshr6TrqacCc
 rORg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+BD96XfV2twTSXl72v5Agr1at/ZBm5w6SA0tYUmlFcg=;
 b=b2i/hqRR7aub2wzkvdlqQMXGXCM6tjRjZuAz9QD4Kq2u44+h9u5iuRBtkD2nEp63EM
 uzLbaYBxNp+J1GPEb7k20dyJU782D/G31p/pcln7hlCLP3KEM/K4RIOjprYa3xTeoLvn
 1iod+8ovFRbOG13z2+fdddbIlXVhgI3Y9sExoE0Sy+wtnDuvACizEKugLqyzaFO8yjfL
 MrqCXQwR1btqHev6PIGFcORv23IdpMd7lDjTcgCvYQL68PgLOKvGRo/OJK3vSkdtpD9L
 /XjYl+RRx3Mbea/KrPE3cqucCcPy7ac62vdhLRi9bCAl45ejVYekCrTZuJN/j59n10bS
 VXig==
X-Gm-Message-State: AOAM530uZy/ojOsn/pO4yVPwCfV5bZ2mXbK8nCLXiN6o1C1CkMmIbB2t
 tcU5PBgbeeRU8DdIVHCe0of+eLA8oYdi4g==
X-Google-Smtp-Source: ABdhPJxg7gVHfuLDCfvpUKCNwD00UchB0xJa3u8r/olx6QhxVc8tBPfvChGW3LJPmE0Zirk+yTcJvg==
X-Received: by 2002:a17:90a:ad88:b0:1be:ec99:a695 with SMTP id
 s8-20020a17090aad8800b001beec99a695mr6888331pjq.119.1646334964275; 
 Thu, 03 Mar 2022 11:16:04 -0800 (PST)
Received: from localhost.localdomain
 (2603-800c-1201-c600-119c-490c-a4ee-08e8.res6.spectrum.com.
 [2603:800c:1201:c600:119c:490c:a4ee:8e8])
 by smtp.gmail.com with ESMTPSA id
 u25-20020a62ed19000000b004f140515d56sm3318043pfh.46.2022.03.03.11.16.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 11:16:03 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 7/9] tcg/mips: Support TCG_TARGET_SIGNED_ADDR32
Date: Thu,  3 Mar 2022 09:15:49 -1000
Message-Id: <20220303191551.466631-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303191551.466631-1-richard.henderson@linaro.org>
References: <20220303191551.466631-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All 32-bit mips operations sign-extend the output, so we are easily
able to keep TCG_TYPE_I32 values sign-extended in host registers.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target-sa32.h |  8 ++++++++
 tcg/mips/tcg-target.c.inc  | 10 ++--------
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/tcg/mips/tcg-target-sa32.h b/tcg/mips/tcg-target-sa32.h
index cb185b1526..51255e7cba 100644
--- a/tcg/mips/tcg-target-sa32.h
+++ b/tcg/mips/tcg-target-sa32.h
@@ -1 +1,9 @@
+/*
+ * Do not set TCG_TARGET_SIGNED_ADDR32 for mips32;
+ * TCG expects this to only be set for 64-bit hosts.
+ */
+#ifdef __mips64
+#define TCG_TARGET_SIGNED_ADDR32 1
+#else
 #define TCG_TARGET_SIGNED_ADDR32 0
+#endif
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 993149d18a..b97c032ded 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -1168,12 +1168,6 @@ static void tcg_out_tlb_load(TCGContext *s, TCGReg base, TCGReg addrl,
                      TCG_TMP0, TCG_TMP3, cmp_off);
     }
 
-    /* Zero extend a 32-bit guest address for a 64-bit host. */
-    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
-        tcg_out_ext32u(s, base, addrl);
-        addrl = base;
-    }
-
     /*
      * Mask the page bits, keeping the alignment bits to compare against.
      * For unaligned accesses, compare against the end of the access to
@@ -1679,7 +1673,7 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is_64)
                         data_regl, data_regh, addr_regl, addr_regh,
                         s->code_ptr, label_ptr);
 #else
-    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
+    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS && !guest_base_signed_addr32) {
         tcg_out_ext32u(s, base, addr_regl);
         addr_regl = base;
     }
@@ -1878,7 +1872,7 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is_64)
                         data_regl, data_regh, addr_regl, addr_regh,
                         s->code_ptr, label_ptr);
 #else
-    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
+    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS && !guest_base_signed_addr32) {
         tcg_out_ext32u(s, base, addr_regl);
         addr_regl = base;
     }
-- 
2.25.1



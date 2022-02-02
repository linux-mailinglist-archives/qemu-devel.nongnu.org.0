Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4214C4A6AB7
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 05:03:07 +0100 (CET)
Received: from localhost ([::1]:47324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF6rJ-0007Cn-Q0
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 23:03:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1nF3tL-0000cQ-Sq
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 19:53:00 -0500
Received: from [2a00:1450:4864:20::22b] (port=43525
 helo=mail-lj1-x22b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1nF3tI-0003DK-CJ
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 19:52:59 -0500
Received: by mail-lj1-x22b.google.com with SMTP id t7so26532633ljc.10
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 16:52:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OiVT0bM4NtspWL25PM05AeUoZSR1WRY5chXXsAksmeU=;
 b=NPDNd9b+YlrT1VVOnWPnp7dtxKHk1V/eb0F+mbhBBm27ZSA+Tt0gMEwzlGeCnzZ5Zv
 xtkdCimWMLaRG0qNYxpWXaMyWXKk+J59c3/UcQcmgRDhApiqJoMBexR8QStZCkhmPvV0
 /GWAuwQPRvb1+jR/xjkzDHQsNDPNukb+tLoSwckDew9fQqexobL5YV3PenkOlCAxjcWU
 PEBbALAkyUXS8jRgqKRiATGZyKOi8tKeBe90WKHrU0bFTmnSOAA8rz78gzK3hl0rmfye
 2CoL9pXIznKL0jRIIDuD/Xnwn9Z7zK2eSaDp5IUznWv0mKKGwp6DLvL4/X/sVKFbwFl6
 RRIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OiVT0bM4NtspWL25PM05AeUoZSR1WRY5chXXsAksmeU=;
 b=vVGqndhKFyEkB+3UUJLQf57xW29XGaO6Mqv8IabLeJOK0wZRRLDIJZ2rgcH+hIzcvb
 1f5n02iGG+zu8W/X4slj2nuNmwEEsH05fg5JRmaHmLWQHvfWb3SVa6LDLJawlhwuG76Y
 OhVBkpR9X7EmvoDvrzU96c22Zq+/OyatIJzMhem4AEys95wV7N3aVNBsChgxiFhaOsEH
 t/e24BcKreI1O9EKoqkYUcm4ZASyzFY+Ry9i9muz4ivGSetPlw2seV8Lj9VtP1x2/Dj3
 C6twz5C8D7Noo6wrsCxeehlI/aZpfYKWMhylOGqgCTh7dMUSTEWjxbKTbvQosPRS2KZd
 Utxg==
X-Gm-Message-State: AOAM5326mXkzPCrvlUInTJK+S5X41eoV5lSeMWrsUDXXaxfcL9QGjWom
 MorK5BbbSDjKdwwZCVFZZObMKeYnD2jxILyO
X-Google-Smtp-Source: ABdhPJyrap/inaVJR67+cWfWqUg9XXaOdHaajOTStmY3G2dr6MdXfnD8/X50dn6+E6yoXsSo2IF1fg==
X-Received: by 2002:a05:651c:1604:: with SMTP id
 f4mr11101696ljq.220.1643763174184; 
 Tue, 01 Feb 2022 16:52:54 -0800 (PST)
Received: from ubuntu-focal.. ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id bt22sm4305297lfb.262.2022.02.01.16.52.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 16:52:53 -0800 (PST)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 1/7] target/riscv: refactor (anonymous struct) RISCVCPU.cfg
 into 'struct RISCVCPUConfig'
Date: Wed,  2 Feb 2022 01:52:43 +0100
Message-Id: <20220202005249.3566542-2-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220202005249.3566542-1-philipp.tomsich@vrull.eu>
References: <20220202005249.3566542-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::22b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::22b;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lj1-x22b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Greg Favor <gfavor@ventanamicro.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

---

(no changes since v4)

Changes in v4:
- use a typedef into 'RISCVCPUConfig' (instead of the explicit
  'struct RISCVCPUConfig') to comply with the coding standard
  (as suggested in Richard's review of v3)

Changes in v3:
- (new patch) refactor 'struct RISCVCPUConfig'

 target/riscv/cpu.h | 78 ++++++++++++++++++++++++----------------------
 1 file changed, 41 insertions(+), 37 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 55635d68d5..1175915c0d 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -303,6 +303,46 @@ struct RISCVCPUClass {
     DeviceReset parent_reset;
 };
 
+struct RISCVCPUConfig {
+    bool ext_i;
+    bool ext_e;
+    bool ext_g;
+    bool ext_m;
+    bool ext_a;
+    bool ext_f;
+    bool ext_d;
+    bool ext_c;
+    bool ext_s;
+    bool ext_u;
+    bool ext_h;
+    bool ext_j;
+    bool ext_v;
+    bool ext_zba;
+    bool ext_zbb;
+    bool ext_zbc;
+    bool ext_zbs;
+    bool ext_counters;
+    bool ext_ifencei;
+    bool ext_icsr;
+    bool ext_zfh;
+    bool ext_zfhmin;
+    bool ext_zve32f;
+    bool ext_zve64f;
+
+    char *priv_spec;
+    char *user_spec;
+    char *bext_spec;
+    char *vext_spec;
+    uint16_t vlen;
+    uint16_t elen;
+    bool mmu;
+    bool pmp;
+    bool epmp;
+    uint64_t resetvec;
+};
+
+typedef struct RISCVCPUConfig RISCVCPUConfig;
+
 /**
  * RISCVCPU:
  * @env: #CPURISCVState
@@ -320,43 +360,7 @@ struct RISCVCPU {
     char *dyn_vreg_xml;
 
     /* Configuration Settings */
-    struct {
-        bool ext_i;
-        bool ext_e;
-        bool ext_g;
-        bool ext_m;
-        bool ext_a;
-        bool ext_f;
-        bool ext_d;
-        bool ext_c;
-        bool ext_s;
-        bool ext_u;
-        bool ext_h;
-        bool ext_j;
-        bool ext_v;
-        bool ext_zba;
-        bool ext_zbb;
-        bool ext_zbc;
-        bool ext_zbs;
-        bool ext_counters;
-        bool ext_ifencei;
-        bool ext_icsr;
-        bool ext_zfh;
-        bool ext_zfhmin;
-        bool ext_zve32f;
-        bool ext_zve64f;
-
-        char *priv_spec;
-        char *user_spec;
-        char *bext_spec;
-        char *vext_spec;
-        uint16_t vlen;
-        uint16_t elen;
-        bool mmu;
-        bool pmp;
-        bool epmp;
-        uint64_t resetvec;
-    } cfg;
+    RISCVCPUConfig cfg;
 };
 
 static inline int riscv_has_ext(CPURISCVState *env, target_ulong ext)
-- 
2.33.1



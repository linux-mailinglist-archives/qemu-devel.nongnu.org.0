Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC3A4A3C16
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 01:06:55 +0100 (CET)
Received: from localhost ([::1]:59770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEKDb-00058l-Ta
	for lists+qemu-devel@lfdr.de; Sun, 30 Jan 2022 19:06:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1nEK5A-0005ak-4W
 for qemu-devel@nongnu.org; Sun, 30 Jan 2022 18:58:10 -0500
Received: from [2a00:1450:4864:20::135] (port=41740
 helo=mail-lf1-x135.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1nEK58-0006u3-97
 for qemu-devel@nongnu.org; Sun, 30 Jan 2022 18:58:07 -0500
Received: by mail-lf1-x135.google.com with SMTP id x7so23337672lfu.8
 for <qemu-devel@nongnu.org>; Sun, 30 Jan 2022 15:58:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R/K2o6RsPl+qPYjokkHOYxiKobshuCIOoA8kMZIng18=;
 b=VtclboTlDpZdUSKkeCiAHLrgCOsCvHl8XhX0pJwMDbqsZL3HZ1omvmNHxMxP0YTLsN
 vqv3zNB21Yba9JzH+m9LE3nNlJZMc3bY2DIHDtjhpmO8OAGJImOGsTU1KwVNX84GTn8m
 MbNpbx5i3dm101yEcA5dkBaS8IUaKL19jDOwuoG0LWnZ8W5K8v674Z45QaLCVO2zy2K5
 WoWZtKIC0ZdFHBNcFXSSBULuSWoE+Dzip/k/ZVhunu8D1V5a5AvMyWKKvge0O6Hu3iaj
 kkkxfyGeOLu3R1n/nZqvHIAi9of0jprH5LydwUN1cD/B7ASPjcJUnX+aVOkjnThlBFlx
 ezoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R/K2o6RsPl+qPYjokkHOYxiKobshuCIOoA8kMZIng18=;
 b=SPxIstJTssn69PG/h7QdttlinZPxycTMRZfopJpsoFCYJp9Zu1Jz0TcQqwAs/rmpaV
 +cnC5hUQ3rdOwv7qTaV1+qatNFm16RhhPtvFsYmD6NDrAK8gsxKa/+2FI37CKC97pQUF
 Njy949lSfOwJrIgbiJEpMu7rBAbgkSkiDwlvGcfl7O0Cf33F1gDEF5UWy+WWj61ABR1d
 tPr5KAaPclAmEVp+O9SlER608Np3Vg/OnYg58wji4wnFIplLe01Ohmz13xtBw0SsYPtN
 Ot/zepADR+3lRiqpozGm13kG1O+80XIiYGlBuhha99LKM2inHY3lH6+vpJg0XUwju+Vp
 qE9g==
X-Gm-Message-State: AOAM530PxEVDROVF74TB2WwFg0Sk6bvF/978GxA9quA5/lsyw1i6Ln6C
 KA1JdNowYfWkucFWEs5SViAmE3Cf4LUGpmGo
X-Google-Smtp-Source: ABdhPJzmJVGM3nPn2ja4LdcSWVIL/JRA8qVJ2fmcvK+28UE1cHvqDYeCju/cPRHdwe6LtOSkgLpLjQ==
X-Received: by 2002:ac2:54ae:: with SMTP id w14mr13577666lfk.197.1643587083691; 
 Sun, 30 Jan 2022 15:58:03 -0800 (PST)
Received: from ubuntu-focal.. ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id 8sm2132159lfq.200.2022.01.30.15.58.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jan 2022 15:58:03 -0800 (PST)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 1/7] target/riscv: refactor (anonymous struct) RISCVCPU.cfg
 into 'struct RISCVCPUConfig'
Date: Mon, 31 Jan 2022 00:57:53 +0100
Message-Id: <20220130235759.1378871-2-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220130235759.1378871-1-philipp.tomsich@vrull.eu>
References: <20220130235759.1378871-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::135
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lf1-x135.google.com
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
Suggested-by: Richard Henderson <richard.henderson@linaro.org>

---

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



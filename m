Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1C64A41E3
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 12:07:45 +0100 (CET)
Received: from localhost ([::1]:45130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEUXA-00040y-52
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 06:07:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1nEURm-0001tJ-By
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 06:02:10 -0500
Received: from [2a00:1450:4864:20::130] (port=34321
 helo=mail-lf1-x130.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1nEURk-00041r-Cm
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 06:02:09 -0500
Received: by mail-lf1-x130.google.com with SMTP id p27so26078845lfa.1
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 03:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xZHH89LsVmLHUEqQmJxUYBMXp2gD032NRq/kWsZbaZA=;
 b=Bwmiav8/JATZaEKoAFpUUiXkvXaK3+n+xb63qKZCJ4IvGx+kWo8Uvd3tMNhdaBWpj+
 2nNPCD5o+95sqGcYRWVT5DHTiM5lGC+0MqYdBgcRjlGVxCYaLMop1pwtXOtzk85X5sP2
 OKTLGnsPpqOcv5LSbvdmf4SSaMFYCgKtdJmw9RO5QnseWqGWv9GWkPs4Rv8E1Ud2PEcJ
 g01Jo7BPIxRZlaqLSr24vjhVIFV50vDkeUIK/1BXp30YoG1YWK5MvKxWg5JHO5WCNKjp
 uJ8yVVju5Nd/zyVEoYv74oJeAzluxxgp5Oexa2tBMy27w3cwmD055Uj7MFxaUoIZKI8p
 iqLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xZHH89LsVmLHUEqQmJxUYBMXp2gD032NRq/kWsZbaZA=;
 b=6A/Eoyv4fqZmn/Z/be1aGeQ3U2rHTqp8a4RY+koezq0pGfRrZO/n3MXIPnBdNY4HT0
 sotzVmkZmGN4AJDN6OaFPwfOSb3+b+NtVzaX0V6MNcUh+K4LdznrCV97hwQhQ6zAr+CB
 KqVzr+ORKIkX+E6V79O77uRMkbZf03YErPgDA30A9D4dHK/HC1a5ivP9ar/xLuHvGcdE
 nQf9DQB3zltUeOjyXDt01XL+NC/lFiawT6T8S1nYeUZ+f0btTlqa5O3cdj6yk9+PNAxp
 aR15Sp1YT8tljFYEGsAuS9y656ojm2nbdvK58qD1Y5TopmCJELMf2IAd7X7D1Gysc2r4
 N8qQ==
X-Gm-Message-State: AOAM533dJECUnU552ol41xIl33CmktsdvZTnCAvqx8YnHAB2/82gtAuP
 GchuoAw/a2BKg23yqvs30m+EXDuqiLp/5Q0q
X-Google-Smtp-Source: ABdhPJxZEUxKpgYU1gsHJoNfQ/zXtkQVjuPTXOkh6KHZPYpyc6/znuR6Zr8LBKWFDTYLLC1AAF+cqA==
X-Received: by 2002:a05:6512:2241:: with SMTP id
 i1mr15101336lfu.622.1643626926231; 
 Mon, 31 Jan 2022 03:02:06 -0800 (PST)
Received: from ubuntu-focal.. ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id u22sm1952759lfl.26.2022.01.31.03.02.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 03:02:05 -0800 (PST)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 1/7] target/riscv: refactor (anonymous struct) RISCVCPU.cfg
 into 'struct RISCVCPUConfig'
Date: Mon, 31 Jan 2022 12:01:55 +0100
Message-Id: <20220131110201.2303275-2-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220131110201.2303275-1-philipp.tomsich@vrull.eu>
References: <20220131110201.2303275-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::130
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lf1-x130.google.com
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Greg Favor <gfavor@ventanamicro.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kito Cheng <kito.cheng@sifive.com>, Philipp Tomsich <philipp.tomsich@vrull.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
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



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A34149FC4C
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 16:00:07 +0100 (CET)
Received: from localhost ([::1]:42092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDSjO-0002GU-J7
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 10:00:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1nDSgF-0008Ug-Dm
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 09:56:51 -0500
Received: from [2a00:1450:4864:20::234] (port=45579
 helo=mail-lj1-x234.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1nDSgD-0000uW-An
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 09:56:50 -0500
Received: by mail-lj1-x234.google.com with SMTP id t9so9332915lji.12
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 06:56:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F29R24gTcoJC/LWmSY1pdI9rj935YOu1A0eBWN4MclI=;
 b=LkLpXbA3c/tEXCzvS6m66gptvPD1BdayEmAKhhN4NGSLkrqi/++c/R64eAn3lPkD00
 ZqqDa5KifLcRGLNeslLAShxyxKUT/wxNjabPc4Td4Qg9OysLeoULjgtDERKvUr5ZSWNG
 7Ja7Vs1tic78JquNR3Bxdc5FZ7wCDskImcM7WVed6oPvXFExMeBF3NbTjGrzGdpFWurC
 b31GWH8hnWv8A8urkJXpeRV5/MqWkxbarDs4aGHb/ky5dbikHNGpKC+0Tk78BH5Mv6/O
 C6r/ioLmQRtT4++lkhuCpuT09ZFKLT+C0fN3kS8c8s4CkKqj3gri+83NVgGBLkGpzyUz
 q5QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F29R24gTcoJC/LWmSY1pdI9rj935YOu1A0eBWN4MclI=;
 b=M1CwfkPBFfyluqZNbRcWamSNzCmLJV4ImXVtN0gsBinw5ZbokZpzpC8LvyA11iJpus
 L0DjUpS17NMoQVwQHlZn0zDMslrcX8+anRZJ9Be9//5YmA+U+yy6uz/HF2YWym38bEj0
 2X+pMy5FoRl7Xx5ZrcD+LiCY49jw+BsSKV9AOh7m6DCy2iZh4d0EDRf8rJQ9wu5KMm7g
 Rte9nNt7+ZOuf5v2x5gRIwIrsnlnT0SnfbJvCIpItGo5g+RL5tnQQrUkwqNAFr73XU/m
 h1lh6cA3b8im7I5hcnNy/q1vsOrmb9Ht0AN5DybAiMo/R3mBg73sO2cXs/aankC+DaBM
 IU+Q==
X-Gm-Message-State: AOAM530028nEx1uaA1EFcvJSlBRCK9909aeUsYYk81mWCJu0aKLBh+Y9
 DNvLZm1hhb8YWO+pf4PYpVOn369ZsSoPb6xW
X-Google-Smtp-Source: ABdhPJyfXoKyOC5UaS0Afq5Dxn9K1wS3HPZJOueSoWSqprpNihcljUH3LurSR3OQYKbYktE6LM+Vug==
X-Received: by 2002:a2e:530c:: with SMTP id h12mr6114979ljb.521.1643381806754; 
 Fri, 28 Jan 2022 06:56:46 -0800 (PST)
Received: from ubuntu-focal.. ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id b20sm1031234lfb.51.2022.01.28.06.56.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 06:56:46 -0800 (PST)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/7] target/riscv: refactor (anonymous struct) RISCVCPU.cfg
 into 'struct RISCVCPUConfig'
Date: Fri, 28 Jan 2022 15:56:36 +0100
Message-Id: <20220128145642.1305416-2-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220128145642.1305416-1-philipp.tomsich@vrull.eu>
References: <20220128145642.1305416-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::234
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::234;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lj1-x234.google.com
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
 Greg Favor <gfavor@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Kito Cheng <kito.cheng@sifive.com>, Philipp Tomsich <philipp.tomsich@vrull.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
Suggested-by: Richard Henderson <richard.henderson@linaro.org>

---

Changes in v3:
- (new patch) refactor 'struct RISCVCPUConfig'

 target/riscv/cpu.h | 76 ++++++++++++++++++++++++----------------------
 1 file changed, 39 insertions(+), 37 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 55635d68d5..9c795089b6 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -303,6 +303,44 @@ struct RISCVCPUClass {
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
 /**
  * RISCVCPU:
  * @env: #CPURISCVState
@@ -320,43 +358,7 @@ struct RISCVCPU {
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
+    struct RISCVCPUConfig cfg;
 };
 
 static inline int riscv_has_ext(CPURISCVState *env, target_ulong ext)
-- 
2.33.1



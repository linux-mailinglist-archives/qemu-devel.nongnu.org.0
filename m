Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C843F5046
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 20:19:27 +0200 (CEST)
Received: from localhost ([::1]:56270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIEXe-0000fA-Ut
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 14:19:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mIEQM-0006YD-SR
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 14:11:55 -0400
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136]:43546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mIEQH-0008PM-7c
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 14:11:54 -0400
Received: by mail-lf1-x136.google.com with SMTP id i9so39674461lfg.10
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 11:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c1rr82jxN5+jzKNI4EU4MahzmM6uD7w3fmff1rpM7zc=;
 b=ntpLqPOyb6Raa8PhHIzZC6m8u6Y7Sq2Cifihp2N87+nZRhX8H6ae/sVc7aibj/ifBO
 pZGqbvIy0k8j5QkkBgwy+9GRAQzFWklBv7mkSpoE4gUsSnlBNEpPWkk9xJwqd4raFNAu
 xkSe5/kpOCDbxGUpGpzeI1176LVr8piJVJDQqHiER9lMe9sdVY92H8XeyyRH23kzq7ol
 IALkxCvWA35fIXW5L82WjwzUYXPr1RFnevSV7KqjRr5kEC1ORD+D140LEl7rJxSVVwh/
 ZBWEe8+hoxzqcCeNItSM8EtKHnMga4wC7HymmL7wgohqj9zPIQr3f2Ct8qNPefT3GntI
 FmvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c1rr82jxN5+jzKNI4EU4MahzmM6uD7w3fmff1rpM7zc=;
 b=o8Y4FDyDKvOOYydXzdKr11lVPYUH+vfO8vxpv8fe9OSbXRdm3HhADKq4jaANnz99+r
 jdzJ8/C7HIizvjUE+5F2FvBM6+JFaNA374157Wix0bk2eafJj9Z85S5hypnfzN0VDY77
 ozHyXedgW0TR8MrwQKIlZRf5BzGLeHcQcmcZFCaHAUYvWmMzhfU/WfiDFXSgRNCwTNoW
 Tp4zDE4DU7iDm1vy1yT3hbz6wYBnbYuoiIewRWB74RSSoshetgfkqgsbFiDlBR0CyT4b
 VtQ8Xwk7GwV39ebXGr1DQYHVkJJD4/0DwWXlryrsfVN5nYOogjKNwPyaS/Uz1PQnslK1
 hGGQ==
X-Gm-Message-State: AOAM530mob2qbZYpr0YqBJEtfaxLV867jY0HoKzcxNP2+cWtPpT3KbII
 0TXY+0tzuYSi0BqLtxMTIY2h2AwEd+IQISRS
X-Google-Smtp-Source: ABdhPJw71aMhMPW8cOh4IZBaFSvA66Tng16iFxpCDEg0umXA7xOrMFpHNGVDL3Aj3gPalU1Ge2HGFQ==
X-Received: by 2002:a05:6512:e94:: with SMTP id
 bi20mr26670020lfb.350.1629742305738; 
 Mon, 23 Aug 2021 11:11:45 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id w26sm1511739lfk.223.2021.08.23.11.11.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 11:11:45 -0700 (PDT)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 13/14] target/riscv: Remove RVB (replaced by Zb[abcs]
Date: Mon, 23 Aug 2021 20:11:31 +0200
Message-Id: <20210823181132.2205367-14-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210823181132.2205367-1-philipp.tomsich@vrull.eu>
References: <20210823181132.2205367-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lf1-x136.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Kito Cheng <kito.cheng@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With everything classified as Zb[abcs] and pre-0.93 draft-B
instructions that are not part of Zb[abcs] removed, we can remove the
remaining support code for RVB.

Note that RVB has been retired for good and misa.B will neither mean
'some' or 'all of' Zb*:
  https://lists.riscv.org/g/tech-bitmanip/message/532

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---

(no changes since v3)

Changes in v3:
- Removing RVB moved into a separate commit at the tail-end of the series.

 target/riscv/cpu.c         | 27 ---------------------------
 target/riscv/cpu.h         |  3 ---
 target/riscv/insn32.decode |  4 ----
 3 files changed, 34 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index c7bc1f9f44..93bd8f7802 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -127,11 +127,6 @@ static void set_priv_version(CPURISCVState *env, int priv_ver)
     env->priv_ver = priv_ver;
 }
 
-static void set_bext_version(CPURISCVState *env, int bext_ver)
-{
-    env->bext_ver = bext_ver;
-}
-
 static void set_vext_version(CPURISCVState *env, int vext_ver)
 {
     env->vext_ver = vext_ver;
@@ -393,7 +388,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     CPURISCVState *env = &cpu->env;
     RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(dev);
     int priv_version = PRIV_VERSION_1_11_0;
-    int bext_version = BEXT_VERSION_0_93_0;
     int vext_version = VEXT_VERSION_0_07_1;
     target_ulong target_misa = env->misa;
     Error *local_err = NULL;
@@ -418,7 +412,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     }
 
     set_priv_version(env, priv_version);
-    set_bext_version(env, bext_version);
     set_vext_version(env, vext_version);
 
     if (cpu->cfg.mmu) {
@@ -496,24 +489,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         if (cpu->cfg.ext_h) {
             target_misa |= RVH;
         }
-        if (cpu->cfg.ext_b) {
-            target_misa |= RVB;
-
-            if (cpu->cfg.bext_spec) {
-                if (!g_strcmp0(cpu->cfg.bext_spec, "v0.93")) {
-                    bext_version = BEXT_VERSION_0_93_0;
-                } else {
-                    error_setg(errp,
-                           "Unsupported bitmanip spec version '%s'",
-                           cpu->cfg.bext_spec);
-                    return;
-                }
-            } else {
-                qemu_log("bitmanip version is not specified, "
-                         "use the default value v0.93\n");
-            }
-            set_bext_version(env, bext_version);
-        }
         if (cpu->cfg.ext_v) {
             target_misa |= RVV;
             if (!is_power_of_2(cpu->cfg.vlen)) {
@@ -584,7 +559,6 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("s", RISCVCPU, cfg.ext_s, true),
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
     /* This is experimental so mark with 'x-' */
-    DEFINE_PROP_BOOL("x-b", RISCVCPU, cfg.ext_b, false),
     DEFINE_PROP_BOOL("x-zba", RISCVCPU, cfg.ext_zba, false),
     DEFINE_PROP_BOOL("x-zbb", RISCVCPU, cfg.ext_zbb, false),
     DEFINE_PROP_BOOL("x-zbc", RISCVCPU, cfg.ext_zbc, false),
@@ -595,7 +569,6 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
     DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
-    DEFINE_PROP_STRING("bext_spec", RISCVCPU, cfg.bext_spec),
     DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
     DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
     DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 7c4cd8ea89..77e8b06106 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -67,7 +67,6 @@
 #define RVS RV('S')
 #define RVU RV('U')
 #define RVH RV('H')
-#define RVB RV('B')
 
 /* S extension denotes that Supervisor mode exists, however it is possible
    to have a core that support S mode but does not have an MMU and there
@@ -83,7 +82,6 @@ enum {
 #define PRIV_VERSION_1_10_0 0x00011000
 #define PRIV_VERSION_1_11_0 0x00011100
 
-#define BEXT_VERSION_0_93_0 0x00009300
 #define VEXT_VERSION_0_07_1 0x00000701
 
 enum {
@@ -288,7 +286,6 @@ struct RISCVCPU {
         bool ext_f;
         bool ext_d;
         bool ext_c;
-        bool ext_b;
         bool ext_s;
         bool ext_u;
         bool ext_h;
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index abf794095a..0f6020ccb1 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -711,10 +711,6 @@ rorw       0110000 .......... 101 ..... 0111011 @r
 # instruction, so we use different handler functions to differentiate.
 zext_h_64  0000100 00000 ..... 100 ..... 0111011 @r2
 
-# *** RV32B Standard Extension ***
-
-# *** RV64B Standard Extension (in addition to RV32B) ***
-
 # *** RV32 Zbc Standard Extension ***
 clmul      0000101 .......... 001 ..... 0110011 @r
 clmulh     0000101 .......... 011 ..... 0110011 @r
-- 
2.25.1



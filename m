Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C2443F958
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 11:04:08 +0200 (CEST)
Received: from localhost ([::1]:44954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgNnz-0007gX-2X
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 05:04:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNja-00042L-H0
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 04:59:34 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:36534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNjY-0004SV-TF
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 04:59:34 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 v1-20020a17090a088100b001a21156830bso10081684pjc.1
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 01:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MDvZee/yESvgDMFWBKfYgPQyqTksnH7apcoJubEpldo=;
 b=Zkjsf3P/M7xRx79aruvUfq83PvhfLpM2r5xsInR8QKht+jPxuv/UEW+MqQ3Rg/Xqwu
 mQHq1zZ0Z6zvAYTFtOjccgITC9J3b/++Me9ZB/Sh09Fq0GN4B5EcuAmBwluqVkyhZEZi
 91w6eTQHOjVZwHHqhfylOKtWQkWWWsSJMUNXr17y+8iTDtvT8rzBhAOwTqvI43tO54dR
 OKvQ1PTosbs4DsiS6DS/9h+jkdylSPdiQnIKqhyNlu0dk2sJVCxpQr21WDnovWTXQFAU
 qgSeYDXkQvE8DZdJ4/OVbu/JA47ysxysqelj5iAtH1pLJKFWiJsayEsu6SRjtvjGKNVU
 V1YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MDvZee/yESvgDMFWBKfYgPQyqTksnH7apcoJubEpldo=;
 b=AXHtJSJjJceKzMPOqS64hUMXygKY2MWYCFV/drfkV4lMP3t2OgdZXeV3ytQxMszZUX
 BLAynzfdYbzAmqFUq0zqpUODTi+LS3U4BrPqLXzeRY8Y3m6JjcgIG0/4MYG2qwp1RriL
 Uil8sRX/isN4BwKmjnKpEw25G8qtunUA8m47XsL5QB5TQyXl6agyCeKg/Ecytsx+5qYp
 xM/Ky79/eUSZqRXFaJbrqvOia9y706tEkK/jl47J4vpwuP2ECT+Bo51+tsuF3JYXhUCr
 jdmUiz4JdoZEV6RN+LuEH1YV18ye+2XsWp1Xx4HIIBnrKL5nA3IPE4Zba+GrzhgcHUG/
 Qh1w==
X-Gm-Message-State: AOAM533yKGrapKPCPrRbbWPTmq4fBPnpTwdQJMjUPKhLuLAi3DjNbOQZ
 EQv1rSB2LPdGTJ3P1SYD8ho3jemN6R7kXAwD
X-Google-Smtp-Source: ABdhPJxEMXlCq408tbWtVQVHog36UEJcl9K9Llk3N6F2POnRi83PK2CqsDe3k2hNTFRwbzNmvmjFiQ==
X-Received: by 2002:a17:902:e844:b0:141:72c0:c5e2 with SMTP id
 t4-20020a170902e84400b0014172c0c5e2mr8526115plg.10.1635497970994; 
 Fri, 29 Oct 2021 01:59:30 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:46b:ce55:983b:6962:38ac:e1b9])
 by smtp.gmail.com with ESMTPSA id t13sm5081477pgn.94.2021.10.29.01.59.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 01:59:30 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v9 01/76] target/riscv: drop vector 0.7.1 and add 1.0 support
Date: Fri, 29 Oct 2021 16:58:06 +0800
Message-Id: <20211029085922.255197-2-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029085922.255197-1-frank.chang@sifive.com>
References: <20211029085922.255197-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 16 ++++++++--------
 target/riscv/cpu.h |  2 +-
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index f7fda686863..c760ea08621 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -523,7 +523,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
             ext |= RVH;
         }
         if (cpu->cfg.ext_v) {
-            int vext_version = VEXT_VERSION_0_07_1;
+            int vext_version = VEXT_VERSION_1_00_0;
             ext |= RVV;
             if (!is_power_of_2(cpu->cfg.vlen)) {
                 error_setg(errp,
@@ -548,8 +548,8 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
                 return;
             }
             if (cpu->cfg.vext_spec) {
-                if (!g_strcmp0(cpu->cfg.vext_spec, "v0.7.1")) {
-                    vext_version = VEXT_VERSION_0_07_1;
+                if (!g_strcmp0(cpu->cfg.vext_spec, "v1.0")) {
+                    vext_version = VEXT_VERSION_1_00_0;
                 } else {
                     error_setg(errp,
                            "Unsupported vector spec version '%s'",
@@ -558,7 +558,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
                 }
             } else {
                 qemu_log("vector version is not specified, "
-                        "use the default value v0.7.1\n");
+                         "use the default value v1.0\n");
             }
             set_vext_version(env, vext_version);
         }
@@ -626,6 +626,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("c", RISCVCPU, cfg.ext_c, true),
     DEFINE_PROP_BOOL("s", RISCVCPU, cfg.ext_s, true),
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
+    DEFINE_PROP_BOOL("v", RISCVCPU, cfg.ext_v, false),
     DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
@@ -635,6 +636,9 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
 
     DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
+    DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
+    DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
+    DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
 
     /* These are experimental so mark with 'x-' */
     DEFINE_PROP_BOOL("x-zba", RISCVCPU, cfg.ext_zba, false),
@@ -643,10 +647,6 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("x-zbs", RISCVCPU, cfg.ext_zbs, false),
     DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
     DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
-    DEFINE_PROP_BOOL("x-v", RISCVCPU, cfg.ext_v, false),
-    DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
-    DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
-    DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
     /* ePMP 0.9.3 */
     DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
 
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index ef677f90922..5ea2004ae02 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -81,7 +81,7 @@ enum {
 #define PRIV_VERSION_1_10_0 0x00011000
 #define PRIV_VERSION_1_11_0 0x00011100
 
-#define VEXT_VERSION_0_07_1 0x00000701
+#define VEXT_VERSION_1_00_0 0x00010000
 
 enum {
     TRANSLATE_SUCCESS,
-- 
2.25.1



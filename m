Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B02B46117B4
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 18:41:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooSQ7-0005wY-AZ; Fri, 28 Oct 2022 12:41:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSPI-0004QK-2E; Fri, 28 Oct 2022 12:40:32 -0400
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSPG-0007oU-I1; Fri, 28 Oct 2022 12:40:31 -0400
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-13c569e5ff5so6491201fac.6; 
 Fri, 28 Oct 2022 09:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iCqxwsrAar7xf5I5K+RvMRREycTzDCaocpqm0tXs1lM=;
 b=Qm23aiYTHD04AjsgrMFBUUU1O19tfhlwPVLYHWdz7e/Tm2ccJvgN08tj0w3mBclLE/
 5dPeZSKaqWjqji03AHuCDQou0zXBgEgnNWbDCm6BhW1qn45f+Ml9lGghMaHPbBuI9HRU
 kTzrgNJq9EvB1srGJacSX19aRaEbGzz0Hbsc56VFdLKy5D0itat+3fv4k2yDuY4uJjbc
 Hs/5NN1nIQ5QclHJypM+onPm9m/9foKxwtVaJxVNeLw8cSiQw+fX1RIPGjBm7q32eTmX
 KgoheFVAjvkf9DuwVkfY84KcDO2tIGOoRazpFNTF1NOFnUt4tQhGTjfWrPbyA/who0l3
 yJeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iCqxwsrAar7xf5I5K+RvMRREycTzDCaocpqm0tXs1lM=;
 b=LMpQIOOcM1wAf/I/AnzSLg7XiFqXyQ4XRuVTgGdOOw1XuXM9mv5MyWG4Jn8BM+z/Z5
 OXIFI1evP0dw1ohQ7+mfBJE1h0Y/L2YPK+7hcZ4Bmd8+4mu109DCxjTiqOYVWU+qsi9o
 o3pbzVcUYHnilxa+XNZsc2nPQu1VkH3C72Y4bQ9/kkhunQnaVqI+c8u5LPjvUwdhNKgJ
 VIx+GKSMJwzt17EivRiw6Gzpjp8fNT/FcOGmgMvdQ2ojrVFLoemlvO8Em4YGEWB6EjT0
 qjzux296AKF/oM6zIzlP7Cg9H/CxS2+89fgL8H53wc624gWYW5IVKHmrBEtXXE/zpIX+
 S/4A==
X-Gm-Message-State: ACrzQf1lzuW3Qzddp2xlBzk8N+wfQnUiwDFibLqnfYwHFPYVLndAjm2x
 v8pCGpvMqGKOHjxhkCB4MDvH6DSa8FIDMQ==
X-Google-Smtp-Source: AMsMyM43X01GaeV2Xhrvq92ekFtvpB5InvNxwCjIBoSytgAmJ6LdApDIZ5DJpPpmv3S+Knrx1h1oDQ==
X-Received: by 2002:a05:6870:fb86:b0:13a:dffa:e4ae with SMTP id
 kv6-20020a056870fb8600b0013adffae4aemr9846835oab.245.1666975227142; 
 Fri, 28 Oct 2022 09:40:27 -0700 (PDT)
Received: from balboa.COMFAST ([177.45.165.63])
 by smtp.gmail.com with ESMTPSA id
 s127-20020acaa985000000b00354b7120d60sm1658373oie.52.2022.10.28.09.40.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 09:40:25 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 06/62] target/ppc: move msgsync to decodetree
Date: Fri, 28 Oct 2022 13:38:55 -0300
Message-Id: <20221028163951.810456-7-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221028163951.810456-1-danielhb413@gmail.com>
References: <20221028163951.810456-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x32.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20221006200654.725390-7-matheus.ferst@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/insn32.decode                       |  1 +
 target/ppc/translate.c                         | 14 --------------
 target/ppc/translate/processor-ctrl-impl.c.inc |  9 +++++++++
 3 files changed, 10 insertions(+), 14 deletions(-)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 5ba4a6807d..70a3b4de5e 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -915,3 +915,4 @@ MSGCLR          011111 ----- ----- ..... 0011101110 -   @X_rb
 MSGSND          011111 ----- ----- ..... 0011001110 -   @X_rb
 MSGCLRP         011111 ----- ----- ..... 0010101110 -   @X_rb
 MSGSNDP         011111 ----- ----- ..... 0010001110 -   @X_rb
+MSGSYNC         011111 ----- ----- ----- 1101110110 -
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 9e200cec24..959e7e3475 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -6239,18 +6239,6 @@ static void gen_icbt_440(DisasContext *ctx)
      */
 }
 
-/* Embedded.Processor Control */
-
-static void gen_msgsync(DisasContext *ctx)
-{
-#if defined(CONFIG_USER_ONLY)
-    GEN_PRIV(ctx);
-#else
-    CHK_HV(ctx);
-#endif /* defined(CONFIG_USER_ONLY) */
-    /* interpreted as no-op */
-}
-
 #if defined(TARGET_PPC64)
 static void gen_maddld(DisasContext *ctx)
 {
@@ -6853,8 +6841,6 @@ GEN_HANDLER2_E(tlbivax_booke206, "tlbivax", 0x1F, 0x12, 0x18, 0x00000001,
                PPC_NONE, PPC2_BOOKE206),
 GEN_HANDLER2_E(tlbilx_booke206, "tlbilx", 0x1F, 0x12, 0x00, 0x03800001,
                PPC_NONE, PPC2_BOOKE206),
-GEN_HANDLER2_E(msgsync, "msgsync", 0x1F, 0x16, 0x1B, 0x00000000,
-               PPC_NONE, PPC2_ISA300),
 GEN_HANDLER(wrtee, 0x1F, 0x03, 0x04, 0x000FFC01, PPC_WRTEE),
 GEN_HANDLER(wrteei, 0x1F, 0x03, 0x05, 0x000E7C01, PPC_WRTEE),
 GEN_HANDLER(dlmzb, 0x1F, 0x0E, 0x02, 0x00000000, PPC_440_SPEC),
diff --git a/target/ppc/translate/processor-ctrl-impl.c.inc b/target/ppc/translate/processor-ctrl-impl.c.inc
index d704a322a8..cc7a50d579 100644
--- a/target/ppc/translate/processor-ctrl-impl.c.inc
+++ b/target/ppc/translate/processor-ctrl-impl.c.inc
@@ -94,3 +94,12 @@ static bool trans_MSGSNDP(DisasContext *ctx, arg_X_rb *a)
 #endif
     return true;
 }
+
+static bool trans_MSGSYNC(DisasContext *ctx, arg_MSGSYNC *a)
+{
+    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
+    REQUIRE_HV(ctx);
+
+    /* interpreted as no-op */
+    return true;
+}
-- 
2.37.3



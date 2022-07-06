Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A7356948C
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 23:36:58 +0200 (CEST)
Received: from localhost ([::1]:40496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9Chd-0008Cl-CU
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 17:36:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9BMM-0000gf-0k; Wed, 06 Jul 2022 16:10:55 -0400
Received: from mail-ua1-x932.google.com ([2607:f8b0:4864:20::932]:42738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9BMJ-0003FR-7T; Wed, 06 Jul 2022 16:10:53 -0400
Received: by mail-ua1-x932.google.com with SMTP id l7so6257167ual.9;
 Wed, 06 Jul 2022 13:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fsUg1CbpJfr6l58iOKp9DxmHizVgBBO683pFNIkmr6s=;
 b=bBA//tjk3ZsayRRVzaVEXwGjYVUWCm3fTKl06eGYK7Sv5bDP6rzZhLiH8uosHASa8b
 fCi0Nja4ivuCw9XbPEcpDEU9SHHChQqxXt7OQ4RAklnF5W+hDPB11yvSBo9avfjsuFtT
 xrqhRDdZrna0o1yuc9bDVA/xjqEtwHjZhUtioXK5dKaT4wQVYh7kIigxLnxeiJnqto/q
 p+SVNFUfnCDoHt698CKcPRrEyQM2bbt16qVSmc9M4j23Nn9/zS+H/5EHiq6RV4CrDIH+
 XqXbbKYfpjw4NgTXc2/WRuuN1YhmZKXrO1sRHu0m6rCI65qhg2+QEmfpDs6Ya1o4e68Q
 p4Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fsUg1CbpJfr6l58iOKp9DxmHizVgBBO683pFNIkmr6s=;
 b=lFzuo9vqgYYJOiX7CZVzovdhc23DZWGuU5nmhmBXr4g4xArfWAsidzLIRyaRqLVt9Q
 JCw9xjOCGf2IGY5CyjyrgoAJ34uYrtHxFkDMAsdzZI1PlNdn1Hs0dihfWuPBky5W7ol6
 F4+LSyWLkZ72YRQ8Fboyj3FgKv8jGOPfz5h2B9fWABWn1roKROIGPkDo3retGZmUP+5h
 vVle3+oZq1MPbsD7vKHUAlNADBz/Hhak7dSaih55L3Ck794YlW+a1Rn42nUNON+Y7aor
 uJSeVVE5M7HboqYi73IquJTWl84lrJlyOutbNuDbW8G2bZVfMhxOcF3PgE+eLO8+XcGV
 B+Vw==
X-Gm-Message-State: AJIora9UF9Me1Nyyg2gWNZcLGd20dHFu5CAdqSxwSch5U82XKYTYPpUy
 hVuJBIEcfOjabmPe/w/J0p21Be6Hd7Q=
X-Google-Smtp-Source: AGRyM1vCWsTl5J9gecNqK78WTIoP89Ib8NtwPH8ljgNyHHIvBMYW6tHnCjvexgVyS+4yVAhZIf7qDA==
X-Received: by 2002:ab0:162b:0:b0:382:4733:532c with SMTP id
 k40-20020ab0162b000000b003824733532cmr13254357uae.62.1657138250161; 
 Wed, 06 Jul 2022 13:10:50 -0700 (PDT)
Received: from balboa.ibmuc.com (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 r22-20020a056122015600b003744975035asm788662vko.19.2022.07.06.13.10.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 13:10:49 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, Matheus Ferst <matheus.ferst@eldorado.org.br>
Subject: [PULL 30/34] target/ppc: implement cbcdtd
Date: Wed,  6 Jul 2022 17:09:42 -0300
Message-Id: <20220706200946.471114-31-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220706200946.471114-1-danielhb413@gmail.com>
References: <20220706200946.471114-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::932;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x932.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Implements the Convert Binary Coded Decimal To Declets instruction.
Since libdecnumber doesn't expose the methods for direct conversion
(decDigitsToDPD, BCD2DPD, etc.), the BCD values are converted to
decimal32 format, from which the declets are extracted.

Where the behavior is undefined, we try to match the result observed in
a POWER9 DD2.3.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
Message-Id: <20220629162904.105060-11-victor.colombo@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/dfp_helper.c                    | 39 ++++++++++++++++++++++
 target/ppc/helper.h                        |  1 +
 target/ppc/insn32.decode                   |  4 +++
 target/ppc/translate/fixedpoint-impl.c.inc |  7 ++++
 4 files changed, 51 insertions(+)

diff --git a/target/ppc/dfp_helper.c b/target/ppc/dfp_helper.c
index 0d01ac3de0..db9e994c8c 100644
--- a/target/ppc/dfp_helper.c
+++ b/target/ppc/dfp_helper.c
@@ -1391,3 +1391,42 @@ DFP_HELPER_SHIFT(DSCLI, 64, 1)
 DFP_HELPER_SHIFT(DSCLIQ, 128, 1)
 DFP_HELPER_SHIFT(DSCRI, 64, 0)
 DFP_HELPER_SHIFT(DSCRIQ, 128, 0)
+
+target_ulong helper_CBCDTD(target_ulong s)
+{
+    uint64_t res = 0;
+    uint32_t dec32;
+    uint8_t bcd[6];
+    int w, i, offs;
+    decNumber a;
+    decContext context;
+
+    decContextDefault(&context, DEC_INIT_DECIMAL32);
+
+    for (w = 1; w >= 0; w--) {
+        res <<= 32;
+        decNumberZero(&a);
+        /* Extract each BCD field of word "w" */
+        for (i = 5; i >= 0; i--) {
+            offs = 4 * (5 - i) + 32 * w;
+            bcd[i] = extract64(s, offs, 4);
+            if (bcd[i] > 9) {
+                /*
+                 * If the field value is greater than 9, the results are
+                 * undefined. We could use a fixed value like 0 or 9, but
+                 * an and with 9 seems to better match the hardware behavior.
+                 */
+                bcd[i] &= 9;
+            }
+        }
+
+        /* Create a decNumber with the BCD values and convert to decimal32 */
+        decNumberSetBCD(&a, bcd, 6);
+        decimal32FromNumber((decimal32 *)&dec32, &a, &context);
+
+        /* Extract the two declets from the decimal32 value */
+        res |= dec32 & 0xfffff;
+    }
+
+    return res;
+}
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 84a41d85b0..583c8dd0c2 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -54,6 +54,7 @@ DEF_HELPER_3(sraw, tl, env, tl, tl)
 DEF_HELPER_FLAGS_2(CFUGED, TCG_CALL_NO_RWG_SE, i64, i64, i64)
 DEF_HELPER_FLAGS_2(PDEPD, TCG_CALL_NO_RWG_SE, i64, i64, i64)
 DEF_HELPER_FLAGS_2(PEXTD, TCG_CALL_NO_RWG_SE, i64, i64, i64)
+DEF_HELPER_FLAGS_1(CBCDTD, TCG_CALL_NO_RWG_SE, tl, tl)
 #if defined(TARGET_PPC64)
 DEF_HELPER_FLAGS_2(cmpeqb, TCG_CALL_NO_RWG_SE, i32, tl, tl)
 DEF_HELPER_FLAGS_1(popcntw, TCG_CALL_NO_RWG_SE, tl, tl)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index af8ba9ca9b..65bcaf657f 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -87,6 +87,9 @@
 &X_rc           rt ra rb rc:bool
 @X_rc           ...... rt:5 ra:5 rb:5 .......... rc:1           &X_rc
 
+&X_sa           rs ra
+@X_sa           ...... rs:5 ra:5 ..... .......... .             &X_sa
+
 %x_frtp         22:4 !function=times_2
 %x_frap         17:4 !function=times_2
 %x_frbp         12:4 !function=times_2
@@ -314,6 +317,7 @@ PEXTD           011111 ..... ..... ..... 0010111100 -   @X
 ## BCD Assist
 
 ADDG6S          011111 ..... ..... ..... - 001001010 -  @X
+CBCDTD          011111 ..... ..... ----- 0100111010 -   @X_sa
 
 ### Float-Point Load Instructions
 
diff --git a/target/ppc/translate/fixedpoint-impl.c.inc b/target/ppc/translate/fixedpoint-impl.c.inc
index 490e49cfc7..892c9d2568 100644
--- a/target/ppc/translate/fixedpoint-impl.c.inc
+++ b/target/ppc/translate/fixedpoint-impl.c.inc
@@ -529,3 +529,10 @@ static bool trans_ADDG6S(DisasContext *ctx, arg_X *a)
 
     return true;
 }
+
+static bool trans_CBCDTD(DisasContext *ctx, arg_X_sa *a)
+{
+    REQUIRE_INSNS_FLAGS2(ctx, BCDA_ISA206);
+    gen_helper_CBCDTD(cpu_gpr[a->ra], cpu_gpr[a->rs]);
+    return true;
+}
-- 
2.36.1



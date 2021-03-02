Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1EFC32A90B
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 19:12:41 +0100 (CET)
Received: from localhost ([::1]:46622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH9Vg-0007j1-VG
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 13:12:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lH9HQ-0002hk-Sy
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 12:57:56 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:33149)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lH9HP-0007a0-5E
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 12:57:56 -0500
Received: by mail-pl1-x634.google.com with SMTP id c16so2999192ply.0
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 09:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A6vR6ziB3b9O465GIDkN5AIXP0cK+f5XI51tj6udrHk=;
 b=IMJod9K1Aamq8qy9e51d0r7hXEmp14yTCO5huTyy3iIpood4ZK2cIflpgYj9OWMZ8w
 MIK9zbyDQH1kboZTgnsfTVUZuSD/PjwJh2CLfzqKEH4y4sJ38fL9dftotKrWKlRLxU0/
 fHRFnPuJL2f9URUTTNCTsL9AUMk855REG74WWH9z8V9mVWEzOT/4KfcTZxWMa6it2Xle
 v826l6OnxGV14BCkPsSKd/ujid/U8L3VG1SuljX3qXhIR3xgVHG+j0gNuMY448jq+TE4
 koskkldRbCbpKklzMxiH+T2c4B24ocsqkccXh3SjUnqU48d7aKLrQfcaaWGsSBapGprN
 0G3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A6vR6ziB3b9O465GIDkN5AIXP0cK+f5XI51tj6udrHk=;
 b=SxY0jqA9PCyhqsMks0vfLSiNh7pP5aBKYIxsLjln/V5re4e4BcObCE5cwr7Qa8W8Bn
 xmX13iG1xQ+uWCBmGeCx6kBz5dceVF0msdRe17AK/yEDrUdwBplvLkpnaHaSSUffCjOX
 6r/xh8N3durLr8mj9CcJogyCoVeiVnvYr4K/Fys6DY1s4iN3OGB+8fg48ixt/0kLTo77
 sO6piNRp4wlHY9EG7DVLHxs6uMdwXRSn98fuxMQfSygQustGmR1j+97AEmJ4u5vkBl00
 f+y7OP8H37MXlRUQjuJBJPm1kEPoaM0QOCdLAud8WFXADe08uXyflzEx4RpD8TI9Rx2X
 PwkQ==
X-Gm-Message-State: AOAM532kRY1qwdwiYoNqL6sAIWdJ9WeNA2V/h2vdEc0pWWLIMsbFrUs2
 NuDcQsi7JVee1CbiIm5JXdC6sAvUejtpTg==
X-Google-Smtp-Source: ABdhPJwrwvASzEDWr0wYR3z9BBi546eehyLaX2GY1hByII8g8Hcf3HGAplrhNhVdoc/YCw6mn1VoUA==
X-Received: by 2002:a17:90a:8d85:: with SMTP id
 d5mr5600995pjo.49.1614707873850; 
 Tue, 02 Mar 2021 09:57:53 -0800 (PST)
Received: from localhost.localdomain (174-21-84-25.tukw.qwest.net.
 [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id gf20sm4232234pjb.39.2021.03.02.09.57.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 09:57:53 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/27] tcg/tci: Merge identical cases in generation
 (conditional opcodes)
Date: Tue,  2 Mar 2021 09:57:24 -0800
Message-Id: <20210302175741.1079851-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210302175741.1079851-1-richard.henderson@linaro.org>
References: <20210302175741.1079851-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
Cc: alex.bennee@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use CASE_32_64 and CASE_64 to reduce ifdefs and merge
cases that are identical between 32-bit and 64-bit hosts.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210217202036.1724901-5-richard.henderson@linaro.org>
[PMD: Split patch as 4/5]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210218232840.1760806-5-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.c.inc | 23 ++++++-----------------
 1 file changed, 6 insertions(+), 17 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 4a86a3bb46..f9893b9539 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -417,15 +417,18 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         }
         set_jmp_reset_offset(s, args[0]);
         break;
+
     case INDEX_op_br:
         tci_out_label(s, arg_label(args[0]));
         break;
-    case INDEX_op_setcond_i32:
+
+    CASE_32_64(setcond)
         tcg_out_r(s, args[0]);
         tcg_out_r(s, args[1]);
         tcg_out_r(s, args[2]);
         tcg_out8(s, args[3]);   /* condition */
         break;
+
 #if TCG_TARGET_REG_BITS == 32
     case INDEX_op_setcond2_i32:
         /* setcond2_i32 cond, t0, t1_low, t1_high, t2_low, t2_high */
@@ -436,13 +439,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         tcg_out_r(s, args[4]);
         tcg_out8(s, args[5]);   /* condition */
         break;
-#elif TCG_TARGET_REG_BITS == 64
-    case INDEX_op_setcond_i64:
-        tcg_out_r(s, args[0]);
-        tcg_out_r(s, args[1]);
-        tcg_out_r(s, args[2]);
-        tcg_out8(s, args[3]);   /* condition */
-        break;
 #endif
     case INDEX_op_ld8u_i32:
     case INDEX_op_ld8s_i32:
@@ -505,14 +501,12 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         tcg_out8(s, args[4]);
         break;
 
-#if TCG_TARGET_REG_BITS == 64
-    case INDEX_op_brcond_i64:
+    CASE_32_64(brcond)
         tcg_out_r(s, args[0]);
         tcg_out_r(s, args[1]);
         tcg_out8(s, args[2]);           /* condition */
         tci_out_label(s, arg_label(args[3]));
         break;
-#endif /* TCG_TARGET_REG_BITS == 64 */
 
     CASE_32_64(neg)      /* Optional (TCG_TARGET_HAS_neg_*). */
     CASE_32_64(not)      /* Optional (TCG_TARGET_HAS_not_*). */
@@ -556,12 +550,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         tcg_out_r(s, args[3]);
         break;
 #endif
-    case INDEX_op_brcond_i32:
-        tcg_out_r(s, args[0]);
-        tcg_out_r(s, args[1]);
-        tcg_out8(s, args[2]);           /* condition */
-        tci_out_label(s, arg_label(args[3]));
-        break;
+
     case INDEX_op_qemu_ld_i32:
         tcg_out_r(s, *args++);
         tcg_out_r(s, *args++);
-- 
2.25.1



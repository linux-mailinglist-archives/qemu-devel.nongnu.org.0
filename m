Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B849132A8AA
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 19:00:07 +0100 (CET)
Received: from localhost ([::1]:60214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH9JW-0004v5-PJ
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 13:00:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lH9HP-0002fB-W4
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 12:57:56 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:38771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lH9HO-0007ZA-AA
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 12:57:55 -0500
Received: by mail-pf1-x432.google.com with SMTP id 201so14330035pfw.5
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 09:57:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yoPJEjHaD9Y/eQNAtgp4CmM0ipXsKYPy7ttmPn2mZ+I=;
 b=ldB3JEcLNusjsvRHdtM+mPXQ89YHosARLBEjfJ4QF+qrNzohCV0kXulhNtPj7irx+F
 czztwZQV8swiOXYsbLG5QD3egxH18oLokkLdTidayPDHIpRSqDZq2m+jv1b1P0/KcWza
 2zbkTUTfN8FeSvjZ3HloKay0e5UOJtX0E8vi8VOraNj//ybC9ygLHIW4J2XKayCCNTx5
 8J3uiXRwLAcIg+qJDqASHihsWCG3MFhH6cutPF8U4rzEl3rMPpF6coJivl9Eoo08uXcz
 G996kY5VD6rzV1T/5Nq19lHLfxY/RYnhGKhUv7eHGObcB9B2MBstDpbF0F7CBntTasor
 eT7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yoPJEjHaD9Y/eQNAtgp4CmM0ipXsKYPy7ttmPn2mZ+I=;
 b=sDnAMKbBAgI2XWZq0n6tm6/kvhpYr07nzY0v5faMMOZLtbcq32I6aKGcC4DfqX74BD
 iTHaqkAq5SeQjhg4C6hM3tckUSK+4Cz72xR3xtCiszzF1FPF2921JYjJOEJ3AF2dW5Ne
 pBq3StSZxRevBBsM+biZ4vxItTJTkYI+5OBhsPuNWahS9HQ9/NaA6pbqOfuNe3LFWmrn
 3t4jJ2sBELwFSO6+U03vcirDhozUbMowI8TaIb6/KO9eKR6QaThoWy7BDAv2UsKCffhK
 i9TS04CMoH2Yisp6GdaofOB1i0YWIQx1ofRFAE6js4hwpGZsNZlJzH0BDNID5k65UmYg
 8F+A==
X-Gm-Message-State: AOAM531hjtjodk2Nzn20S+3qPRkEDMfSywL8JpUWNuZaTmc21hojyU+K
 31geEluDpYsZS0DQLv9Md47FdRThcWrSfQ==
X-Google-Smtp-Source: ABdhPJxg32iN36d1+3O0mmfKuH7WgMsWzjv+uCOvGnoiHG+qBhe9jjnduzQh/id1brztn7UGrGwQKw==
X-Received: by 2002:a62:fc45:0:b029:1ed:bdd2:a07d with SMTP id
 e66-20020a62fc450000b02901edbdd2a07dmr4413982pfh.0.1614707873016; 
 Tue, 02 Mar 2021 09:57:53 -0800 (PST)
Received: from localhost.localdomain (174-21-84-25.tukw.qwest.net.
 [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id gf20sm4232234pjb.39.2021.03.02.09.57.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 09:57:52 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/27] tcg/tci: Merge identical cases in generation (deposit
 opcode)
Date: Tue,  2 Mar 2021 09:57:23 -0800
Message-Id: <20210302175741.1079851-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210302175741.1079851-1-richard.henderson@linaro.org>
References: <20210302175741.1079851-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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
[PMD: Split patch as 3/5]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210218232840.1760806-4-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.c.inc | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 1896efd100..4a86a3bb46 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -494,7 +494,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         tcg_out_r(s, args[1]);
         tcg_out_r(s, args[2]);
         break;
-    case INDEX_op_deposit_i32:  /* Optional (TCG_TARGET_HAS_deposit_i32). */
+
+    CASE_32_64(deposit)  /* Optional (TCG_TARGET_HAS_deposit_*). */
         tcg_out_r(s, args[0]);
         tcg_out_r(s, args[1]);
         tcg_out_r(s, args[2]);
@@ -505,15 +506,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         break;
 
 #if TCG_TARGET_REG_BITS == 64
-    case INDEX_op_deposit_i64:  /* Optional (TCG_TARGET_HAS_deposit_i64). */
-        tcg_out_r(s, args[0]);
-        tcg_out_r(s, args[1]);
-        tcg_out_r(s, args[2]);
-        tcg_debug_assert(args[3] <= UINT8_MAX);
-        tcg_out8(s, args[3]);
-        tcg_debug_assert(args[4] <= UINT8_MAX);
-        tcg_out8(s, args[4]);
-        break;
     case INDEX_op_brcond_i64:
         tcg_out_r(s, args[0]);
         tcg_out_r(s, args[1]);
-- 
2.25.1



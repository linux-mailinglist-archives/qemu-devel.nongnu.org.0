Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD09F6A2807
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Feb 2023 10:02:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVqQF-0001Yy-I3; Sat, 25 Feb 2023 04:00:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqPj-0000YP-C5
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:00:23 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqPh-00055I-Gl
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:00:19 -0500
Received: by mail-pl1-x62b.google.com with SMTP id l15so1885951pls.1
 for <qemu-devel@nongnu.org>; Sat, 25 Feb 2023 01:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IYCWwbbJIP8d6veHeIA0O5e/DufmdWm+tt9+vif/hVA=;
 b=VUrQnVZ1IGfsZCE8+qkzQqJ1oss8edsfToGLAdSIt40neYju0E8VmGYxrYyrz99aFN
 Syhn5Wf4e6sWWbnj/85jkJimt6/knMI7dD6YNntE2nhaFqCrqkdRBwvlmr0PgqTm2Du+
 CCa+HIKujKcVUUFb+Nl+Ou3ZeaHxH2jdys1qQRZ72oXYef1B95QMwh1UtiXhUZjEmNey
 J0q5J3Qy64/luVQV2WUdf0GQ6ClOEQ0SAzQMJA07gfqIfyTF4PtaP0t74nwjk5gUyC57
 itw4/uxT59FbY44JXDUbtcigslx/Tm+v+4neVgvg3PHVucwHA7JUBtP8s9uUdiBHIA6R
 HK9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IYCWwbbJIP8d6veHeIA0O5e/DufmdWm+tt9+vif/hVA=;
 b=wf1D2U/Eks5BjeDjhcn0oiMWZW0XMmNGJoOIoyzUgUSGYP+P6AYQpmRsMzvbXkhQas
 OziuwtiHeq6rqE5fslkA/2GLREZPV25VWIPsca/7ERwkNQBEuIk56+EPJC658UlQIH7d
 uhNr7QnyWmwVd1tHDphNWJaopheCuAkruwgdAbhkdI5tNYhshWhKhQevGI5/S5OxhihM
 3MGElZ4V8PtnBu4UuEf3PnD+CTeGDLhxhR5ovraQaUOdcCN99ubReYcDCGNBMCY9zIAF
 RPNdp9be6HkkLvWg4dSmjg58yd87ljiBGDMg7X4HtT0EMKcEvUV5oNehFSS/H+a15S8m
 GDSw==
X-Gm-Message-State: AO0yUKXAg+lxGyytyRIrBhZvMrNt27M1RFRyOeyjzqgncB62Sv781zco
 9zIA6i0xpCnC5ECIaFO9Eurwz5nKne569PBiSAU=
X-Google-Smtp-Source: AK7set8ZSGtqLiDnDWC9JKohBoEj8dIPnR+wdOgpABY8xm/B8BW4FDsb3UlGhJzUnk3lt1Y86E+Ybw==
X-Received: by 2002:a05:6a20:6a0c:b0:cb:a09e:6941 with SMTP id
 p12-20020a056a206a0c00b000cba09e6941mr17639776pzk.61.1677315615911; 
 Sat, 25 Feb 2023 01:00:15 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 s17-20020a639251000000b00502ecb91940sm715546pgn.55.2023.02.25.01.00.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:00:15 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 18/30] tcg: Change default temp lifetime to TEMP_TB
Date: Fri, 24 Feb 2023 22:59:33 -1000
Message-Id: <20230225085945.1798188-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225085945.1798188-1-richard.henderson@linaro.org>
References: <20230225085945.1798188-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Guest front-ends now get temps that span the lifetime of
the translation block by default, which avoids accidentally
using the temp across branches and invalidating the data.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 6cc6758cd6..2e220d4040 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -901,7 +901,7 @@ static inline TCGv_i32 tcg_temp_ebb_new_i32(void)
 
 static inline TCGv_i32 tcg_temp_new_i32(void)
 {
-    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I32, TEMP_EBB);
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I32, TEMP_TB);
     return temp_tcgv_i32(t);
 }
 
@@ -927,7 +927,7 @@ static inline TCGv_i64 tcg_temp_ebb_new_i64(void)
 
 static inline TCGv_i64 tcg_temp_new_i64(void)
 {
-    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I64, TEMP_EBB);
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I64, TEMP_TB);
     return temp_tcgv_i64(t);
 }
 
@@ -946,7 +946,7 @@ static inline TCGv_i128 tcg_temp_ebb_new_i128(void)
 
 static inline TCGv_i128 tcg_temp_new_i128(void)
 {
-    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I128, TEMP_EBB);
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I128, TEMP_TB);
     return temp_tcgv_i128(t);
 }
 
@@ -972,7 +972,7 @@ static inline TCGv_ptr tcg_temp_ebb_new_ptr(void)
 
 static inline TCGv_ptr tcg_temp_new_ptr(void)
 {
-    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_PTR, TEMP_EBB);
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_PTR, TEMP_TB);
     return temp_tcgv_ptr(t);
 }
 
-- 
2.34.1



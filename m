Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0BF681C01
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 22:00:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMbGN-0000OH-PI; Mon, 30 Jan 2023 16:00:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMbG9-0008Tg-Jm
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 16:00:16 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMbG2-0005Se-CP
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 16:00:10 -0500
Received: by mail-pg1-x52b.google.com with SMTP id 36so8573030pgp.10
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 13:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=so9vBNsM0K3ib/CbMgVPvTGuV/jF1OapvpvI0+Y7m7A=;
 b=NEy4CbkvPTI7eQ5xhfYGF/ENJh/JNJ6m2M77WCwz6xkxTHKOycSk+rIaNXbiHRJgSh
 PXQWJSiNEklda3xXaBvBzzToLbpVsqINOO93Edk2J4zw+zqKUKywRAs8CyBlr+jZiZrn
 aNGCDq7GJTqIedS3/+p3MFuuRdfwa6HEwJkLy0WNRD55FUTfledJKxA0u0gWozsrbPi7
 oWmAfX/F+tvVTtpwpzXTNHRZ84NdaT/+Ryo1ZedlKEVMA8KO6gPC3SRdg3lozZfQdZpV
 E72uvo9zzTBPIMrq+EkoqSto0ldFe0f2WUIduzNWR9Q66+1UgoM1n5BExFDjwc5unEqn
 66RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=so9vBNsM0K3ib/CbMgVPvTGuV/jF1OapvpvI0+Y7m7A=;
 b=vOQqVQ8V91PT2d+O71jtTrN6jURNBftNj8Drha56OPaT96oqr+X7i6x0S5tTlY9EiN
 4dWKxePg/PDRoRc65SmHgK5QC1a/ALvafJcnRTxKuGBHCUWj8BhCHSuPJ+MiamXEu6K9
 azoXHxPDxrl7KcOqjEmrf0pv5XKWGjMnGit70gXQugLj/MKxJV5o6lv/0Vd7bewobeKR
 nCSusV5ArAy8TbBuyu7ma6hOaISDg6PGmmcB3y/RUB7zCk1sJqbeg5yNvoJM9pkaB7YN
 ps1MFSVxqQq16zpMSEt02c+GflnYeRXN0mqReeiHkyy82XOFOi0NQmDxfuvQQRSQ8+5i
 13Qg==
X-Gm-Message-State: AO0yUKVRSGFRTOU6wFowv/8lLZP6bJvCcoZa7lZCBdSrWTkI61pN7Nlo
 kw2X9nxPtMVvKadRhdhhE+bbTjZ+gSF990ci
X-Google-Smtp-Source: AK7set/thrPP93r/9BPQ+2zNLnGdTWyLew8ZyVKupYFmZUeLM9SGneFW8OIghAgLrwaUmhLDaR0wyA==
X-Received: by 2002:a62:f250:0:b0:593:d5de:f02c with SMTP id
 y16-20020a62f250000000b00593d5def02cmr2339017pfl.27.1675112405037; 
 Mon, 30 Jan 2023 13:00:05 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 x10-20020aa79a4a000000b00593eb3a5e44sm102933pfj.37.2023.01.30.13.00.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 13:00:04 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	cota@braap.org
Subject: [PATCH 15/27] tcg: Change default temp lifetime to TEMP_TB
Date: Mon, 30 Jan 2023 10:59:23 -1000
Message-Id: <20230130205935.1157347-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130205935.1157347-1-richard.henderson@linaro.org>
References: <20230130205935.1157347-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 0a3d14ce66..a6512ac53e 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -899,7 +899,7 @@ static inline TCGv_i32 tcg_temp_ebb_new_i32(void)
 
 static inline TCGv_i32 tcg_temp_new_i32(void)
 {
-    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I32, TEMP_EBB);
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I32, TEMP_TB);
     return temp_tcgv_i32(t);
 }
 
@@ -925,7 +925,7 @@ static inline TCGv_i64 tcg_temp_ebb_new_i64(void)
 
 static inline TCGv_i64 tcg_temp_new_i64(void)
 {
-    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I64, TEMP_EBB);
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I64, TEMP_TB);
     return temp_tcgv_i64(t);
 }
 
@@ -944,7 +944,7 @@ static inline TCGv_i128 tcg_temp_ebb_new_i128(void)
 
 static inline TCGv_i128 tcg_temp_new_i128(void)
 {
-    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I128, TEMP_EBB);
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I128, TEMP_TB);
     return temp_tcgv_i128(t);
 }
 
@@ -970,7 +970,7 @@ static inline TCGv_ptr tcg_temp_ebb_new_ptr(void)
 
 static inline TCGv_ptr tcg_temp_new_ptr(void)
 {
-    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_PTR, TEMP_EBB);
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_PTR, TEMP_TB);
     return temp_tcgv_ptr(t);
 }
 
-- 
2.34.1



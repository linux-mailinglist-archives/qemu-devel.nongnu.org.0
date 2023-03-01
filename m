Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF52C6A6648
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 04:07:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXCis-0004KU-2r; Tue, 28 Feb 2023 22:01:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCib-0002Xy-Ej
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 22:01:25 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCiN-0004JV-8J
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 22:01:12 -0500
Received: by mail-pl1-x631.google.com with SMTP id i10so12550840plr.9
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 19:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IYCWwbbJIP8d6veHeIA0O5e/DufmdWm+tt9+vif/hVA=;
 b=Wnc0P7ytboYxmbmWsIThIGiwT43p55Af2b3dXF0z58SKCX9P3MVYnT+Ej0sCCq+gSY
 4kCF+lFgl9+pFZST5IQ+k7c1u7JfvMsest6Mcw/VBwUpkEH+AWOXO45mgVdSrlYmnhbT
 UJcfuC076RJ0cJnhIwn4kAfZWB0PeJGtcz2T+1I2RMz9JPuAUFFdzA/X869RVoZ9C8Jb
 gHxVnSYNfGyKQhXrwBS7voVCIjxdN82Oo+V2iRFjlUo7LmsUGbdFBjTvzB+Daab4aOMR
 TKzIwVzhpzMwV2NdhYVtO9xUJPioh4WgResfLZA5PyOCeg30pLy3saGcKmaEFSqyN4Ih
 tMWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IYCWwbbJIP8d6veHeIA0O5e/DufmdWm+tt9+vif/hVA=;
 b=TJHe/TYL/fFSdwoTyYp///r044q+Np3sApnziTU8bMZ3t7FyRWzpKul1fDBzmQK1Ab
 b1a/r4Zxk8088ALx3+hmW4bHmHNh7T+hK47FaOJ8AKNXyi4Qtk+y/alGz7Kv48wUcCbB
 eij2IvP8i8KZJIA+FJ7NlPwKndyjhCR5SN+eRaFMiCXy9QR+UbcsLLtWhL3OAI2uBBrE
 +1nDmSPrZCsIkZVTqAcqnmMxiaAcgQr6Prij9tSHjgZTGre/Qo4yqxOmsGC6p1/2Ro38
 3F1gdu6TyCIdXKtb6uK1DSjNJK/6Xa08dpIfeyCc4d9RF/pdUjyfJawJ9bJTfnzawpWr
 OkYg==
X-Gm-Message-State: AO0yUKVxPmMMdjgV7wla26LuA68QrqBQ2HFo47T9G+KmR5VXUfHAIoZj
 lsfK6CkrI7zLmktAOwvZDoVEFDquPzOZ9usaXPU=
X-Google-Smtp-Source: AK7set/qbGpRUPy7CVjYxc/e8T6irbMSt8bGxuvGzxo8p0FMkrZWCy6CmWuSNfu5tb0otyW7JwW/9w==
X-Received: by 2002:a17:902:ec85:b0:19d:138b:7c4a with SMTP id
 x5-20020a170902ec8500b0019d138b7c4amr5462022plg.3.1677639669736; 
 Tue, 28 Feb 2023 19:01:09 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 r11-20020a170902be0b00b0019aca830869sm7181444pls.238.2023.02.28.19.01.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 19:01:09 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 49/62] tcg: Change default temp lifetime to TEMP_TB
Date: Tue, 28 Feb 2023 16:56:30 -1000
Message-Id: <20230301025643.1227244-50-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301025643.1227244-1-richard.henderson@linaro.org>
References: <20230301025643.1227244-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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



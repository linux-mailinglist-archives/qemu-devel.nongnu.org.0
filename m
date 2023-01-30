Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CBA681C00
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 22:00:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMbGF-0008GZ-DD; Mon, 30 Jan 2023 16:00:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMbFu-00086i-HK
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:59:58 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMbFs-0005GB-Rg
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:59:58 -0500
Received: by mail-pl1-x632.google.com with SMTP id m2so7980705plg.4
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 12:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cdYpQpQ5SYl2o8UdmBXZaO2pRh3PKqoimMJzfCpHVmg=;
 b=T/FTpHGmWftTaoUCPzcEiz1/FoyA0SxhO3Km1srnWKn30CjHyhb+zTzdhCFLIPkerf
 DwTLrc5IOCakJw2lLrtrxd9aUMS5MOeAvutbNSit3whP5hTaLlr6ycnySAW68MyMMV+C
 O3ukPzltuiBc/8wdKlkwBVi41QOg8uFIxpUUUtYX5HhQWD+cYopSqCl0hovVcI0tP0Vp
 Y+DcQBVzZWFYwpvgqoeQtSD4dKvhU78xNVgq4QMYI3EdowNWJ3hHStsdADuYoddt6woV
 RYjHliTWDadXe0AW2Owe6I4bv1zFBYCZK14PDatwq5D8leGkRqYqR2/BeULN16/RAGua
 ecKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cdYpQpQ5SYl2o8UdmBXZaO2pRh3PKqoimMJzfCpHVmg=;
 b=J9/rmIsyl6VywG9DBcduO3riDmPWueuniXX92qINdHslyqDl/6y9q266rFdgQhJIBd
 nO3DUTD7Rxf3RIgj1ZvWJ9eSEYULU7/BXCQgoXSrPijglCXEYoo8WRq1u4HVJ0YDnN2j
 kmX7v/TBmQ8C0fAboT1jC7ZEL5T5KZxvAZP12MqM6wiM35tSZ3XbDT0wvgFGFLC5v4ue
 H0Je93bp7xL+7zMB4uD4Rph8VXIRwm/FQq8UVholWVOCrvuQmfbKaA3E+Kc+cpRPQTVq
 q2t0uBoMVjtDE3zk56cd9ANLFSkyXQlMxRtJ5yrOker4RTUsVrQwtM/wZ5cRmSx5ctEi
 XqIw==
X-Gm-Message-State: AO0yUKWXLkP0iAXlBs2G7z6mbpjJxvCNNeJjOxI9WvC2AuCvjclZ5zqT
 EtMzxDySgU6E2u+nwCvr7gKMZP4xyzFCi7h8
X-Google-Smtp-Source: AK7set8l70+kuZomfbkKDzxndppvjnjt9GpP6fQmeiufQ0yiu/OyvyOzktKSeHbCDZ3h16GB+biE4A==
X-Received: by 2002:a05:6a20:938c:b0:bc:bae7:642f with SMTP id
 x12-20020a056a20938c00b000bcbae7642fmr9989251pzh.58.1675112395401; 
 Mon, 30 Jan 2023 12:59:55 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 x10-20020aa79a4a000000b00593eb3a5e44sm102933pfj.37.2023.01.30.12.59.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 12:59:54 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	cota@braap.org
Subject: [PATCH 09/27] tcg: Add tcg_temp_ebb_new_{i32,i64,ptr}
Date: Mon, 30 Jan 2023 10:59:17 -1000
Message-Id: <20230130205935.1157347-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130205935.1157347-1-richard.henderson@linaro.org>
References: <20230130205935.1157347-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FUZZY_BITCOIN=1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

TCG internals will want to be able to allocate and reuse
explicitly life-limited temporaries.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index bbede1e900..fe57373d4b 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -890,6 +890,13 @@ static inline TCGv_i32 tcg_global_mem_new_i32(TCGv_ptr reg, intptr_t offset,
     return temp_tcgv_i32(t);
 }
 
+/* Used only by tcg infrastructure: tcg-op.c or plugin-gen.c */
+static inline TCGv_i32 tcg_temp_ebb_new_i32(void)
+{
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I32, TEMP_EBB);
+    return temp_tcgv_i32(t);
+}
+
 static inline TCGv_i32 tcg_temp_new_i32(void)
 {
     TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I32, TEMP_EBB);
@@ -909,6 +916,13 @@ static inline TCGv_i64 tcg_global_mem_new_i64(TCGv_ptr reg, intptr_t offset,
     return temp_tcgv_i64(t);
 }
 
+/* Used only by tcg infrastructure: tcg-op.c or plugin-gen.c */
+static inline TCGv_i64 tcg_temp_ebb_new_i64(void)
+{
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I64, TEMP_EBB);
+    return temp_tcgv_i64(t);
+}
+
 static inline TCGv_i64 tcg_temp_new_i64(void)
 {
     TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I64, TEMP_EBB);
@@ -921,6 +935,13 @@ static inline TCGv_i64 tcg_temp_local_new_i64(void)
     return temp_tcgv_i64(t);
 }
 
+/* Used only by tcg infrastructure: tcg-op.c or plugin-gen.c */
+static inline TCGv_i128 tcg_temp_ebb_new_i128(void)
+{
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I128, TEMP_EBB);
+    return temp_tcgv_i128(t);
+}
+
 static inline TCGv_i128 tcg_temp_new_i128(void)
 {
     TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I128, TEMP_EBB);
@@ -940,6 +961,13 @@ static inline TCGv_ptr tcg_global_mem_new_ptr(TCGv_ptr reg, intptr_t offset,
     return temp_tcgv_ptr(t);
 }
 
+/* Used only by tcg infrastructure: tcg-op.c or plugin-gen.c */
+static inline TCGv_ptr tcg_temp_ebb_new_ptr(void)
+{
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_PTR, TEMP_EBB);
+    return temp_tcgv_ptr(t);
+}
+
 static inline TCGv_ptr tcg_temp_new_ptr(void)
 {
     TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_PTR, TEMP_EBB);
-- 
2.34.1



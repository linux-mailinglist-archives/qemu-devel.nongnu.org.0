Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 579435F5FF6
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 06:14:37 +0200 (CEST)
Received: from localhost ([::1]:48808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogIHK-0005Xq-M1
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 00:14:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHoa-0004Mx-Dn
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:44:52 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:33597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHoX-0003zg-D4
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:44:52 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 n18-20020a17090ade9200b0020b0012097cso1009941pjv.0
 for <qemu-devel@nongnu.org>; Wed, 05 Oct 2022 20:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=dymtBTjNDFvkVseJCTMJpwyHfk/v6x0F+7yT+M5DpeU=;
 b=oRn4GGuY+A/QoidPix4q4HRHXppdiW6Q+9V/dzObUiJAJgN5vB6YxaWdGp+Pmv1uYT
 VHGXac3b8hleEP4eUI2SROmHH2WPX2SOL6z0x0WI+9pyMdI6jbdk4YUdCbDUJ8BHQjMb
 +6MKtAMCNZEUm8uVs+089mpcTutodiv/dabS9Ws0nCDKfYHIu58UabPiDA0zSAiALK+a
 p1pD5L7DAKA1PGQsxSvPhJMYXB4Zv3xtauGS//r0PEXLU9pP+Td7qewG1EcmepyZwVSN
 G3q8lZsPiTUIe0KpZTmcYCPors/GJa3Hgl0wlRb+kXn35Cw1jxKwyuiDqTpfIiTnNjlM
 izjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=dymtBTjNDFvkVseJCTMJpwyHfk/v6x0F+7yT+M5DpeU=;
 b=i0xcwODsVEHpufVz6YuBGZ5BcS3gZsv88R8zFA+dRqR/b65q0VcYPx6oHsRXtQZcaQ
 KZJj5/ZLJ9AtRjn47jfUDTLx7b+dxpXGmmErpitUnWG6EQCt+Qfdn0d6CAfG7JouxqjS
 2rtqZrEytfegDIBRUJ4DlIuJhWsuld2WrajawzJ4j4wXi+MkoASjvTMUIBVZUCzVPVXL
 RfvPLf+VsPdd7+SrVj3S+HSlprw+LZwKXWrc4uEdu41Ald4/Zh3hmk50hSo9c/Wb5byK
 PDo6J4RcZEHy5b6UuKtWDRzTa7LmUt3q9F+t6Du2eLjRb/hU/MPweMpdMU1H8K8aZN/l
 eJ9g==
X-Gm-Message-State: ACrzQf0AAqmLuUBVAPJa5+BFmqGRUZmHZmd34Z+Q/EenQ+gRXm7BAQ2S
 MoOZXJhsEktagSp+7S24JZ4ljIULIByHMA==
X-Google-Smtp-Source: AMsMyM6O+bFIziMyJ9A0LbCL5AUkiCfpAelMy3tFvM2dHKf4j1Vk0ktEXuj1jbsABTetDGmAuBgxtQ==
X-Received: by 2002:a17:90b:1b06:b0:202:c7c2:b66d with SMTP id
 nu6-20020a17090b1b0600b00202c7c2b66dmr3020498pjb.77.1665027886775; 
 Wed, 05 Oct 2022 20:44:46 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:9ad0:4307:7d39:bb61])
 by smtp.gmail.com with ESMTPSA id
 y6-20020a17090ad0c600b00205f4f7a3b3sm1905086pjw.21.2022.10.05.20.44.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 20:44:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 25/26] tcg: Introduce tcg_temp_is_normal_*
Date: Wed,  5 Oct 2022 20:44:20 -0700
Message-Id: <20221006034421.1179141-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006034421.1179141-1-richard.henderson@linaro.org>
References: <20221006034421.1179141-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Allow targets to determine if a given temp will die across a branch.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg-op.h |  2 ++
 include/tcg/tcg.h    | 15 +++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/include/tcg/tcg-op.h b/include/tcg/tcg-op.h
index 0ebbee6e24..4b06895a32 100644
--- a/include/tcg/tcg-op.h
+++ b/include/tcg/tcg-op.h
@@ -850,6 +850,7 @@ static inline void tcg_gen_plugin_cb_end(void)
 #define tcg_temp_local_new() tcg_temp_local_new_i32()
 #define tcg_temp_ebb_new() tcg_temp_ebb_new_i32()
 #define tcg_temp_free tcg_temp_free_i32
+#define tcg_temp_is_normal tcg_temp_is_normal_i32
 #define tcg_gen_qemu_ld_tl tcg_gen_qemu_ld_i32
 #define tcg_gen_qemu_st_tl tcg_gen_qemu_st_i32
 #else
@@ -858,6 +859,7 @@ static inline void tcg_gen_plugin_cb_end(void)
 #define tcg_temp_local_new() tcg_temp_local_new_i64()
 #define tcg_temp_ebb_new() tcg_temp_ebb_new_i64()
 #define tcg_temp_free tcg_temp_free_i64
+#define tcg_temp_is_normal tcg_temp_is_normal_i64
 #define tcg_gen_qemu_ld_tl tcg_gen_qemu_ld_i64
 #define tcg_gen_qemu_st_tl tcg_gen_qemu_st_i64
 #endif
diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 3835711d52..0659c465da 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -871,6 +871,21 @@ static inline void tcg_temp_free_vec(TCGv_vec arg)
     tcg_temp_free_internal(tcgv_vec_temp(arg));
 }
 
+static inline bool tcg_temp_is_normal_i32(TCGv_i32 arg)
+{
+    return tcgv_i32_temp(arg)->kind == TEMP_NORMAL;
+}
+
+static inline bool tcg_temp_is_normal_i64(TCGv_i64 arg)
+{
+    return tcgv_i64_temp(arg)->kind == TEMP_NORMAL;
+}
+
+static inline bool tcg_temp_is_normal_ptr(TCGv_ptr arg)
+{
+    return tcgv_ptr_temp(arg)->kind == TEMP_NORMAL;
+}
+
 static inline TCGv_i32 tcg_global_mem_new_i32(TCGv_ptr reg, intptr_t offset,
                                               const char *name)
 {
-- 
2.34.1



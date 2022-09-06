Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 287655AE744
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 14:10:02 +0200 (CEST)
Received: from localhost ([::1]:58370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVXOz-0001UA-1D
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 08:10:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVeu-0003WQ-Dz
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:18:20 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:34383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVeq-0005B2-CZ
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:18:20 -0400
Received: by mail-wr1-x433.google.com with SMTP id e13so14709861wrm.1
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 03:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=TX1smXvv0vZH8BGSs3ForgPhQTaJXwq4cozeOtT/Nb0=;
 b=kvbZObAoNmCGjOKFYG7Shn+dxy+oN60XQFR+NP2NhIzbYUiC/EkDPuoWoQpmIAxg6L
 TLbj4o52/Gyj9YSjALTcEABwQHyhz0NaH2gIaULCLzpxnfhkhfy2yhKCJ421mKL8FEYo
 jDZniRQ7vUW5yK9f+6evMSvxS6Or/0JgrMjKDkXIMcZb86uAOENsRE6hLPtizrdLvJ5B
 cwlGghS2oA53YdyfmqV/SIacOqAlyNy94AOLaEjcggdrvJpRKLKLI8NJn4AiKZZ4G5te
 Ezd5lZ4vSwo7zAMZ5etvo7fcld3pwKtrnzCuIN9nczbdq4x1tLZFnlerkVw/2JuEheRx
 fPIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=TX1smXvv0vZH8BGSs3ForgPhQTaJXwq4cozeOtT/Nb0=;
 b=6ol4v+Vi7eJv2Q31WLn4ZZydJMFCWDT3ceWr78gbB3sCO/66Em4FYlrWv7SzN4rxfJ
 tTgxyYWf/GqYVCLd+GtlYhkSS77RqykcS07ahBLiZHkz9yX3ofn7OASg/DGWfTbXpQPd
 S/vXMGGVFFjEF+4sFA76/DfSxvklMFZTNcA93KHJaXMVnpGbYzQ4w7Y+p8+IFMYE2wIx
 Y05rBI6iCcGkc9HPZFxI74nZ0KIUxd1TYXRHzize2VKaSyaamEtc/uBIXi64KVPeaUCa
 GHzCgoT/p2gLpCAdHWjcOSuaaZgn9mUIdCh0sYKPiNznFh7Yxil6zwQC+EWUYdYHpj+q
 cLgQ==
X-Gm-Message-State: ACgBeo2lkN3KBYwAyMPfES65p05WLl/VSbEPQ5bpsruV3x9vxVR8hhKU
 vPedopLOWBI/0OtM2dKghLs+ggPrs7Gtrpvo
X-Google-Smtp-Source: AA6agR6WP/WCjBH/xLY8/86uhpL6P52W8e2GOSbHoJyoOvM/YnI7ig9Ox4g8PvSGzT/mvONOC8cLAg==
X-Received: by 2002:a05:6000:1446:b0:222:c466:58a0 with SMTP id
 v6-20020a056000144600b00222c46658a0mr27794712wrx.53.1662459495344; 
 Tue, 06 Sep 2022 03:18:15 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a05600c365000b003a62bc1735asm14094361wmq.9.2022.09.06.03.18.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 03:18:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
Subject: [PATCH v1 25/26] tcg: Introduce tcg_temp_is_normal_*
Date: Tue,  6 Sep 2022 11:17:46 +0100
Message-Id: <20220906101747.344559-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906101747.344559-1-richard.henderson@linaro.org>
References: <20220906101747.344559-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Allow targets to determine if a given temp will die across a branch.

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
index 546cb3d9d7..c766e45242 100644
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



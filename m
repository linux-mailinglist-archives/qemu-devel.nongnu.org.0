Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D893ED907
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 16:36:37 +0200 (CEST)
Received: from localhost ([::1]:38422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFdjA-0005R8-GV
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 10:36:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mFdi3-0003dM-3I
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 10:35:27 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:33466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mFdhx-00051I-AJ
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 10:35:26 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 28-20020a17090a031cb0290178dcd8a4d1so167588pje.0
 for <qemu-devel@nongnu.org>; Mon, 16 Aug 2021 07:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VVyFMlWxRnStEYufOQJ3qJgLS+kc0qyr8j+/IKn46/A=;
 b=utsgpSxBXI0cVbESAuOWBsqK4bW4F8/QmWW+QbA54zXCcJXCG7lfZfzNQzLCGX5Gtc
 STjTNvN3hQyC9xx/9263FZKOyXOjKqoj67VUJuVRsr2w+u+0GLEIhXKy/VPDbL98afd3
 Ho9ILEWtM/7WLvVCbYW5BO2fpVtde+LPQN2CwoHPa7zATunJQxGVzJ8qSWY9JWn3zTlH
 xcgI/p2MBl2tZGzLxtGm8FlqIPLeucr0j1TGf8RTcjG54d6DTfC/DohHo/ewnpTT1MpL
 6hYOWLrNVV5YOjE44Mx/AX0qbaocCh7/dLz35YUKYHNBl5iEpWQCxhrUAXjtIXQhU+kt
 cv1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VVyFMlWxRnStEYufOQJ3qJgLS+kc0qyr8j+/IKn46/A=;
 b=aTfnDhVJ39t/4e2rzKbY6bezs3Nx7hlWaSJ/hMFxU207JX/gbiNxVsrbfK0Nua9M/3
 JZ4XCFLjjwikO7XmYKaLnjWxgSa4bjXu4/T+DH68bMRLMJRMQ7yT8BM7YLp3s6M2UFof
 ivhF98yG9jbNdzJDPA2LtQtNtaSEgzClRiXoBX9D71iPL+vDNc07RthfNt8oPYYIZ5bA
 VF0PP5xNmn6uDdl/jQ+IXrCUPqRqi5JRdDh9+JSJt+EZw4S5xjduH/CNqpaUu69irBLn
 VtEn9E02rEI4wFhhoP5/YaHXWq2UY6UiasINMPdWwl4RwG9IfQvthV8beny+TPa33JkO
 RPZg==
X-Gm-Message-State: AOAM532tQQC32WK/Qad0nmdzcW462qPbrkuKwdBDogLiLlZqVGXERotq
 x95zYPtmRchqcgQH3Fl0H9g=
X-Google-Smtp-Source: ABdhPJw+ghqoNq/pjFr1ZPs4NSITP5pduAPUKdnIWDvTZn0g7mvUXuoJ/9tYUYOICjcsySnhQlYL4Q==
X-Received: by 2002:a65:6a0c:: with SMTP id m12mr16658795pgu.267.1629124517728; 
 Mon, 16 Aug 2021 07:35:17 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id n23sm12888054pgv.76.2021.08.16.07.35.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 07:35:17 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PATCH] tcg: Remove tcg_global_reg_new defines
Date: Mon, 16 Aug 2021 22:35:07 +0800
Message-Id: <20210816143507.11200-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since commit 1c2adb958fc0 ("tcg: Initialize cpu_env generically"),
these tcg_global_reg_new_ macros are not used anywhere.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 include/tcg/tcg-op.h    | 2 --
 target/hppa/translate.c | 3 ---
 2 files changed, 5 deletions(-)

diff --git a/include/tcg/tcg-op.h b/include/tcg/tcg-op.h
index 2a654f350c..0545a6224c 100644
--- a/include/tcg/tcg-op.h
+++ b/include/tcg/tcg-op.h
@@ -843,7 +843,6 @@ static inline void tcg_gen_plugin_cb_end(void)
 
 #if TARGET_LONG_BITS == 32
 #define tcg_temp_new() tcg_temp_new_i32()
-#define tcg_global_reg_new tcg_global_reg_new_i32
 #define tcg_global_mem_new tcg_global_mem_new_i32
 #define tcg_temp_local_new() tcg_temp_local_new_i32()
 #define tcg_temp_free tcg_temp_free_i32
@@ -851,7 +850,6 @@ static inline void tcg_gen_plugin_cb_end(void)
 #define tcg_gen_qemu_st_tl tcg_gen_qemu_st_i32
 #else
 #define tcg_temp_new() tcg_temp_new_i64()
-#define tcg_global_reg_new tcg_global_reg_new_i64
 #define tcg_global_mem_new tcg_global_mem_new_i64
 #define tcg_temp_local_new() tcg_temp_local_new_i64()
 #define tcg_temp_free tcg_temp_free_i64
diff --git a/target/hppa/translate.c b/target/hppa/translate.c
index b18150ef8d..4a61098a52 100644
--- a/target/hppa/translate.c
+++ b/target/hppa/translate.c
@@ -34,7 +34,6 @@
 
 #undef TCGv
 #undef tcg_temp_new
-#undef tcg_global_reg_new
 #undef tcg_global_mem_new
 #undef tcg_temp_local_new
 #undef tcg_temp_free
@@ -59,7 +58,6 @@
 #define TCGv_reg             TCGv_i64
 
 #define tcg_temp_new         tcg_temp_new_i64
-#define tcg_global_reg_new   tcg_global_reg_new_i64
 #define tcg_global_mem_new   tcg_global_mem_new_i64
 #define tcg_temp_local_new   tcg_temp_local_new_i64
 #define tcg_temp_free        tcg_temp_free_i64
@@ -155,7 +153,6 @@
 #else
 #define TCGv_reg             TCGv_i32
 #define tcg_temp_new         tcg_temp_new_i32
-#define tcg_global_reg_new   tcg_global_reg_new_i32
 #define tcg_global_mem_new   tcg_global_mem_new_i32
 #define tcg_temp_local_new   tcg_temp_local_new_i32
 #define tcg_temp_free        tcg_temp_free_i32
-- 
2.25.1



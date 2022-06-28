Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A18D955BF09
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 09:23:21 +0200 (CEST)
Received: from localhost ([::1]:36226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o65ZA-0003Ul-NX
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 03:23:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63Jf-00022v-Te
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:59:14 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:35588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63Je-0000XJ-Cd
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:59:11 -0400
Received: by mail-pf1-x42a.google.com with SMTP id x4so10975509pfq.2
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4guIB9WBX/ay757xxYogFh0D5rQcKO1Qw1OmBzJA6xE=;
 b=yfKjKX/S2DdUpfHmMrARtImCXV/D7LCsXznW7ul5S6y1Gt4eO1MKURfhw4Gi7O/lu7
 t/4Tv6qDMameV3Yc5mc8kUkaGHfMlalR0SnmFAirq9oz/kC2bCZxwa2WDSihyy/uCNDL
 U/pisHTm62ckyTM11VdRwocXUa7xYbGhOiKj+UPLeWm1cTteSoV4He+DmlUKbJumP6jw
 ydEMwYfY9u45LjYqv8ZwiX0ZbhiApbJKatVwevv+0e1luvKAKXKEwRluLeTh4/6pQtEy
 oOaB9ZJ866ZsCsDpJN7L75v3HOwE6KQhzq4FuP5NKkThrpdqiiNdydTRFGdRTV9LbSLn
 VOxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4guIB9WBX/ay757xxYogFh0D5rQcKO1Qw1OmBzJA6xE=;
 b=Pt0yPb95pOq/cp/xq1kwe3illHrxRyXClASfVkSbD/l1nlg20O/446mtKHHEPq3Agc
 V40lVrRNZ773pevR68peS4YQhOEBH5sYujKeMZFptzXFqUab+KXClNcdolsAgAWQhe8N
 3CsMgOv7SYLLHUdeBBpCHcDNeAsYCVAl0xPoH4S+5aH4zmg8FLLh4WZDDjHxPQkyFoGU
 AyXwn6MSGdMi/5usQfST+FKMo2frGPS9V2FgDbCzZb26o7CHrAtnxz/rk+cZchUh1vKa
 xCJyvmlZmDudNphPr2iGehxmiILJWfWCIdHBCwuF/4PM9twXdQP/ecVUa1CpUcSuCPA5
 o3aA==
X-Gm-Message-State: AJIora8x0rgRLpw4cOVyxZe4cyMtHiL4ff+afPykVxDbUmfqxnyf2jFE
 v7XCB2ZR7dYTJfZNvCoSAiAQYdzEGzPQaQ==
X-Google-Smtp-Source: AGRyM1v4F6Kw07muvPP97fvgQug9hVNfyvVgpE1bRG+dsz87lFcJdosVhqH5xGmShmeXwBXIxCpI2w==
X-Received: by 2002:a05:6a00:2402:b0:4e1:46ca:68bd with SMTP id
 z2-20020a056a00240200b004e146ca68bdmr2767516pfh.70.1656392349181; 
 Mon, 27 Jun 2022 21:59:09 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 y7-20020aa78f27000000b00522c0a75c39sm8259686pfr.196.2022.06.27.21.59.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:59:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Luc Michel <lmichel@kalray.eu>
Subject: [PULL 48/60] semihosting: Use console_in_gf for SYS_READC
Date: Tue, 28 Jun 2022 10:23:51 +0530
Message-Id: <20220628045403.508716-49-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628045403.508716-1-richard.henderson@linaro.org>
References: <20220628045403.508716-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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

Reviewed-by: Luc Michel <lmichel@kalray.eu>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 semihosting/arm-compat-semi.c | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index fdb143ace8..9d4d6d2812 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -302,6 +302,22 @@ common_semi_flen_fstat_cb(CPUState *cs, uint64_t ret, int err)
     common_semi_cb(cs, ret, err);
 }
 
+static void
+common_semi_readc_cb(CPUState *cs, uint64_t ret, int err)
+{
+    if (!err) {
+        CPUArchState *env G_GNUC_UNUSED = cs->env_ptr;
+        uint8_t ch;
+
+        if (get_user_u8(ch, common_semi_stack_bottom(cs) - 1)) {
+            ret = -1, err = EFAULT;
+        } else {
+            ret = ch;
+        }
+    }
+    common_semi_cb(cs, ret, err);
+}
+
 #define SHFB_MAGIC_0 0x53
 #define SHFB_MAGIC_1 0x48
 #define SHFB_MAGIC_2 0x46
@@ -428,15 +444,8 @@ void do_common_semihosting(CPUState *cs)
         break;
 
     case TARGET_SYS_READC:
-        {
-            uint8_t ch;
-            int ret = qemu_semihosting_console_read(cs, &ch, 1);
-            if (ret == 1) {
-                common_semi_cb(cs, ch, 0);
-            } else {
-                common_semi_cb(cs, -1, EIO);
-            }
-        }
+        semihost_sys_read_gf(cs, common_semi_readc_cb, &console_in_gf,
+                             common_semi_stack_bottom(cs) - 1, 1);
         break;
 
     case TARGET_SYS_ISERROR:
-- 
2.34.1



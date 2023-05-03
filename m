Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C65656F51AC
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:34:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6q7-0001TH-Md; Wed, 03 May 2023 03:23:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6q1-0001AE-07
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:23:45 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6py-0001Rq-Rz
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:23:44 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3062b101ae1so2315687f8f.2
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683098621; x=1685690621;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=goIerk8+h2mAmH5cdq9rvqtnI9Xor6Xtsg8O4mT4pEA=;
 b=sUFSBIjBeOWzgz75CsJ1ZuMH5iM+PXBqugA5anhlyG86tFOn8pdhMTiaQpShHPDN8Y
 xPQR58IskLw3qhtIs9AQRJyUpC4JlrDeNVqekF7Oy12nmrBr3IPGi+unzH3P2uC8qs4R
 7Dv7j44CVlxmGj/wxgUsThvX+OZfwAzolIOJCmiayJBUkijKe1Iki9qcjTDCeKAllPwd
 CClbvhRkZziJOyxbH4MMSusfa0NJ7bjoheDuMxcutKAcPANUeWroSw/0WmwF8qQAo3bA
 FTdIbwidzpa9aynE1usqDZCjZ3WQtnQGx5J2rF2OdFHt0IDFkSylv+p7yX2dBjSodQ+C
 KJDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683098621; x=1685690621;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=goIerk8+h2mAmH5cdq9rvqtnI9Xor6Xtsg8O4mT4pEA=;
 b=jOY5YDOrGl8fdoglEoAboLHpjdcMeYy0Y2nE5vsysE01rCQMvNQLpkPiDviDGKSZdA
 CGSpyleMI5DruYsL0r81UhlRIKRZljhpOUpCCY91SFIuv+Jcmd8zKSXKRim10BZF432N
 tz93gBNIAXTfoVXgaiORVoMt+h2G5YrN8++I8mjKaQNwIjDSaGYdmBgCSIegN9AqSCUm
 v1/5A/t6Hgu0OGx3PylSkBRjFzZzwJ9swbZSOidi+C2aheK5Sr5RzCuQg3BfQfwl0dbK
 j8D41S8wEuotaVvA9zWoKrK+DzgvMW9LNJ/VtnD3U8eTT/bIkVbFmohtS9aaitoGCuPw
 nuIA==
X-Gm-Message-State: AC+VfDyPpcWbcsiDlh5iodWi1uAIasUtnS+QxomWL+jqRaO5BQNQp0ya
 SQNVp+dS6cwZufs7jI8FOJGbcJBctd9/QtxIQfLxaA==
X-Google-Smtp-Source: ACHHUZ6BppygZb/i0DvUGx7K9bRrYV2xtBHayit3gP9Ib+pKqNEexOORNN46kEQE+uEvBI1JJzen6w==
X-Received: by 2002:a5d:5745:0:b0:2f4:a60f:3cd8 with SMTP id
 q5-20020a5d5745000000b002f4a60f3cd8mr13865266wrw.49.1683098620958; 
 Wed, 03 May 2023 00:23:40 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a05600010ce00b0030627f58325sm9586745wrx.25.2023.05.03.00.23.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:23:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
Subject: [PATCH 07/84] accel/tcg: Merge gen_mem_wrapped with
 plugin_gen_empty_mem_callback
Date: Wed,  3 May 2023 08:22:14 +0100
Message-Id: <20230503072331.1747057-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503072331.1747057-1-richard.henderson@linaro.org>
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42d.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

As gen_mem_wrapped is only used in plugin_gen_empty_mem_callback,
we can avoid the curiosity of union mem_gen_fn by inlining it.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/plugin-gen.c | 30 ++++++------------------------
 1 file changed, 6 insertions(+), 24 deletions(-)

diff --git a/accel/tcg/plugin-gen.c b/accel/tcg/plugin-gen.c
index 5efb8db258..04facd6305 100644
--- a/accel/tcg/plugin-gen.c
+++ b/accel/tcg/plugin-gen.c
@@ -202,35 +202,17 @@ static void plugin_gen_empty_callback(enum plugin_gen_from from)
     }
 }
 
-union mem_gen_fn {
-    void (*mem_fn)(TCGv, uint32_t);
-    void (*inline_fn)(void);
-};
-
-static void gen_mem_wrapped(enum plugin_gen_cb type,
-                            const union mem_gen_fn *f, TCGv addr,
-                            uint32_t info, bool is_mem)
+void plugin_gen_empty_mem_callback(TCGv addr, uint32_t info)
 {
     enum qemu_plugin_mem_rw rw = get_plugin_meminfo_rw(info);
 
-    gen_plugin_cb_start(PLUGIN_GEN_FROM_MEM, type, rw);
-    if (is_mem) {
-        f->mem_fn(addr, info);
-    } else {
-        f->inline_fn();
-    }
+    gen_plugin_cb_start(PLUGIN_GEN_FROM_MEM, PLUGIN_GEN_CB_MEM, rw);
+    gen_empty_mem_cb(addr, info);
     tcg_gen_plugin_cb_end();
-}
 
-void plugin_gen_empty_mem_callback(TCGv addr, uint32_t info)
-{
-    union mem_gen_fn fn;
-
-    fn.mem_fn = gen_empty_mem_cb;
-    gen_mem_wrapped(PLUGIN_GEN_CB_MEM, &fn, addr, info, true);
-
-    fn.inline_fn = gen_empty_inline_cb;
-    gen_mem_wrapped(PLUGIN_GEN_CB_INLINE, &fn, 0, info, false);
+    gen_plugin_cb_start(PLUGIN_GEN_FROM_MEM, PLUGIN_GEN_CB_INLINE, rw);
+    gen_empty_inline_cb();
+    tcg_gen_plugin_cb_end();
 }
 
 static TCGOp *find_op(TCGOp *op, TCGOpcode opc)
-- 
2.34.1



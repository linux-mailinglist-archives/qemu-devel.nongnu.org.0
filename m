Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF15467CA02
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 12:32:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL0UI-0005dX-VC; Thu, 26 Jan 2023 06:32:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pL0U8-0004dq-Hl
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 06:32:04 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pL0U6-0007oK-0e
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 06:32:03 -0500
Received: by mail-wr1-x431.google.com with SMTP id h16so1423229wrz.12
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 03:32:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UUquEbB7BYPXscqNOEIUMtAR42gGz+ZdtvQ3iT3SzLc=;
 b=A1Tv29LvCbi5K7bwZcYIThXUjA7I5lxhTz5ACqBMAT4hAYcyYsH6FxUzzYZokGKlS3
 W4kFbr6mA31A/l9nRrRmQE4zpyHHhdXwyOg/Vs6dZVdPq0nseFRCQtBBX6syXbgtCgEA
 mlvxYoLp3y35dgOrcPMlxvljHV00xm2eGbwrhW7cnIa+512AH0PegEw3TqHjZg/U2W7L
 0ubaw2MCClYVO771w27XBSY5WbY3g2meJwwXVf7S6EmINC9RAi2J0iAPnjUVz9x807Cw
 4hH4cyYyH/DCSc31dYJv4xRJ7yLmAd9VVZJ/DV2m5M78HxsZqSJ7aoCdjoz7f9UV8e8z
 gn5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UUquEbB7BYPXscqNOEIUMtAR42gGz+ZdtvQ3iT3SzLc=;
 b=YBtHq1/ZgdjI7U2VbqJPs3izey77o6HjGFrc5zOBPFkVyYr0/SnsWLDNmHm16tEJNN
 irpeFX+Uxh90cqevfAqY9fjL2UJhIAHfTyNok380A5GPLocfPcDflfeoQTqOyojW1Kvj
 Yzyl7KVt3IODw7SZcsvCsw8VVdJCqV2cl5OPhNrcR+rUHgevHXCYf+gq/Q5Ddh01tI98
 yiUfPWD0eMmkRuMw9JXtyYT8nT/gEKZK/9WnSWAA+JWYd97sSI2dGVsMUz56svxo4lLi
 oZ+eN7mkf6bLv4K52kx+GNUOaOwy68Zl/SYhmetHQgcLx0rLxF+w36pt0BNetfKn3FEa
 7Jpg==
X-Gm-Message-State: AO0yUKUMWAUCFR3yGpKVcAupTaqCBREkbcz06Any+IDE0z3mwk3bCUa1
 +G7bQ4mcRZHMtEPcDCOv/gsFtg==
X-Google-Smtp-Source: AK7set97ZOpMnZEt8TE1vo6Y6LC8pbC+It/2LYRKCtLqK4phoso51iPW7crbROnDCgn/YyhWQjnxrQ==
X-Received: by 2002:a05:6000:1102:b0:2bf:c338:b02a with SMTP id
 z2-20020a056000110200b002bfc338b02amr1909964wrw.36.1674732719706; 
 Thu, 26 Jan 2023 03:31:59 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 m15-20020a056000024f00b002bfae16ee2fsm1137275wrz.111.2023.01.26.03.31.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 03:31:59 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F18211FFBB;
 Thu, 26 Jan 2023 11:22:59 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Emilio Cota <cota@braap.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 33/35] tcg: exclude non-memory effecting helpers from
 instrumentation
Date: Thu, 26 Jan 2023 11:22:48 +0000
Message-Id: <20230126112250.2584701-34-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230126112250.2584701-1-alex.bennee@linaro.org>
References: <20230126112250.2584701-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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

From: Emilio Cota <cota@braap.org>

There are actually a whole bunch of helpers that don't affect memory
that we shouldn't instrument. They are helpfully identified by the
TCG_CALL_NO_SIDE_EFFECTS flag which marks out lookup_tb_ptr as well as
a lot of the maths helpers. To avoid the string compare we introduce a
new flag for plugin internals so we skip that too.

Related: #1381
Signed-off-by: Emilio Cota <cota@braap.org>
Message-Id: <20230108164731.61469-4-cota@braap.org>
[AJB: updated to skip all no SE plugins, add flag for plugin helper]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230124180127.1881110-34-alex.bennee@linaro.org>

diff --git a/accel/tcg/plugin-helpers.h b/accel/tcg/plugin-helpers.h
index 9829abe4a9..8e685e0654 100644
--- a/accel/tcg/plugin-helpers.h
+++ b/accel/tcg/plugin-helpers.h
@@ -1,4 +1,4 @@
 #ifdef CONFIG_PLUGIN
-DEF_HELPER_FLAGS_2(plugin_vcpu_udata_cb, TCG_CALL_NO_RWG, void, i32, ptr)
-DEF_HELPER_FLAGS_4(plugin_vcpu_mem_cb, TCG_CALL_NO_RWG, void, i32, i32, i64, ptr)
+DEF_HELPER_FLAGS_2(plugin_vcpu_udata_cb, TCG_CALL_NO_RWG | TCG_CALL_PLUGIN, void, i32, ptr)
+DEF_HELPER_FLAGS_4(plugin_vcpu_mem_cb, TCG_CALL_NO_RWG | TCG_CALL_PLUGIN, void, i32, i32, i64, ptr)
 #endif
diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 6f497172f8..8dc291d030 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -405,6 +405,8 @@ typedef TCGv_ptr TCGv_env;
 #define TCG_CALL_NO_SIDE_EFFECTS    0x0004
 /* Helper is G_NORETURN.  */
 #define TCG_CALL_NO_RETURN          0x0008
+/* Helper is part of Plugins.  */
+#define TCG_CALL_PLUGIN             0x0010
 
 /* convenience version of most used call flags */
 #define TCG_CALL_NO_RWG         TCG_CALL_NO_READ_GLOBALS
diff --git a/tcg/tcg.c b/tcg/tcg.c
index d502327be2..fd557d55d3 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1674,8 +1674,10 @@ void tcg_gen_callN(void *func, TCGTemp *ret, int nargs, TCGTemp **args)
     op = tcg_op_alloc(INDEX_op_call, total_args);
 
 #ifdef CONFIG_PLUGIN
-    /* detect non-plugin helpers */
-    if (tcg_ctx->plugin_insn && unlikely(strncmp(info->name, "plugin_", 7))) {
+    /* Flag helpers that may affect guest state */
+    if (tcg_ctx->plugin_insn &&
+        !(info->flags & TCG_CALL_PLUGIN) &&
+        !(info->flags & TCG_CALL_NO_SIDE_EFFECTS)) {
         tcg_ctx->plugin_insn->calls_helpers = true;
     }
 #endif
-- 
2.34.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB46681C0E
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 22:01:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMbGL-0000DM-GF; Mon, 30 Jan 2023 16:00:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMbG4-0008HT-1R
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 16:00:11 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMbG1-0005FZ-Fx
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 16:00:07 -0500
Received: by mail-pg1-x52f.google.com with SMTP id e10so8574662pgc.9
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 13:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9K53aBZoJGec2fQ0xkaUEgHlBXe38uQUbD7Y6F3/ZGQ=;
 b=Eqpj6U2dQa5XUDes4WG+B58wyQEMACz6uOz+hY8T7DE/OGLpQZfiFZFJO6RzX3Nv4o
 TamQA8nICQtKL7Nd8OQveTgI0l/s8Y5o6O5w7n9CaVTUUvu+rAVKtv9uQo38/VkweyNU
 IIMVmlpSh1HI8KL8bLb4GPqLYkJG1jMKFobxIgHJOcSUwhkCi7M3k+01gXuisrOu35me
 zoMaUtUKoTlOiYFObHSN30hQ1wuZXGC098qX3fzQLDHOMR5WZao4AeTWSlhW/+Jfasm6
 zF/He9L7E+NKC8jW8saZTfWpv4D9PQ+QUcr2PIBSH7WMOFGekNgfmsnduBTTKdJSzgHp
 Y6og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9K53aBZoJGec2fQ0xkaUEgHlBXe38uQUbD7Y6F3/ZGQ=;
 b=T0a3hcMUl2KyV5KRqrctxIVRhc9wu+p9hI6XMRLfJJMxzKHRV4ETDcq9W8SugztDwT
 eEc+BUkVGefSiS5yLmIp9VzdpJRuupqJqFIkp9R2utsYK43eo9/6zzyz0SDaz2NCzUVw
 +L10YwzWsOb0nZoNerww7xbIXIx0VEO9VMiv4ifTZfvKRtMS90kAUr2bo6COTfDPbmuO
 l2fSdF0Wbh+QYlT+2WrEUSo4RdiuMeWblFlk+0z8vO0eqYW6I5SptKUjfDpI1ls4oP7n
 iWU3FAX0t/k3kwZu2+QB4/4pAb4pEGC2VSLgw0BRNsqjqyhrTmwSKzRAa5B4Q1SEmjRk
 FXRQ==
X-Gm-Message-State: AO0yUKUPOZySRJyjpVBrzjOXHr+xFWjD158qa6l5uZ8TQMz8TVsIM1+O
 J4GVm3aL7eGejsFLFODMVKGjmAVOX9vvOXSm
X-Google-Smtp-Source: AK7set+T3FVDUmdSCIBjex89v45coB/WTaw1PiThO7Ro0Z1phul7nN31Dd/BcVPn5RzUNMpGD+6Rjw==
X-Received: by 2002:a62:ea13:0:b0:590:13f4:e08c with SMTP id
 t19-20020a62ea13000000b0059013f4e08cmr7030670pfh.0.1675112402050; 
 Mon, 30 Jan 2023 13:00:02 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 x10-20020aa79a4a000000b00593eb3a5e44sm102933pfj.37.2023.01.30.13.00.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 13:00:01 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	cota@braap.org
Subject: [PATCH 13/27] accel/tcg/plugin: Tidy plugin_gen_disable_mem_helpers
Date: Mon, 30 Jan 2023 10:59:21 -1000
Message-Id: <20230130205935.1157347-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130205935.1157347-1-richard.henderson@linaro.org>
References: <20230130205935.1157347-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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

Here we are creating a temp whose value needs to be replaced,
but always storing NULL into CPUState.plugin_mem_cbs.
Use tcg_constant_ptr(0) explicitly.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/plugin-gen.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/accel/tcg/plugin-gen.c b/accel/tcg/plugin-gen.c
index ea875c0990..ae2dbd7ad0 100644
--- a/accel/tcg/plugin-gen.c
+++ b/accel/tcg/plugin-gen.c
@@ -628,16 +628,13 @@ static void inject_mem_disable_helper(struct qemu_plugin_insn *plugin_insn,
 /* called before finishing a TB with exit_tb, goto_tb or goto_ptr */
 void plugin_gen_disable_mem_helpers(void)
 {
-    TCGv_ptr ptr;
-
     if (likely(tcg_ctx->plugin_insn == NULL ||
                !tcg_ctx->plugin_insn->mem_helper)) {
         return;
     }
-    ptr = tcg_const_ptr(NULL);
-    tcg_gen_st_ptr(ptr, cpu_env, offsetof(CPUState, plugin_mem_cbs) -
-                                 offsetof(ArchCPU, env));
-    tcg_temp_free_ptr(ptr);
+
+    tcg_gen_st_ptr(tcg_constant_ptr(NULL), cpu_env,
+                   offsetof(CPUState, plugin_mem_cbs) - offsetof(ArchCPU, env));
     tcg_ctx->plugin_insn->mem_helper = false;
 }
 
-- 
2.34.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E259869FF70
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 00:28:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUyWS-0000Sa-3X; Wed, 22 Feb 2023 18:27:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUyWQ-0000S0-Te
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 18:27:38 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUyWO-0005JQ-Vp
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 18:27:38 -0500
Received: by mail-pl1-x632.google.com with SMTP id ky4so11973771plb.3
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 15:27:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c/FsI5n4WgHRv66eevhE+xAIN7J7lkFbjUwPoPOuuXQ=;
 b=fmB8qqCRRkUF4ABe/CI+DfzWOhMgMpNf8R5lU32WMpOURZ9Qgj6qaxMOmhaELREI7C
 CSf+VotFbk6NpyP2WSSnwTNjVtEnP/hg7T/vmFhHy307voxZnJBhCVmsMCB6BDOF+UoL
 rp2RA59wt20Qd9xQirrV8u2uxbFutdd4Qbah9R/BE+lflnNfG4gFPp6LUHNTxo0n5MUF
 9yal8UnVlv6+dol1y7tnysMB3q/xU9j3K8h9h3dMe7EZs1oSjD0zKIzFVuVy0lzrPwHg
 dR11mCVzh6UlWTnOHcpyNyTKid/W9vlcU0HsRAItg43nAakGU4hiSEmKVvorfX1Rw3XG
 VN4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c/FsI5n4WgHRv66eevhE+xAIN7J7lkFbjUwPoPOuuXQ=;
 b=IyU1xlFG+EYPg3On7Se82MYs2CzFhheYFruzXLj5UF98JxSTZ9EXp7D1FT6V6442Y9
 0dOfRpOk7Cgx/fibIYuULPnETyXaUeIpssn8MCaUCyaUxiiDMeagErcPV4Ii8IHVP9kS
 4nP+UEcZUJHxKMcyKqDdmMDhCzv5sPPABr+u9aKzW6mS3niX84IAW6qjpUQ7IeKt+NtY
 N06OfMZYj5UwJ6hywTa4kur5/rURny3FZ5gm+9jGxYt8Jn3biG2coGsLRrQtsyb5twdN
 pMqSDeMmT0evFryNG9Yn3Rb1CNz/TpXaXqTwroO3xQOYx5LJ425TsINehc9kx3zuOwsi
 FltA==
X-Gm-Message-State: AO0yUKXodFc9WlCnK6ORHsOuzI2SdriB/ASSYnGFBpXwJlruk5YTJ3o2
 c3e4VpTiKlXNyZEzE18YeB4k1AMgQq56t5L4ABY=
X-Google-Smtp-Source: AK7set/kFV1XVWqRQKsW6RjtZHzTLkrI9McDCyoJaYafTt8cmpJnwC4UTxwxiLGCPoqSkixd0JOcvQ==
X-Received: by 2002:a17:90b:3890:b0:233:f990:d646 with SMTP id
 mu16-20020a17090b389000b00233f990d646mr9726144pjb.35.1677108456189; 
 Wed, 22 Feb 2023 15:27:36 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 s16-20020a17090ad49000b00234e6d2de3dsm5008918pju.11.2023.02.22.15.27.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 15:27:35 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 13/28] accel/tcg/plugin: Tidy plugin_gen_disable_mem_helpers
Date: Wed, 22 Feb 2023 13:27:00 -1000
Message-Id: <20230222232715.15034-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230222232715.15034-1-richard.henderson@linaro.org>
References: <20230222232715.15034-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/plugin-gen.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/accel/tcg/plugin-gen.c b/accel/tcg/plugin-gen.c
index 9b793ac62c..c42a436c0c 100644
--- a/accel/tcg/plugin-gen.c
+++ b/accel/tcg/plugin-gen.c
@@ -630,8 +630,6 @@ static void inject_mem_disable_helper(struct qemu_plugin_insn *plugin_insn,
 /* called before finishing a TB with exit_tb, goto_tb or goto_ptr */
 void plugin_gen_disable_mem_helpers(void)
 {
-    TCGv_ptr ptr;
-
     /*
      * We could emit the clearing unconditionally and be done. However, this can
      * be wasteful if for instance plugins don't track memory accesses, or if
@@ -644,10 +642,8 @@ void plugin_gen_disable_mem_helpers(void)
     if (!tcg_ctx->plugin_tb->mem_helper) {
         return;
     }
-    ptr = tcg_const_ptr(NULL);
-    tcg_gen_st_ptr(ptr, cpu_env, offsetof(CPUState, plugin_mem_cbs) -
-                                 offsetof(ArchCPU, env));
-    tcg_temp_free_ptr(ptr);
+    tcg_gen_st_ptr(tcg_constant_ptr(NULL), cpu_env,
+                   offsetof(CPUState, plugin_mem_cbs) - offsetof(ArchCPU, env));
 }
 
 static void plugin_gen_tb_udata(const struct qemu_plugin_tb *ptb,
-- 
2.34.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA546A2818
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Feb 2023 10:04:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVqQD-00019p-1q; Sat, 25 Feb 2023 04:00:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqPg-0000Ra-32
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:00:18 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqPe-00054h-A7
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:00:15 -0500
Received: by mail-pl1-x633.google.com with SMTP id ky4so1878185plb.3
 for <qemu-devel@nongnu.org>; Sat, 25 Feb 2023 01:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c/FsI5n4WgHRv66eevhE+xAIN7J7lkFbjUwPoPOuuXQ=;
 b=wR/8+JJYNmAQNzxK1ZYJPc0AP7lD70l3eMAzMar86M19in5ynlGrmlKGYFEDAJSED6
 QwYVJpRxIBva75MvkSGn4J8ko6jAoI6XNw8MZDTD3QaHFzDTJi7f7d3MOXAozZIQBdi9
 IS1hU2HFEqF7l7sNbtUJeRl6EFEhT3PHlyCgYG4Wv8X6VV67ekDwc+X52WGVQ/FrBKXN
 j0Fc/KdQwf3Xf6r1e61ALQiRqBd0AHkm0UHSmJA4lpUVYVSgzYziYuAj4ZyXymA6s9d/
 rRTMkCAXKE38buJ/2J7oXMIAyEbSTz9zvuKMkuLszZUT7sJZUS0YoQVMliooO+SyhBh7
 qZlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c/FsI5n4WgHRv66eevhE+xAIN7J7lkFbjUwPoPOuuXQ=;
 b=uPFhB1wGK20G031efYMuMvfwMBHPpiYFb0crLD0OhUX61ynbktTA5mSF4B+nlKG0Dg
 m5dZGuh/JoWguABqIiDOyCHzXMRzu9B8ghNp7J3Y7EHJFDwdbc41MsE44TXIkf27e1np
 73sksJ++3ONEDv1gH5jksKeSvJN8vEPB9caVuUFbi52B2MUsYTkE1E1nwugyi9kamRgL
 n1gq6xjrzIFtUwd0nbz5o+E07M31hDCg3xs0T1dBE9ce2nmTZQ+Y7GDmcZIoh9Tfn3Fx
 6OCDlAo4MsbzAjUHgzNSnIv0zn0l9iCVFXHVjzJzTqb9TnAsh9w+OtM9qlmMvRVpyWrJ
 7utA==
X-Gm-Message-State: AO0yUKWr9MRwm2L+aS8rojhbPNIW+Kvl5kPlOkjA9vxb6b9JxZ5in3EY
 ejqfKgoBCDMZo2DzWcpqaBeW+yN8MxFs46y7zTQ=
X-Google-Smtp-Source: AK7set8kWCNGSsDv1LxLmVk6ca+xKz0X9wf16/AQUMyGkwxns7acF8HYAZ9EpiFPxrEHYdUUFni+jw==
X-Received: by 2002:a17:90a:31c:b0:237:1b6a:dbce with SMTP id
 28-20020a17090a031c00b002371b6adbcemr17954255pje.2.1677315613129; 
 Sat, 25 Feb 2023 01:00:13 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 s17-20020a639251000000b00502ecb91940sm715546pgn.55.2023.02.25.01.00.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:00:12 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 16/30] accel/tcg/plugin: Tidy plugin_gen_disable_mem_helpers
Date: Fri, 24 Feb 2023 22:59:31 -1000
Message-Id: <20230225085945.1798188-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225085945.1798188-1-richard.henderson@linaro.org>
References: <20230225085945.1798188-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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



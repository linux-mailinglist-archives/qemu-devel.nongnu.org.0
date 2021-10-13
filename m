Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE17342B2E9
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 04:52:45 +0200 (CEST)
Received: from localhost ([::1]:33692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maUNo-00023t-N2
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 22:52:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maUHg-0004R9-GA
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 22:46:24 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:33682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maUHe-0004ro-Sd
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 22:46:24 -0400
Received: by mail-pf1-x42f.google.com with SMTP id t184so297755pfd.0
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 19:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KU5GqqnHBwJE2oQY4NvVS8KLTvZHsylgeTI1DbvIUb8=;
 b=VZ9bp/XN4RwXODAQd3FeXT2cCu3aSR3txc5F+hcP/KyzkvDOuqtKgbB095rPAUUl1O
 UqbyZjawnHXtbe3yGcARvIYMgVAjA0w1+mjhIvvQfLdgIiV0mt6NT/RwbYzybdvUNjcP
 tQI5miaN1GvzMUUMv+twRZxnyRw3P68eIvEyl2BgpakGiMWZk8PQovW98BifeEkhGlj5
 pavJjQXHTEOnwNlR0mdnEz/TjHfx1cgAJgDBUsVN8qNklB6Np+8OVjolAcf+YtSUDHqe
 aNXfDzXhU0RosG7i7q2evJ7+flHayuovwniFdDsWQTbesjpCu+Tv/dFy8oSQB2DcR+f5
 hDbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KU5GqqnHBwJE2oQY4NvVS8KLTvZHsylgeTI1DbvIUb8=;
 b=7mHAjJF83jiciuFb1b4iPd+SEqw4xJHnJC/vuRCCbv+Gg2nx1i+xtg/jpBZ3E9SJpt
 ub8GBStIUBPCzHaHO4UVJyNahNtnu0DAxTqj9qxqJ9m1EYGZI+WBQ/bOwAJkE7mdQztJ
 IX+Xa0n97hRQMh+/b0pfteg2Yxrl9HqpNkFiflluQ5QLxEUWKA3dbNE01fKnS6ExeoaO
 4MfVY+xrpjP0XW77aj6iQr5ZIyHgC9A5BYGIe/5tygx4uX6rP78qk+SLt75ndoN6Rg8S
 t86iG4VeLKYP/n7LlpqPsIpseSWNNU5Eg/8/mBY8m986WOtGOMHyX0Ud1VKtcqftjI+q
 9r4w==
X-Gm-Message-State: AOAM533bN2McSYpWxreByOLsLYIZ9hEbyz5WmHZ6y8zDDXMXcrQA5Rls
 kQN1SoS25kR8joG2M9u5+9IfrA9juLKe5Q==
X-Google-Smtp-Source: ABdhPJyBRA9529VlnILqJRdg7tJnm3EO9TsovAbhpdyYXcsX6NRz1R35cswt/u9c7FizRF1GKIuHTQ==
X-Received: by 2002:a63:d806:: with SMTP id b6mr25896744pgh.395.1634093181514; 
 Tue, 12 Oct 2021 19:46:21 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id qe17sm4855014pjb.39.2021.10.12.19.46.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 19:46:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 12/48] target/sh4: Set fault address in
 superh_cpu_do_unaligned_access
Date: Tue, 12 Oct 2021 19:45:31 -0700
Message-Id: <20211013024607.731881-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013024607.731881-1-richard.henderson@linaro.org>
References: <20211013024607.731881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We ought to have been recording the virtual address for reporting
to the guest trap handler.

Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sh4/op_helper.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/sh4/op_helper.c b/target/sh4/op_helper.c
index c0cbb95382..d6d70c339f 100644
--- a/target/sh4/op_helper.c
+++ b/target/sh4/op_helper.c
@@ -29,6 +29,9 @@ void superh_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
                                     MMUAccessType access_type,
                                     int mmu_idx, uintptr_t retaddr)
 {
+    CPUSH4State *env = cs->env_ptr;
+
+    env->tea = addr;
     switch (access_type) {
     case MMU_INST_FETCH:
     case MMU_DATA_LOAD:
@@ -37,6 +40,8 @@ void superh_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
     case MMU_DATA_STORE:
         cs->exception_index = 0x100;
         break;
+    default:
+        g_assert_not_reached();
     }
     cpu_loop_exit_restore(cs, retaddr);
 }
-- 
2.25.1



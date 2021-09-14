Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B5A40A228
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 02:45:17 +0200 (CEST)
Received: from localhost ([::1]:53908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPwZY-0002iH-Qt
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 20:45:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPw6j-0001oH-2W
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 20:15:30 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:41711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPw6f-0007sD-It
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 20:15:28 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 m21-20020a17090a859500b00197688449c4so1397830pjn.0
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 17:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=znFE2rH6NP0Hsm2vcYSsLUjEpqww+ODmNFuebItoj0M=;
 b=jTT7WyrZvQ8Rq5QF2A66nUvSfyHDBtvZwccnXifdySikvKqTiTBmrVp57vHXIuJ+xG
 wvor5splcoTW6sfruTgOk1CDSYKvufOoA5YeCzJ5Fx7uADIALACzfKNL2OQ1I4SBxiu/
 FhxXLWo3vkb8cVJGU/Iqrfq368ous5a5ez5/hD76S+ON+qDhHKK0lT+zGaCzhUDAtYOF
 MKZXDG2KtdBpXi/7YIk5Kwjd2zY0aNqdQDZ3yAm7tXJkj2Qpq+t9gBxVCNiSJxS6Lgx7
 1ZoPp8cynuN/POvjWvz4ClKJ89Myk2m8PASDitS1TLCH4rRw03zqxsYbbuffUA61F/MT
 GMUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=znFE2rH6NP0Hsm2vcYSsLUjEpqww+ODmNFuebItoj0M=;
 b=dUUui5znwhYasiFq2K08rSF1h28ckqvjfrtbdTir2BukKV8ClyjZbTvh4bmzLB+BJT
 qOvSgWFPEs+70c7Zm78m7Tdbuor9kmfv12+nKB5ZjJ6DhCz+79y4Ga1ZmkZVxaabhdmS
 aCLVglxCBK8uneZGP0IQt5sxrzOhHgp59xpuzedQ/Gfv4GJBwpHIEUlKOCisunq1jqwo
 hyNXdet35zlkNnHmhEbROgq/12ButZDEqYQcla7CBRIsa3KZa2/SLJldBR/QuPFXwJmD
 zP9ibMHCQuF6Jyajqovww66Cu8KHr6kVtuhTuShnJnw0AgMybf3Inzj5J0PA0L01OeFz
 C2VQ==
X-Gm-Message-State: AOAM531CfFF55uwxZ1l23qxwyDG0Ku/AStmqyC+F21otr3oIMujuRYej
 v7I41svxJXm8ah0hKYtiz0g3zkPfERsI6A==
X-Google-Smtp-Source: ABdhPJw3NpLVZwGW4LN6vgI+rbIjL4zpAA6XfNXb80dQ0nAADUaiqLeiTS0juaPJaGlYipn3NXYQDg==
X-Received: by 2002:a17:90a:ec17:: with SMTP id
 l23mr2449143pjy.142.1631578522125; 
 Mon, 13 Sep 2021 17:15:22 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id m7sm9334179pgn.32.2021.09.13.17.15.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 17:15:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 33/44] user: Mark cpu_loop() with noreturn attribute
Date: Mon, 13 Sep 2021 17:14:45 -0700
Message-Id: <20210914001456.793490-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210914001456.793490-1-richard.henderson@linaro.org>
References: <20210914001456.793490-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
Cc: peter.maydell@linaro.org, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

cpu_loop() never exits, so mark it with QEMU_NORETURN.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-By: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210905000429.1097336-1-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/qemu.h   | 2 +-
 linux-user/qemu.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index 522d6c4031..1511327d51 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -168,7 +168,7 @@ abi_long do_openbsd_syscall(void *cpu_env, int num, abi_long arg1,
                             abi_long arg5, abi_long arg6);
 void gemu_log(const char *fmt, ...) GCC_FMT_ATTR(1, 2);
 extern __thread CPUState *thread_cpu;
-void cpu_loop(CPUArchState *env);
+void QEMU_NORETURN cpu_loop(CPUArchState *env);
 char *target_strerror(int err);
 int get_osversion(void);
 void fork_start(void);
diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index 3b0b6b75fe..5b2c764ae7 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -236,7 +236,7 @@ abi_long do_syscall(void *cpu_env, int num, abi_long arg1,
                     abi_long arg5, abi_long arg6, abi_long arg7,
                     abi_long arg8);
 extern __thread CPUState *thread_cpu;
-void cpu_loop(CPUArchState *env);
+void QEMU_NORETURN cpu_loop(CPUArchState *env);
 const char *target_strerror(int err);
 int get_osversion(void);
 void init_qemu_uname_release(void);
-- 
2.25.1



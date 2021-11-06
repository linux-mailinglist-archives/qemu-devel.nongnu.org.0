Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEBC7446DAB
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Nov 2021 12:43:36 +0100 (CET)
Received: from localhost ([::1]:59334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjK6h-0002xj-Um
	for lists+qemu-devel@lfdr.de; Sat, 06 Nov 2021 07:43:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mjK2e-00018I-1y
 for qemu-devel@nongnu.org; Sat, 06 Nov 2021 07:39:24 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:41845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mjK2b-00072N-A6
 for qemu-devel@nongnu.org; Sat, 06 Nov 2021 07:39:22 -0400
Received: by mail-wr1-x435.google.com with SMTP id d3so17858023wrh.8
 for <qemu-devel@nongnu.org>; Sat, 06 Nov 2021 04:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E7n9uccHgblrzOqUeGbVrI2Xim//WITpMzEAT2b9wnE=;
 b=R7Bs8z1mqQNlbFpABwgMDYicbA/fH2rF/fiByk6azgKhZgcmpOtxpTIz/CHI3vNMc8
 T8wjs5OOtYHFbpyHlqWNXxX7EVeAD+PqbymAax+xytO4xtUJRxfWDwRsdqUC+H0QFxZy
 i6bCN/kYYgyUjxRxfKC6QWtJS2RzZg1ZNXqCB2ovdn8jCBCEz4V1JZDlQJEd642iFLVP
 iwPa0u1IsuIZqucl4YyhMmpecb4hGrKNpjwjCBH9Cj1tei3SQsIkybQYoqvWmjX/YZ81
 RxEAHvW8IsRyikY9emFJlmHr88dCO+GLDPe+uMa79hKQplWsdmXNZzf0uNRAvxwLrJGN
 HTlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=E7n9uccHgblrzOqUeGbVrI2Xim//WITpMzEAT2b9wnE=;
 b=SclY0cNfQ8DLYwy8F6HNw58FV0DjdQL/4Iqqnr2zhAxrZoMsdM+hDHAhXgbDvpk8v2
 /VdChiXsayTG+Z30IS4rxXwSFeL7VU5WUSqt9aEa5g6wLMQKvThzMSkW37Y95m8csqnS
 zhu3YViZGK96GMTzYwW3BhlRPQemtGzsEHxVcAqekFM3c7ZFrHqwEPS6yrT2sc7hCUHi
 q4Iar6VMD/De+wvejk18IyZa5rxYvQLHZOBpzOivBeAO1fL7hYD36cxopoaBWIU0RVU2
 FjcrDjkHaZbmVWDm8s/B9WQgd2C4xHjUjIL9gQU7JEdXOi7mLSitlEgfdCITHulTmJL7
 CHhQ==
X-Gm-Message-State: AOAM531Xm757UL+Hdyzk6hqbCW1RTF4OE1gMK3WQISvGzqjJ/xle2SzT
 swBA+WNtflh2fkJ7pXQ8XhnVZv5oDCs=
X-Google-Smtp-Source: ABdhPJzTLP4BgPTAmLnolGULD4guzfJ4y8d9pZVBID50u/naXaXkw299Woa730sm30qzkhlUyNfRPg==
X-Received: by 2002:a05:6000:1813:: with SMTP id
 m19mr71999485wrh.51.1636198758505; 
 Sat, 06 Nov 2021 04:39:18 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id e18sm10385505wrs.48.2021.11.06.04.39.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Nov 2021 04:39:18 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] linux-user: Mark cpu_loop() with noreturn attribute
Date: Sat,  6 Nov 2021 12:39:16 +0100
Message-Id: <20211106113916.544587-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Bin Meng <bmeng.cn@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

cpu_loop() never exits, so mark it with QEMU_NORETURN.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-By: Warner Losh <imp@bsdimp.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v2:
- rebased
- restricted to linux-user

Supersedes: <20210905000429.1097336-1-f4bug@amsat.org>
---
 linux-user/user-internals.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/user-internals.h b/linux-user/user-internals.h
index 661612a088b..c7ad00268af 100644
--- a/linux-user/user-internals.h
+++ b/linux-user/user-internals.h
@@ -65,7 +65,7 @@ abi_long do_syscall(void *cpu_env, int num, abi_long arg1,
                     abi_long arg5, abi_long arg6, abi_long arg7,
                     abi_long arg8);
 extern __thread CPUState *thread_cpu;
-void cpu_loop(CPUArchState *env);
+void QEMU_NORETURN cpu_loop(CPUArchState *env);
 const char *target_strerror(int err);
 int get_osversion(void);
 void init_qemu_uname_release(void);
-- 
2.31.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 264C6508F77
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 20:29:33 +0200 (CEST)
Received: from localhost ([::1]:33080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhF52-000302-89
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 14:29:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhEiz-0005rX-8U
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:06:45 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:38884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhEix-0001H7-I0
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:06:44 -0400
Received: by mail-pf1-x434.google.com with SMTP id b15so2687170pfm.5
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 11:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qwwWjzueBoGHmyIr/QS+H9jb1bNImx0NNgZVRYsrQuo=;
 b=bPbWDTClDOMSARBVgZg4abfVZ7hPv+gub2zCRRWaNCdeWg7jEsfsrgP1P3IsnGVM91
 aIPxgQx/c7GyZsuRI3lp44E3qg4KpqHYpWLk2lmxQE7EZdlHrdkx9qqmuQbDIsYmck13
 EFS+TKkFDV3NkXt+rGvdjRSZb42Ci997Xuw3xMCceVJLp2E2QwilIfV1n6axWDPS+Ncs
 a3D5/g8S53TpIJEJB+zCauu1G2+lIJs1DdEVO4O3gmqESpXXSg5sNHeIDMH+goGVz8WN
 TYg6QOBH06UQs53iNEKhcjn25XrzEbUYy9Qb+CRNfImfuilz3tqaabc6cys+3TSnpjQm
 Mv7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qwwWjzueBoGHmyIr/QS+H9jb1bNImx0NNgZVRYsrQuo=;
 b=iMPgtQy4r9Mlk/o96KmbVrCnIUrUw9WpmvyqXkWLEx2fuejT+Q6RvLTGmwHDLgJzBD
 ZwosyQXGTZpoUGSfa2XUNXKYX+IU/oWmgLnBUYP6WQv1BBRCS7J0JAC/S4f9G8Mtqui7
 PaS2WfCO+rTeetv8v9BpIxO7dyXT5aH5UvwzLVxhoEaJG3NOCFAVsviRk64jCdibcyE1
 V2d+C9eY1FBlOZ0L6aq9nguTyEXKgcCxOnyYjMZYEP0vOFTGGNa2kDnFxJL+dvNxz2qG
 usL9md2IYbJc51GIjvJRW3CVHHHQjDjES2ygj5RKns5u6/R0h8CWNcnFwXXgK034wvAA
 /jsA==
X-Gm-Message-State: AOAM530bxX5+AhguLGkCmVmlwX6fX6fWsCwOR9oWetvptjDVhTq5MjO8
 EqCkSrY7xyhmKm7Bh2W8BMEerY88QDNWjQ==
X-Google-Smtp-Source: ABdhPJx6aqHzMlgmzvznKPT1JV35Yep4xhi11pvm7YT2xgxVm2hlFENVPED/9aXPHichTNR2EHD1bA==
X-Received: by 2002:a05:6a00:138e:b0:50a:9503:44a7 with SMTP id
 t14-20020a056a00138e00b0050a950344a7mr9912354pfg.75.1650478002199; 
 Wed, 20 Apr 2022 11:06:42 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a058200b001d2fc489b8asm56681pji.25.2022.04.20.11.06.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 11:06:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 21/39] bsd-user: Expand log_page_dump inline
Date: Wed, 20 Apr 2022 11:06:00 -0700
Message-Id: <20220420180618.1183855-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220420180618.1183855-1-richard.henderson@linaro.org>
References: <20220420180618.1183855-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have extra stuff to log at the same time.
Hoist the qemu_log_trylock/unlock to the caller and use fprintf.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220417183019.755276-22-richard.henderson@linaro.org>
---
 bsd-user/main.c | 35 ++++++++++++++++++++++-------------
 1 file changed, 22 insertions(+), 13 deletions(-)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index 0c8aa1ae90..ed26fc5acb 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -503,20 +503,29 @@ int main(int argc, char **argv)
     g_free(target_environ);
 
     if (qemu_loglevel_mask(CPU_LOG_PAGE)) {
-        qemu_log("guest_base  %p\n", (void *)guest_base);
-        log_page_dump("binary load");
+        FILE *f = qemu_log_trylock();
+        if (f) {
+            fprintf(f, "guest_base  %p\n", (void *)guest_base);
+            fprintf(f, "page layout changed following binary load\n");
+            page_dump(f);
 
-        qemu_log("start_brk   0x" TARGET_ABI_FMT_lx "\n", info->start_brk);
-        qemu_log("end_code    0x" TARGET_ABI_FMT_lx "\n", info->end_code);
-        qemu_log("start_code  0x" TARGET_ABI_FMT_lx "\n",
-                 info->start_code);
-        qemu_log("start_data  0x" TARGET_ABI_FMT_lx "\n",
-                 info->start_data);
-        qemu_log("end_data    0x" TARGET_ABI_FMT_lx "\n", info->end_data);
-        qemu_log("start_stack 0x" TARGET_ABI_FMT_lx "\n",
-                 info->start_stack);
-        qemu_log("brk         0x" TARGET_ABI_FMT_lx "\n", info->brk);
-        qemu_log("entry       0x" TARGET_ABI_FMT_lx "\n", info->entry);
+            fprintf(f, "start_brk   0x" TARGET_ABI_FMT_lx "\n",
+                    info->start_brk);
+            fprintf(f, "end_code    0x" TARGET_ABI_FMT_lx "\n",
+                    info->end_code);
+            fprintf(f, "start_code  0x" TARGET_ABI_FMT_lx "\n",
+                    info->start_code);
+            fprintf(f, "start_data  0x" TARGET_ABI_FMT_lx "\n",
+                    info->start_data);
+            fprintf(f, "end_data    0x" TARGET_ABI_FMT_lx "\n",
+                    info->end_data);
+            fprintf(f, "start_stack 0x" TARGET_ABI_FMT_lx "\n",
+                    info->start_stack);
+            fprintf(f, "brk         0x" TARGET_ABI_FMT_lx "\n", info->brk);
+            fprintf(f, "entry       0x" TARGET_ABI_FMT_lx "\n", info->entry);
+
+            qemu_log_unlock(f);
+        }
     }
 
     /* build Task State */
-- 
2.34.1



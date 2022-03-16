Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27EE34DAA78
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 07:10:31 +0100 (CET)
Received: from localhost ([::1]:50124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUMre-00061L-8v
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 02:10:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUMgV-0002mo-7o
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 01:58:59 -0400
Received: from [2607:f8b0:4864:20::430] (port=37786
 helo=mail-pf1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUMgT-0006UH-Ln
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 01:58:58 -0400
Received: by mail-pf1-x430.google.com with SMTP id t5so2555715pfg.4
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 22:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LMgZ+9vBXxkL3ObSKn51zXKkedsdNPSwBIC1O+HtQSg=;
 b=y3VL7dxbawsuNElVlAzqQiOuvcWEl44aiEPZ+5+mbX56dByS/YXXF7QudSbKs5055a
 jc4Jutqt5jyRMykrQkk8pxE/hZXxXrysXHAjlFkXtSCfUvP52BKhU1wifrFh81DUlYHu
 9v7eSWPjt3YeZhb9NZu+BHFCkCZlyQIh0J7W5M90RdpYrw7RjRk8ignBYT9MFZOzsENQ
 igALtrnFP2Y/8eGOZIcRHrxkYxJt4rIjzZCFhMXWPpTgvluVs+PWIxm3gJ92O0n08z3Q
 yi1kqOQElvkVnbtqzzFYbkRrdv1QPCBzyLRoDHXa0Dak7NtB9yoP3QVWlHGerrm9Rixc
 LdqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LMgZ+9vBXxkL3ObSKn51zXKkedsdNPSwBIC1O+HtQSg=;
 b=NXFko/Vm8EJWBT1UhJ7VPQo27/zGc7NR1EtzsxX9eYmoHG62XgxmmaBddH7nY9duyT
 KVmayfpmbPafmr3Mc2x1ywarj6hsC3nGsW/66WzvXssuggIbppzj4GumkwO650SBnDJh
 HIL3tGKGlJHW1zVwh7twD6AqaNRoiyFdoMZSgIBHwjfVNwVkYNY5fbCJPj2J6ifcRBVY
 7M/zvrMVfehsRd97qGZRvejydapUuv5503N+Ritxf9d2mxRqsvkHNEbMhHMBN1Bzt13F
 rNB5kMZBS3obdhoxVnWoLOrLjBmLikb4mKkQuYz0QZfA3V6BUUbLb/eK5gUfX39nNF+M
 LsTw==
X-Gm-Message-State: AOAM5334KSIJDLxtNaL4/4owClCh6S6w+Us3r5UEIxc4WkHSJ+lmSNiV
 0VBgZEgHsAiOdZQ+QV3+ljwO20hhP7qqMg==
X-Google-Smtp-Source: ABdhPJzbkw6Du4l4SMkFmpj0vXjEyNH4oAjjpNAgNAUHxZNIWqxLfRcJjnPshCwL5GlZQtYjCFEamQ==
X-Received: by 2002:a63:4e:0:b0:37f:f3f0:2d24 with SMTP id
 75-20020a63004e000000b0037ff3f02d24mr26897821pga.526.1647410336437; 
 Tue, 15 Mar 2022 22:58:56 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 i24-20020a056a00225800b004f6edabc9f4sm1236290pfu.72.2022.03.15.22.58.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 22:58:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 15/17] linux-user/strace: Fix print_syscall_err
Date: Tue, 15 Mar 2022 22:58:38 -0700
Message-Id: <20220316055840.727571-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220316055840.727571-1-richard.henderson@linaro.org>
References: <20220316055840.727571-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::430
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Errors are not all negative numbers, but only the top 4k.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/strace.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux-user/strace.c b/linux-user/strace.c
index 2cdbf030ba..f235118fb6 100644
--- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -684,12 +684,12 @@ print_ipc(void *cpu_env, const struct syscallname *name,
  */
 
 static bool
-print_syscall_err(abi_long ret)
+print_syscall_err(abi_ulong ret)
 {
     const char *errstr;
 
     qemu_log(" = ");
-    if (ret < 0) {
+    if (ret > -4096) {
         errstr = target_strerror(-ret);
         if (errstr) {
             qemu_log("-1 errno=%d (%s)", (int)-ret, errstr);
-- 
2.25.1



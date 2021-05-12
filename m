Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C01CE37BA2C
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 12:15:27 +0200 (CEST)
Received: from localhost ([::1]:36062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgltm-0001Qh-Sv
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 06:15:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kito.cheng@sifive.com>)
 id 1lglsd-0000kM-HY
 for qemu-devel@nongnu.org; Wed, 12 May 2021 06:14:15 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:37831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kito.cheng@sifive.com>)
 id 1lglsY-000817-JI
 for qemu-devel@nongnu.org; Wed, 12 May 2021 06:14:12 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 bo23-20020a17090b0917b029015cb1f2fd59so139518pjb.2
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 03:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X077m+ElD9qEQUEYwDVMD/GZd2LaJfraz/rOBiTmeb8=;
 b=jx0lWWbW6a8ZcfACrEu9ro/1bOhgaIMDiygmZztJaAa/2JAXTQLHgxmzg0PkJm9Kj0
 G+d8zyAcrQuo54v1mVlhUq3gyErpyy279YsuoT5+07w4mBmroMcAn6QqkDCz9gKX8VfD
 ESUwYN6Vj+yI2cCjRYZYZBE0pc1HGtGOQ/HxgPWBWiRbL1PIVcAn/xFh1N53+UhnL8NZ
 C7zS5Lz384rT2XXYsfMtDyXY3rBKj9VXpZBY8aeR/iD+vAYMWEbM4xO6GfKQuz53dIm2
 ATUsSZqcHNxlW3t4GivMtxUBHiTWYKQLNbBC7LT1kNUk3XHmbRWOr3hmeI//ZEYRSJ6T
 mc0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X077m+ElD9qEQUEYwDVMD/GZd2LaJfraz/rOBiTmeb8=;
 b=RrHNBpzO7n+p99/aSmf1eYYPljF6SwTeqdX249GzR9A3RMsKfIiEzXdjIvxLtTXAIH
 KfJYKhas7/UsHsjWZ46l5Hz13jiyPWDLmPU0Gkpc3oUKKLNJDZbbcM6itYQXu6RiMfPJ
 WG8s3OpCY6gIKVf8IO+GVYJCAUALHGOmTCI3gnIe6ccLREEYvxtbDzuNGr/XqKUsh7TZ
 +SkHlclDjGK1/Fnr6y9iRvsZOOCJ33gYVXgI4ehqWRrLFLmrZy5ab1uh983epp0Cz3I1
 Q4LimS82dxTsCXrQDhou5208bJXTK1C8mieChXQ5tFAO8vQ+dui3MwuRVsewk5uoRMoH
 MrtQ==
X-Gm-Message-State: AOAM531w++SuMgJO9tjTEEoZztWha92Z7F7JSXqeviSTZBm3sLMYgdfB
 2vZT9W1bGKqu6Zpwwnr07tCsnZFDjrB2jA==
X-Google-Smtp-Source: ABdhPJyGYhbP3LxpG6Mf0nqRZLtz3O/yYXlLCazhOKPiejUiWApYl1Hnc7lZf5dsfcZYEeo8fvhufA==
X-Received: by 2002:a17:90a:e645:: with SMTP id
 ep5mr10086262pjb.143.1620814446940; 
 Wed, 12 May 2021 03:14:06 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (59-124-168-89.HINET-IP.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id v67sm2088306pfb.205.2021.05.12.03.14.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 May 2021 03:14:06 -0700 (PDT)
From: Kito Cheng <kito.cheng@sifive.com>
To: qemu-devel@nongnu.org, kito.cheng@gmail.com,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH] linux-user: Add strace support for printing arguments of
 llseek
Date: Wed, 12 May 2021 18:13:58 +0800
Message-Id: <20210512101358.122781-1-kito.cheng@sifive.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=kito.cheng@sifive.com; helo=mail-pj1-x102d.google.com
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
Cc: Kito Cheng <kito.cheng@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some target are using llseek instead of _llseek like riscv,
nios2, hexagon, and openrisc.

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
---
 linux-user/strace.c    | 3 ++-
 linux-user/strace.list | 3 +++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/linux-user/strace.c b/linux-user/strace.c
index e969121b6c..4ebf85b063 100644
--- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -2335,7 +2335,7 @@ print_linkat(void *cpu_env, const struct syscallname *name,
 }
 #endif
 
-#ifdef TARGET_NR__llseek
+#if defined(TARGET_NR__llseek) || defined(TARGET_NR_llseek)
 static void
 print__llseek(void *cpu_env, const struct syscallname *name,
               abi_long arg0, abi_long arg1, abi_long arg2,
@@ -2355,6 +2355,7 @@ print__llseek(void *cpu_env, const struct syscallname *name,
     qemu_log("%s", whence);
     print_syscall_epilogue(name);
 }
+#define print_llseek print__llseek
 #endif
 
 #ifdef TARGET_NR_lseek
diff --git a/linux-user/strace.list b/linux-user/strace.list
index 084048ab96..46e1410836 100644
--- a/linux-user/strace.list
+++ b/linux-user/strace.list
@@ -511,6 +511,9 @@
 #ifdef TARGET_NR__llseek
 { TARGET_NR__llseek, "_llseek" , NULL, print__llseek, NULL },
 #endif
+#ifdef TARGET_NR_llseek
+{ TARGET_NR_llseek, "llseek" , NULL, print_llseek, NULL },
+#endif
 #ifdef TARGET_NR_lock
 { TARGET_NR_lock, "lock" , NULL, NULL, NULL },
 #endif
-- 
2.31.1



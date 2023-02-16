Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95CBD698C5B
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 06:49:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSX7e-0003lc-PU; Thu, 16 Feb 2023 00:47:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSX7c-0003l4-La
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 00:47:56 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSX7b-0004wc-3T
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 00:47:56 -0500
Received: by mail-pl1-x62f.google.com with SMTP id ja21so953293plb.13
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 21:47:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3/GsGOhPL6d8HonZ9tvdFyDrYuAo6ZmEKf6gpoOjRcI=;
 b=HQB3PJLuA9MUG6bqVFdMuKez6pm27N5ZO2YnZFwvyh3Tyk1OQCVJYA/rtuYcFKNbqi
 KlzniEAY9LyGjZ6yjdHgC0Dmna8J5Oj6sMGstpAFvY6GXjxbjaDgETFC0AE3xH4flL5S
 CaZjCy/NwqXBEHnvcYegxUJw5lhQtUzGzrgdzWpNCq+bqx+1QqF3DRAhR7ZNu8SC9Gt1
 3s2pGoHiNDQ33wr8JDkGmd4CML/K+1xEayNJ2UX79BkYwd2d/nxAS4pXlkOktNNtu7dP
 D/g9sjXsQGrSupzHg+TqBXBCjbLpQIikAxFoE62/4Yzb92NNsWQfc10fiFXXgx3T1pu+
 3RBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3/GsGOhPL6d8HonZ9tvdFyDrYuAo6ZmEKf6gpoOjRcI=;
 b=jhX8u97O5f3vw5jgE50/17qEoRc7bCZJdaUvW5eesWzaYaYOEm3E0z/pm8yTf7dcog
 RH/7bvVHdZhxlxHTHyMAaF2dBg21C9eOqQK+1suPYa3TBfIn9GJRo51yNHnTbC9R6zqH
 +ksRoi+z3E/rEMUXHiQFGxx4JMjwPAKpObjquE8MzjlwickRwiJ0psGZ0JMqSdGA9vwV
 6tmXmIwlhDAuX9/Il9ksZOBVQHFoO6bwdqzoJaLM5ctPx4/qHppCdSiD+EPkcxvK9ZPT
 s8ab6QbvNGEwiM58gwrtUHRHalFFvI6HuisBJQu9hegGBlCqlk4p/pbVM8KwgIHKTQD+
 J8qg==
X-Gm-Message-State: AO0yUKVytprh4OXl7YXWcyWOo0r/NzBdWHhfxBVNXrRoHy8b5rstggXe
 FUbPXU6OUuja84s0uwyxQ5RwGVfSo0Q2zCyZLoM=
X-Google-Smtp-Source: AK7set+jTw7mnmfV5kIV0lr/EOirk+JYwA/AwbGKDpwg4H/acG+2oLp4ikzEBUUyVlGwxe9K2+fxQA==
X-Received: by 2002:a05:6a20:244d:b0:be:b8bd:83ad with SMTP id
 t13-20020a056a20244d00b000beb8bd83admr5174680pzc.0.1676526473761; 
 Wed, 15 Feb 2023 21:47:53 -0800 (PST)
Received: from stoup.. (rrcs-74-87-59-234.west.biz.rr.com. [74.87.59.234])
 by smtp.gmail.com with ESMTPSA id
 j184-20020a6380c1000000b0047917991e83sm358034pgd.48.2023.02.15.21.45.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 21:47:53 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu
Subject: [PATCH v2 02/15] linux-user/sparc: Tidy syscall trap
Date: Wed, 15 Feb 2023 19:45:03 -1000
Message-Id: <20230216054516.1267305-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216054516.1267305-1-richard.henderson@linaro.org>
References: <20230216054516.1267305-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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

Use TT_TRAP.

For sparc32, 0x88 is the "Slowaris" system call, currently BAD_TRAP
in the kernel's ttable_32.S.  For sparc64, 0x110 is tl0_linux32, the
sparc32 trap, now folded into the TARGET_ABI32 case via TT_TRAP.

For sparc64, there does still exist trap 0x111 as tl0_oldlinux64,
which was replaced by 0x16d as tl0_linux64 in 1998.  Since no one
has noticed, don't bother implementing it now.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/sparc/cpu_loop.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/linux-user/sparc/cpu_loop.c b/linux-user/sparc/cpu_loop.c
index c120c42278..d31ea057db 100644
--- a/linux-user/sparc/cpu_loop.c
+++ b/linux-user/sparc/cpu_loop.c
@@ -149,6 +149,12 @@ static void flush_windows(CPUSPARCState *env)
 #endif
 }
 
+#ifdef TARGET_ABI32
+#define TARGET_TT_SYSCALL  (TT_TRAP + 0x10) /* t_linux */
+#else
+#define TARGET_TT_SYSCALL  (TT_TRAP + 0x6d) /* tl0_linux64 */
+#endif
+
 void cpu_loop (CPUSPARCState *env)
 {
     CPUState *cs = env_cpu(env);
@@ -167,13 +173,7 @@ void cpu_loop (CPUSPARCState *env)
         }
 
         switch (trapnr) {
-#ifndef TARGET_SPARC64
-        case 0x88:
-        case 0x90:
-#else
-        case 0x110:
-        case 0x16d:
-#endif
+        case TARGET_TT_SYSCALL:
             ret = do_syscall (env, env->gregs[1],
                               env->regwptr[0], env->regwptr[1],
                               env->regwptr[2], env->regwptr[3],
-- 
2.34.1



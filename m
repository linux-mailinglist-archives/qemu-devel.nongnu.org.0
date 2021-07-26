Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2233D6913
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 23:56:01 +0200 (CEST)
Received: from localhost ([::1]:43606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m88Zs-00058l-6R
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 17:56:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m88Rz-000352-2s
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 17:47:51 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:42527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m88Rx-0006Eq-JV
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 17:47:50 -0400
Received: by mail-pl1-x635.google.com with SMTP id i1so13316999plr.9
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 14:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zE5MTjUi9y133mTU7/pQadmSuW4/bah/7+NERAt/57k=;
 b=BRRjiv7pk7GPWjHrAyE3DXGpIvhv79wj255B2Msl9Z7SIFulCboKlgSrjpQiEparrn
 8HL/S/yUkls5N7W7QeGZAvgKMHD7GEaQu99X3tHRV4WVQj5ZY5vMnnOlt3UkTl5Db4KZ
 VVWj6I+6EBrK1cErN9/3qyiNYQG6td4jk6wYuaTtRvmUImiAjBJLdKPWjvXTgPuWAbet
 WJMXkAVOn2Nvzz0ZzNHGQeSs0V9YYLJP0r2Gi4FjIfoT0gz4ubdgdOPF/JlU8sQMyoVC
 KNsDceCwKUxi5ySMBzWnsEFiUthvH8II+eitTaVZ7vMYu8eaKCqWHkenwiDGit1ZIszC
 X4Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zE5MTjUi9y133mTU7/pQadmSuW4/bah/7+NERAt/57k=;
 b=D90fxqcrhB+jvgTUCMlGDlSsdbm/Wl5yVs/9Qnwy/O+rkaFIO4LetRjgpdtOv38Xqr
 W5b/cGLHLzR9GcNuRneIJtO97Nn6buchc/TcPWLvo8L0JovqPYqyA3leZeb+vZEZETAa
 Se0M1aaAtMJZRsfTseIn8Mm41F9K8+PRm3QhjmBYIipFyxilEQKY6kf1eDOGhtFHCvb3
 rLDiC8yf94HnYoXtn1Zd1+rqr8iY1l5NJRb8zZooL9Twj1ozhW4gjqwwBmC8WWU9R2wP
 nYn2cOEvK1t/0hyV5YZs3cUE/0MXpMB1DY3mhXn1AyqcDv5Dcz/6JuPhleKP0MPPWxaG
 IYUQ==
X-Gm-Message-State: AOAM530S6d5GvEU3DniLteZSgCkqj0aYQR+QXGcytqVRUlcWE/IsNQ5H
 9YgmqkkUjB6lPPXw3djo6Z7XnfsGavQGcQ==
X-Google-Smtp-Source: ABdhPJwCUcNdHxpw7Ug0lYBChWbtat45Bx6fdePPZL9oKUU2VpySlIWC1wLAJXfOv269BUY1lqYMAw==
X-Received: by 2002:a17:902:cec7:b029:12a:ece5:6abf with SMTP id
 d7-20020a170902cec7b029012aece56abfmr15973690plg.50.1627336068237; 
 Mon, 26 Jul 2021 14:47:48 -0700 (PDT)
Received: from cloudburst.home
 (2603-800c-3202-ffa7-497b-6ae4-953c-7ad1.res6.spectrum.com.
 [2603:800c:3202:ffa7:497b:6ae4:953c:7ad1])
 by smtp.gmail.com with ESMTPSA id e8sm997679pfm.218.2021.07.26.14.47.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 14:47:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL for-6.1 11/12] linux-user/syscall: Remove unused variable from
 execve
Date: Mon, 26 Jul 2021 11:47:28 -1000
Message-Id: <20210726214729.2062862-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210726214729.2062862-1-richard.henderson@linaro.org>
References: <20210726214729.2062862-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
Cc: peter.maydell@linaro.org, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From clang-13:
linux-user/syscall.c:8503:17: error: variable 'total_size' set but not used \
    [-Werror,-Wunused-but-set-variable]

Acked-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/syscall.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 376629c689..ccd3892b2d 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -8364,7 +8364,6 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
             abi_ulong guest_envp;
             abi_ulong addr;
             char **q;
-            int total_size = 0;
 
             argc = 0;
             guest_argp = arg2;
@@ -8396,7 +8395,6 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
                     break;
                 if (!(*q = lock_user_string(addr)))
                     goto execve_efault;
-                total_size += strlen(*q) + 1;
             }
             *q = NULL;
 
@@ -8408,7 +8406,6 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
                     break;
                 if (!(*q = lock_user_string(addr)))
                     goto execve_efault;
-                total_size += strlen(*q) + 1;
             }
             *q = NULL;
 
-- 
2.25.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C893C65E1
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 00:03:28 +0200 (CEST)
Received: from localhost ([::1]:46620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m341P-0004Ay-L2
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 18:03:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m33ty-0000hb-BN
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 17:55:46 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:43773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m33tv-0006u7-D2
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 17:55:46 -0400
Received: by mail-pf1-x42f.google.com with SMTP id a127so17679288pfa.10
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 14:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=98hXjA4uSUkP3B9/WqgmYEJVY206bbsiqYmueSYFIP8=;
 b=A5XxD2ZlTroVbml+CU5XK4A8VhlUBbeMGrH1M3bFs2BBQ16nsA/0PzI7KsIUBgdiy+
 7zBW98ZemlXuEvpaTWZXpv/zx1KsS+xt+N7xTOKo79YOy/KWfkKPUGWDQHzrdg6j3zsI
 /C9MXey4d7zJGsBs+qMWmCcKYGt6pk2FiPt9faPHlz+I69AeNPZhYDauHPs4NLRK/UoZ
 GxA6YuBtwQk4AuaTEzJFBoojJvn220UN+8tYfdet5ll24iqpyQxbxH4Rh9IPIMp+MkP7
 Eibgt6eOXgZ6mOU9Hgz5LVamFs2wmdQAfSVXg6llWzsE7UUIUf6WswOeFlCS4HNhK70w
 S6Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=98hXjA4uSUkP3B9/WqgmYEJVY206bbsiqYmueSYFIP8=;
 b=e2xFhb6CEIP5U60za4TN81TUrPH08ES9/8grIwIh87J4t8rOXUe/cMBimmhcazxVvo
 c1qOcyvJrE8QmIXHSBIHLhTngfCL2/zrqLtaBSb2zc+NHej/26S/B5gp6JgIIlpr+5jK
 lSyRCJa4wV5jZEIFB8o6omqOiIL0QVxkuLNoFWvF9P0yBKqv2ytQHea5v0wxsGvRszB0
 oV3FO8DO/8koG1r0pcg5/CEHlV/5NouWKuAZm/m+5kblUu13I0LYjSQrjlA11bBvRoBV
 QF6zCpu6so8sv1I03lPVWOyRYg4vMso2ypjVLvK+S6uNgMIWJO/Sl5fMGKVV0+I9YaVM
 CWpw==
X-Gm-Message-State: AOAM531GCboyfE2EpBAjh2xQwvK/OscL7ipQ8LUC9Zly/JXfyRDRzK23
 ikGzaYV39h8/MvtxmZaPCTmRFshj5o0IOA==
X-Google-Smtp-Source: ABdhPJz/PeScgqyHHTC6zJGd7QPNrrrvuPzKQ3T3RFAKNIdQSWUgb4UgYftxW7qmWIbhL19lcV7mEA==
X-Received: by 2002:aa7:828f:0:b029:200:6e27:8c8f with SMTP id
 s15-20020aa7828f0000b02902006e278c8fmr1318855pfm.44.1626126942220; 
 Mon, 12 Jul 2021 14:55:42 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id d2sm376932pjo.50.2021.07.12.14.55.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 14:55:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/11] linux-user/syscall: Remove unused variable from execve
Date: Mon, 12 Jul 2021 14:55:32 -0700
Message-Id: <20210712215535.1471256-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210712215535.1471256-1-richard.henderson@linaro.org>
References: <20210712215535.1471256-1-richard.henderson@linaro.org>
MIME-Version: 1.0
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From clang-13:
linux-user/syscall.c:8503:17: error: variable 'total_size' set but not used \
    [-Werror,-Wunused-but-set-variable]

Cc: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/syscall.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 2e826206d2..c27debba8c 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -8500,7 +8500,6 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
             abi_ulong guest_envp;
             abi_ulong addr;
             char **q;
-            int total_size = 0;
 
             argc = 0;
             guest_argp = arg2;
@@ -8532,7 +8531,6 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
                     break;
                 if (!(*q = lock_user_string(addr)))
                     goto execve_efault;
-                total_size += strlen(*q) + 1;
             }
             *q = NULL;
 
@@ -8544,7 +8542,6 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
                     break;
                 if (!(*q = lock_user_string(addr)))
                     goto execve_efault;
-                total_size += strlen(*q) + 1;
             }
             *q = NULL;
 
-- 
2.25.1



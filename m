Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27833698C52
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 06:48:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSX7q-00045g-46; Thu, 16 Feb 2023 00:48:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSX7n-00040b-Ks
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 00:48:07 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSX7m-0005PY-0b
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 00:48:07 -0500
Received: by mail-pj1-x1036.google.com with SMTP id gd1so864172pjb.1
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 21:48:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nwwEZS3IY8awyA29AWhLSBTJfEFo65LkYzhDCm7Aots=;
 b=Q2qsPbeHO32QlZccTd8vPfrj4vY4qHL1tKim9kQChPhw+ommKTfWdM0+sYikGZ4/u+
 fmVllyIjVzRCTWDUQu0zE0+QhXSGTvRs8bxD2f8YODOjdtn0o8zgiLtfZwy2bCGOBcrX
 m/gIBbMcj/QcgZTywWMMSjwWoUgxLiGPme/4bwVj2D6lbqet4ZdZhB+6Puj9sdcNWAAG
 eTPXHI3TxS0d9EOqOaBomAQr8AyD1tt+N0WZD782C04yz0/uofuPHExexGweJhaCrc3C
 IWGiaRW72KEa88CswtsHLSh0WX+08/wxZ3Tf/OuUWNG7QUSegv4m90c7Vpl3hpT5u8wd
 ljlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nwwEZS3IY8awyA29AWhLSBTJfEFo65LkYzhDCm7Aots=;
 b=M/7FcT36CzZbHBuQlyDgyX9SJA3bo8U1GE+ghfdjL6wL1wvKl9Pz4NAnnE5tuFCJ/w
 VXu4V6TzqelZ4flfuQwOpepYU936QZmARGlC2Yka/ppLg0OQJ4Jj9LPnnHzFti3t7K0z
 0BNg5uLpJJ3ALTEvUCjE9BvdnS/z+mgbeRnnX44J7zI+lJNBv/MDyjtCzkgseNv1Lw0f
 gPAIEU45MkvhqZnnu4zp0dMHwhydaucRQH7HTgqDzmOOErYx3prX6CVWxW7KJE1H4oqj
 cWuh7MRu7FZmPS/FiYT2RSr0t4/tBUFEgM0fIEZgSxFMe/DbmIvOlqXEqOWLoGcvSybe
 9o8Q==
X-Gm-Message-State: AO0yUKWs8SxQNF8FFSNTAFYT57j+reSjKZQtconvTZNXVgTe4fBz3A39
 uddJ7fbWvk9fcbriPkLdoZNfaAKLvSRyRpV1H20=
X-Google-Smtp-Source: AK7set/HEUt8RViTR3+6vWcrUJi6U0rQO9P2ox7TsQCUQ2kwBJXVPa8FIDYjXJosb7eeqyFbZHhoUg==
X-Received: by 2002:a05:6a21:78a0:b0:c6:d8bf:265f with SMTP id
 bf32-20020a056a2178a000b000c6d8bf265fmr4026741pzc.28.1676526484522; 
 Wed, 15 Feb 2023 21:48:04 -0800 (PST)
Received: from stoup.. (rrcs-74-87-59-234.west.biz.rr.com. [74.87.59.234])
 by smtp.gmail.com with ESMTPSA id
 j184-20020a6380c1000000b0047917991e83sm358034pgd.48.2023.02.15.21.48.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 21:48:04 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu
Subject: [PATCH v2 07/15] linux-user/sparc: Handle software breakpoint trap
Date: Wed, 15 Feb 2023 19:45:08 -1000
Message-Id: <20230216054516.1267305-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216054516.1267305-1-richard.henderson@linaro.org>
References: <20230216054516.1267305-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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

This is 'ta 1' for both v9 and pre-v9.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/sparc/cpu_loop.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/linux-user/sparc/cpu_loop.c b/linux-user/sparc/cpu_loop.c
index edbc4f3bdc..c14eaea163 100644
--- a/linux-user/sparc/cpu_loop.c
+++ b/linux-user/sparc/cpu_loop.c
@@ -206,6 +206,11 @@ void cpu_loop (CPUSPARCState *env)
             env->npc = env->npc + 4;
             break;
 
+        case TT_TRAP + 0x01: /* breakpoint */
+        case EXCP_DEBUG:
+            force_sig_fault(TARGET_SIGTRAP, TARGET_TRAP_BRKPT, env->pc);
+            break;
+
         case TT_TRAP + 0x03: /* flush windows */
             flush_windows(env);
             /* next instruction */
@@ -237,9 +242,6 @@ void cpu_loop (CPUSPARCState *env)
         case TT_ILL_INSN:
             force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPC, env->pc);
             break;
-        case EXCP_DEBUG:
-            force_sig_fault(TARGET_SIGTRAP, TARGET_TRAP_BRKPT, env->pc);
-            break;
         case EXCP_ATOMIC:
             cpu_exec_step_atomic(cs);
             break;
-- 
2.34.1



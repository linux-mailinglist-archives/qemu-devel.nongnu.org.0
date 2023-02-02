Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB03687287
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 01:52:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNNpv-00060u-7O; Wed, 01 Feb 2023 19:52:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pNNpt-00060l-HJ
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 19:52:21 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pNNps-0000Pm-0u
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 19:52:21 -0500
Received: by mail-pl1-x62b.google.com with SMTP id k13so334741plg.0
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 16:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OkmjatRg9OxEuhuzHdWmE9IfcduIdOzoC0jbgvrF6fo=;
 b=g5tcX4sa0d+dYrQOiHYR+5f7vmbqAYswxTthUtFvnGB04HGmSKVLI3Oh0kxiU9rJJL
 GC0yQV1+ADE/zHLDTynR12H7MAYyakK/7bqfRIPyReFwZKN6fAj8N28dJgMlfGSwBruL
 h33Z0dzrZ0P9c8aTFPYfMGwJYdgWT/hg/DVFQMJFr6VG3kBCGPB+GFEsMCi/vkMdeRCt
 gd5bQhkVmcW/dgq1pJ8gd4pmXshf8R6/7/uTmOCRyvrW5d2I7jIWkeFuWBBBAht6f5fR
 tO2biHiHmPtL7LvxlnGc/OrEA5vCLxMT2NeS5C6b3bfVQG5WIKvUr6yc/bcCKuCquKPV
 jQUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OkmjatRg9OxEuhuzHdWmE9IfcduIdOzoC0jbgvrF6fo=;
 b=LmwFJeQRfOLQX/VqsZwy32TsxBidK3UKV7I3gomptxa9R3SX5PG3TleVT6Y4acFtl4
 m90S7Jmc/RaTKZLLoM4RPJk9ofHTfBqNecJM+0FtgpNhiTvnlRA/D0GmmyOcGkuo5mma
 JS0RkrCZwTrHhhatlM9AqepU6YeY6XABjIOL2K6rj6BFPJrvlSUZq7CPctICvq3rZH56
 tqsAvKSMfUc7BFzqrR9TzMVr2BZgQmpJbiRBQMEM947q3p5E+TeSktLuSSrMg9j4Nk1B
 vMaOddeUIaZYtyjS5vqg6Re3jVKYEizpTQPTQWqKrmItyd/lBoGFOWD7He4xoqFrobR3
 HS0g==
X-Gm-Message-State: AO0yUKVwrLXrmWvNqO7o2CoGAYXEVeNQJTWNDMCBeQfEXPa73Wce17ie
 a+mkzxmEebx1Qs/Wet+DcNC4qiVg4cmok6cP
X-Google-Smtp-Source: AK7set9G3JjayOq7h0sSNZ/wRVCiQHwmkqUZcI/tnBl+b+edYFDtdCLUul+8EvArrHXQBQb+b8fp8g==
X-Received: by 2002:a17:902:cf08:b0:194:a6e0:3ba with SMTP id
 i8-20020a170902cf0800b00194a6e003bamr4933377plg.54.1675299138665; 
 Wed, 01 Feb 2023 16:52:18 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 z3-20020a1709028f8300b00192cf87ed25sm12391334plo.35.2023.02.01.16.52.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 16:52:18 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: mark.cave-ayland@ilande.co.uk,
	laurent@vivier.eu,
	iii@linux.ibm.com
Subject: [PATCH 06/14] linux-user/sparc: Handle software breakpoint trap
Date: Wed,  1 Feb 2023 14:51:56 -1000
Message-Id: <20230202005204.2055899-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230202005204.2055899-1-richard.henderson@linaro.org>
References: <20230202005204.2055899-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
index 493845fe76..573d97c60b 100644
--- a/linux-user/sparc/cpu_loop.c
+++ b/linux-user/sparc/cpu_loop.c
@@ -210,6 +210,11 @@ void cpu_loop (CPUSPARCState *env)
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
@@ -241,9 +246,6 @@ void cpu_loop (CPUSPARCState *env)
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



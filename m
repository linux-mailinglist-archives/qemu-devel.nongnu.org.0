Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DDE6441FDB
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 19:16:25 +0100 (CET)
Received: from localhost ([::1]:51918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhbr6-0002FA-GQ
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 14:16:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb9B-0007rO-7J
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:31:01 -0400
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734]:45709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb98-0001C6-T0
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:31:00 -0400
Received: by mail-qk1-x734.google.com with SMTP id n15so3743886qkp.12
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 10:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QdBbkxzZXl4V2J/0UdfvZmZe+nM+srroKJ9DSgm4Qw8=;
 b=S/z3RdXmXNm63qXWjIjgSWqUioV7hvmM8EBv4Gc+BNIJLbjRLCXAGjiShg1XAfWHeS
 igVoCWZhqwTh0VpFVrYPchSbtqq+WwPiANE5lQneYDGTRvPIsdaU/IWMIHt3sNVZ/rmA
 0Enjg/TK2p3WDlwlUewJ6LCC9rBIde9qDW9b46CYldAtktODVphyCT4gK7JnLDsRW6Dp
 aI+e6IylQQ1HiAUOCU76xa+xIQ/hcjU3FKriGbtyUE23VgYVos1oDTJ01vgVoxUVrS8l
 p3R1T+hJ2caLekBsbnDUHeh+/XdSJk8veJXYdxVEx+w+2m6ue8Qx9dR4Ot6V57ecm59v
 3KhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QdBbkxzZXl4V2J/0UdfvZmZe+nM+srroKJ9DSgm4Qw8=;
 b=NiZBp7CstAwlHqPBGWQrNxYim8RkjFIdJEhiYG8aF9J+xTSLba19YyYiAklCN9Et92
 u8FuU6XMPx9mynN5P/g+dOJ8GH3XlwLnQv7k3ZKIsCTK8ZDhq1yyHFjRMaDg6NQ5df5P
 OZphDnt07LRUjsKIllFSBo/k6mihLDS9i/GIBdbDH4TgCKL0CjNPH3gozHj2kqVKc2Lr
 29GvH3qF3FQanYk8ujvoaHvVyHV2/OPBTQIOfk2H01DTE6+TEmbQWq3eVat+W79UPkom
 3ghlr5IFYHRvO6RoDO96J5OOsJIbn4hybnDlQGOClHoyiiOXjQbZCE/VX/vgfk5EcvJU
 A6YA==
X-Gm-Message-State: AOAM530xmC7MBTtBmMNNclzqNJ7/+jztVNxmu2vmAL9bjo5Fs6F4Ageo
 PiAaVzCmTjOyXKBvptP4KnV3CJVbBGCBUA==
X-Google-Smtp-Source: ABdhPJwmM1iz9xMNfo3gxjMOFrYVWIPRf2o1kUV2frusBHDh9tvR+Yc4MOLj09aeTFPbXhjle/odoA==
X-Received: by 2002:a37:b3c3:: with SMTP id
 c186mr24279874qkf.464.1635787858044; 
 Mon, 01 Nov 2021 10:30:58 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id 13sm1222289qkc.40.2021.11.01.10.30.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 10:30:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 46/60] linux-user/hppa: Remove EXCP_UNALIGN handling
Date: Mon,  1 Nov 2021 13:27:15 -0400
Message-Id: <20211101172729.23149-47-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211101172729.23149-1-richard.henderson@linaro.org>
References: <20211101172729.23149-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::734;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x734.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We will raise SIGBUS directly from cpu_loop_exit_sigbus.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/hppa/cpu_loop.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/linux-user/hppa/cpu_loop.c b/linux-user/hppa/cpu_loop.c
index e0a62deeb9..375576c8f0 100644
--- a/linux-user/hppa/cpu_loop.c
+++ b/linux-user/hppa/cpu_loop.c
@@ -144,13 +144,6 @@ void cpu_loop(CPUHPPAState *env)
             env->iaoq_f = env->gr[31];
             env->iaoq_b = env->gr[31] + 4;
             break;
-        case EXCP_UNALIGN:
-            info.si_signo = TARGET_SIGBUS;
-            info.si_errno = 0;
-            info.si_code = 0;
-            info._sifields._sigfault._addr = env->cr[CR_IOR];
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
-            break;
         case EXCP_ILL:
         case EXCP_PRIV_OPR:
         case EXCP_PRIV_REG:
-- 
2.25.1



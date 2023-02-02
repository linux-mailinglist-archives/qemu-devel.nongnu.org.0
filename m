Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A7E68728E
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 01:53:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNNpq-0005zZ-J9; Wed, 01 Feb 2023 19:52:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pNNpo-0005zQ-Fc
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 19:52:16 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pNNpn-0000Ov-09
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 19:52:16 -0500
Received: by mail-pl1-x630.google.com with SMTP id r8so304890pls.2
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 16:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JZR6v1mutzuyGZ2hYhsQ0hkbJ/my9Uu96+Z1L/w+T3g=;
 b=veDlFeYBi1ccUlByKu9vxh9AcIEoYIbOME+Toqr+rMi1sjlIa0F+TbQSzJEUOsIszc
 myulYZAdmGljYQQLxvAZVlDuyShie7fHdqDdgjkvsKk6liUkoB3LkxC1hMM0bOgutAzc
 EOvWyzh1QamwS4fnKqn31AmW/zPn8+BYXLm4sQZp9zKVaFO74UOwGJzlrCk10zSSpitE
 7vZ74MoSQunBnTIipn2Yd4lNddfTjLTIw7kBJjTYs1hvgwkgQ6Dnr+SrWMj91B9uA/wy
 yel21H/OEldnE9VrT9ptamANJA1SnW344jHqZp7qK0RM+WgP6EGw2WyDEbj0v2BauPAF
 rAQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JZR6v1mutzuyGZ2hYhsQ0hkbJ/my9Uu96+Z1L/w+T3g=;
 b=i5G/OK/VRp9nmtpYEPBNNyGJ2HJd6F5YNcfYg0DwjGBnK+Jn3VyRNRzkHmAZxEPh03
 0h2ZxFjbL1/ZR5gRG4kRbfXcL84PYQ2bNbFUOyKPTrztM/+I03I6joYRXLrM+zGTFWLA
 dDRHg4WeJ9HPM9q+/gdhflU69V62ydiKtuCNLjmauhlJn3nxl7/quDfQGGwY7Ub95wI9
 +1KFCgsTByjQlZJJoXiiw++Al4F9e7BchcJHsngD1H1J6fL2v0bRJuO5NMIf2fJNkaFa
 NPhLupc88dwkyU9fCOvitHwB//8HSkiuBPTrqk0e+h1mC6fTJkTP6uhvyL7cc5azFd5O
 UVSg==
X-Gm-Message-State: AO0yUKW1aj20jifyFYLlE+acepoJjITqwHBkfH/bR02ZZ9tAs0e6mBPM
 Qlx/tDbXpbH4xzhlddJxD2C6dsOEt9cow5oW
X-Google-Smtp-Source: AK7set9xvQgf07EWc0oWPBdBePwQy9FNJUjDQVw9nV3fEEAXQwMkFz6mLBwT2KuXiAz8fJAS8RqhdA==
X-Received: by 2002:a17:902:c992:b0:198:9597:9934 with SMTP id
 g18-20020a170902c99200b0019895979934mr3488470plc.68.1675299133733; 
 Wed, 01 Feb 2023 16:52:13 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 z3-20020a1709028f8300b00192cf87ed25sm12391334plo.35.2023.02.01.16.52.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 16:52:12 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: mark.cave-ayland@ilande.co.uk,
	laurent@vivier.eu,
	iii@linux.ibm.com
Subject: [PATCH 03/14] linux-user/sparc: Use TT_TRAP for flush windows
Date: Wed,  1 Feb 2023 14:51:53 -1000
Message-Id: <20230202005204.2055899-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230202005204.2055899-1-richard.henderson@linaro.org>
References: <20230202005204.2055899-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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

The v9 and pre-v9 code can be unified with this macro.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/sparc/cpu_loop.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/linux-user/sparc/cpu_loop.c b/linux-user/sparc/cpu_loop.c
index 18d5c24af1..a94bffc583 100644
--- a/linux-user/sparc/cpu_loop.c
+++ b/linux-user/sparc/cpu_loop.c
@@ -200,15 +200,14 @@ void cpu_loop (CPUSPARCState *env)
             env->pc = env->npc;
             env->npc = env->npc + 4;
             break;
-        case 0x83: /* flush windows */
-#ifdef TARGET_ABI32
-        case 0x103:
-#endif
+
+        case TT_TRAP + 0x03: /* flush windows */
             flush_windows(env);
             /* next instruction */
             env->pc = env->npc;
             env->npc = env->npc + 4;
             break;
+
 #ifndef TARGET_SPARC64
         case TT_WIN_OVF: /* window overflow */
             save_window(env);
-- 
2.34.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE82687291
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 01:54:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNNps-000606-Bq; Wed, 01 Feb 2023 19:52:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pNNpq-0005zg-DG
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 19:52:18 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pNNpo-0000P6-LD
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 19:52:18 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 e8-20020a17090a9a8800b0022c387f0f93so4033194pjp.3
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 16:52:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=89UUaeY0rrKedYNMf8jAgL7z2598RbZiMA1VfAZ8r+I=;
 b=W3AqVJa3EyhuH3IiE4Dlqu974rTnJiX4yKGX0JHI4gR/0avYMUrBJMBATPaCV9BBkM
 NEs85dsBrMI0vZfqoydIm6LzjO0tc1gRFlQMNjQjL96pLI57BG9zArMrOXtroKxvG5pj
 NK/5LGguZ68N4iYf2gF/r+ofwYhEzfJAJBjgwJXij7lIobHAeKcB86PL1MRTVkqSL+zd
 aadKLm2fraR+COmnYH3Z/K1GKYN+pNvHPh5Bj7g+dJK+t0lgudrqe0+5SZRSRbpmsIVf
 49/7YWS6g3NwxmhuBPwG1sM0nb1AU9JiSopYSeRAdUxznTlR/p6/nWGp9Bb5OeSdcxQV
 Vu4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=89UUaeY0rrKedYNMf8jAgL7z2598RbZiMA1VfAZ8r+I=;
 b=yf+egGH8X2jnsXqto/8Jc5qErNouyhV+phcjctkbAdNeSrODYc/nItNVspsmPTmErt
 Q2tcZS4kI0f20qNKyERldYVr4JKC7yKDXr4IgwxjrMzb3m5a/8WTQ44TVi2hwBrZ+jFF
 beN92O0AUdOA7n2ICUWCpWSoHTLkeVVDCqyiEcwiFRubagw3biZfGRKLuPv8NjUf244W
 YmEKMGjznfbr5aCQka3meGQt1XyS/LNlddtItCx6GF6UNVvpN3EOMJZwiwVlyxT5X7Et
 FgzOXw0NHokr/32rNdmQBUGCZRXq49jotLOtv4+HW/BlWn/Qpj+TwIlvL9NRpwiBwQg5
 cxwA==
X-Gm-Message-State: AO0yUKVgS2lny8mnzpK6nsV7Aedi5W32DRbCpVVdRGGsq4/P8sDXIUM7
 wgXObHNVOdUiRXLk1P/IikmjpYid9YaSz8u0
X-Google-Smtp-Source: AK7set8yFgBNXbERioKDuqrIB1/Tvvuw/Sb9HeUBbG/rqE7aQLllKd6fnF0WHGXUryEk3EZgxwkDzg==
X-Received: by 2002:a17:903:283:b0:198:96d2:9181 with SMTP id
 j3-20020a170903028300b0019896d29181mr544014plr.56.1675299135348; 
 Wed, 01 Feb 2023 16:52:15 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 z3-20020a1709028f8300b00192cf87ed25sm12391334plo.35.2023.02.01.16.52.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 16:52:14 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: mark.cave-ayland@ilande.co.uk,
	laurent@vivier.eu,
	iii@linux.ibm.com
Subject: [PATCH 04/14] linux-user/sparc: Tidy window spill/fill traps
Date: Wed,  1 Feb 2023 14:51:54 -1000
Message-Id: <20230202005204.2055899-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230202005204.2055899-1-richard.henderson@linaro.org>
References: <20230202005204.2055899-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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

Add some macros to localize the hw difference between v9 and pre-v9.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/sparc/cpu_loop.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/linux-user/sparc/cpu_loop.c b/linux-user/sparc/cpu_loop.c
index a94bffc583..efc0fa64d5 100644
--- a/linux-user/sparc/cpu_loop.c
+++ b/linux-user/sparc/cpu_loop.c
@@ -149,6 +149,15 @@ static void flush_windows(CPUSPARCState *env)
 #endif
 }
 
+/* Avoid ifdefs below for the v9 and pre-v9 hw traps. */
+#ifdef TARGET_SPARC64
+#define TARGET_TT_SPILL  TT_SPILL
+#define TARGET_TT_FILL   TT_FILL
+#else
+#define TARGET_TT_SPILL  TT_WIN_OVF
+#define TARGET_TT_FILL   TT_WIN_UNF
+#endif
+
 void cpu_loop (CPUSPARCState *env)
 {
     CPUState *cs = env_cpu(env);
@@ -208,20 +217,14 @@ void cpu_loop (CPUSPARCState *env)
             env->npc = env->npc + 4;
             break;
 
-#ifndef TARGET_SPARC64
-        case TT_WIN_OVF: /* window overflow */
+        case TARGET_TT_SPILL: /* window overflow */
             save_window(env);
             break;
-        case TT_WIN_UNF: /* window underflow */
-            restore_window(env);
-            break;
-#else
-        case TT_SPILL: /* window overflow */
-            save_window(env);
-            break;
-        case TT_FILL: /* window underflow */
+        case TARGET_TT_FILL:  /* window underflow */
             restore_window(env);
             break;
+
+#ifdef TARGET_SPARC64
 #ifndef TARGET_ABI32
         case 0x16e:
             flush_windows(env);
-- 
2.34.1



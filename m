Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9842F698C51
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 06:48:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSX7n-0003v5-4v; Thu, 16 Feb 2023 00:48:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSX7k-0003sg-6q
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 00:48:04 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSX7i-0005On-Kb
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 00:48:03 -0500
Received: by mail-pl1-x62f.google.com with SMTP id r8so1006159pls.2
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 21:48:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1qgOI+XbaLOlA8TDn/4BzcaH/ANI94JgR1D1gQbepb8=;
 b=cyXHauOShPnKy3y8Gm0vSQPfFNJDVuXG+tFbj9zRo18zzqzVe1A/RSSDxDx7mWsFZi
 7MaybDNyyE5JYLcrmchPB8ErHiKNnCwn1Kv8y7mp8XI6S8on/ks/M437umUfxYNfryYH
 e+IfbaFZODvEbe9MwPHtYo3WEgGODXP1G43uwk/ZCLpvX0HxS0JwBzPJ2Qs4yRIomFlS
 lB7lFZny4oWrXbyZClqe8rJeFGWbz0DWw8Uf85KQhzYvn5cx/3AUuRJmQfwWNeWCCvls
 I8UGbk3A1CO2Ya+Rprm5kwfx9SeX6BAc7MYWImzWAEMZIXto7LUrkEaCbIyh69WpozQm
 m/mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1qgOI+XbaLOlA8TDn/4BzcaH/ANI94JgR1D1gQbepb8=;
 b=aw0tdobcr9mZ6kxmKVCRGSVW6cmoCpeKJv7CciWKEzv0M78YOklWe78b2infxT2syq
 Kjcx+wVGu0OCIwb3XwE2IhGsu6tEHjZrmhfF8cOyXXl8srvVYf2CEM80XZ9+uQTGHILL
 noSzRvy5idRE8TcFmtKBL5fW0c4O78k8fH1X+IaGRc/PxRYV85QHdB/EnZKuK1tjE70S
 XMLjUpeJgWLQwYtvAHLq/KEnOe7v4BZBQj9iLX09nMrPRqu1jeiSl8QJKr/O/8/nozD2
 JcB8FQDRazfT5MBhOww0Lz6zLX0havDy9Zk2D+2mpTEsCy6OBkMq7CDzu3Uqcl+OhZMK
 XoDQ==
X-Gm-Message-State: AO0yUKWeVPf5KLKhihCxsHLvkvhKre8Q6+DGNpLsvQSojUz/IMxLQHMc
 I0QD9yDtkpKVDH4s0Hi259njH9L1CtcyNtu0Akk=
X-Google-Smtp-Source: AK7set/UNzPBOlgRVfaoTHAQQ4snpKdecfOAlHwBwJpqAiGkrAGSurz/NobsuUXqpo8b2oxEIsaVZw==
X-Received: by 2002:a05:6a21:9985:b0:bc:51a4:d14c with SMTP id
 ve5-20020a056a21998500b000bc51a4d14cmr5512143pzb.16.1676526481411; 
 Wed, 15 Feb 2023 21:48:01 -0800 (PST)
Received: from stoup.. (rrcs-74-87-59-234.west.biz.rr.com. [74.87.59.234])
 by smtp.gmail.com with ESMTPSA id
 j184-20020a6380c1000000b0047917991e83sm358034pgd.48.2023.02.15.21.47.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 21:48:00 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu
Subject: [PATCH v2 05/15] linux-user/sparc: Tidy window spill/fill traps
Date: Wed, 15 Feb 2023 19:45:06 -1000
Message-Id: <20230216054516.1267305-6-richard.henderson@linaro.org>
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

Add some macros to localize the hw difference between v9 and pre-v9.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/sparc/cpu_loop.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/linux-user/sparc/cpu_loop.c b/linux-user/sparc/cpu_loop.c
index e1d08ff204..2bcf32590f 100644
--- a/linux-user/sparc/cpu_loop.c
+++ b/linux-user/sparc/cpu_loop.c
@@ -158,6 +158,15 @@ static void flush_windows(CPUSPARCState *env)
 #define syscall_cc         xcc
 #endif
 
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
@@ -204,20 +213,14 @@ void cpu_loop (CPUSPARCState *env)
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



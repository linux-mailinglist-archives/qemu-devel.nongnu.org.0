Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E864268728A
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 01:53:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNNq2-0006C2-U9; Wed, 01 Feb 2023 19:52:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pNNq0-0006BV-Rh
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 19:52:28 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pNNpz-0000R1-7D
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 19:52:28 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 rm7-20020a17090b3ec700b0022c05558d22so292057pjb.5
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 16:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8D+STpvePJyIt+1ZL+zvip2U4CwOQ4PGaTgGIJkXneY=;
 b=r2YP/8ODNxT97xGRNbIYK7Ls/PEsQrKjOfKE5wURY26z2rasXld1CTYy9AHHB2cztc
 yJgb1D6iwd+M+DCYgjGx2KIq7lyGyLXNW8s9hHcyi/nMXOg0Lt2lk8DBYaLTltsMeuu+
 rXLk2ufc+LpO9MdP6l1EEKO2rVp0S9JLGWiCfm+0Ys5iuQOAF+K/VzidGW2w6KzfH+6q
 5huJ6AqnPHgGogtSFNThe9eyI5SY6kRfwT1nF/M3F/TFxpPPkAGli0ib6FHyzWOj+LSz
 rjts5IX5T0AEG2gH3hVTIQBxsdp4w9UyUMTJ6Ba5vPZwCIKP9y9pTq8zK2jbfjcni8q5
 BvqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8D+STpvePJyIt+1ZL+zvip2U4CwOQ4PGaTgGIJkXneY=;
 b=BMfdbSTYihFp7LyVccb5KCQLyNRVaudC1K0BbSdhPjyeGoR3+U9cw2HobckpZ3XlK/
 S28RB0cQTJfbXdpoUnBusCfQ41vFhA81RjygRtCvfAgYHkpmce70qwBqUrFHvGvsabJV
 A6rEza6ENXiSmcPrBN4q7aBox6Ml1l9Ap0IL64RDK4ch2B5vEiSWPUQrE267SYDfKm2E
 wIdouIJKVnmAwVO+f01OjF3fGKt5xNjJaufYIDeB5r9e5DdqXhV86cECtZ6ksyn6oqcC
 UaKQeSS3WXSf5njoaDSqLzhXWWoBrNNlZDiK0viVZ64rgxa8VgoaVCPKOKF81hGZMWNV
 KAHw==
X-Gm-Message-State: AO0yUKUGQAezLRgcfZs9obZyxUxBdkPrfhfFzXS4c6+JC1xvePPpebZf
 h6qNOrbAW5rEEO9s0uF/mMXG5KPIAoPF7rHE
X-Google-Smtp-Source: AK7set+KVV+JIunSrry51UE8VBSy/GFL9ytZ3l8AJLjFsl4XK0uCXQ7TMKnQxNSK0kZMDCZZ+JD2KA==
X-Received: by 2002:a17:902:d4ce:b0:198:c335:ae95 with SMTP id
 o14-20020a170902d4ce00b00198c335ae95mr688414plg.0.1675299145934; 
 Wed, 01 Feb 2023 16:52:25 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 z3-20020a1709028f8300b00192cf87ed25sm12391334plo.35.2023.02.01.16.52.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 16:52:25 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: mark.cave-ayland@ilande.co.uk,
	laurent@vivier.eu,
	iii@linux.ibm.com
Subject: [PATCH 10/14] linux-user/sparc: Handle privilidged action trap
Date: Wed,  1 Feb 2023 14:52:00 -1000
Message-Id: <20230202005204.2055899-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230202005204.2055899-1-richard.henderson@linaro.org>
References: <20230202005204.2055899-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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

This is raised by using an %asi < 0x80 in user-mode.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/sparc/cpu_loop.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/linux-user/sparc/cpu_loop.c b/linux-user/sparc/cpu_loop.c
index 3af791455f..42e92ef859 100644
--- a/linux-user/sparc/cpu_loop.c
+++ b/linux-user/sparc/cpu_loop.c
@@ -310,6 +310,12 @@ void cpu_loop (CPUSPARCState *env)
         case TT_PRIV_INSN:
             force_sig_fault(TARGET_SIGILL, TARGET_ILL_PRVOPC, env->pc);
             break;
+#ifdef TARGET_SPARC64
+        case TT_PRIV_ACT:
+            /* Note do_privact defers to do_privop. */
+            force_sig_fault(TARGET_SIGILL, TARGET_ILL_PRVOPC, env->pc);
+            break;
+#endif
         case EXCP_ATOMIC:
             cpu_exec_step_atomic(cs);
             break;
-- 
2.34.1



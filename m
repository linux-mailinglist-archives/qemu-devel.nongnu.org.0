Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDC8687293
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 01:54:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNNpn-0005zA-IM; Wed, 01 Feb 2023 19:52:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pNNpl-0005yH-0r
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 19:52:13 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pNNpj-0000OW-Dq
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 19:52:12 -0500
Received: by mail-pl1-x633.google.com with SMTP id d3so270874plr.10
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 16:52:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0NlXg86UHyXHALJd4CNrXKqdR3YhnMuvIdL7EfthOjo=;
 b=EWXTppJcRBEzev53O9g0l9etB9YMbLO90jmFC1wOnQqMkq0TgXVsPun8yhL2UUAuzo
 hWQYGxTtNSHpQ1iF4HrKNaIh22ie1ug4E+lEWt3mlv6eq1xWNKGlfZMqcWG/znC1ws1v
 ULTtODWbHfGq9YJEIFwIaquk9HV5sGLae4ceQaeam5paDnYjq+1zrkzow1UnhofBNQr6
 JoEMZj9c+sJA801DRktJXk8ERjA75Wuv8NZ0xRIlIFep2HnDTma6uiPKAIwLcHq9WNbr
 U8aobKq+M32DTVyRKAQNPPlIQCWPzoIbBCxF0JRFlFwIlVYzupv2Ku5YzjdNsSvu3An7
 Ph1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0NlXg86UHyXHALJd4CNrXKqdR3YhnMuvIdL7EfthOjo=;
 b=kpTGK4dDLFP1CkdiRPaTggP/WXQevJC4miN18ERsdWPiaCkrNg/isozSEsuNWUWeFq
 GQhq/rsovDhYO1bcjuhZV7RWD6T/ToMV0QBn7C4ItIHoHjL6rAvSW64zmaThESb4/Xx5
 e5+DaPJrhD1IRCPx2uVvuLLGMhkyKLbJ3IBdyXaYq3N4YBg/K722dWccTKs3s5P6OfFf
 R6PmaBHBTQSUdlApCKL2E9y4gs7dS84F4NOwBC7vYfF096lwEtdbmWqc1BZu4+tDK8KC
 zEB3OftIh7xw6BGVnufshC2TxOlwVU9jeLwEggs0DIpPmdBl1D6604/jIaSpLgZxR4Vx
 kP3Q==
X-Gm-Message-State: AO0yUKXqpDuOK8lMM6BONo3KS/7X1iWyG7lWzLhkrQw1QrntRlfcNmya
 HZ193KC7hdsMe+ciyHwK3ERg+aQOGlu3BkWp
X-Google-Smtp-Source: AK7set9zMtm98wKQEsNiLzCpN2SEmB9WkPhSCjYuxuV9a2WGnv8eEEMufdD7HvfCb2e2eV5+iK3E+w==
X-Received: by 2002:a17:903:234f:b0:194:4b98:42c8 with SMTP id
 c15-20020a170903234f00b001944b9842c8mr5512643plh.28.1675299130093; 
 Wed, 01 Feb 2023 16:52:10 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 z3-20020a1709028f8300b00192cf87ed25sm12391334plo.35.2023.02.01.16.52.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 16:52:09 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: mark.cave-ayland@ilande.co.uk,
	laurent@vivier.eu,
	iii@linux.ibm.com
Subject: [PATCH 01/14] linux-user/sparc: Raise SIGILL for all unhandled
 software traps
Date: Wed,  1 Feb 2023 14:51:51 -1000
Message-Id: <20230202005204.2055899-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230202005204.2055899-1-richard.henderson@linaro.org>
References: <20230202005204.2055899-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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

The linux kernel's trap tables vector all unassigned trap
numbers to BAD_TRAP, which then raises SIGILL.

Reported-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/sparc/cpu_loop.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/linux-user/sparc/cpu_loop.c b/linux-user/sparc/cpu_loop.c
index 434c90a55f..c120c42278 100644
--- a/linux-user/sparc/cpu_loop.c
+++ b/linux-user/sparc/cpu_loop.c
@@ -248,6 +248,14 @@ void cpu_loop (CPUSPARCState *env)
             cpu_exec_step_atomic(cs);
             break;
         default:
+            /*
+             * Most software trap numbers vector to BAD_TRAP.
+             * Handle anything not explicitly matched above.
+             */
+            if (trapnr >= TT_TRAP && trapnr <= TT_TRAP + 0x7f) {
+                force_sig_fault(TARGET_SIGILL, ILL_ILLTRP, env->pc);
+                break;
+            }
             fprintf(stderr, "Unhandled trap: 0x%x\n", trapnr);
             cpu_dump_state(cs, stderr, 0);
             exit(EXIT_FAILURE);
-- 
2.34.1



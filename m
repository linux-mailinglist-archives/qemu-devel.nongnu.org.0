Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37DA369C474
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 04:24:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pTwmP-00019k-2b; Sun, 19 Feb 2023 22:23:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pTwmM-00019Y-RY
 for qemu-devel@nongnu.org; Sun, 19 Feb 2023 22:23:50 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pTwmL-0005q9-DB
 for qemu-devel@nongnu.org; Sun, 19 Feb 2023 22:23:50 -0500
Received: by mail-pl1-x636.google.com with SMTP id l15so1047359pls.1
 for <qemu-devel@nongnu.org>; Sun, 19 Feb 2023 19:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4zhGePcD91yQ6ch+7pxzLZ4Aayz4MXPEoGj6QOyVgUM=;
 b=k1iPuwWN05dCebnyza/8iKydDRbNtnylTmzUoMu/7cBwmY2XaQuwYPx49P7cBGxXk4
 kK6d/Zv2KXyFCexiJs5Zi4PW+8Bi3I8vPLlDzNrCaM4d8OgJSUxeBbBRo57qoBScswHw
 Fm5uhGTD2AKoWSvABq77cLDJYH+PRlnsOg3WsTKMJTqDrGE6sNGmOXRajAwp+p6b5nIx
 bNJR2CEukN8AIKGuQgEf7euxMZjiHxsVI8d237BLPTZBQCR9HPSKH94fmoGWLJZ8glNv
 Yby83iy0HqLP7fUFmHU9xqiK/Je1NpnFbeXPWgHtB6R27yYOfHMekEhVsc49ocAjKaTn
 YL6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4zhGePcD91yQ6ch+7pxzLZ4Aayz4MXPEoGj6QOyVgUM=;
 b=P5MsLMomqy49wlgQfznQXc2c8zhkNL009+Cd+UskYzGucanDhD6PXKyimA0tMbv4rS
 zUFTvhKEhaKQ2GuvpHP+lvrEbX/A8xhSrjGvQJjvitnX6rG/1ZFli8bHe8n43ULs3Wcy
 1+1ETq0B/ZF+VuOncDZenjc06XKGHv+OlNMeaV3vMPx2aGTxI1k/PQGXwPxM8GNBqLSL
 z2AYlTdtHAoSXf/1IdrmvNrUSaUyjMTfwqlLQqbujV8Pk9q1MsZYow8/2ZIxF1RSeNZ2
 Lk2RHmnRUDNKO2Djg6gK1SX6sbaXjSOxoLsP61HFQxlRgaPha10jyW4APAUE9rYz1vxQ
 R+OA==
X-Gm-Message-State: AO0yUKUdI8OYB8EdVzEnf9JVeeHHVwOEVJs45aRHaTmaxf8ER089gHK3
 tRR/QKrRBJbhhTceanxNc6Wsmt+ipwcM1m3I1gk=
X-Google-Smtp-Source: AK7set9thZDqf+q3yfs/fX9G86K2coYsmYbw1BvcKptRm2E27sd6oKCcMAs3LkBghifgKUdPCATiOQ==
X-Received: by 2002:a17:902:d502:b0:194:a531:4b39 with SMTP id
 b2-20020a170902d50200b00194a5314b39mr1670980plg.67.1676863427727; 
 Sun, 19 Feb 2023 19:23:47 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 l11-20020a170902d34b00b00198e1bc9d83sm6621302plk.266.2023.02.19.19.23.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Feb 2023 19:23:47 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PULL 2/7] linux-user/sparc: Raise SIGILL for all unhandled software
 traps
Date: Sun, 19 Feb 2023 17:23:33 -1000
Message-Id: <20230220032338.5619-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230220032338.5619-1-richard.henderson@linaro.org>
References: <20230220032338.5619-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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

Tested-by: Ilya Leoshkevich <iii@linux.ibm.com>
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



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C718C698C45
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 06:46:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSX5Y-0001G0-T3; Thu, 16 Feb 2023 00:45:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSX5N-000115-JK
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 00:45:38 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSX5L-00012Y-Qs
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 00:45:37 -0500
Received: by mail-pl1-x62f.google.com with SMTP id jk14so974563plb.8
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 21:45:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4zhGePcD91yQ6ch+7pxzLZ4Aayz4MXPEoGj6QOyVgUM=;
 b=PNMBYKObCsz9WrJuxjzHRldkjkZuouINoye/Ir95MRsAhV+ZdwMvogcORdZQrb048v
 UoKCoQRRiNCu8G+k3rdWdYhpDgDr0LTfarXVDkpw9urzp3cjI8GkPDX9kE7XLKZQBDSs
 ol0MUH7GlBFHWW4Qf2uT69lF7S5vUitidTYeSgmGmYECFkp0+agv/xMCNNtAzQoY/+fd
 PcC062P2uWm2eCeVRoi84iKESkX6eISdSS8xj2q8FU+oSnuEO/rBuH5DoxqetJ14q+DT
 htFObL+TRfJzZYPtHQPEQGW72zb7LOk1p0i9bIg8GHoUKcMLdNfCk1ZocfwCdXJdXOB1
 HGEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4zhGePcD91yQ6ch+7pxzLZ4Aayz4MXPEoGj6QOyVgUM=;
 b=Xal5ItFFcvfoEhuFuBi9SVlNZD4bwJ322X14S4U0PzVffKW4b5CRnFXhhNpQ6A23kx
 sktpleZY8LSfBcTa0XmePu5RZoQExwXB8ttySghiZ30969RC+a2JZGPDEriVK8tuXWFN
 0PFouEd7fiRbwKFNfklswnsp/d5HKB/bGCH8++Cvfw5yhqaO15XfH8phSzB4n7+0GDKZ
 3Ewo2hBct/RZVigPfboAuJacV222q3wxA6ok1uOn4euR5Hrcm1ghGH4AA+bBBtF3d9fw
 1fd+f/ZS/LmWkTgkchUp0Vg1nPY7bMhQ8DphAuKOkE3dmhfTL5n8cGoD9iKnXs108dDI
 fzhQ==
X-Gm-Message-State: AO0yUKUbBhp7BkKq6dLBEfirB51xCOpxTwArOWF+ZSOut/y6olHbD7ED
 T7dZ4bcRAyNBo5lMoO5xm8ZOM4ueA4AeUWKnGNM=
X-Google-Smtp-Source: AK7set+Jk2ghDpboaawoTpxIjHvz7SsHU48wLL7Lcu3TrnTjtI0ptGxr5jOdYCjGg6e9Z8C3WvK1vA==
X-Received: by 2002:a05:6a20:7d95:b0:c7:23ad:63eb with SMTP id
 v21-20020a056a207d9500b000c723ad63ebmr1073519pzj.10.1676526334190; 
 Wed, 15 Feb 2023 21:45:34 -0800 (PST)
Received: from stoup.. (rrcs-74-87-59-234.west.biz.rr.com. [74.87.59.234])
 by smtp.gmail.com with ESMTPSA id
 j184-20020a6380c1000000b0047917991e83sm358034pgd.48.2023.02.15.21.45.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 21:45:33 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu,
	Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v2 01/15] linux-user/sparc: Raise SIGILL for all unhandled
 software traps
Date: Wed, 15 Feb 2023 19:45:02 -1000
Message-Id: <20230216054516.1267305-2-richard.henderson@linaro.org>
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



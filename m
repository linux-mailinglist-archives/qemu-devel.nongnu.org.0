Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C0762F0F8
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 10:20:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovxX0-0001KS-43; Fri, 18 Nov 2022 04:19:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovxWt-0001EP-W5
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 04:19:26 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovxWp-0005wa-Ql
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 04:19:23 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 k2-20020a17090a4c8200b002187cce2f92so2577677pjh.2
 for <qemu-devel@nongnu.org>; Fri, 18 Nov 2022 01:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=klMV9QcwxtW012k58NMnkKEYmz5AJ4MFhRIGSfHup4Y=;
 b=JXozbtKbs72AyOGMZJoXbfa/EJoyArSa+5fH/65HcnasY/JEmLkOWLG4DDwUOJfN88
 f+CgQTbVD3HMi9Mux6VCv+/r5ojYfu0m8NZVLFdl6fj+OoXjtc5vtJ9Y7OCthVcrRCxV
 +JBkq6aWT/+DHnbyeyfDlBgVxB6RIQZoAKAcTW8TYjyOBDPF79w/UCNayz+PnMPPuisa
 3z6Il0OUMqL/DekcuigUlIF6DfY9POhnirEvqXDaLDzpQ/zxF78WJaWigk4xNOi31nwB
 PgbOzVc955842mG5ya/KeEJyPyoBi0oPxTtx2dwknYagztRGK5Ypttu98H4JEPo81UTJ
 bSgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=klMV9QcwxtW012k58NMnkKEYmz5AJ4MFhRIGSfHup4Y=;
 b=pai7Gs+h7uY71ISarRnk0OOio0yOrUh/UJGkSegujLiAonOAqn4PQz5OfY82ypw233
 dW3E8huiFxK7j8f4uPuz8vERWCv6vbGvfWzacY4YOOX/uEEUKdEpMMkJ4LjWApfZqy9n
 IUTvuEvpuzZFiyW6Sj5IH6DpJcoSHZqa2VYns6LBfmtOID1X9Di51reygLPNzOvAjCyi
 UbhIh4eK69xOj8awQwsea7GXEPYDEIP1JIhMXincEGzvCSM5DSo9GWX/J9sq23Nfnd9v
 5ub4u5Y5Ztz0HzNCZbRDSNMq3s+3SUZU1Cuj7ZFMC4HyEVab7wUEkv7XMN6Jtsr8kEF3
 SAww==
X-Gm-Message-State: ANoB5pk+OE8t0ZfL3+XgCGIGggW31PIPBSBovVhoIziEKmkSr56P6W/G
 BFfky8vaWIfdfboo+pmkBxmDwq9mxG6cog==
X-Google-Smtp-Source: AA0mqf5AWh4QZsl2JIw6QUW3CUBbLjWE4FDPTrY/abDF+M10Cd7EU4KaRnUxvFZFz6YBakcXrUcOyQ==
X-Received: by 2002:a17:90b:4d0b:b0:214:1329:dec7 with SMTP id
 mw11-20020a17090b4d0b00b002141329dec7mr12947722pjb.91.1668763151823; 
 Fri, 18 Nov 2022 01:19:11 -0800 (PST)
Received: from stoup.. ([2602:47:d48a:1201:90b2:345f:bf0a:c412])
 by smtp.gmail.com with ESMTPSA id
 a27-20020aa794bb000000b0056e8eb09d57sm2672305pfl.63.2022.11.18.01.19.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Nov 2022 01:19:11 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org
Subject: [PATCH for-8.0 6/7] hw/ppc: Use QEMU_IOTHREAD_LOCK_GUARD in
 ppc_set_irq
Date: Fri, 18 Nov 2022 01:18:57 -0800
Message-Id: <20221118091858.242569-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221118091858.242569-1-richard.henderson@linaro.org>
References: <20221118091858.242569-1-richard.henderson@linaro.org>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
Cc: qemu-ppc@nongnu.org
---
 hw/ppc/ppc.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
index dc86c1c7db..4e816c68c7 100644
--- a/hw/ppc/ppc.c
+++ b/hw/ppc/ppc.c
@@ -44,13 +44,9 @@ void ppc_set_irq(PowerPCCPU *cpu, int irq, int level)
 {
     CPUPPCState *env = &cpu->env;
     unsigned int old_pending;
-    bool locked = false;
 
     /* We may already have the BQL if coming from the reset path */
-    if (!qemu_mutex_iothread_locked()) {
-        locked = true;
-        qemu_mutex_lock_iothread();
-    }
+    QEMU_IOTHREAD_LOCK_GUARD();
 
     old_pending = env->pending_interrupts;
 
@@ -67,10 +63,6 @@ void ppc_set_irq(PowerPCCPU *cpu, int irq, int level)
 
     trace_ppc_irq_set_exit(env, irq, level, env->pending_interrupts,
                            CPU(cpu)->interrupt_request);
-
-    if (locked) {
-        qemu_mutex_unlock_iothread();
-    }
 }
 
 /* PowerPC 6xx / 7xx internal IRQ controller */
-- 
2.34.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6F0440B43
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 20:32:19 +0200 (CEST)
Received: from localhost ([::1]:49080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgt9P-0005Lb-0w
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 14:32:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgs1x-0001a6-KH
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:20:33 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:45804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgs1v-0002Fr-At
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:20:33 -0400
Received: by mail-pg1-x52c.google.com with SMTP id f5so12980217pgc.12
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 10:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=G7SBr/WksrEb3wfGw9+4/7HGKeZrYxUMshTizcIBHp0=;
 b=ha+vwqS490HsDFEQ0F/1pikVnMkJcrluXAED+0j3rqMv+we36g6BjtrpJwLnoSPAIT
 FkZCAY68jMp+tTFn0alRgo8/Lgi6V9bycGgXNpuGqGceN8EgnBwTagIHCrPQbSVBvKbO
 41fzzzIqKm6BjtjIkop8sGuOUm0KeJNm+yBG1JTvDzGEM/g/eEwZY+zytbT+Vx/zmkFa
 NcRKT4Qk85APgf/lviVO5DvxDdYb9xaDzQ1hK0gjYlc2NLbd3mknXaT4okU5Bx/iVGN7
 0cpQ8nac800QTPaZB4b7rml8FB0jBxdPA4Rv498EYNolXxcXXOErEn05u8IRuiPzmeGx
 x6Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G7SBr/WksrEb3wfGw9+4/7HGKeZrYxUMshTizcIBHp0=;
 b=fURRZ5kNYkBTfX5vwK4cpiyc/HMwaoxUE99SPDNlVBMbg9HploYmIgPxa8CJ7+hiHh
 xpNnhPGWJ2Fr/pxgFY5oR7uNi/xdToP6JNHx7fWf3pHaFpAbt6NDsJChpRR8eERXfZq5
 RT7qqqK5kUs790p9+WB/UVRCHcAP9hDQhZszxZOkcfwKkcY3Rx677N7vbP7dOvBbR2ru
 cbiDibNdeDdnfbzf/6KXhym8N4w0tj1TJm5m8vmVae/SIvOAjwPWGwUW+QxcnPsb7kbp
 fpguengEgglS+0wH7zGSYYY0LxOQ4yUb9kQdvVqqwRdDrV53mxliyOzlEpiUuU+eaQ9j
 Ntpw==
X-Gm-Message-State: AOAM533Zi7obj6lRc39KJ4O/3WuItBPwIQtEWGu+NB7F3d+os7M0V3Pb
 qoASI+dHQZRhA584vtSM2UxlbrkmRB3ejQ==
X-Google-Smtp-Source: ABdhPJy+vtVUOXSuebXNw9Z4HJI0c3YLZxOu4EIChRfPYT1nbDFKmevgAwB5yoipVIunJg/t6mGdUA==
X-Received: by 2002:a63:b241:: with SMTP id t1mr13676132pgo.154.1635614429261; 
 Sat, 30 Oct 2021 10:20:29 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id k14sm9584798pji.45.2021.10.30.10.20.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 10:20:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 57/66] accel/tcg: Report unaligned atomics for user-only
Date: Sat, 30 Oct 2021 10:16:26 -0700
Message-Id: <20211030171635.1689530-58-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211030171635.1689530-1-richard.henderson@linaro.org>
References: <20211030171635.1689530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: alex.bennee@linaro.org, laurent@vivier.eu, imp@bsdimp.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the new cpu_loop_exit_sigbus for atomic_mmu_lookup, which
has access to complete alignment info from the TCGMemOpIdx arg.

Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/user-exec.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index c4f69908e9..1ee64f01fc 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -474,11 +474,22 @@ static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
                                MemOpIdx oi, int size, int prot,
                                uintptr_t retaddr)
 {
+    MemOp mop = get_memop(oi);
+    int a_bits = get_alignment_bits(mop);
+    void *ret;
+
+    /* Enforce guest required alignment.  */
+    if (unlikely(addr & ((1 << a_bits) - 1))) {
+        MMUAccessType t = prot == PAGE_READ ? MMU_DATA_LOAD : MMU_DATA_STORE;
+        cpu_loop_exit_sigbus(env_cpu(env), addr, t, retaddr);
+    }
+
     /* Enforce qemu required alignment.  */
     if (unlikely(addr & (size - 1))) {
         cpu_loop_exit_atomic(env_cpu(env), retaddr);
     }
-    void *ret = g2h(env_cpu(env), addr);
+
+    ret = g2h(env_cpu(env), addr);
     set_helper_retaddr(retaddr);
     return ret;
 }
-- 
2.25.1



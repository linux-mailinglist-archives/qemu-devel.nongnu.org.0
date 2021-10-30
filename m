Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E62440AEB
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 20:11:33 +0200 (CEST)
Received: from localhost ([::1]:41700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgspI-0005dV-St
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 14:11:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgs1x-0001a7-OY
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:20:34 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:40579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgs1v-0002GT-Ex
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:20:33 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 n36-20020a17090a5aa700b0019fa884ab85so13062600pji.5
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 10:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MIsR5ntgtAsaxoJ+NtIU7qk3vK65x7GB6eb5bSAQ4NA=;
 b=j9FKfR1ccCUM+gIHVspWVzeJo0UmJ+5v4WsXAeIZcBukprR7Bqb5l0u6B+i1XIFpl/
 D0tdeXiA0DCPffT15di72bdT/Pa3+Jf0085u2WPlCISn7Mt8ptXGSsPTaWRYoQ381305
 7Be81toSeudq97EicGdIzEP90pjHaxGub68YbampX8XWG+liNTdxWboDHlv5pVtOYehO
 E0W9gHX0m9NXh6MLQa62Uqhr6JdQjipPMHJW79U8xKAAPk9sCm9CYoOqN9UHMNwISpCJ
 2L9+dwdGtMsuS6tjmKl5XKRZ895hqsU9vTrr2Q2fY4ZFjLDzl7hrv0vtlrBDmGACv0H7
 Vntg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MIsR5ntgtAsaxoJ+NtIU7qk3vK65x7GB6eb5bSAQ4NA=;
 b=Hss22LfFdgZ6rpAgCGnhtOoW5TjRKF0DyzngqN4e8fPlu7uf6cHJr88TW8Oyf8qso/
 ak+oAZ1wCnlJVnfjM30pMLx27tZjsakdcwLWi4E4wYkUWFzjZmZPucProd3j2zPxaeeZ
 vJMo1V+fdsEZ9gDsA9CCwme3a1ZOmfcexaJEoiqsXRRNeyl1GCcT4ETz038lX8sn6qWE
 dYDIfl01mjtKcZETgts5LeAUK5Sy2jfAUzTWhQnam2tv2DFy1blIbvhMEHcKq6yQwCMn
 9zADdvcEM/wno9DCAWH7Z3ZLHvVEEu8xkAm5Cko1XP6vYVbLEkcHlNjNB4wL4SwdNw+i
 wMJA==
X-Gm-Message-State: AOAM533pYvxE9PQ0oLuL6hOedIMPapa62pSMxRonWB913jtfNYWEH34+
 JVx0U+j2Ha+mzXSNIBB3IT+QwWBBz4pq8Q==
X-Google-Smtp-Source: ABdhPJzwfg2KD3uFXuS1cRma10SVHfSF817hWTRAxXY3gsG2z6K0j2GhMKt1VIoxNYGhNK35WFp3/w==
X-Received: by 2002:a17:902:e808:b0:140:55fe:1b4e with SMTP id
 u8-20020a170902e80800b0014055fe1b4emr15631702plg.87.1635614430147; 
 Sat, 30 Oct 2021 10:20:30 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id k14sm9584798pji.45.2021.10.30.10.20.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 10:20:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 58/66] accel/tcg: Report unaligned load/store for user-only
Date: Sat, 30 Oct 2021 10:16:27 -0700
Message-Id: <20211030171635.1689530-59-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211030171635.1689530-1-richard.henderson@linaro.org>
References: <20211030171635.1689530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, alex.bennee@linaro.org,
 laurent@vivier.eu, imp@bsdimp.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the new cpu_loop_exit_sigbus for cpu_mmu_lookup.

Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/user-exec.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 1ee64f01fc..aaf47d89d2 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -218,9 +218,14 @@ static void validate_memop(MemOpIdx oi, MemOp expected)
 static void *cpu_mmu_lookup(CPUArchState *env, target_ulong addr,
                             MemOpIdx oi, uintptr_t ra, MMUAccessType type)
 {
+    MemOp mop = get_memop(oi);
+    int a_bits = get_alignment_bits(mop);
     void *ret;
 
-    /* TODO: Enforce guest required alignment.  */
+    /* Enforce guest required alignment.  */
+    if (unlikely(addr & ((1 << a_bits) - 1))) {
+        cpu_loop_exit_sigbus(env_cpu(env), addr, type, ra);
+    }
 
     ret = g2h(env_cpu(env), addr);
     set_helper_retaddr(ra);
-- 
2.25.1



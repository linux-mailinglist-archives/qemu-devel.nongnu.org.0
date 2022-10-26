Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CEB360D92C
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 04:19:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onVtV-0004qY-SS; Tue, 25 Oct 2022 22:11:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVtL-0004gJ-D4
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:11:39 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVtJ-00013O-BF
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:11:38 -0400
Received: by mail-pf1-x431.google.com with SMTP id d10so13895957pfh.6
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 19:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cbu+XeGtZCwlJENuQOWLw8zlHTHpS+i5rpNgMNp+qA8=;
 b=one/8hid87nUEQI2d4fPIVuOkq7zfO/4f2pqZ9K2ab8tVEqrLIXFG5519cC+EKnSuo
 KkbrawDMSx7mqCFXSI3MhUcFjGRpwaROd/zQas9iCmfmsKxja3031Y3P1I/4GOPQfpib
 oezjQSHzwvEwezz+/uJj84Ydl++B3ciWod8OMNbApl/o+o73h0GsFgkmwKIiUAluVKPX
 Lw4/V7luoodUsdNY8BuQzuQr2M4+AqZlu/BqH3TQ4XgLNWpco7Ka/MDuV+88Uc3fN+rG
 GlnFzQ/BWV+ZJnYY9ty9edJBNRIe2PZGK4Kzk2bJWeuK3VsCmXJVxOFsIhiy3kViIgch
 9JKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cbu+XeGtZCwlJENuQOWLw8zlHTHpS+i5rpNgMNp+qA8=;
 b=UrdhSxmALw4YdRpBZaigIccnWhHkfcNDWqeyMzWmA+YKml5nZYu4YYZe/7EH27a4ID
 NK4O0rXSi5jHZ16BqFTvYRf019NeVsUaa6N2yJt7NXlIYHDqoWdguwt6PSs7ptDK6i+G
 F/rtDrZ+8OyXZF5J/3KHfNIQpOtHh9IaM7GYfNQEjx+YoS+lhQsMIoXdBPWJCz8Nl+J3
 vupzPtNZwaaHjo+c5DFj8OYpsEIl2SL4mnCi9dngjV3aW8cb1PYvIWPgE7cKc5FiY1H1
 KndcGtxuSAa4DX1FO/mpNJIr0ibCrUQ6QAAe4UDB9qpH+yCJ64NaR5z69Z7/pVDzFqic
 f6Rg==
X-Gm-Message-State: ACrzQf3jG6pRZxtdo6lYXPBuVEP6EKmrm0nZQBIUA1M+eY5SRlMibYZK
 OrojxBFX4vfIKstJtktKs/2VQmaolgaUjRxD
X-Google-Smtp-Source: AMsMyM6dP5hx/86GjXgMhNMGOT4Vx2Q7x+2iCFG/AKH9+9IHTHIYtqwg17rWc3AFL7jzoBUahVGwvw==
X-Received: by 2002:a05:6a00:178a:b0:563:7ada:f70 with SMTP id
 s10-20020a056a00178a00b005637ada0f70mr41848574pfg.69.1666750295917; 
 Tue, 25 Oct 2022 19:11:35 -0700 (PDT)
Received: from stoup.hotspotlogin.services ([103.100.225.182])
 by smtp.gmail.com with ESMTPSA id
 o29-20020a635d5d000000b0043c9da02729sm1897833pgm.6.2022.10.25.19.11.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 19:11:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
	Leandro Lupori <leandro.lupori@eldorado.org.br>
Subject: [PULL 04/47] accel/tcg: Add a quicker check for breakpoints
Date: Wed, 26 Oct 2022 12:10:33 +1000
Message-Id: <20221026021116.1988449-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221026021116.1988449-1-richard.henderson@linaro.org>
References: <20221026021116.1988449-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Leandro Lupori <leandro.lupori@eldorado.org.br>

Profiling QEMU during Fedora 35 for PPC64 boot revealed that a
considerable amount of time was being spent in
check_for_breakpoints() (0.61% of total time on PPC64 and 2.19% on
amd64), even though it was just checking that its queue was empty
and returning, when no breakpoints were set. It turns out this
function is not inlined by the compiler and it's always called by
helper_lookup_tb_ptr(), one of the most called functions.

By leaving only the check for empty queue in
check_for_breakpoints() and moving the remaining code to
check_for_breakpoints_slow(), called only when the queue is not
empty, it's possible to avoid the call overhead. An improvement of
about 3% in total time was measured on POWER9.

Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20221025202424.195984-2-leandro.lupori@eldorado.org.br>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cpu-exec.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index f9e5cc9ba0..bb4b9e92ce 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -304,16 +304,12 @@ static void log_cpu_exec(target_ulong pc, CPUState *cpu,
     }
 }
 
-static bool check_for_breakpoints(CPUState *cpu, target_ulong pc,
-                                  uint32_t *cflags)
+static bool check_for_breakpoints_slow(CPUState *cpu, target_ulong pc,
+                                       uint32_t *cflags)
 {
     CPUBreakpoint *bp;
     bool match_page = false;
 
-    if (likely(QTAILQ_EMPTY(&cpu->breakpoints))) {
-        return false;
-    }
-
     /*
      * Singlestep overrides breakpoints.
      * This requirement is visible in the record-replay tests, where
@@ -374,6 +370,13 @@ static bool check_for_breakpoints(CPUState *cpu, target_ulong pc,
     return false;
 }
 
+static inline bool check_for_breakpoints(CPUState *cpu, target_ulong pc,
+                                         uint32_t *cflags)
+{
+    return unlikely(!QTAILQ_EMPTY(&cpu->breakpoints)) &&
+        check_for_breakpoints_slow(cpu, pc, cflags);
+}
+
 /**
  * helper_lookup_tb_ptr: quick check for next tb
  * @env: current cpu state
-- 
2.34.1



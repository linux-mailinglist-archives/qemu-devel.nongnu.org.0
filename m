Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73CC01FD6B5
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Jun 2020 23:09:05 +0200 (CEST)
Received: from localhost ([::1]:55070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlfIu-0003DM-Ds
	for lists+qemu-devel@lfdr.de; Wed, 17 Jun 2020 17:09:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.foley@linaro.org>)
 id 1jlfDd-0002lr-Vl
 for qemu-devel@nongnu.org; Wed, 17 Jun 2020 17:03:38 -0400
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842]:45562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <robert.foley@linaro.org>)
 id 1jlfDT-0008Qe-LQ
 for qemu-devel@nongnu.org; Wed, 17 Jun 2020 17:03:37 -0400
Received: by mail-qt1-x842.google.com with SMTP id y1so2729877qtv.12
 for <qemu-devel@nongnu.org>; Wed, 17 Jun 2020 14:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1vOKTGG7r7jNUJaDxhAJRyKeVBws+iqtlbFnw8ux2yw=;
 b=PeGyUbkMI3pOovZHdFQmrpdylYHtgbPgM8pdzXFMziKQBbXZESlYWjeDUsk0obRFiW
 L/GIlCYWa8t8oC89L0YJUU193J4kaI5MUCJ8qWlAqlafFUb/VO33UorfmUoQVr+yC81h
 KcZ2GuYzSxNusMV94s/DiqFkdKk0I0Ivg7e3YRLWPv85ca4uUDg708A2YTohk1kthvE+
 Mb8ueMsV9nkWgyPHta5gzyNpm6/boxqx1F7oT4tqNxo7SupapHvRcB3bZtHJOuJdjDYz
 aOEeS1pU7Ssn1SSvx8H278xuzlTKYzWAWS9znoK6wRe4zKqjQWb/gtViyXjG/am7ctZh
 9iJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1vOKTGG7r7jNUJaDxhAJRyKeVBws+iqtlbFnw8ux2yw=;
 b=bXGKVMdCFTAdxGfeIVbi5ufUnXGBtiQfxiEq1I7bvNhwrX6a5nCqm9lhTsE+l+/gfe
 ehB5d+w7odjE5Mp6o0HdMdqcZkNK6Yx4i5rRVQJmbknUfqFkgOyfpqBe/4vFAARKaeMk
 sdQz3EJIrF1aoXcwRkaiCVz7WmMewf0Q/LCx8potE3zwadnZ9yyMcjDDoYExqux4Xe43
 MhHNg1KENtJEw2mE3IVfAuFg2eku8iJmgDNEgvUi86jAmymS9004f2wGkwHSCTTYp77Z
 78N1Sa70xvjc6dSLb5JAzcXMD2ID+qOqCYEiuQODPKbM0p6EEErAVcURAc10vLbp8M8a
 yEUg==
X-Gm-Message-State: AOAM533vRQAIwDzOEQ3t0dOh1G4+ez0qWw8t+F8/0KltVaTbPTai28fK
 otOfOz6sJ2u0iq4NHUAZmnhaXZ5Ujzy18A==
X-Google-Smtp-Source: ABdhPJxpQKjxJwdDw0860st385fV8/3BS2Ebhr+sfq6RjYBO9NXKsEs2YOViP5e6JfLJGTuBgqlI0Q==
X-Received: by 2002:aed:3f55:: with SMTP id q21mr1146781qtf.190.1592427805826; 
 Wed, 17 Jun 2020 14:03:25 -0700 (PDT)
Received: from Rfoley-MA01.hsd1.ma.comcast.net
 ([2601:199:4480:60c0:fc79:714c:9711:2e9c])
 by smtp.gmail.com with ESMTPSA id w13sm997245qkb.91.2020.06.17.14.03.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 14:03:25 -0700 (PDT)
From: Robert Foley <robert.foley@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v10 07/73] tcg-runtime: define helper_cpu_halted_set
Date: Wed, 17 Jun 2020 17:01:25 -0400
Message-Id: <20200617210231.4393-8-robert.foley@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200617210231.4393-1-robert.foley@linaro.org>
References: <20200617210231.4393-1-robert.foley@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::842;
 envelope-from=robert.foley@linaro.org; helo=mail-qt1-x842.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: robert.foley@linaro.org, cota@braap.org,
 Paolo Bonzini <pbonzini@redhat.com>, peter.puhov@linaro.org,
 alex.bennee@linaro.org, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Emilio G. Cota" <cota@braap.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Emilio G. Cota <cota@braap.org>
Signed-off-by: Robert Foley <robert.foley@linaro.org>
---
 accel/tcg/tcg-runtime.c | 7 +++++++
 accel/tcg/tcg-runtime.h | 2 ++
 2 files changed, 9 insertions(+)

diff --git a/accel/tcg/tcg-runtime.c b/accel/tcg/tcg-runtime.c
index 446465a09a..32ec18fe40 100644
--- a/accel/tcg/tcg-runtime.c
+++ b/accel/tcg/tcg-runtime.c
@@ -168,3 +168,10 @@ void HELPER(exit_atomic)(CPUArchState *env)
 {
     cpu_loop_exit_atomic(env_cpu(env), GETPC());
 }
+
+void HELPER(cpu_halted_set)(CPUArchState *env, uint32_t val)
+{
+    CPUState *cpu = env_cpu(env);
+
+    cpu->halted = val;
+}
diff --git a/accel/tcg/tcg-runtime.h b/accel/tcg/tcg-runtime.h
index 4eda24e63a..eb7af0e6f0 100644
--- a/accel/tcg/tcg-runtime.h
+++ b/accel/tcg/tcg-runtime.h
@@ -28,6 +28,8 @@ DEF_HELPER_FLAGS_1(lookup_tb_ptr, TCG_CALL_NO_WG_SE, ptr, env)
 
 DEF_HELPER_FLAGS_1(exit_atomic, TCG_CALL_NO_WG, noreturn, env)
 
+DEF_HELPER_FLAGS_2(cpu_halted_set, TCG_CALL_NO_RWG, void, env, i32)
+
 #ifdef CONFIG_SOFTMMU
 
 DEF_HELPER_FLAGS_5(atomic_cmpxchgb, TCG_CALL_NO_WG,
-- 
2.17.1



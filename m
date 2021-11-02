Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23033442D7A
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 13:04:19 +0100 (CET)
Received: from localhost ([::1]:59790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhsWY-00011f-A7
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 08:04:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhrhI-0001gG-Jk
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:11:20 -0400
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e]:43691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhrhF-00021W-5q
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:11:18 -0400
Received: by mail-qt1-x82e.google.com with SMTP id 8so986711qty.10
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 04:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MIsR5ntgtAsaxoJ+NtIU7qk3vK65x7GB6eb5bSAQ4NA=;
 b=idtZ3bpWwOwDhGsa6Tp4Y07D2p7fu5keQIByYmeHsYQ8rjwyhhu8eCDyEzMdlMOGo3
 AO5RQ7cCTvAYgtB9iXFu5FbuxH5Gm6CdVt9mcj2fyVV+ceXk3ybqz3KSZWpwm+VEo5wt
 n4zO+bhbQ8M+ZnNQp3JFJWLUDX3JXJJii0tI54VP7/CavHVo01rKimcJgrIBzEjbUgYZ
 RGhnP7CKdBql5goDmvXk04ddw6BZeXUHzpyEKzRBQ4o2SHdezuM5Pf+PCXoqN+OxfNag
 0u1eU53lVwVKwlueWRmc3bLPZilHi93/comh1uz6bmNBGE8Rq+YT+7BhktMFdrclb7nI
 amCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MIsR5ntgtAsaxoJ+NtIU7qk3vK65x7GB6eb5bSAQ4NA=;
 b=DI1Ga0z7wuendmfiSSv5KgJa74eM0XaTxJ/HtyCIt2oZMZeRhku/3DLEQtTXUCh2xg
 dpWDok0DFei141YdrOksJUpSUNtB3vz+He3JTGaLEtZ8iEagSzZfLkavLNefS0FfkiFi
 dv3lpV3c+8lPKRNrrE1VrcU6I9DuifLED9vKZdbWskLJFkmp3degbDiFB8zwreJ4wYuF
 o/5CrPqNDfAA8yD8gE1Ufgg0j3sb6KElrLiq96C8RDEDWkq4OgY5nXgBwgZlSb2PkmIe
 E2Gbj+VsmdVMsPs5dMXgw2mdU28R/8kqGokGkWqGmymk3vhYCQtMqfuxoQurjnUcuVBU
 4W8Q==
X-Gm-Message-State: AOAM5335mVuYMXZzuvCPeKrGcZPEIHNX4A67ELXpcF8LaQKGpUfLKGqL
 Ax7IhsYwnXQ80rE7G+KH3sSao7t9y6x4FQ==
X-Google-Smtp-Source: ABdhPJxNESCzHQbmUOceW/4KvcE+sz0PEYjEkXP+XL0L4kBBfFjZumAwXaMP3GlZ8yr7JKaqpKUi3A==
X-Received: by 2002:ac8:5e49:: with SMTP id i9mr36082947qtx.145.1635851476337; 
 Tue, 02 Nov 2021 04:11:16 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id bm25sm12730854qkb.4.2021.11.02.04.11.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 04:11:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 58/60] accel/tcg: Report unaligned load/store for user-only
Date: Tue,  2 Nov 2021 07:07:38 -0400
Message-Id: <20211102110740.215699-59-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211102110740.215699-1-richard.henderson@linaro.org>
References: <20211102110740.215699-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82e.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Warner Losh <imp@bsdimp.com>
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



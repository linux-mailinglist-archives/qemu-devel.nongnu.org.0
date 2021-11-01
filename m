Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7553D441FFA
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 19:23:35 +0100 (CET)
Received: from localhost ([::1]:37554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhby2-0004Kv-Ic
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 14:23:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb9H-0008DJ-Un
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:31:08 -0400
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832]:46015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb9G-0001G7-0T
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:31:07 -0400
Received: by mail-qt1-x832.google.com with SMTP id r2so15244621qtw.12
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 10:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MIsR5ntgtAsaxoJ+NtIU7qk3vK65x7GB6eb5bSAQ4NA=;
 b=wvE/eYX9Qyng6ZlBHRzu+Ez/di3OPcag/lccP/vgQGCh9A/I1V1oSGMAZNZoqBc29I
 NIDEOt9oD18caUnxwnWGp1uVvTKcaFJ1Ym/9UovK5RCJQrHxxXUXQYXLnJ6QNPzYX1bJ
 omlK1pjom3TDe1GYG0hA2hro1h94LyZW1Wj5yn9jhlFWjp1ipo8V50s9wVHdvfhHbSQE
 aQFbiX3in7azYYu9XRdbAJfwRefkIkIRbwb98xvE+ze3KcNQqbICM6yvGX2CKeY8wrzy
 IOq1q2w11hcUb9O4S6/M8uwO4OngFaC7aX9vrL9pQ7G9aBrys04mk4uNudc4uDuE6PGR
 SsqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MIsR5ntgtAsaxoJ+NtIU7qk3vK65x7GB6eb5bSAQ4NA=;
 b=k7mXIdLWVIs5x6lvoNdRu7fUQLXlVJMqaL/m2aMuHrAQIYIYQailRJFScbQtQCUE8b
 Mwr1mPnd3dAXa7L/Xp/O9+BD+72259lFOABLCIQcUIvTwBj+blU3NaWEKnY6RZVHRurA
 uV4ilbIq5s+tcHecNL/FzdAAHhlKGKjj9YLQ64abJ+TA1gSYbtwo3gF0VAeFroSa6JC5
 HRHicit5KS4qeTM5AFVhiDwW4PrY0l2XkeE334Yh5pJfdUbCYks8d32SpOfufm78n+h7
 xZxJSDOx0QkaTnDJAYIwrV1Kdef8k7UfsWKWsXBKx7mRKuR7EiXYdwmo+mnaVJZrhA31
 H5Iw==
X-Gm-Message-State: AOAM531emFsFwXOUbrGSP3eT5b92rnjpZ55/R00v5lqlk4FHj+s5RlrX
 j+yes8Zzm5YkdPwV7SvJiBHhd024bSLeLg==
X-Google-Smtp-Source: ABdhPJxK0QNJlMcSseGIw3Wii3/g+pRpE++4tNoowhfXH4PyNutb9AhY2j0dxqB5XkUEPm2lzoJCtQ==
X-Received: by 2002:a05:622a:1007:: with SMTP id
 d7mr7855829qte.233.1635787865136; 
 Mon, 01 Nov 2021 10:31:05 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id 13sm1222289qkc.40.2021.11.01.10.31.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 10:31:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 58/60] accel/tcg: Report unaligned load/store for user-only
Date: Mon,  1 Nov 2021 13:27:27 -0400
Message-Id: <20211101172729.23149-59-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211101172729.23149-1-richard.henderson@linaro.org>
References: <20211101172729.23149-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::832;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x832.google.com
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



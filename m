Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A07993017EA
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 19:56:38 +0100 (CET)
Received: from localhost ([::1]:39150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3O5N-00036X-MP
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 13:56:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l3Nzd-0005Hn-2e
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 13:50:41 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:32960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l3Nzb-0008Hx-9H
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 13:50:40 -0500
Received: by mail-pl1-x631.google.com with SMTP id b8so5180547plx.0
 for <qemu-devel@nongnu.org>; Sat, 23 Jan 2021 10:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JMOpMnB2EIi71uPv++zJqhVu0CRBzaOh+TyvyTqEpP4=;
 b=Qpe+hYsDUnN7hD8gUuwcBxbSZmd3H8KlL6lX5WxrSee1LohaeWZzuXCyzhomdzHBYG
 n+3XO4XpFh61DWI0rwNuf3W3STTt5jGhHT0cWGa/jMsXSHfvNXu7BxXF6Q9jOWT/sd/2
 Ks8weu1RGsejYnQoCfuDweVlRugS17TgdIQmBipPLgrYFHn2Zcyz3gGKbisphrIYd5ce
 B7yzm6b593oYc8NSdI8p+NkJUW2y1FgBVYz6fRe5LXbkk3vy/4AGZEFszf6lcont4Rwf
 qltt+dB9e7eeQYizHbKllVIWKIZ7KtLPt0bphrItweqHHDU0O0IyhPrYNj4caFuLtdO6
 S5dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JMOpMnB2EIi71uPv++zJqhVu0CRBzaOh+TyvyTqEpP4=;
 b=eTHNKYaJEPKcRfmMFHWuubiUba/U/zq+C0wb53gZeFPAT5efiASiKZLgsQrdIvz65G
 hGaM9zlYEYAxXvs820gaoif0dD287C78W1UUsOCk1GvlfF2ytleqM88vYUQqHevvrEd8
 cAL9wTUdlJI7gjBe3tS+AVNSqh9RNTTjRvez3XG5l6+AJgqOJASJlJ22B2lNyPBaRZ+G
 vd+XePGdXqAj5vSdzNmdD0UPa6KWvmKlRQfQN0adgSIOsnsynVgWAz2xAo1lq1TC6+VQ
 shu7ee8qL8BMNi5WPKMLuYWj1sgXpwLUFZVQt62WBfKuT2d1Wa4YN4YUoEiXkUZ5QEsx
 2dbQ==
X-Gm-Message-State: AOAM530n6j0WX0J5oXONCziO/e7NfziYpCoPEb6Fc8Jzp/vFZ7JobH5i
 aQxa8K4gSx256y2nVtiQDHbYWuEwJ7/oWg==
X-Google-Smtp-Source: ABdhPJx6GMr2+Q9F1KyEIdclaamEv4R8R/+Kw6WpB6SUqpJR5MMO9FDU9MLq3S4gDoRS9OLycQiCFw==
X-Received: by 2002:a17:902:bd03:b029:df:cfe6:3444 with SMTP id
 p3-20020a170902bd03b02900dfcfe63444mr1677681pls.24.1611427837456; 
 Sat, 23 Jan 2021 10:50:37 -0800 (PST)
Received: from localhost.localdomain (cpe-66-75-72-126.hawaii.res.rr.com.
 [66.75.72.126])
 by smtp.gmail.com with ESMTPSA id j19sm5018614pfn.14.2021.01.23.10.50.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jan 2021 10:50:36 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/10] accel/tcg: Declare missing cpu_loop_exit*() stubs
Date: Sat, 23 Jan 2021 08:50:18 -1000
Message-Id: <20210123185020.1766324-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210123185020.1766324-1-richard.henderson@linaro.org>
References: <20210123185020.1766324-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

cpu_loop_exit*() functions are declared in accel/tcg/cpu-exec-common.c,
and are not available when TCG accelerator is not built. Add stubs so
linking without TCG succeed.

Problematic files:

- hw/semihosting/console.c in qemu_semihosting_console_inc()
- hw/ppc/spapr_hcall.c in h_confer()
- hw/s390x/ipl.c in s390_ipl_reset_request()
- hw/misc/mips_itu.c

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210117164813.4101761-5-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/stubs/tcg-stub.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/accel/stubs/tcg-stub.c b/accel/stubs/tcg-stub.c
index 8c18d3eabd..2304606f8e 100644
--- a/accel/stubs/tcg-stub.c
+++ b/accel/stubs/tcg-stub.c
@@ -28,3 +28,13 @@ void *probe_access(CPUArchState *env, target_ulong addr, int size,
      /* Handled by hardware accelerator. */
      g_assert_not_reached();
 }
+
+void QEMU_NORETURN cpu_loop_exit(CPUState *cpu)
+{
+    g_assert_not_reached();
+}
+
+void QEMU_NORETURN cpu_loop_exit_restore(CPUState *cpu, uintptr_t pc)
+{
+    g_assert_not_reached();
+}
-- 
2.25.1



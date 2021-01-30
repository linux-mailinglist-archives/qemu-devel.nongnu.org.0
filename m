Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B86C930915F
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Jan 2021 02:55:18 +0100 (CET)
Received: from localhost ([::1]:42650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5fTp-0001NZ-RN
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 20:55:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l5fRw-0007s2-33; Fri, 29 Jan 2021 20:53:20 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:35800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l5fRu-0000F4-FX; Fri, 29 Jan 2021 20:53:19 -0500
Received: by mail-wr1-x431.google.com with SMTP id l12so10637671wry.2;
 Fri, 29 Jan 2021 17:53:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sHwmePAwBZnB/6MQG332p6aeurp1aOW9YUVHNzJgQQk=;
 b=HJZc1PSaje6m+L7668kBqPcK1wBm9CBsKO2kC1XrobpTcPPnHU6ITs11hbUl/YKjbc
 DzmcMbtXJnzP6jZlLgdJWwpTlE27nSIkIGsIVBfAmCGKQgMB/xWkVmaOqqSFYsifLlUd
 43jJZWsgGnfdPJBE8xZg+aMXkJ51DSQ7epXkB4qfmO1Rp1YXYWGGo76hopz0wEqPZD4D
 B0dQ+lKuMROs0W/ZONElGdzV5hnhFvdWMUgJODm2C2Sdaq2e81ytYWHR/5xXLEXTV9v9
 iQCHMX91/noURZa+VVbdTq8Y8AIgbZ7bd2E4fXynsrlRzci32qoKpvpXMMtBXeUyxVrN
 GbZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=sHwmePAwBZnB/6MQG332p6aeurp1aOW9YUVHNzJgQQk=;
 b=jaT4L8Tc/o6+N1E0kmmFfkfd1c/NxexiTu9gKKA2SinBECtvZFL7pB/KHym40NYtep
 V0UZiLLdwVm4bASl+ZuRHx1aaukFMH0TuBguuNtcaPDn/G0tXRj5uFTqXKWxAO1+bps/
 LoQbT48qGn2HRPgE90o9cB9BNQWAojof7F8h4dTrxUJkCmz0Ea4f9K5P9+2jTJObLbw+
 8TXBRyiXXcMHm1jSPh1mUus/I9GeSoGnEDkLavpiaH5z25c+m9pi3mi7Gc/B6rGKKc2J
 n29dchB9FTaN/RegfYwOj+2Y7bzDzZo4v0QA6g17aP0bPcz8Mx6CDFMRg7AUxcrmCC6Z
 xIQg==
X-Gm-Message-State: AOAM531aO7mL5H1FZ83hXaVQi11QPDi9XFevacKAblIG6o4c5ELlNuv2
 WlnPjIqEvHT/gPYY5Jac4nWs8n5YPTg=
X-Google-Smtp-Source: ABdhPJytRdW5ApRmNTPnsqDHD7BiuYa2AbAtlk3vbvJPE6VBSMcsUQvRsWX8iwp2BHbkvB+QsXhcxg==
X-Received: by 2002:adf:d4ce:: with SMTP id w14mr7095039wrk.89.1611971596601; 
 Fri, 29 Jan 2021 17:53:16 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id p18sm10429022wrx.84.2021.01.29.17.53.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 17:53:16 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 09/11] target/arm: Reorder meson.build rules
Date: Sat, 30 Jan 2021 02:52:25 +0100
Message-Id: <20210130015227.4071332-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210130015227.4071332-1-f4bug@amsat.org>
References: <20210130015227.4071332-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, kvm@vger.kernel.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Reorder the rules to make this file easier to modify.
No logical change introduced in this commit.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/arm/meson.build | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index 6c6081966cd..aac9a383a61 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -14,31 +14,36 @@
 
 arm_ss = ss.source_set()
 arm_ss.add(gen)
+arm_ss.add(zlib)
 arm_ss.add(files(
   'cpu.c',
-  'crypto_helper.c',
-  'debug_helper.c',
   'gdbstub.c',
   'helper.c',
+  'vfp_helper.c',
+))
+
+arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
+  'cpu64.c',
+  'gdbstub64.c',
+))
+
+arm_ss.add(files(
+  'crypto_helper.c',
+  'debug_helper.c',
   'iwmmxt_helper.c',
   'neon_helper.c',
   'op_helper.c',
   'tlb_helper.c',
   'translate.c',
   'vec_helper.c',
-  'vfp_helper.c',
   'cpu_tcg.c',
 ))
-arm_ss.add(zlib)
-
 arm_ss.add(when: 'CONFIG_ARM_V7M', if_true: files('m_helper.c'), if_false: files('m_helper-stub.c'))
 arm_ss.add(when: 'CONFIG_TCG', if_false: files('m_helper-stub.c'))
 
 arm_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c', 'kvm64.c'), if_false: files('kvm-stub.c'))
 
 arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
-  'cpu64.c',
-  'gdbstub64.c',
   'helper-a64.c',
   'mte_helper.c',
   'pauth_helper.c',
-- 
2.26.2



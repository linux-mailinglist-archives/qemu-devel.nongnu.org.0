Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5723D8B9A
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 12:19:38 +0200 (CEST)
Received: from localhost ([::1]:32988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8gf3-0000it-F1
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 06:19:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laramglazier@gmail.com>)
 id 1m8gd9-0007sg-KZ
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 06:17:39 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:41590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <laramglazier@gmail.com>)
 id 1m8gd6-00071X-Ui
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 06:17:38 -0400
Received: by mail-ej1-x62e.google.com with SMTP id x11so2777622ejj.8
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 03:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MJtquZF+BXJdOTj8OvvrrkTQh3k4bYbK1E7DSOL1bEc=;
 b=YRxKOkZAYw47mS8LNxouv2Vq5iA+d6hRN2CmFsaJI73FafQGP8VATc88AgxSFCvQjX
 aZxcMuwyfN/T7dss+bmZG6P1o60kLds/X7SeZwmAWP4suGQ1WKq3AgZaDOtbNxrG/2yd
 vbVFPgvuajycCkT6IxZMJHQHQ2niPd4UbyqybQU1JRW6L1WQ9t+j0rXQsUeSI5u7ri2r
 YfAjE51wRDGWBVuR5HAwcjwEQtHj2itCwiW1OwzRyMAsj3r15tmS3oiTG9sS4Ke2FVNk
 iiZwA224de8KiDyL6KsJDB7/SF5GZm6/j46ayDivpM/HuhnXKUOePvDv93JulQ/Wl0bb
 WVFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MJtquZF+BXJdOTj8OvvrrkTQh3k4bYbK1E7DSOL1bEc=;
 b=Vvco66ZfvsU96caRar4UZuZp1sEIFDgh+ET/0+BpdNUGxEZGP+ULgM0wirdXfLCgpJ
 6xyGj0JthTDDBF/uZ679xp2We2jUkCma5stxspzRMsX/kxbwgLeUsgvMhrNDgzwZfLQO
 URs1QtffvaRoUxLeVbhcrdYqxGDB5IMpdhtssYtGB/s8uNOzBoEGlDXW/vEXL7ok/lSB
 WAVmz53eNIrnW+Pg6T7awi3IqU1NJjYh0LFJtioYCzeHfjnL2IjCj4adw6P2tU0j49kw
 Vl4x4sXNpDVdn/6ZNm8rhqj3EzQWqfWkQuFa4MxC+C0DWSGGVq8SfLyZJKRFQqcrgLhr
 5GTA==
X-Gm-Message-State: AOAM530IG2w9Mv5s6dKhJO2fSIlyLaIX3tegIXx/vkIz6zepBkcMHeip
 +uzrj1dneflEZ8HAnwmqT4wL3gWxRQSRQQ==
X-Google-Smtp-Source: ABdhPJx8sItlK2Ji5y7y1euL9bDxnw/RORW+UvQFlV3sD/ZlLhDZGwK3AQ8xYkL8r2HOFBQXHuLZbQ==
X-Received: by 2002:a17:906:4917:: with SMTP id
 b23mr7948016ejq.468.1627467454426; 
 Wed, 28 Jul 2021 03:17:34 -0700 (PDT)
Received: from localhost.localdomain (93-38-168-93.ip71.fastwebnet.it.
 [93.38.168.93])
 by smtp.gmail.com with ESMTPSA id hd32sm582089ejc.106.2021.07.28.03.17.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 03:17:34 -0700 (PDT)
From: Lara Lazier <laramglazier@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] target/i386: Added V_INTR_PRIO check to virtual interrupts
Date: Wed, 28 Jul 2021 12:17:21 +0200
Message-Id: <20210728101721.26712-1-laramglazier@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=laramglazier@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: pbonzini@redhat.com, Lara Lazier <laramglazier@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v1->v2: Fixed Mask

The APM2 states that The processor takes a virtual INTR interrupt
if V_IRQ and V_INTR_PRIO indicate that there is a virtual interrupt pending
whose priority is greater than the value in V_TPR.

Signed-off-by: Lara Lazier <laramglazier@gmail.com>
---
 target/i386/tcg/sysemu/svm_helper.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/target/i386/tcg/sysemu/svm_helper.c b/target/i386/tcg/sysemu/svm_helper.c
index 72ea7c9a08..a3138e9f86 100644
--- a/target/i386/tcg/sysemu/svm_helper.c
+++ b/target/i386/tcg/sysemu/svm_helper.c
@@ -65,6 +65,16 @@ static inline void svm_load_seg_cache(CPUX86State *env, hwaddr addr,
                            sc->base, sc->limit, sc->flags);
 }
 
+static inline bool ctl_has_irq(uint32_t int_ctl)
+{
+    uint32_t int_prio;
+    uint32_t tpr;
+
+    int_prio = (int_ctl & V_INTR_PRIO_MASK) >> V_INTR_PRIO_SHIFT;
+    tpr = int_ctl & V_TPR_MASK;
+    return (int_ctl & V_IRQ_MASK) && (int_prio >= tpr);
+}
+
 static inline bool is_efer_invalid_state (CPUX86State *env)
 {
     if (!(env->efer & MSR_EFER_SVME)) {
@@ -365,7 +375,6 @@ void helper_vmrun(CPUX86State *env, int aflag, int next_eip_addend)
 
     if (ctl_has_irq(int_ctl)) {
         CPUState *cs = env_cpu(env);
-
         cs->interrupt_request |= CPU_INTERRUPT_VIRQ;
     }
 
-- 
2.25.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF1655E5CF
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 17:50:38 +0200 (CEST)
Received: from localhost ([::1]:52398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6DU5-0005W8-Iv
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 11:50:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o6DR4-00039Q-G7
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 11:47:31 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:36528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o6DR2-0001bl-Gv
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 11:47:30 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 i67-20020a1c3b46000000b003a03567d5e9so8051650wma.1
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 08:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JiuCEj2xQ/c91sEvynV74DJKiJu/V4mqw+6nB9+yEdQ=;
 b=yIwrxxkqNwYp5yvOoY7x8EVXbRsTBpnyK+IhgM96oI1uveIrHgG6Dvtcop0hRfJHYa
 BC25xhr14SEUY/n0XgXlJ/PN4hxC08AbQZKHKqZTuxq6/Le9VqsV6fvEnVTQPewoUYC1
 hvTr3E4V6oAM8UDT33vTqALQTl0p+LEjJA5dRHU/vZnzOYoj7Whz1tZ8/unOhkcjt9S4
 0iAfneP18EtJy4m6MNze6tUNrW/F1n+K0hhJpSF8YWTsYnZT5vB7EXleCW4moIsoymXX
 h+z3Ag0LEr1BPsXJNFjEkIuu/UxkkVc8GUkC8P3B5kF2KuSLuQ9CqEQMZhm32obIDx+O
 K4YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JiuCEj2xQ/c91sEvynV74DJKiJu/V4mqw+6nB9+yEdQ=;
 b=T59/ogZTXw3lRdxpxRb+Hi+oX8+AhTYAZkwTpfXXcbRhCrFgfivIgw3K9+SONYpehz
 GtyxfOu1UewSyA+jtofEY3Nf6dUVxobTMmWX2RWS3VrSphFnNQDI2dkGITq7GJUAWXLq
 vSVNe6ijJiv7OjldPpgwA/sG05CgxK3ZBQd/mZeWWW0ent1ELYf8Vzg9Q10/55/8v2WH
 D+hKgC9S3ccVlhbqqpuj2/lSQn4HNyBffdiH+L6X94zkjiwxn/vLwqts+7ME8sQKHzbO
 98LQX/wpKGD9zNGq51XR9uGQBNyZwFaFYVV+gk/8slI85GLGP6mD2oeSOsaV/QGcPDNn
 4/QQ==
X-Gm-Message-State: AJIora9dBdsDz0VuTOnKYDFqdFWZLI1fAi+B7Ye7Q/laMdQW+72iHwIh
 ZXGfTB82Pzd47SXUNSw0INR+Nw==
X-Google-Smtp-Source: AGRyM1tyfGP+zZKgSGPnFu+v8PX+9gtzEn0jrsliCOkjSGC8gA4zJl3/pUZPGVWwxrU0KbPOmir/FA==
X-Received: by 2002:a05:600c:1d25:b0:3a0:4cc8:f644 with SMTP id
 l37-20020a05600c1d2500b003a04cc8f644mr261764wms.121.1656431246985; 
 Tue, 28 Jun 2022 08:47:26 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 t3-20020a0560001a4300b0021b9cc87aa9sm14231990wry.111.2022.06.28.08.47.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 08:47:26 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Igor=20Kotrasi=C5=84ski?= <i.kotrasinsk@samsung.com>
Subject: [PATCH] hw/intc/armv7m_nvic: ICPRn must not unpend an IRQ that is
 being held high
Date: Tue, 28 Jun 2022 16:47:24 +0100
Message-Id: <20220628154724.3297442-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In the M-profile Arm ARM, rule R_CVJS defines when an interrupt should
be set to the Pending state:
 A) when the input line is high and the interrupt is not Active
 B) when the input line transitions from low to high and the interrupt
    is Active
(Note that the first of these is an ongoing condition, and the
second is a point-in-time event.)

This can be rephrased as:
 1 when the line goes from low to high, set Pending
 2 when Active goes from 1 to 0, if line is high then set Pending
 3 ignore attempts to clear Pending when the line is high
   and Active is 0

where 1 covers both B and one of the "transition into condition A"
cases, 2 deals with the other "transition into condition A"
possibility, and 3 is "don't drop Pending if we're already in
condition A".  Transitions out of condition A don't affect Pending
state.

We handle case 1 in set_irq_level(). For an interrupt (as opposed
to other kinds of exception) the only place where we clear Active
is in armv7m_nvic_complete_irq(), where we handle case 2 by
checking for whether we need to re-pend the exception. For case 3,
the only places where we clear Pending state on an interrupt are in
armv7m_nvic_acknowledge_irq() (where we are setting Active so it
doesn't count) and for writes to NVIC_CPSRn.

It is the "write to NVIC_ICPRn" case that we missed: we must ignore
this if the input line is high and the interrupt is not Active.
(This required behaviour is differently and perhaps more clearly
stated in the v7M Arm ARM, which has pseudocode in section B3.4.1
that implies it.)

Reported-by: Igor Kotrasiński <i.kotrasinsk@samsung.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Simple change, commit message long because I included all
the analysis that we haven't forgotten any other cases.
This is essentially the change Igor suggested in the qemu-arm
thread, but it took me a while to find time to audit the code
to confirm that was the only change we needed here.
---
 hw/intc/armv7m_nvic.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 13df002ce4d..1f7763964c3 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -2389,8 +2389,15 @@ static MemTxResult nvic_sysreg_write(void *opaque, hwaddr addr,
         startvec = 8 * (offset - 0x280) + NVIC_FIRST_IRQ; /* vector # */
 
         for (i = 0, end = size * 8; i < end && startvec + i < s->num_irq; i++) {
+            /*
+             * Note that if the input line is still held high and the interrupt
+             * is not active then rule R_CVJS requires that the Pending state
+             * remains set; in that case we mustn't let it be cleared.
+             */
             if (value & (1 << i) &&
-                (attrs.secure || s->itns[startvec + i])) {
+                (attrs.secure || s->itns[startvec + i]) &&
+                !(setval == 0 && s->vectors[startvec + i].level &&
+                  !s->vectors[startvec + i].active)) {
                 s->vectors[startvec + i].pending = setval;
             }
         }
-- 
2.25.1



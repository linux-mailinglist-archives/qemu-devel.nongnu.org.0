Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA084AD87B
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 13:59:57 +0100 (CET)
Received: from localhost ([::1]:47412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHQ65-0003kt-NL
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 07:59:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHOrT-000165-3v
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:40:45 -0500
Received: from [2a00:1450:4864:20::32d] (port=46706
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHOqt-00029U-9I
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:40:22 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 l67-20020a1c2546000000b00353951c3f62so1398076wml.5
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 03:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Jz4riheGOmiMeuNbjKDE7wXP/MlDdFoZj/oQ3PvSVLE=;
 b=xVzZ8UxQDHTvE5e8M1Bl4tV9Za0lWk7Qu7aP4wFxlGRDLtWYct5BNkK9C+9zfdgyVF
 pEKuLLXo9iV+uZ8t7A/ZjFqvDVh7Oqkkrd4PCS4DR5JvG1D075IzPtE0PskOceKIJ+zE
 7CNUuZEFfr/8yEfVUtVWC9dT/zcfyODq1o07xPzfjopRthOAI6DU5Z0W+jrOTp928Xvj
 r/Psuo1hObbdNolXPxDotZX4QRymmgtV9TOd0uYxa2D4HDYwGkxrYEiA5tlQ8zmdJQes
 XDl9KTSB618foenmEoj6FkUzKR7DHaQIhegMaUeoBpHBvHqhHyg3kVAw11HXi/nVXv5q
 V8hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Jz4riheGOmiMeuNbjKDE7wXP/MlDdFoZj/oQ3PvSVLE=;
 b=k88UabCXoPfhYGaAEO47l1i6djrubD1ZV27n6/mFNfON0FZaBar4aOBCx0zAszUdNl
 BtzraKf4Zinha4NYBS6dfIUUNIVqqxdjoIH83sO7omO8rCnzgbzPYN74hXuncsasS9Iq
 t3/QEIcuT7HUiLVVtjH0iOEl/erQ0DQ+aCFXxeLusV8VVD6y4Vn/cJ6N0w1j1CAQDQHi
 u/amjLwhEx2F74nzcZrls9OgoYeWo7NoF3tzUNkxnXDfbSrcFMEkyAARccZQ9nwo/OQD
 VUkEhFdU0rnaom1SLE744PdqlQ89WdqzFT89TC1/nB6BXQlEJnfzrUPpdFwZlLUKfcLT
 3sSg==
X-Gm-Message-State: AOAM533jTb/jBp7XDNh1yTO/0gLzrRZyroodH+XrsalsQLLUf5CdJ9Gi
 VtxA/gsNiMC6v8fnmZVMPxZoQhac42qfKA==
X-Google-Smtp-Source: ABdhPJwsTHGMwKJXaxRbKCKy5iOuTs1M//qyMYL2B2/fX9VjsxmXBlJnPtp2yc3g2pZyi/ii7cuzeA==
X-Received: by 2002:a05:600c:210c:: with SMTP id
 u12mr806188wml.56.1644320405639; 
 Tue, 08 Feb 2022 03:40:05 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id r11sm4245199wrt.28.2022.02.08.03.40.05
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 03:40:05 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 24/39] hw/timer/armv7m_systick: Update clock source before
 enabling timer
Date: Tue,  8 Feb 2022 11:39:33 +0000
Message-Id: <20220208113948.3217356-25-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220208113948.3217356-1-peter.maydell@linaro.org>
References: <20220208113948.3217356-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

From: Richard Petri <git@rpls.de>

Starting the SysTick timer and changing the clock source a the same time
will result in an error, if the previous clock period was zero. For exmaple,
on the mps2-tz platforms, no refclk is present. Right after reset, the
configured ptimer period is zero, and trying to enabling it will turn it off
right away. E.g., code running on the platform setting

    SysTick->CTRL  = SysTick_CTRL_CLKSOURCE_Msk | SysTick_CTRL_ENABLE_Msk;

should change the clock source and enable the timer on real hardware, but
resulted in an error in qemu.

Signed-off-by: Richard Petri <git@rpls.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20220201192650.289584-1-git@rpls.de
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/timer/armv7m_systick.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/timer/armv7m_systick.c b/hw/timer/armv7m_systick.c
index 3bd951dd044..5dfe39afe36 100644
--- a/hw/timer/armv7m_systick.c
+++ b/hw/timer/armv7m_systick.c
@@ -149,6 +149,10 @@ static MemTxResult systick_write(void *opaque, hwaddr addr,
         s->control &= 0xfffffff8;
         s->control |= value & 7;
 
+        if ((oldval ^ value) & SYSTICK_CLKSOURCE) {
+            systick_set_period_from_clock(s);
+        }
+
         if ((oldval ^ value) & SYSTICK_ENABLE) {
             if (value & SYSTICK_ENABLE) {
                 ptimer_run(s->ptimer, 0);
@@ -156,10 +160,6 @@ static MemTxResult systick_write(void *opaque, hwaddr addr,
                 ptimer_stop(s->ptimer);
             }
         }
-
-        if ((oldval ^ value) & SYSTICK_CLKSOURCE) {
-            systick_set_period_from_clock(s);
-        }
         ptimer_transaction_commit(s->ptimer);
         break;
     }
-- 
2.25.1



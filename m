Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B48E269CA53
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 12:52:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU4iF-0002Jh-Fp; Mon, 20 Feb 2023 06:52:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU4i8-00027C-DA
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 06:52:00 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU4i6-0005Dp-IW
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 06:51:59 -0500
Received: by mail-wm1-x332.google.com with SMTP id n31so657450wms.2
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 03:51:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=74ZBJo9MLan5PaXAa/O0nRsZBEqss8JkgGSoLyAn+kU=;
 b=ru+R0vnBsBcT77qvnS3HbagtCp0d513COHI2GV9uR+qZh39ygYBMGtzmPUxbnSFbW9
 Rv7V3ES5J0T34/3JxlcIr4svuVVr00jGkGd1nXUooJDHG9cFIdGpwZO9HR4kXWg9LsbJ
 CiR+V6vgNHv3pLQS01R4vQAPh9bp+baflg6VeJdfQqcjL2z5+3kPPlnJ88CnJpCt3RX/
 j2qyGH7mPr3rfBTipOd2yOr8pn9alaIPhXMb6/1uy1rWdtRBRrIcopgSKNjmyPztjItT
 /D8qkFEDayLIfPCHCzyh1i4ScRB7DZzKMWpWZhcQ2mA+6q4FVCqS+bXEa3GKrEA5aazP
 iy2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=74ZBJo9MLan5PaXAa/O0nRsZBEqss8JkgGSoLyAn+kU=;
 b=JfsSD1go0De6zyRcyGMBndT2SdsA8p9MlFR+S+gssstahVkAo8aAwhxYcQx3sz+KUL
 SB7hYbyDjuHshh7AWHHY9Y9Bipne69mamHYvXATTP8tLAvo051CV3rXUEYk6II2GlVCN
 PxQyp9emDFmVpguuzGbnyBmWM+bTuOHjHyPPLKsXhVdfeWhH/ADjQVZAMNhEZwfmDoeF
 CmBbXPffvUWjgzipxg18IBGcxb9i7BeINGOr2/utiwGbpAMIfComoSu4d87fh8YHQ9sf
 mMXwMcIqSAtPKi/kqPbg34YwFdxQ4Dul/IgS/hTBEYy1LTu3IrXhqttPUuwtmVOc/voo
 f12w==
X-Gm-Message-State: AO0yUKWwxz8NH4TOw8lplJWpGq+lLmelCFGa9QYCimcJbvEp9ntmpXD0
 Nr88nwJgWJ9MiHH3uqIBPlvfUtEUrSpV6bVZ
X-Google-Smtp-Source: AK7set/wPEmD4x4IJvdDGpOhRapA9F0GKBelcTevekgvnBR6uSQWKdP7XcyOsPHvBw+axmS9WjD9Ag==
X-Received: by 2002:a05:600c:3b95:b0:3db:3e8:feca with SMTP id
 n21-20020a05600c3b9500b003db03e8fecamr472122wms.15.1676893917095; 
 Mon, 20 Feb 2023 03:51:57 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a05600c4fc200b003e2059c7978sm15219215wmq.36.2023.02.20.03.51.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Feb 2023 03:51:56 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 8/8] hw/intc/armv7m_nvic: Use QOM cast CPU() macro
Date: Mon, 20 Feb 2023 12:51:14 +0100
Message-Id: <20230220115114.25237-9-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230220115114.25237-1-philmd@linaro.org>
References: <20230220115114.25237-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Avoid accessing 'parent_obj' directly.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/intc/armv7m_nvic.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 1f7763964c..2fe5b1c4e1 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -584,7 +584,7 @@ static void do_armv7m_nvic_set_pending(void *opaque, int irq, bool secure,
              * which saves having to have an extra argument is_terminal
              * that we'd only use in one place.
              */
-            cpu_abort(&s->cpu->parent_obj,
+            cpu_abort(CPU(s->cpu),
                       "Lockup: can't take terminal derived exception "
                       "(original exception priority %d)\n",
                       s->vectpending_prio);
@@ -650,7 +650,7 @@ static void do_armv7m_nvic_set_pending(void *opaque, int irq, bool secure,
                  * Lockup condition due to a guest bug. We don't model
                  * Lockup, so report via cpu_abort() instead.
                  */
-                cpu_abort(&s->cpu->parent_obj,
+                cpu_abort(CPU(s->cpu),
                           "Lockup: can't escalate %d to HardFault "
                           "(current priority %d)\n", irq, running);
             }
@@ -749,7 +749,7 @@ void armv7m_nvic_set_pending_lazyfp(void *opaque, int irq, bool secure)
              * We want to escalate to HardFault but the context the
              * FP state belongs to prevents the exception pre-empting.
              */
-            cpu_abort(&s->cpu->parent_obj,
+            cpu_abort(CPU(s->cpu),
                       "Lockup: can't escalate to HardFault during "
                       "lazy FP register stacking\n");
         }
-- 
2.38.1



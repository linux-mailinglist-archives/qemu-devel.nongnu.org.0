Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B141629AD2
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 14:41:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouwBe-0004Qr-TB; Tue, 15 Nov 2022 08:41:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ouwBL-0004FY-Ku
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 08:40:59 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ouwBJ-0005Vl-9U
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 08:40:55 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 r4-20020a1c4404000000b003cfdd569507so505732wma.4
 for <qemu-devel@nongnu.org>; Tue, 15 Nov 2022 05:40:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DUYMzZxfJxLIOZBg3FPiTm0W8FtywEEUClm2jhY9GAU=;
 b=irINtRIQ63PlYHjpYfYFxw7f13zfXsBznjmmrLJ7hjv2cVlOOsJxtmREf+Bzameqj4
 iS8ZrE0pMOwOk/5Q7MDbeocnGnbNdnuzuh2xYk5N2i4rz7kcU92pplGg2w8tPCsDvPmZ
 jy5PRpY3ihTqsfBg1wO0RMEqzdd4uFJvzafsN4B5feAodKtXDXivxJvJIHCxCSTmUJls
 itNYFfl1oPAla7nINPAgCKXZIkM9V75bfL91tbpDDpp4mtT0Qmts+0wMP3Ezeqw93RYQ
 24UsxoETu27BALbjOeMhdjYvAuttpUJNkEZGWCxAYvXUKurYJt5iAgGcByYlefzTMzlV
 r60A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DUYMzZxfJxLIOZBg3FPiTm0W8FtywEEUClm2jhY9GAU=;
 b=d+4Y6XLwTGVmSM/1Z7RtU8unv3WLi5zhNw7UQEB7IIzvienBBxmv0j4brpDq2a/tk/
 wZ6eUnz70CmNJO0/yTC4JFqmnUJT7WC+8gQQcwcHu3YU2XYskJIQgIdi1Xj/oebCHElc
 GGIXFKtbbpSVJz8hav0fKpm7Uh2V/K7dSj3RwK168H9LtikA2rmg4k4Arn5WQ7aLUYj1
 FNArZFBKQJZG1EhKPJ0dnmPJL4IQmTGIfOsUFA/MP1P6OXlX/zFsCKQisYQ9MGEe2CJm
 0rZCqc0jpLkeCO40hPXzVYPxp/IC9s3EI/baaa5gDXpFAdRbFCev1N4A5jWT4+JdG1Xa
 m9QA==
X-Gm-Message-State: ANoB5pnlELbX1skTmcxizv5fiJJZBbXv78lCQj/GTVNbHgUulicuL7nf
 nEpq/iqkRhx+lshz3rNzy8ysdQ==
X-Google-Smtp-Source: AA0mqf6JcKLavqe0HpqSOYmW0Dy2ESl4oYZng49l6cU7hTmNvkITiOZhOVjp9khEQgr1JQdQHtrbWQ==
X-Received: by 2002:a05:600c:4256:b0:3c6:d39c:fc43 with SMTP id
 r22-20020a05600c425600b003c6d39cfc43mr1649915wmm.68.1668519649685; 
 Tue, 15 Nov 2022 05:40:49 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 e24-20020a05600c219800b003cfd42821dasm12587184wme.3.2022.11.15.05.40.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Nov 2022 05:40:49 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B29931FFB8;
 Tue, 15 Nov 2022 13:40:48 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v1 1/2] hw/intc: clean-up access to GIC multi-byte registers
Date: Tue, 15 Nov 2022 13:40:47 +0000
Message-Id: <20221115134048.2352715-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221115134048.2352715-1-alex.bennee@linaro.org>
References: <20221115134048.2352715-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

gic_dist_readb was returning a word value which just happened to work
as a result of the way we OR the data together. Lets fix it so only
the explicit byte is returned for each part of GICD_TYPER. I've
changed the return type to uint8_t although the overflow is only
detected with an explicit -Wconversion.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gic.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index 492b2421ab..1a04144c38 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -941,7 +941,7 @@ static void gic_complete_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
     gic_update(s);
 }
 
-static uint32_t gic_dist_readb(void *opaque, hwaddr offset, MemTxAttrs attrs)
+static uint8_t gic_dist_readb(void *opaque, hwaddr offset, MemTxAttrs attrs)
 {
     GICState *s = (GICState *)opaque;
     uint32_t res;
@@ -955,6 +955,7 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr offset, MemTxAttrs attrs)
     cm = 1 << cpu;
     if (offset < 0x100) {
         if (offset == 0) {      /* GICD_CTLR */
+            /* We rely here on the only non-zero bits being in byte 0 */
             if (s->security_extn && !attrs.secure) {
                 /* The NS bank of this register is just an alias of the
                  * EnableGrp1 bit in the S bank version.
@@ -964,11 +965,14 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr offset, MemTxAttrs attrs)
                 return s->ctlr;
             }
         }
-        if (offset == 4)
-            /* Interrupt Controller Type Register */
-            return ((s->num_irq / 32) - 1)
-                    | ((s->num_cpu - 1) << 5)
-                    | (s->security_extn << 10);
+        if (offset == 4) {
+            /* GICD_TYPER byte 0 */
+            return ((s->num_irq / 32) - 1) | ((s->num_cpu - 1) << 5);
+        }
+        if (offset == 5) {
+            /* GICD_TYPER byte 1 */
+            return (s->security_extn << 2);
+        }
         if (offset < 0x08)
             return 0;
         if (offset >= 0x80) {
-- 
2.34.1



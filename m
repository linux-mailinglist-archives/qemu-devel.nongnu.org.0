Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C77FC339762
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 20:27:17 +0100 (CET)
Received: from localhost ([::1]:40644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKnRM-0005zX-Sq
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 14:27:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arkaisp2021@gmail.com>)
 id 1lKl3W-0000xO-Mr
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 11:54:30 -0500
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134]:43018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <arkaisp2021@gmail.com>)
 id 1lKl3U-0002eL-PM
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 11:54:30 -0500
Received: by mail-lf1-x134.google.com with SMTP id d3so46743379lfg.10
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 08:54:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=nhMqPgfJL5skTQ1f1DYuFP99P7jRowKYGS0QCo5fYT4=;
 b=gjH5V1n0JZa2mCip8ltjXEQL/9/ut4OtrImU8N0LgYKiYY3nhY+sVf8enUBov1Lw8B
 yEHrJMlq6e1QKcZ/0HhrQKE12C5/D/M4RAKaIKffQflDE2rwgFZ02Xr9SIa+GQJdt5Uy
 b/nYdZ8yMGjxMq3Nfx73oZ6hex66zQaXTF6soa8cA0Vga52kj1jdVN97VGPrUI/wf8Di
 r/guROGmoEm8LMfuN7o/3+4AkAlg6UfNuLcOMmQBsgOnT/0Da1qy08IntrqlXEmqgRYE
 vdaCsmTTPL+zsQMaMd9WWYKbl0ZeuG7r+Zdt8cM6CqsApD1sojRcInBEevnCXYyHa9lY
 oX/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=nhMqPgfJL5skTQ1f1DYuFP99P7jRowKYGS0QCo5fYT4=;
 b=COV0AzfQoVNQFZJIhZMH3+h+bQyV+JpL6XruoHAcYRrCcEJ5QAsCRKJW+qQkpsHlcH
 Z9/7ixD9/z09vH7ezrYv32aF6RRsmUfZQbELqPNLHvEV4LTW456WQWbZK/UqjC1cDWi/
 4F11vKE7Q4ozwGEdcujqJakTcuewZSZiWXQA49EW7Nv1C+6/8R1yeVaojkOu9zAZ1RRR
 XSLkTB1xqWQUVWBUUSu6BFh42IIP3JB3vGgUBGqLsA6HZ+CsK5eS7RM0xEliyPGjUlbG
 74u2I3C1Bsv+VxNQ5AEbVPLhotf0wBtVzNN8b+jsWUCVwrtuxpcDaUUBFEsxXYwnFwa0
 5hAQ==
X-Gm-Message-State: AOAM533n0oIVzrMwhlw6SP3iTvWnKh2laKgBQm8GJn2eE3VwsfYw+NRj
 Q9is358Y5hNLNYhKnplokhCtDPqVI9d7fg==
X-Google-Smtp-Source: ABdhPJxk+1cLDcumrnCGr6KEaf0mKajBTXphGEESeCUnrQ+nXLHott/+ah7jQh3CiZBZvmBP7hPFXg==
X-Received: by 2002:a19:4116:: with SMTP id o22mr106745lfa.272.1615568066168; 
 Fri, 12 Mar 2021 08:54:26 -0800 (PST)
Received: from localhost.localdomain ([85.142.117.226])
 by smtp.gmail.com with ESMTPSA id p16sm1785133lft.147.2021.03.12.08.54.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 08:54:25 -0800 (PST)
From: Arkadiy <arkaisp2021@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/avr: Fix interrupt execution
Date: Fri, 12 Mar 2021 19:47:54 +0300
Message-Id: <20210312164754.18437-1-arkaisp2021@gmail.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=arkaisp2021@gmail.com; helo=mail-lf1-x134.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 12 Mar 2021 13:58:14 -0500
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
Cc: NDNF <arkaisp2021@gmail.com>, S.E.Harris@kent.ac.uk,
 Arkasha <ivanovrkasha@gmail.com>, mrolnik@gmail.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: NDNF <arkaisp2021@gmail.com>

Only one interrupt is in progress at the moment.It is necessary to set to
reset interrupt_request only after all interrupts have been executed

Signed-off-by: Arkasha <ivanovrkasha@gmail.com>
---
 target/avr/helper.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/avr/helper.c b/target/avr/helper.c
index 65880b9928..9f20cc198e 100644
--- a/target/avr/helper.c
+++ b/target/avr/helper.c
@@ -49,7 +49,9 @@ bool avr_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
             cc->tcg_ops->do_interrupt(cs);
 
             env->intsrc &= env->intsrc - 1; /* clear the interrupt */
-            cs->interrupt_request &= ~CPU_INTERRUPT_HARD;
+            if (!env->intsrc) {
+                cs->interrupt_request &= ~CPU_INTERRUPT_HARD;
+            }
 
             ret = true;
         }
-- 
2.17.1



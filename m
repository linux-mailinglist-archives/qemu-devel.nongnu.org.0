Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A673564A12
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 23:37:06 +0200 (CEST)
Received: from localhost ([::1]:60346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o87H7-0000PQ-6h
	for lists+qemu-devel@lfdr.de; Sun, 03 Jul 2022 17:37:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1o879R-0004EV-Nk
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 17:29:09 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:35777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1o879Q-0006Nn-BC
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 17:29:09 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 x18-20020a17090a8a9200b001ef83b332f5so1403248pjn.0
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 14:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UGaGgVs7SDUPOEFRyCBkmJZ47VH/vWWzJK8XgOjQE9k=;
 b=ctTqboY1Xf6oVC3++neuaQUBMRjtQLIByHe2xH0tqQ1FYZHrUnmNjtJ735BhtMYqtY
 Ix0zUQ7nZUc9yLDIUezELW42tqZucAgTYr6ReKHpJRZwGDJJUWqcA2um9edmcvIwFixf
 lCQozyIvH17Z0jJqv2iIyECWbcbhBOi54m/dY7Oeu1c14UL7tbIEAk69KVvx2+ZACd5x
 jHO5l77I0Tmj5yQ/ShQ+x9IoiBkWNO54kZnYSPFco8iiTXVwW2jLO18oMZoTQMirNcsL
 MqumlN/5RNHu4kgN7FLkv9dtBoB+T2BZ0Ze6d+t4gEImElq6z4vAxzj+7P0SU7Yad4Pt
 9YEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UGaGgVs7SDUPOEFRyCBkmJZ47VH/vWWzJK8XgOjQE9k=;
 b=SOHbV2ml1PHy1OEkuULCHwqgdJowonF8I7TjxUYXyCYcRJ5wWxYwZWal985TT9YbWO
 gWnf8rm7H9obmQD7rS9f4uxT3JA4VTt0hGY8lAFlUdbFpg1eTPdJALe9JlPnorB9oldv
 eHaBP8EeGEkYLb9/eAqspXsBB8bPaEnl69wVmzVYn7uyyWV10dS3QJSYtfDprkDPMB+2
 prsKMGRK65B8zLVOip4ALFIVPoSjx4DulhTnEjQRDemRU/7tT8HgUd7KVHypOJUDCZKM
 NpD+Yh+WqOa+t7ZGeIjW63ysqEDXpK80ZwwGM9P9B50zeENqXD0x/8da41aMRC5QT3YK
 42nw==
X-Gm-Message-State: AJIora+gPcf6tz3/kCzwOYQMk63JWO1fSaOcj85T45FstfJKOJ8OV1Lk
 9wkxW179+/Nd0aWq/QFpOy9MhtvmDyQ=
X-Google-Smtp-Source: AGRyM1uWwxP6+pJEjL03lCTGaAyQfxiR4HCd+D9DjMGtguEA5eN1a8oWQU/Qlr1EqfUoT+PWa2Y7BQ==
X-Received: by 2002:a17:90b:4c0a:b0:1ec:d3b2:ed22 with SMTP id
 na10-20020a17090b4c0a00b001ecd3b2ed22mr31426586pjb.2.1656883746947; 
 Sun, 03 Jul 2022 14:29:06 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 63-20020a620542000000b0051be7ecd733sm20009136pff.16.2022.07.03.14.29.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 14:29:06 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: QEMU Development <qemu-devel@nongnu.org>
Cc: Openrisc <openrisc@lists.librecores.org>, Stafford Horne <shorne@gmail.com>
Subject: [PATCH v2 09/11] target/openrisc: Interrupt handling fixes
Date: Mon,  4 Jul 2022 06:28:21 +0900
Message-Id: <20220703212823.10067-10-shorne@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220703212823.10067-1-shorne@gmail.com>
References: <20220703212823.10067-1-shorne@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=shorne@gmail.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

When running SMP systems we sometimes were seeing lockups where
IPI interrupts were being raised by never handled.

This looks to be caused by 2 issues in the openrisc interrupt handling
logic.

 1. After clearing an interrupt the openrisc_cpu_set_irq handler will
    always clear PICSR.  This is not correct as masked interrupts
    should still be visible in PICSR.
 2. After setting PICMR (mask register) and exposed interrupts should
    cause an interrupt to be raised.  This was not being done so add it.

This patch fixes both issues.

Signed-off-by: Stafford Horne <shorne@gmail.com>
---
 target/openrisc/cpu.c        | 1 -
 target/openrisc/sys_helper.c | 7 +++++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
index 41d1b2a24a..cb9f35f408 100644
--- a/target/openrisc/cpu.c
+++ b/target/openrisc/cpu.c
@@ -98,7 +98,6 @@ static void openrisc_cpu_set_irq(void *opaque, int irq, int level)
         cpu_interrupt(cs, CPU_INTERRUPT_HARD);
     } else {
         cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
-        cpu->env.picsr = 0;
     }
 }
 #endif
diff --git a/target/openrisc/sys_helper.c b/target/openrisc/sys_helper.c
index 7c0d3d6187..5336110b5e 100644
--- a/target/openrisc/sys_helper.c
+++ b/target/openrisc/sys_helper.c
@@ -139,6 +139,13 @@ void HELPER(mtspr)(CPUOpenRISCState *env, target_ulong spr, target_ulong rb)
         break;
     case TO_SPR(9, 0):  /* PICMR */
         env->picmr = rb;
+        qemu_mutex_lock_iothread();
+        if (env->picsr & env->picmr) {
+            cpu_interrupt(cs, CPU_INTERRUPT_HARD);
+        } else {
+            cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
+        }
+        qemu_mutex_unlock_iothread();
         break;
     case TO_SPR(9, 2):  /* PICSR */
         env->picsr &= ~rb;
-- 
2.36.1



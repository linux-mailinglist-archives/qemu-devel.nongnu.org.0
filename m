Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 307345722C9
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 20:39:15 +0200 (CEST)
Received: from localhost ([::1]:50040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBKmp-0007oG-5j
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 14:39:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jaykhandkar2002@gmail.com>)
 id 1oBGjE-00083t-86
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 10:19:09 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:34517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jaykhandkar2002@gmail.com>)
 id 1oBGjC-0000Ao-Lc
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 10:19:07 -0400
Received: by mail-pl1-x62e.google.com with SMTP id z1so7386270plb.1
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 07:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NEh+YghuA3PNw9iqVvSsUInXummRli/MWzD6Xc/emxU=;
 b=o+eCCQnmKy9dyj/bTSp8s0JG94tO+xjuahlxeGkldMRlwdB29eW63PtWFSNR+wuvjW
 zgFtC4vCjFaUn4n452Y7MlEnjAFoLJq8Eld3MDbcE87Ezb7MfbWQI+qBVG9v0vwUampY
 iAzXdhUN+lXnxOsa663oyTxvUCOTomOp8ImNtWT+Ec8rz3JsIkLD+LYNJCa7Z4bNI8pa
 WgtuHiAtpV6oVbnq+GwXvYZThyUKZgcsUwopdtXHbUbcAJZBioaEUBHOsnDop1SAbYGR
 fL5sFZy/zzWhTv8WbtrgLKJrzfdTeraK6Ihpisx6sJWVM3KDu9jy1YRnFcUhI2aUIvmC
 C+7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NEh+YghuA3PNw9iqVvSsUInXummRli/MWzD6Xc/emxU=;
 b=2br5KEdG1but/s7U6ffeFYMjXLeu3GLR0M3xsmm/Og8yq/WbcTgR/O64E62G9FBhbc
 rBfN2eJQEsQU6MPInYjXa0KScboIlXzNfGi7PryWupzzONeXsREa7UeoULq7erjs5i5Y
 qMjs7ZWNy09evBskAzH1nN7bKjO9GzOdANaRMwjT/EFIRFpwyB00U8BUn10INplrcbvY
 wgK5JUvWpDBwyNr4+0/fL4FF+WvyHb6dRk8ytHTJlx3QMjlttzNv9w6G9w3Ti/vOvnrb
 DT2p+l8eQd+eDBgHn6S+ldZ+Lf6jN9T/h3ubA0OpWKONQAIF0KtR1MQ1Zhu/pxgcvMz+
 IkCA==
X-Gm-Message-State: AJIora88jPNtGJm7SIRJr9TWfF6P34SXutpLhT1RDFgba9emP8cjstJm
 zAW/5833VpHlzoqaHmsc3uE=
X-Google-Smtp-Source: AGRyM1vGPtCtZCk7hOW9k2Pr5X+gz1sw/qzyGNtavFz1orkuUOyRR4z3RqKdvZVx6ub1vP7Y0NzbZw==
X-Received: by 2002:a17:902:e80a:b0:16c:3340:aba5 with SMTP id
 u10-20020a170902e80a00b0016c3340aba5mr18109600plg.102.1657635543736; 
 Tue, 12 Jul 2022 07:19:03 -0700 (PDT)
Received: from thinkpad ([117.195.19.150]) by smtp.gmail.com with ESMTPSA id
 f9-20020a63f749000000b0041981461f5dsm349639pgk.90.2022.07.12.07.19.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jul 2022 07:19:03 -0700 (PDT)
From: Jay Khandkar <jaykhandkar2002@gmail.com>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, mst@redhat.com,
 Jay Khandkar <jaykhandkar2002@gmail.com>
Subject: [PATCH] hw/intc: Handle software disabling of APIC correctly
Date: Tue, 12 Jul 2022 19:48:05 +0530
Message-Id: <20220712141804.99494-1-jaykhandkar2002@gmail.com>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=jaykhandkar2002@gmail.com; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 12 Jul 2022 14:31:49 -0400
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

When the local APIC is in a software disabled state, all local interrupt
sources must be masked and all attempts to unmask them should be
ignored. Currently, we don't do either. Fix this by handling it
correctly in apic_mem_write().

Signed-off-by: Jay Khandkar <jaykhandkar2002@gmail.com>
---
 hw/intc/apic.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/hw/intc/apic.c b/hw/intc/apic.c
index 3df11c34d6..493c70af62 100644
--- a/hw/intc/apic.c
+++ b/hw/intc/apic.c
@@ -792,9 +792,16 @@ static void apic_mem_write(void *opaque, hwaddr addr, uint64_t val,
         s->dest_mode = val >> 28;
         break;
     case 0x0f:
-        s->spurious_vec = val & 0x1ff;
-        apic_update_irq(s);
-        break;
+        {
+            s->spurious_vec = val & 0x1ff;
+            if (!(val & APIC_SPURIO_ENABLED)) {
+                for (int i = 0; i < APIC_LVT_NB; i++) {
+                    s->lvt[i] |= APIC_LVT_MASKED;
+                }
+            }
+            apic_update_irq(s);
+            break;
+        }
     case 0x10 ... 0x17:
     case 0x18 ... 0x1f:
     case 0x20 ... 0x27:
@@ -812,6 +819,9 @@ static void apic_mem_write(void *opaque, hwaddr addr, uint64_t val,
     case 0x32 ... 0x37:
         {
             int n = index - 0x32;
+            if (!(s->spurious_vec & APIC_SPURIO_ENABLED)) {
+                val |= APIC_LVT_MASKED;
+            }
             s->lvt[n] = val;
             if (n == APIC_LVT_TIMER) {
                 apic_timer_update(s, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL));
-- 
2.37.0



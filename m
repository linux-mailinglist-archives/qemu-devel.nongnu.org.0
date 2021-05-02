Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 967A8370E2B
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 19:21:37 +0200 (CEST)
Received: from localhost ([::1]:43918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldFmi-0005nG-MH
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 13:21:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldF8A-0003l1-SC
 for qemu-devel@nongnu.org; Sun, 02 May 2021 12:39:42 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:41493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldF89-00063p-5r
 for qemu-devel@nongnu.org; Sun, 02 May 2021 12:39:42 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 t11-20020a05600c198bb02901476e13296aso2149472wmq.0
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 09:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IdlZfh0jCcKdQ4dnlDtxjnnGZ8KwGepT18rEIuOb8mI=;
 b=CPlmgpWLglnkbB3An2tamHh8z3VNiaXkQtQY8M/WTFze1A949NTgfou675vY/DdLtB
 pNhOaYnsZhthBlnShNgkaZ1LCYEzeL4ZBOxuEUHPgx9c2fHw1lxcTu9yJ6HflnveIbdG
 wRznmnl7RvLaLtoB0XGWKn7Y9yw9di221cG7FN73qKV/VmXXX41txM5a3RO2QExIp2wp
 SXLUf7XGTb8LW1H9oN0QOy9EX+turuSC2ihcl8KFaWeDXw24rr1vrURbp/4TqHyCXXjM
 0ygpg/5TSpvr4nY77e9Nn/oJqWT9CCNcBfiZj5tFH7JjW5YNqfyy2QrIoMXa+o/MUUba
 RmFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=IdlZfh0jCcKdQ4dnlDtxjnnGZ8KwGepT18rEIuOb8mI=;
 b=knZa23s6EhcSuV0GBSgEVlXoM4drejdyVN8N2Wx7UmNO7E+47dqr+WddCO3JJ6N08P
 0mqs2CGkBMWX1o36rg8kO2wMIHub6lbNYYy3BOuvyJxKuhd907JYTJjQyTUSQc8YshSE
 Ujm2sq2UR6OAKxzdiQowG31aBWEsCWUhzuFtLsDgubS7MrN1pNRikaETIVSkp3k50L5G
 71f0OwynfOKG9cdeL/F/6TcW0/Qib6E4KSWrNBcgE25PQNVQ5l2FZalJqeyKZc1PFLEY
 sZCF+oDW+hWauFH6Gh7IizSN+30w8r0cvhMu/iUigbAQu1LbVOnqjjUEym5z8LLtx0nF
 dHbA==
X-Gm-Message-State: AOAM5308oGKDte0SzKApGrgHsQXySW5Qo+N+DhC//CkQHJkg5aaPjLIb
 TCQhYOgVuGSRv7bgAAmYFWR46x/EFFA199lV
X-Google-Smtp-Source: ABdhPJyty6Oav8OGx7G4wOdslp2C4RyfdeDyWoWap/MLaRR+KYm7w57qNa4//s6asW/M2Z753sueBw==
X-Received: by 2002:a1c:a481:: with SMTP id
 n123mr27528996wme.162.1619973579623; 
 Sun, 02 May 2021 09:39:39 -0700 (PDT)
Received: from localhost.localdomain
 (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id d2sm9374052wrs.10.2021.05.02.09.39.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 09:39:39 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/2] hw/timer/etraxfs_timer: Convert to 3-phase reset
 (Resettable interface)
Date: Sun,  2 May 2021 18:39:30 +0200
Message-Id: <20210502163931.552675-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210502163931.552675-1-f4bug@amsat.org>
References: <20210502163931.552675-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

TYPE_ETRAX_FS_TIMER is a sysbus device, so its DeviceClass::reset()
handler is called automatically when its qbus parent is reset
(we don't need to register it manually).

Convert the generic reset to a enter/hold resettable ones, and
remove the qemu_register_reset() call.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/timer/etraxfs_timer.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/hw/timer/etraxfs_timer.c b/hw/timer/etraxfs_timer.c
index 5379006086f..4ba662190de 100644
--- a/hw/timer/etraxfs_timer.c
+++ b/hw/timer/etraxfs_timer.c
@@ -309,9 +309,9 @@ static const MemoryRegionOps timer_ops = {
     }
 };
 
-static void etraxfs_timer_reset(void *opaque)
+static void etraxfs_timer_reset_enter(Object *obj, ResetType type)
 {
-    ETRAXTimerState *t = opaque;
+    ETRAXTimerState *t = ETRAX_TIMER(obj);
 
     ptimer_transaction_begin(t->ptimer_t0);
     ptimer_stop(t->ptimer_t0);
@@ -325,6 +325,12 @@ static void etraxfs_timer_reset(void *opaque)
     t->rw_wd_ctrl = 0;
     t->r_intr = 0;
     t->rw_intr_mask = 0;
+}
+
+static void etraxfs_timer_reset_hold(Object *obj)
+{
+    ETRAXTimerState *t = ETRAX_TIMER(obj);
+
     qemu_irq_lower(t->irq);
 }
 
@@ -343,14 +349,16 @@ static void etraxfs_timer_realize(DeviceState *dev, Error **errp)
     memory_region_init_io(&t->mmio, OBJECT(t), &timer_ops, t,
                           "etraxfs-timer", 0x5c);
     sysbus_init_mmio(sbd, &t->mmio);
-    qemu_register_reset(etraxfs_timer_reset, t);
 }
 
 static void etraxfs_timer_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
 
     dc->realize = etraxfs_timer_realize;
+    rc->phases.enter = etraxfs_timer_reset_enter;
+    rc->phases.hold = etraxfs_timer_reset_hold;
 }
 
 static const TypeInfo etraxfs_timer_info = {
-- 
2.26.3



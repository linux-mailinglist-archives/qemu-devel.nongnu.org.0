Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3286468019D
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Jan 2023 22:35:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMFJy-0002Q2-JO; Sun, 29 Jan 2023 16:34:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pMFJw-0002Pc-AU
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 16:34:40 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pMFJu-0001MI-SA
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 16:34:40 -0500
Received: by mail-ed1-x534.google.com with SMTP id n6so6617335edo.9
 for <qemu-devel@nongnu.org>; Sun, 29 Jan 2023 13:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yk47PqZmuOTiniLSu6qFGT/8lOr+9kd9+ln4IWTKIHI=;
 b=jcB2/DN5GQSDU6XT+v+JLKHif5Yk1QSlA8vScXPbaY0v9DZ2n7euV2cqVpLKWjJA5X
 KR/b+RriTUVO+CZDcmhNUnu7tYoDlKFhwklLQ0Suobc7N8isAZ83/T4TAh5RHhq4hNU5
 uFtotzcrke3tqSn7k401T3BvtrWG/qKVBguS+EYEzEqm0KP8jNV/Oq3GI0oT9Z+xF0p4
 BxCYXyAPo6INJKpRFvT5vFIEtPNPALsberGUM9fH+95w7J4PfRcUpTa9cjs7gwHBHrZX
 xGgZsngadYkUSYMQrYDjQsDarssqWrsYPJJCekmwU8IyxUdX1I6Zz4rR9T8n7WC0uZ8E
 eJzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yk47PqZmuOTiniLSu6qFGT/8lOr+9kd9+ln4IWTKIHI=;
 b=KsAc6d2XNB2qTogwgVTv9puiAtoRkny/vC+RmxS5CqIkTVTskDrh5dH8riKMSdILED
 N+jGUUxXnJKCyMFNtxiFY19R3zVNq4Xj/ifERMaW7FVCQttUpJuMeInAcSQKFi+d7D15
 kaT6pvmnaU/EoL9SrW/jEDzu61Cg1q7F16C74j2ey8v2AocMwJdFi72edZvDtfc60PZ7
 CUVya8TJztTQoLqkC5U5I1b7f4+8F+aExp054BjdCc7arE9r1srfRy3ys/TUemYMVPCB
 Tkl9CmNOlJPheC+7C9B4wCY7hXisSetN2eCPvIdsPTsmqrq696YPTBwe7iDeO6jYX33i
 Uq/Q==
X-Gm-Message-State: AFqh2kqIqyOK/AtRMG+nOyDjB0UknIRClBx1kgu+CabnKcYzMPSje3qD
 lGh0GvTwCVLg00AHUGS/sQGkFOYSABc=
X-Google-Smtp-Source: AMrXdXtf6WvLxlBNkdRG7d9Wzfh7Z3jcCJFTUdKgmA54kWd0OBMts1eK3T6tPQUGtMer5c3K766eXA==
X-Received: by 2002:aa7:cc81:0:b0:47e:eaae:9a5b with SMTP id
 p1-20020aa7cc81000000b0047eeaae9a5bmr48468343edt.42.1675028077073; 
 Sun, 29 Jan 2023 13:34:37 -0800 (PST)
Received: from localhost.localdomain ([46.183.103.17])
 by smtp.gmail.com with ESMTPSA id
 d1-20020aa7d681000000b0049be07c9ff5sm5831220edr.4.2023.01.29.13.34.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jan 2023 13:34:36 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, Huacai Chen <chenhuacai@kernel.org>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 3/3] hw/isa/vt82c686: Implement ACPI powerdown
Date: Sun, 29 Jan 2023 22:34:18 +0100
Message-Id: <20230129213418.87978-4-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230129213418.87978-1-shentey@gmail.com>
References: <20230129213418.87978-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/vt82c686.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index b0765d4ed8..2db54d1649 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -33,8 +33,10 @@
 #include "qapi/error.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
+#include "qemu/notify.h"
 #include "qemu/range.h"
 #include "qemu/timer.h"
+#include "sysemu/runstate.h"
 #include "trace.h"
 
 #define ACPI_ENABLE 0xf1
@@ -50,6 +52,8 @@ struct ViaPMState {
     APMState apm;
     PMSMBus smb;
 
+    Notifier powerdown_notifier;
+
     qemu_irq irq;
 };
 
@@ -198,6 +202,14 @@ static void via_pm_reset(DeviceState *d)
     smb_io_space_update(s);
 }
 
+static void via_pm_powerdown_req(Notifier *n, void *opaque)
+{
+    ViaPMState *s = container_of(n, ViaPMState, powerdown_notifier);
+
+    assert(s != NULL);
+    acpi_pm1_evt_power_down(&s->ar);
+}
+
 static void via_pm_realize(PCIDevice *dev, Error **errp)
 {
     ViaPMState *s = VIA_PM(dev);
@@ -218,6 +230,9 @@ static void via_pm_realize(PCIDevice *dev, Error **errp)
     acpi_pm_tmr_init(&s->ar, pm_tmr_timer, &s->io);
     acpi_pm1_evt_init(&s->ar, pm_tmr_timer, &s->io);
     acpi_pm1_cnt_init(&s->ar, &s->io, false, false, 2, false);
+
+    s->powerdown_notifier.notify = via_pm_powerdown_req;
+    qemu_register_powerdown_notifier(&s->powerdown_notifier);
 }
 
 static void via_pm_init(Object *obj)
-- 
2.39.1



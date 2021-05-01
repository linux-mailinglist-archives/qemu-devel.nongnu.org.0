Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEACA37092A
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 00:15:53 +0200 (CEST)
Received: from localhost ([::1]:55662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcxtw-00046x-QR
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 18:15:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lcxsA-0002Yj-S6
 for qemu-devel@nongnu.org; Sat, 01 May 2021 18:14:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lcxs9-0002YI-2h
 for qemu-devel@nongnu.org; Sat, 01 May 2021 18:14:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619907240;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1UI+NSi3BR5rLg3jDpEAayh2qFI6CVFc0ULRL96rJ38=;
 b=COcUQlTqk4ldWT9gkkgVKbIu9aLK8ImFR1x/z4ElMy9Scg/4OMm03YNNl9JhaLtwv2IOck
 c0lKrmOD8TFXEmyq06e3ikPbwJOy6MN0ak6ZIFpAka2K00bWJUazmnGB/Lz5OJ8hYuKkP0
 4GlARVlrY8HeTJBZjANeH8gLxgoand0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-7-NVmL_X7zPeK7Oh9tdEBXqg-1; Sat, 01 May 2021 18:13:58 -0400
X-MC-Unique: NVmL_X7zPeK7Oh9tdEBXqg-1
Received: by mail-wr1-f70.google.com with SMTP id
 v2-20020a0560001622b0290106e28f8af8so1263080wrb.9
 for <qemu-devel@nongnu.org>; Sat, 01 May 2021 15:13:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1UI+NSi3BR5rLg3jDpEAayh2qFI6CVFc0ULRL96rJ38=;
 b=SCO7eIoMHtWQsdJ09rHNvfA5RKtqM8Ue+VFF6a3pnzkO0OeFA5V/EfaSf8KfFuL/UM
 uQKiav/sOt7uI6knFvlntUtz/mV6hqlBs1kKlJs3ZuIz/aWJK5+PIoa1o020o7XiO7HB
 aoIkJG4Q2zahCn/X1uGaxBFm0GefmiHlLY3HuBzW352AGeh87Mls1b6oF91bwRadibXX
 fKnk9sHCvyqe66VNbz/MiYB6wi1SaJE1tTsSeftON4xx1aoR755XLw1SuVOPoYS9H5Ay
 pRVPZL/r2RKCMsgXdkqLa4j7hO59iYgGE5q3AqRqIzhUidpTzK2GrGPbnsgKRwCtYQKw
 r3zQ==
X-Gm-Message-State: AOAM5314EpwCgLpeeaHNhl1Xd/azwcEHEhW4x9A9cbZP/s0XZnQ40Cfy
 Y/ATl4xAQaj3/BA5bTHhYdx9FC/7qO+cYNiLrTJwcpVb5tHIVRZvWsXwonZs4Nl7tWbArzpccyp
 XoXWgA4zeQkZ+D+XAMNOnoWu3y3T4LiPKBeGhB7VFmyBlYL75REhgwI8e2PEUwPz3
X-Received: by 2002:a05:6000:136b:: with SMTP id
 q11mr15836783wrz.350.1619907237387; 
 Sat, 01 May 2021 15:13:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4Zyk4lIsnuOT7jJWhaqjoF4E0riBTqVOZSxSn85u2ckhXTuikHhrp2BS7aZrwfP0ZIavNFw==
X-Received: by 2002:a05:6000:136b:: with SMTP id
 q11mr15836764wrz.350.1619907237254; 
 Sat, 01 May 2021 15:13:57 -0700 (PDT)
Received: from localhost.localdomain
 (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id r19sm16035420wmq.33.2021.05.01.15.13.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 May 2021 15:13:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] hw/timer/etraxfs_timer: Convert to 3-phase reset
 (Resettable interface)
Date: Sun,  2 May 2021 00:13:49 +0200
Message-Id: <20210501221350.501946-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210501221350.501946-1-philmd@redhat.com>
References: <20210501221350.501946-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

TYPE_ETRAX_FS_TIMER is a sysbus device, so its DeviceClass::reset()
handler is called automatically when its qbus parent is reset
(we don't need to register it manually).

Convert the generic reset to a enter/exit resettable ones, and
remove the qemu_register_reset() call.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/timer/etraxfs_timer.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/hw/timer/etraxfs_timer.c b/hw/timer/etraxfs_timer.c
index 5379006086f..7dd3daf6771 100644
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
+static void etraxfs_timer_reset_exit(Object *obj)
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
+    rc->phases.exit = etraxfs_timer_reset_exit;
 }
 
 static const TypeInfo etraxfs_timer_info = {
-- 
2.26.3



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF67409906
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 18:26:14 +0200 (CEST)
Received: from localhost ([::1]:57458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPomb-0005ca-7l
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 12:26:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPoYw-00018U-Hq
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 12:12:06 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:46982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPoYu-0008GQ-5X
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 12:12:06 -0400
Received: by mail-wr1-x435.google.com with SMTP id x6so15528784wrv.13
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 09:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=oZqbaO7c6QCloZzkB19gQ8ommdJiJOBGAsKV4oV9j4I=;
 b=CMLN2hJ+SjF3NGGpwqXhStsEXAd4XrsOEmdlbPO5tEycEXFyfwd/4436DzrVMTwKh9
 V63OGlm6+Q3HxFKjd32D2ndl6fxD7uZmjmwnLAp5U+DIOBq+QL5YnxVrWAfh3PJajYa3
 0OLDvCdXs+mffWe0bbBN7uJwy0mBtyUirDK84KJ5+fBKwIB5dYcqWpcOKsFY0e5iTrzx
 FIQ5ukA2wX8ZB7JRnA11NZlZZtek9YLUzk+wYuKt/cywXyS2p8Kd2rycg564YgvlTjTP
 vlpCLGxvEA7WaIbhBSLx70IkaFUkFbrlNxBqmhMuAvoo1966PTqQFvtcL3sg7UwUHU+A
 2J1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oZqbaO7c6QCloZzkB19gQ8ommdJiJOBGAsKV4oV9j4I=;
 b=iSaQ6p/7rW8ryrxUT2WZd8TQ5rmKgMq1CRg5m4uB3PvjIcv5Tf6UuyLz80algGVnhN
 XKk/HQxb9BQU/HquRfx9sMnOFxW+R99hhzEDZd8hTHcJdHzJS3b0pC5bapKVBKVC9uC1
 MrLkgFz1VtwDuKey+rlQXziVfkY1kG9LOAkRX8nvCeGmiiUJFKl/uDMHkLofZhxR3SVI
 6Oi75fdimd+86EPJ0zWyt/6/jZ2h3zZQSPvV/dM7XEEsKlTAADFeEKEpAj2Zms7glKjd
 QXfzYOm1Vt8LNkHynOlRW8b/JPnOyp+txVEtJ6Wh2NIATcPf9jmJowpeg7FtQTnHGTXs
 q4EA==
X-Gm-Message-State: AOAM532nDzZDOxhN1T2vc6FulO5KivrVhMl/ki3qqqKevmMPGZTr2/OK
 rBGxE13u95M8dKACknRqPDIAm2G6YrSBWg==
X-Google-Smtp-Source: ABdhPJxRMiOHXVjduOTp9iS5TAYnIJwy+c7IPWxktzEFnhgZjd2soJo7YA5dqltlM6foXxBtPoXqUw==
X-Received: by 2002:a5d:6902:: with SMTP id t2mr13005949wru.23.1631549522691; 
 Mon, 13 Sep 2021 09:12:02 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y1sm7629265wmq.43.2021.09.13.09.12.02
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 09:12:02 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 20/23] qdev: Support marking individual buses as 'full'
Date: Mon, 13 Sep 2021 17:11:41 +0100
Message-Id: <20210913161144.12347-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210913161144.12347-1-peter.maydell@linaro.org>
References: <20210913161144.12347-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

By default, QEMU will allow devices to be plugged into a bus up to
the bus class's device count limit.  If the user creates a device on
the command line or via the monitor and doesn't explicitly specify
the bus to plug it in, QEMU will plug it into the first non-full bus
that it finds.

This is fine in most cases, but some machines have multiple buses of
a given type, some of which are dedicated to on-board devices and
some of which have an externally exposed connector for user-pluggable
devices. One example is I2C buses.

Provide a new function qbus_mark_full() so that a machine model can
mark this kind of "internal only" bus as 'full' after it has created
all the devices that should be plugged into that bus. The "find a
non-full bus" algorithm will then skip the internal-only bus when
looking for a place to plug in user-created devices.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210903151435.22379-2-peter.maydell@linaro.org
---
 include/hw/qdev-core.h | 24 ++++++++++++++++++++++++
 softmmu/qdev-monitor.c |  7 ++++++-
 2 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index bafc311bfa1..762f9584dde 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -264,6 +264,7 @@ struct BusState {
     HotplugHandler *hotplug_handler;
     int max_index;
     bool realized;
+    bool full;
     int num_children;
 
     /*
@@ -798,6 +799,29 @@ static inline bool qbus_is_hotpluggable(BusState *bus)
    return bus->hotplug_handler;
 }
 
+/**
+ * qbus_mark_full: Mark this bus as full, so no more devices can be attached
+ * @bus: Bus to mark as full
+ *
+ * By default, QEMU will allow devices to be plugged into a bus up
+ * to the bus class's device count limit. Calling this function
+ * marks a particular bus as full, so that no more devices can be
+ * plugged into it. In particular this means that the bus will not
+ * be considered as a candidate for plugging in devices created by
+ * the user on the commandline or via the monitor.
+ * If a machine has multiple buses of a given type, such as I2C,
+ * where some of those buses in the real hardware are used only for
+ * internal devices and some are exposed via expansion ports, you
+ * can use this function to mark the internal-only buses as full
+ * after you have created all their internal devices. Then user
+ * created devices will appear on the expansion-port bus where
+ * guest software expects them.
+ */
+static inline void qbus_mark_full(BusState *bus)
+{
+    bus->full = true;
+}
+
 void device_listener_register(DeviceListener *listener);
 void device_listener_unregister(DeviceListener *listener);
 
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index a304754ab91..0705f008466 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -435,7 +435,12 @@ static DeviceState *qbus_find_dev(BusState *bus, char *elem)
 
 static inline bool qbus_is_full(BusState *bus)
 {
-    BusClass *bus_class = BUS_GET_CLASS(bus);
+    BusClass *bus_class;
+
+    if (bus->full) {
+        return true;
+    }
+    bus_class = BUS_GET_CLASS(bus);
     return bus_class->max_dev && bus->num_children >= bus_class->max_dev;
 }
 
-- 
2.20.1



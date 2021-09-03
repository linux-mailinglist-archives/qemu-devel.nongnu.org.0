Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B6A4001DE
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 17:17:38 +0200 (CEST)
Received: from localhost ([::1]:47978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMAwj-0007RI-Ll
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 11:17:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mMAtv-0004ZH-HE
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 11:14:43 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:53072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mMAts-0007N5-MW
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 11:14:43 -0400
Received: by mail-wm1-x32d.google.com with SMTP id e26so3741977wmk.2
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 08:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SL90VPTxtLLYwhekzrWcwoaOEJbVtGKH8Xq7EIDvL2c=;
 b=pYAYb9U1+SsSWmzd6H40H1A2jLg9KAssZe44momZuONP7U0IyDa3RAdVZfO6ivnsn4
 zQRMQwOEcwR0i/ILz1BJUZdZhAEv+cByMJc2bhIZ2nTAtx84ZMaGVmPsX6Z7vSGOJcWz
 KVevJ4x3hLtvXmzNuy8qxHyE289GZN37YXmARjmJsRTDmWnk3zM6y1NzmBP186retWgm
 NuDlKpZuEMRD7jQaNQ+yMxVqVAHnn7iHOWNuPR2fjUvHgN9UqTEsPAKv/pHpg5jtmOsL
 oMzdKzJbJLHh1NGOpAsV0l7ik2K8HHAIC2J87C4cjoti3ZSJ13KJX/gXxoNDFITc40BB
 xohw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SL90VPTxtLLYwhekzrWcwoaOEJbVtGKH8Xq7EIDvL2c=;
 b=uk8+Wp9MTERkmYznMxJA05NEM4k50XYaC9aZ5CEiCrdC5X3+w8MXGSphrofv/KFw2a
 YmZKeUQ07UG6DxN4bujPrLVzlHo81tYz9KoSAiWt3sOtypVFcSIhW+/ZK7aAztL/aaKy
 H2nrz5c1AwpCdmOXMg1otTxA+sMH2itSnYCixGg8Z+doB3W5NQPyGRTLCyCDtjj0XUm/
 p0nb5ffBV7C5JqGfmjbRK4rHLYhrULp9Tc+RLLJu3YeaNeyLi8qq0zCA+abNzhfgOI+l
 LAAMFATA94EuvEfvwiKY3mCDc+8icdRZCexDA3oZ61Y/7E0ARKwScGf2eTOOEzdbybSW
 Ul3A==
X-Gm-Message-State: AOAM530sHgIvHoPAb508nD3ZU7pCGyGfqhvoVI4Mmbbz+A4x84gBC5VO
 N94rTjU2a04O8DrKQJyTtUQlQg==
X-Google-Smtp-Source: ABdhPJwjH4sxI5gz2lmeIyZObD9Jj2SDexCt+v3r5BWNxvMF2C3dupdWslOlqL3wBZZKbfST24ED/Q==
X-Received: by 2002:a05:600c:2215:: with SMTP id
 z21mr9057262wml.47.1630682079233; 
 Fri, 03 Sep 2021 08:14:39 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y21sm4737780wmc.11.2021.09.03.08.14.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 08:14:38 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 1/4] qdev: Support marking individual buses as 'full'
Date: Fri,  3 Sep 2021 16:14:32 +0100
Message-Id: <20210903151435.22379-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210903151435.22379-1-peter.maydell@linaro.org>
References: <20210903151435.22379-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>
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



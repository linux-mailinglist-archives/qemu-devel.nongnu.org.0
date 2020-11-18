Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3D32B79AF
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 09:57:16 +0100 (CET)
Received: from localhost ([::1]:34706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfJH9-0002qx-3Z
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 03:57:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kfIyv-00030Z-1s
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:38:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kfIyt-0005cc-78
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:38:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605688702;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/d1v6DBgojNw2uMHK1agy5e9FlbdhWGWctrKkwB9trQ=;
 b=GELGOcThShwlwpnTSt3y5K3QQLhjc7jWUFo8HcqdFDdJLh6eHw/488PEXYznOUTx2gN8zo
 q0KTxne3Ej/6MZqNVt7126OLM9SaoWvHG73deVDTmHDYNBVMYs2/VSK040EjBT2rpsvjDE
 faJayMrSsX08QI/7dNGDb2cX+lEaMbY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-434-0HDYRPwJPeeMhnaNctoUyA-1; Wed, 18 Nov 2020 03:38:20 -0500
X-MC-Unique: 0HDYRPwJPeeMhnaNctoUyA-1
Received: by mail-wr1-f72.google.com with SMTP id k1so625218wrg.12
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 00:38:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/d1v6DBgojNw2uMHK1agy5e9FlbdhWGWctrKkwB9trQ=;
 b=ArTgfIaK45OtNlNyv4Mn09LcSqOmwcTc1UnHOv2FU3oq4dgr2V5d7EsWT891vZa4ev
 xmlam20eiIOgPEMjOq4OW3L0mf5FKM1gcLcTqtvPI55Q7dLMsRa6uT3yCyqPbIv9JVRI
 npR5yZ8n89ePIE9cxoxdoDCAieEO4rR0OviGTG2cogiP7q0+eSmoGyQRVPzbiDP32SoH
 DJnMVWEecQE7qpLFzNUgRbQhEeZBsJ/JYYif4dLO3GIO1XQ5G9EsiJZiczZX9FG9tbjV
 zVjDZYLxGT+O65gaBzjSNEeYkM2qjl7kvQC8C7fmLgnTetiSFJOdpFupxaXH1oyGqg1/
 a2EQ==
X-Gm-Message-State: AOAM532S2v+VIMMgsm+GTeTfQ6iBuKSHBomZWoQEh6wN/IILN+clukVJ
 QiC25acicL3rPxXO22TTpBc9gmLmVcYQwKTVv7+UphBjsSYJ+tSRaXh4iIm0BzxaQJcfioOj+HX
 kdElZ/VfAaJK/wtwK1vMUAqWc2NXBV1DU7LmPTXFuxziMlSKZ3zQE1Hx8Q9iBSyvLy3w=
X-Received: by 2002:adf:d84b:: with SMTP id k11mr3543762wrl.305.1605688699422; 
 Wed, 18 Nov 2020 00:38:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwiN19WF4OtArHliT8uWJPU14nVVviCfHAScJTRcWyCWZMeXEbRQoqP8vEkPfxEbE/ZJYDx0A==
X-Received: by 2002:adf:d84b:: with SMTP id k11mr3543738wrl.305.1605688699246; 
 Wed, 18 Nov 2020 00:38:19 -0800 (PST)
Received: from localhost (trasno.trasno.org. [83.165.45.250])
 by smtp.gmail.com with ESMTPSA id j71sm2522761wmj.10.2020.11.18.00.38.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 00:38:18 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 19/27] failover: simplify qdev_device_add() failover case
Date: Wed, 18 Nov 2020 09:37:40 +0100
Message-Id: <20201118083748.1328-20-quintela@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201118083748.1328-1-quintela@redhat.com>
References: <20201118083748.1328-1-quintela@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 19:41:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Just put allthe logic inside the same if.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 softmmu/qdev-monitor.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index a25f5d612c..12b7540f17 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -600,7 +600,6 @@ DeviceState *qdev_device_add(QemuOpts *opts, Error **errp)
     const char *driver, *path;
     DeviceState *dev = NULL;
     BusState *bus = NULL;
-    bool hide;
 
     driver = qemu_opt_get(opts, "driver");
     if (!driver) {
@@ -634,17 +633,19 @@ DeviceState *qdev_device_add(QemuOpts *opts, Error **errp)
             return NULL;
         }
     }
-    hide = should_hide_device(opts);
 
-    if ((hide || qdev_hotplug) && bus && !qbus_is_hotpluggable(bus)) {
+    if (should_hide_device(opts)) {
+        if (bus && !qbus_is_hotpluggable(bus)) {
+            error_setg(errp, QERR_BUS_NO_HOTPLUG, bus->name);
+        }
+        return NULL;
+    }
+
+    if (qdev_hotplug && bus && !qbus_is_hotpluggable(bus)) {
         error_setg(errp, QERR_BUS_NO_HOTPLUG, bus->name);
         return NULL;
     }
 
-    if (hide) {
-        return NULL;
-    }
-
     if (!migration_is_idle()) {
         error_setg(errp, "device_add not allowed while migrating");
         return NULL;
-- 
2.26.2



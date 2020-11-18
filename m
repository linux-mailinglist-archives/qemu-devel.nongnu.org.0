Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 525FD2B79F3
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 10:05:55 +0100 (CET)
Received: from localhost ([::1]:37730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfJPW-0007LJ-Cp
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 04:05:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kfIyw-00033g-9v
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:38:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kfIyu-0005dV-Er
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:38:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605688703;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8f+XuO3LDEIIB2EAEZIj7OLu1bSb0Kj1s21nNqxaLGw=;
 b=CxrpC6sx+kck6DuE7Q6PKHxzs/OZEkufymuZH/v5H32O3M2lFVV/Q11tCDgtxTT1IjPzMY
 NLDSCIOgZXGzngIMksRGwY6QJ7lfK+NSIKqwoAldfYrNuRJgRntivNx+YZchyzAVviamDR
 qcbOFZohs5XkAnDhWMxFppEj4ZCBiOI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-534-NTmCdXOnPOSmvgjLS03fIA-1; Wed, 18 Nov 2020 03:38:22 -0500
X-MC-Unique: NTmCdXOnPOSmvgjLS03fIA-1
Received: by mail-wr1-f71.google.com with SMTP id v5so645334wrr.0
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 00:38:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8f+XuO3LDEIIB2EAEZIj7OLu1bSb0Kj1s21nNqxaLGw=;
 b=A5BTrSwff1nt35j8+WQNm51S3zG5rQFy3dXM7hEYXFoVa2wjHBDVZ811oU4AKCABb7
 YklBBHeuDP2INaevdHVzlXbN81guC+q5f2zClJjcnKfuypvof8Dg8IAcqCyZNQ8Tkczw
 NIfPDyyfUrn2/fOvHF9HgHmtnLoyMxb6YW5zzM68O5LwKf4puVyNTBMB/H9w2lB3fg1+
 Vk+Ya25JjqhCtwij+IdhwukvKfFSR5oWBXWjK+5QnQW5B32ye9wgYOLUmtaZvKFODnbE
 FsI8xlHtx4Sjg2wUiWJiqKL1hhywSx9Lg0Tb7X88Ue8yKvO2X4n6M2W7+DTAHNpk+xy4
 EK7Q==
X-Gm-Message-State: AOAM533NDXBQfaaUMpj1yO/ccaaoqwIazCve+xYM7CUiZkfUiXoqRVOZ
 XkYqfye80ngHdlF6m6h8CH/V6tsOovu8SnTJs8V5saLpYReiYmWPQ2kcxYmpEAzFRFkvnAwL34x
 3avit1+wbfBNdoZAZyzd3jlMzS5auJcyd+kP0UeheEf548pi15Er8uTDA/PKgj1IeNJk=
X-Received: by 2002:a1c:4944:: with SMTP id w65mr3310516wma.50.1605688700869; 
 Wed, 18 Nov 2020 00:38:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxYAYsN574m73lHJqJdq4j2tZx800f67ztwnPaG2rpsRTHpqC5MvXoJZLwqHZRDefEWWypkTw==
X-Received: by 2002:a1c:4944:: with SMTP id w65mr3310494wma.50.1605688700702; 
 Wed, 18 Nov 2020 00:38:20 -0800 (PST)
Received: from localhost (trasno.trasno.org. [83.165.45.250])
 by smtp.gmail.com with ESMTPSA id v19sm33119536wrf.40.2020.11.18.00.38.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 00:38:20 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 20/27] failover: simplify qdev_device_add()
Date: Wed, 18 Nov 2020 09:37:41 +0100
Message-Id: <20201118083748.1328-21-quintela@redhat.com>
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

We don't need to walk the opts by hand.  qmp_opt_get() already does
that.  And then we can remove the functions that did that walk.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 softmmu/qdev-monitor.c | 32 ++++++--------------------------
 1 file changed, 6 insertions(+), 26 deletions(-)

diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index 12b7540f17..0e10f0466f 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -572,28 +572,6 @@ void qdev_set_id(DeviceState *dev, const char *id)
     }
 }
 
-static int is_failover_device(void *opaque, const char *name, const char *value,
-                              Error **errp)
-{
-    if (strcmp(name, "failover_pair_id") == 0) {
-        QemuOpts *opts = opaque;
-
-        if (qdev_should_hide_device(opts)) {
-            return 1;
-        }
-    }
-
-    return 0;
-}
-
-static bool should_hide_device(QemuOpts *opts)
-{
-    if (qemu_opt_foreach(opts, is_failover_device, opts, NULL) == 0) {
-        return false;
-    }
-    return true;
-}
-
 DeviceState *qdev_device_add(QemuOpts *opts, Error **errp)
 {
     DeviceClass *dc;
@@ -634,11 +612,13 @@ DeviceState *qdev_device_add(QemuOpts *opts, Error **errp)
         }
     }
 
-    if (should_hide_device(opts)) {
-        if (bus && !qbus_is_hotpluggable(bus)) {
-            error_setg(errp, QERR_BUS_NO_HOTPLUG, bus->name);
+    if (qemu_opt_get(opts, "failover_pair_id")) {
+        if (qdev_should_hide_device(opts)) {
+            if (bus && !qbus_is_hotpluggable(bus)) {
+                error_setg(errp, QERR_BUS_NO_HOTPLUG, bus->name);
+            }
+            return NULL;
         }
-        return NULL;
     }
 
     if (qdev_hotplug && bus && !qbus_is_hotpluggable(bus)) {
-- 
2.26.2



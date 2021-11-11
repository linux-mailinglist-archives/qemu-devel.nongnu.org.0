Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7E644D719
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 14:19:41 +0100 (CET)
Received: from localhost ([::1]:50384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml9zQ-0000gg-3v
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 08:19:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ml9pg-00072Y-2N
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 08:09:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ml9pe-000542-9q
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 08:09:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636636173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qnudr3jVW2eS2ktNbb8o44JZbFw9wE6RWWzNU2qimAc=;
 b=HAPb08gOOqNU99V+GA/fSNwDDLubMZJ77APy4EDIys5dWieAXjwJJ72MCrYQlPINbvqjYf
 sYMm3Fbm9Ht7CUO5PGzznyGzylx1qUEzCSguYQ61xlpdgM0Kfje8btZxxHFt2OZCiCOLlh
 5w+KACQTOOJoNLj/1lX/WHyhiLrajiQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-537-9eYd8Q3UMC6UJUFzP7lqsQ-1; Thu, 11 Nov 2021 08:09:30 -0500
X-MC-Unique: 9eYd8Q3UMC6UJUFzP7lqsQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E7AB280A5CA;
 Thu, 11 Nov 2021 13:09:25 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.245])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BF0DC6A249;
 Thu, 11 Nov 2021 13:09:24 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1D75F18009D2; Thu, 11 Nov 2021 14:09:00 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 6/6] pcie: expire pending delete
Date: Thu, 11 Nov 2021 14:08:59 +0100
Message-Id: <20211111130859.1171890-7-kraxel@redhat.com>
In-Reply-To: <20211111130859.1171890-1-kraxel@redhat.com>
References: <20211111130859.1171890-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add an expire time for pending delete, once the time is over allow
pressing the attention button again.

This makes pcie hotplug behave more like acpi hotplug, where one can
try sending an 'device_del' monitor command again in case the guest
didn't respond to the first attempt.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/hw/qdev-core.h | 1 +
 hw/pci/pcie.c          | 2 ++
 softmmu/qdev-monitor.c | 4 +++-
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index 72622bd33706..20d3066595e4 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -181,6 +181,7 @@ struct DeviceState {
     char *canonical_path;
     bool realized;
     bool pending_deleted_event;
+    int64_t pending_deleted_expires_ms;
     QDict *opts;
     int hotplugged;
     bool allow_unplug_during_migration;
diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
index a930ac738a15..c5ed26633723 100644
--- a/hw/pci/pcie.c
+++ b/hw/pci/pcie.c
@@ -548,6 +548,8 @@ void pcie_cap_slot_unplug_request_cb(HotplugHandler *hotplug_dev,
     }
 
     dev->pending_deleted_event = true;
+    dev->pending_deleted_expires_ms =
+        qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL) + 5000; /* 5 secs */
 
     /* In case user cancel the operation of multi-function hot-add,
      * remove the function that is unexposed to guest individually,
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index b5aaae4b8cbe..cc402f18b933 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -937,7 +937,9 @@ void qmp_device_del(const char *id, Error **errp)
 {
     DeviceState *dev = find_device_state(id, errp);
     if (dev != NULL) {
-        if (dev->pending_deleted_event) {
+        if (dev->pending_deleted_event &&
+            (dev->pending_deleted_expires_ms == 0 ||
+             dev->pending_deleted_expires_ms > qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL))) {
             error_setg(errp, "Device %s is already in the "
                              "process of unplug", id);
             return;
-- 
2.33.1



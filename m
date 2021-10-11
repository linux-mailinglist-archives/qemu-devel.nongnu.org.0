Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D20428CBC
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 14:11:36 +0200 (CEST)
Received: from localhost ([::1]:39798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZu9X-0006QL-Ml
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 08:11:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mZu4L-0006GA-E4
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 08:06:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54250)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mZu4J-0004VE-UL
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 08:06:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633953971;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T52qkV6p0EqIPaRnDHzBDcMR40tyCSd7kE1e9itdo+Y=;
 b=EVCP0Xll7F9wiVUIKn1odtigMzH66hb5ZNPecTprI8F4f4hx4tjWdu/arFI9LAVGtP/HYT
 a9R1U+EdDLYrMDYeeXFxnC9L+30bv+q/HStvUohifa9OY0c6AWvXGmeLcjbnuajbgvnVI+
 oRRw0+gjfv7TVvWYZ32nDapWzJ94lnI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-cwPMBUGIOLqot81Nog823Q-1; Mon, 11 Oct 2021 08:06:10 -0400
X-MC-Unique: cwPMBUGIOLqot81Nog823Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 777DB801A93;
 Mon, 11 Oct 2021 12:06:09 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7304960C4A;
 Mon, 11 Oct 2021 12:05:57 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id BF22518009EB; Mon, 11 Oct 2021 14:05:04 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/6] pcie: expire pending delete
Date: Mon, 11 Oct 2021 14:05:04 +0200
Message-Id: <20211011120504.254053-7-kraxel@redhat.com>
In-Reply-To: <20211011120504.254053-1-kraxel@redhat.com>
References: <20211011120504.254053-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
index 4ff19c714bd8..d082a9a00aca 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -180,6 +180,7 @@ struct DeviceState {
     char *canonical_path;
     bool realized;
     bool pending_deleted_event;
+    int64_t pending_deleted_expires_ms;
     QemuOpts *opts;
     int hotplugged;
     bool allow_unplug_during_migration;
diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
index f3ac04399969..477c8776aa27 100644
--- a/hw/pci/pcie.c
+++ b/hw/pci/pcie.c
@@ -549,6 +549,8 @@ void pcie_cap_slot_unplug_request_cb(HotplugHandler *hotplug_dev,
     }
 
     dev->pending_deleted_event = true;
+    dev->pending_deleted_expires_ms =
+        qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL) + 5000; /* 5 secs */
 
     /* In case user cancel the operation of multi-function hot-add,
      * remove the function that is unexposed to guest individually,
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index 0705f008466d..5e7960c52a0a 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -910,7 +910,9 @@ void qmp_device_del(const char *id, Error **errp)
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
2.31.1



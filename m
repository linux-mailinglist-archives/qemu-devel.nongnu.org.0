Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A65BA284C06
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Oct 2020 14:52:41 +0200 (CEST)
Received: from localhost ([::1]:47758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kPmSO-0006Uq-Ml
	for lists+qemu-devel@lfdr.de; Tue, 06 Oct 2020 08:52:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kPmGJ-0001zl-GN
 for qemu-devel@nongnu.org; Tue, 06 Oct 2020 08:40:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kPmGH-0007zQ-B0
 for qemu-devel@nongnu.org; Tue, 06 Oct 2020 08:40:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601988008;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nnuyc6vGg0YQTTko9ZFG8pQ6V7jgI3e2I4rg00G88H8=;
 b=e9xOKIvTbyagvseNKNvvH32fsqDZ0ybXi/YCKhrmWM13Em9dQe/7wExq7UBlb0w8sgLRg3
 //fjn87awYLljEMpoLgOpfI9k9G/Rf4olqsn7b9H76iOTiHhcGkKnciS2W2agaHGNZIYRr
 ijXaH6ZbSkgZNe2d/Bi79BUKipP1JHQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-492-KeDsAdMBMOKiRS1eMl-9AA-1; Tue, 06 Oct 2020 08:40:06 -0400
X-MC-Unique: KeDsAdMBMOKiRS1eMl-9AA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E2245802B45;
 Tue,  6 Oct 2020 12:40:04 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.35.206.84])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C80C855760;
 Tue,  6 Oct 2020 12:39:57 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 09/13] device-core: use atomic_set on .realized property
Date: Tue,  6 Oct 2020 15:39:00 +0300
Message-Id: <20201006123904.610658-10-mlevitsk@redhat.com>
In-Reply-To: <20201006123904.610658-1-mlevitsk@redhat.com>
References: <20201006123904.610658-1-mlevitsk@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlevitsk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/06 01:55:55
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.733,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Maxim Levitsky <mlevitsk@redhat.com>, John Snow <jsnow@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some code might race with placement of new devices on a bus.
We currently first place a (unrealized) device on the bus
and then realize it.

As a workaround, users that scan the child device list, can
check the realized property to see if it is safe to access such a device.
Use an atomic write here too to aid with this.

A separate discussion is what to do with devices that are unrealized:
It looks like for this case we only call the hotplug handler's unplug
callback and its up to it to unrealize the device.
An atomic operation doesn't cause harm for this code path though.

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20200913160259.32145-6-mlevitsk@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/core/qdev.c         | 19 ++++++++++++++++++-
 include/hw/qdev-core.h |  2 ++
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index 59e5e710b7..fc4daa36fa 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -946,7 +946,25 @@ static void device_set_realized(Object *obj, bool value, Error **errp)
             }
        }
 
+       qatomic_store_release(&dev->realized, value);
+
     } else if (!value && dev->realized) {
+
+        /*
+         * Change the value so that any concurrent users are aware
+         * that the device is going to be unrealized
+         *
+         * TODO: change .realized property to enum that states
+         * each phase of the device realization/unrealization
+         */
+
+        qatomic_set(&dev->realized, value);
+        /*
+         * Ensure that concurrent users see this update prior to
+         * any other changes done by unrealize.
+         */
+        smp_wmb();
+
         QLIST_FOREACH(bus, &dev->child_bus, sibling) {
             qbus_unrealize(bus);
         }
@@ -961,7 +979,6 @@ static void device_set_realized(Object *obj, bool value, Error **errp)
     }
 
     assert(local_err == NULL);
-    dev->realized = value;
     return;
 
 child_realize_fail:
diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index 2c6307e3ed..868973319e 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -163,6 +163,8 @@ struct NamedClockList {
 /**
  * DeviceState:
  * @realized: Indicates whether the device has been fully constructed.
+ *            When accessed outsize big qemu lock, must be accessed with
+ *            atomic_load_acquire()
  * @reset: ResettableState for the device; handled by Resettable interface.
  *
  * This structure should not be accessed directly.  We declare it here
-- 
2.26.2



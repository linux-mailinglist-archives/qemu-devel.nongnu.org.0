Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8F624AC4C
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Aug 2020 02:36:58 +0200 (CEST)
Received: from localhost ([::1]:58400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k8YZd-0006q1-R6
	for lists+qemu-devel@lfdr.de; Wed, 19 Aug 2020 20:36:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1k8YDU-0007Fx-O8
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 20:14:04 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:36403
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1k8YDT-0002RD-0F
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 20:14:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597882442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D9F/zJODlTZa0Ik9V5FFLr0xn16D9Xi/6K5VZnCL0X8=;
 b=aydnmiVZVBYNgYhxh0Q9OtZKgsECmG3ItYw9JFDNUckZpeHbDlas61dezqHWX8k7Z9+iJf
 5dH2QCGzwldjFoihPk6ORr17mKbxVdY7n1FkKDKBErfminQDc2xXplMNM9MhW8q8wukwjK
 fevsh9LSpS3HvT5DN8TiFbe5Sl9zDjc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-sy9pydsiPFaD92HxUyPSFA-1; Wed, 19 Aug 2020 20:14:00 -0400
X-MC-Unique: sy9pydsiPFaD92HxUyPSFA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D5071186A579
 for <qemu-devel@nongnu.org>; Thu, 20 Aug 2020 00:13:59 +0000 (UTC)
Received: from localhost (ovpn-117-244.rdu2.redhat.com [10.10.117.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A1C0160BEC;
 Thu, 20 Aug 2020 00:13:59 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 34/58] vmbus: Move QOM macros to vmbus.h
Date: Wed, 19 Aug 2020 20:12:12 -0400
Message-Id: <20200820001236.1284548-35-ehabkost@redhat.com>
In-Reply-To: <20200820001236.1284548-1-ehabkost@redhat.com>
References: <20200820001236.1284548-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/18 23:05:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move all declarations related to TYPE_VMBUS to the same place in
vmbus.h.

This will make future conversion to OBJECT_DECLARE* easier.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Changes series v1 -> v2: new patch in series v2

Cc: qemu-devel@nongnu.org
---
 include/hw/hyperv/vmbus-bridge.h | 3 +--
 include/hw/hyperv/vmbus.h        | 4 ++++
 hw/hyperv/vmbus.c                | 3 ---
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/hw/hyperv/vmbus-bridge.h b/include/hw/hyperv/vmbus-bridge.h
index 33f93de64d..fe90bda01b 100644
--- a/include/hw/hyperv/vmbus-bridge.h
+++ b/include/hw/hyperv/vmbus-bridge.h
@@ -11,11 +11,10 @@
 #define HW_HYPERV_VMBUS_BRIDGE_H
 
 #include "hw/sysbus.h"
+#include "hw/hyperv/vmbus.h"
 
 #define TYPE_VMBUS_BRIDGE "vmbus-bridge"
 
-typedef struct VMBus VMBus;
-
 typedef struct VMBusBridge {
     SysBusDevice parent_obj;
 
diff --git a/include/hw/hyperv/vmbus.h b/include/hw/hyperv/vmbus.h
index 40e8417eec..cd98ec24e7 100644
--- a/include/hw/hyperv/vmbus.h
+++ b/include/hw/hyperv/vmbus.h
@@ -26,6 +26,10 @@
 #define VMBUS_DEVICE_GET_CLASS(obj) \
     OBJECT_GET_CLASS(VMBusDeviceClass, (obj), TYPE_VMBUS_DEVICE)
 
+#define TYPE_VMBUS "vmbus"
+typedef struct VMBus VMBus;
+#define VMBUS(obj) OBJECT_CHECK(VMBus, (obj), TYPE_VMBUS)
+
 /*
  * Object wrapping a GPADL -- GPA Descriptor List -- an array of guest physical
  * pages, to be used for various buffers shared between the host and the guest.
diff --git a/hw/hyperv/vmbus.c b/hw/hyperv/vmbus.c
index 34392e892a..75af6b83dd 100644
--- a/hw/hyperv/vmbus.c
+++ b/hw/hyperv/vmbus.c
@@ -20,9 +20,6 @@
 #include "cpu.h"
 #include "trace.h"
 
-#define TYPE_VMBUS "vmbus"
-#define VMBUS(obj) OBJECT_CHECK(VMBus, (obj), TYPE_VMBUS)
-
 enum {
     VMGPADL_INIT,
     VMGPADL_ALIVE,
-- 
2.26.2



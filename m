Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B756E2B173E
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 09:34:52 +0100 (CET)
Received: from localhost ([::1]:36432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdUXj-0005Zm-R3
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 03:34:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kdUPl-0006BC-0F
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 03:26:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29142)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kdUPi-0005jF-5N
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 03:26:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605255993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yi11DC7Q4Yhy44eYBjY5ENf72O5lFNnlB5CRDSqfCVg=;
 b=ck1ZaK+bllzjLwDsJDM3gNP//mqQ/NS2ahcToQKCNMnTf1HXyYC6Vnh42zN3uRbtFlRRtT
 GeW4TD8VI07ETQJJ1/cJHns2W1Q4jWrUMTK/9FJtpsvtd9+AcX68pxdDGQRvWw1NFJbxo7
 1l9qqXI2ZrGEj6YbXBYvXccMvylaUVE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-224-ZtLsMilnNXm1sm-KdCuKQw-1; Fri, 13 Nov 2020 03:26:30 -0500
X-MC-Unique: ZtLsMilnNXm1sm-KdCuKQw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C82AF186DD4D
 for <qemu-devel@nongnu.org>; Fri, 13 Nov 2020 08:26:29 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9B0E75577C
 for <qemu-devel@nongnu.org>; Fri, 13 Nov 2020 08:26:29 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A0F361138403; Fri, 13 Nov 2020 09:26:26 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/10] Tweak a few "Parameter 'NAME' expects THING" error
 message
Date: Fri, 13 Nov 2020 09:26:26 +0100
Message-Id: <20201113082626.2725812-11-armbru@redhat.com>
In-Reply-To: <20201113082626.2725812-1-armbru@redhat.com>
References: <20201113082626.2725812-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 16:09:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Change to "expects a THING" where that's an obvious improvement

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 block/quorum.c                   | 2 +-
 blockdev.c                       | 2 +-
 chardev/char.c                   | 2 +-
 hw/core/qdev-properties-system.c | 2 +-
 softmmu/qdev-monitor.c           | 4 ++--
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/block/quorum.c b/block/quorum.c
index e846a7e892..656a80f93a 100644
--- a/block/quorum.c
+++ b/block/quorum.c
@@ -856,7 +856,7 @@ static int quorum_valid_threshold(int threshold, int num_children, Error **errp)
 
     if (threshold < 1) {
         error_setg(errp, QERR_INVALID_PARAMETER_VALUE,
-                   "vote-threshold", "value >= 1");
+                   "vote-threshold", "a value >= 1");
         return -ERANGE;
     }
 
diff --git a/blockdev.c b/blockdev.c
index d05a8740f4..6c7be7c522 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -2991,7 +2991,7 @@ static void blockdev_mirror_common(const char *job_id, BlockDriverState *bs,
     }
     if (granularity & (granularity - 1)) {
         error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "granularity",
-                   "power of 2");
+                   "a power of 2");
         return;
     }
 
diff --git a/chardev/char.c b/chardev/char.c
index aa4282164a..a9b8c5a9aa 100644
--- a/chardev/char.c
+++ b/chardev/char.c
@@ -521,7 +521,7 @@ static const ChardevClass *char_get_class(const char *driver, Error **errp)
 
     if (object_class_is_abstract(oc)) {
         error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "driver",
-                   "abstract device type");
+                   "an abstract device type");
         return NULL;
     }
 
diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-system.c
index b81a4e8d14..93061b5bf1 100644
--- a/hw/core/qdev-properties-system.c
+++ b/hw/core/qdev-properties-system.c
@@ -776,7 +776,7 @@ static void set_pci_devfn(Object *obj, Visitor *v, const char *name,
         }
         if (value < -1 || value > 255) {
             error_setg(errp, QERR_INVALID_PARAMETER_VALUE,
-                       name ? name : "null", "pci_devfn");
+                       name ? name : "null", "a value between -1 and 255");
             return;
         }
         *ptr = value;
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index bcfb90a08f..08318c5d9d 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -237,7 +237,7 @@ static DeviceClass *qdev_get_device_class(const char **driver, Error **errp)
 
     if (object_class_is_abstract(oc)) {
         error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "driver",
-                   "non-abstract device type");
+                   "a non-abstract device type");
         return NULL;
     }
 
@@ -245,7 +245,7 @@ static DeviceClass *qdev_get_device_class(const char **driver, Error **errp)
     if (!dc->user_creatable ||
         (qdev_hotplug && !dc->hotpluggable)) {
         error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "driver",
-                   "pluggable device type");
+                   "a pluggable device type");
         return NULL;
     }
 
-- 
2.26.2



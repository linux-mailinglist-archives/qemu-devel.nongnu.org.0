Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC24416EB6
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 11:16:53 +0200 (CEST)
Received: from localhost ([::1]:56058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mThK8-0004HA-GX
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 05:16:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mThAp-0006BR-Ff
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:07:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mThAn-00047N-T7
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:07:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632474431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qV5UEIxZEELZVQ6L7lFBojqVKwPn7e3y0+5jPMqL01U=;
 b=GkG0jLPL4YZ3WcEs0mR80TQ8rPkS0IU4F7PJAhi2QkeFb5DKkyu+c8F8FszsaM4ATxjIGl
 Dd3b6xQn3OEVnfUWIj13AE1w38K9WJ4OSic0tQP5r/rrQPM/kgRoQzT3sy0aDUF9ujn0qn
 gb5XymDP5CKYG3XFCuPmWZoX8emIMek=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-383-Pa40HDbYPeaFLm8uL_i5qQ-1; Fri, 24 Sep 2021 05:06:46 -0400
X-MC-Unique: Pa40HDbYPeaFLm8uL_i5qQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C1C701007905;
 Fri, 24 Sep 2021 09:06:45 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F00635D9DC;
 Fri, 24 Sep 2021 09:06:26 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/11] qdev: Avoid QemuOpts in QMP device_add
Date: Fri, 24 Sep 2021 11:04:25 +0200
Message-Id: <20210924090427.9218-10-kwolf@redhat.com>
In-Reply-To: <20210924090427.9218-1-kwolf@redhat.com>
References: <20210924090427.9218-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.473,
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
Cc: kwolf@redhat.com, pkrempa@redhat.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, libvir-list@redhat.com,
 armbru@redhat.com, its@irrelevant.dk, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Directly call qdev_device_add_from_qdict() for QMP device_add instead of
first going through QemuOpts and converting back to QDict.

Note that this changes the behaviour of device_add, though in ways that
should be considered bug fixes:

QemuOpts ignores differences between data types, so you could
successfully pass a string "123" for an integer property, or a string
"on" for a boolean property (and vice versa).  After this change, the
correct data type for the property must be used in the JSON input.

qemu_opts_from_qdict() also silently ignores any options whose value is
a QDict, QList or QNull.

To illustrate, the following QMP command was accepted before and is now
rejected for both reasons:

{ "execute": "device_add",
  "arguments": { "driver": "scsi-cd",
                 "drive": { "completely": "invalid" },
                 "physical_block_size": "4096" } }

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 softmmu/qdev-monitor.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index c09b7430eb..8622ccade6 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -812,7 +812,8 @@ void hmp_info_qdm(Monitor *mon, const QDict *qdict)
     qdev_print_devinfos(true);
 }
 
-void qmp_device_add(QDict *qdict, QObject **ret_data, Error **errp)
+static void monitor_device_add(QDict *qdict, QObject **ret_data,
+                               bool from_json, Error **errp)
 {
     QemuOpts *opts;
     DeviceState *dev;
@@ -825,7 +826,9 @@ void qmp_device_add(QDict *qdict, QObject **ret_data, Error **errp)
         qemu_opts_del(opts);
         return;
     }
-    dev = qdev_device_add(opts, errp);
+    qemu_opts_del(opts);
+
+    dev = qdev_device_add_from_qdict(qdict, from_json, errp);
 
     /*
      * Drain all pending RCU callbacks. This is done because
@@ -838,13 +841,14 @@ void qmp_device_add(QDict *qdict, QObject **ret_data, Error **errp)
      */
     drain_call_rcu();
 
-    if (!dev) {
-        qemu_opts_del(opts);
-        return;
-    }
     object_unref(OBJECT(dev));
 }
 
+void qmp_device_add(QDict *qdict, QObject **ret_data, Error **errp)
+{
+    monitor_device_add(qdict, ret_data, true, errp);
+}
+
 static DeviceState *find_device_state(const char *id, Error **errp)
 {
     Object *obj;
@@ -936,7 +940,7 @@ void hmp_device_add(Monitor *mon, const QDict *qdict)
 {
     Error *err = NULL;
 
-    qmp_device_add((QDict *)qdict, NULL, &err);
+    monitor_device_add((QDict *)qdict, NULL, false, &err);
     hmp_handle_error(mon, err);
 }
 
-- 
2.31.1



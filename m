Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1272192B0
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jul 2020 23:44:21 +0200 (CEST)
Received: from localhost ([::1]:55628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jtHrY-0007XY-0O
	for lists+qemu-devel@lfdr.de; Wed, 08 Jul 2020 17:44:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jtHbx-0000HC-Fz
 for qemu-devel@nongnu.org; Wed, 08 Jul 2020 17:28:13 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:48246
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jtHbs-00027Z-AK
 for qemu-devel@nongnu.org; Wed, 08 Jul 2020 17:28:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594243687;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kbI0t5xOMXiLx3nzIpbj4/LXhEjhaATFf6Db7PDtyxo=;
 b=aRCEpDUqjW3dm1y6f94oc+4E+ApvFzpMuiHK/5mwcc3mjjJxMo+dIpl6slV4nU3hu4qcBb
 yq6wWEh430bKUTUVFu0zUuREcfvARMWZnVoeKaZFUy5nglvUZFKWOtxNqpJL7xbxaFg8CW
 2nxk9r8YRLjVtqHmLpq9/oTcip3F/OE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-or6cSnVpNeOg6MEaQh6LuQ-1; Tue, 07 Jul 2020 17:25:21 -0400
X-MC-Unique: or6cSnVpNeOg6MEaQh6LuQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D32F01005510
 for <qemu-devel@nongnu.org>; Tue,  7 Jul 2020 21:25:20 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A51905C1D0;
 Tue,  7 Jul 2020 21:25:20 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BF78B10C4AEA; Tue,  7 Jul 2020 23:25:04 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 45/53] hmp: Ignore Error objects where the return value suffices
Date: Tue,  7 Jul 2020 23:24:55 +0200
Message-Id: <20200707212503.1495927-46-armbru@redhat.com>
In-Reply-To: <20200707212503.1495927-1-armbru@redhat.com>
References: <20200707212503.1495927-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/07 17:25:09
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qdev_print_props() receives and throws away Error objects just to
check for object_property_get_str() and object_property_print()
failure.  Unnecessary, both return suitable values, so use those
instead.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20200707160613.848843-46-armbru@redhat.com>
---
 qdev-monitor.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/qdev-monitor.c b/qdev-monitor.c
index 96e52a9e81..31cc1f6564 100644
--- a/qdev-monitor.c
+++ b/qdev-monitor.c
@@ -694,22 +694,22 @@ static void qdev_print_props(Monitor *mon, DeviceState *dev, Property *props,
     if (!props)
         return;
     for (; props->name; props++) {
-        Error *err = NULL;
         char *value;
         char *legacy_name = g_strdup_printf("legacy-%s", props->name);
+
         if (object_property_get_type(OBJECT(dev), legacy_name, NULL)) {
-            value = object_property_get_str(OBJECT(dev), legacy_name, &err);
+            value = object_property_get_str(OBJECT(dev), legacy_name, NULL);
         } else {
-            value = object_property_print(OBJECT(dev), props->name, true, &err);
+            value = object_property_print(OBJECT(dev), props->name, true,
+                                          NULL);
         }
         g_free(legacy_name);
 
-        if (err) {
-            error_free(err);
+        if (!value) {
             continue;
         }
         qdev_printf("%s = %s\n", props->name,
-                    value && *value ? value : "<null>");
+                    *value ? value : "<null>");
         g_free(value);
     }
 }
-- 
2.26.2



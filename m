Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADC3338EAA
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 14:22:49 +0100 (CET)
Received: from localhost ([::1]:35822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKhkc-0005ez-BZ
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 08:22:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lKhhj-0004BP-EO
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:19:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32377)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lKhhb-0007s1-0a
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:19:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615555177;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=NiVh9a+s5xJmZwKdaW1j2o8lJQu15+edSMc644xjHto=;
 b=QHrb2v9bVHvHbubpIL9ShFw/UPyZoQyEbr43IoZqYkMC+1aEeBqVIcRJw3irUEvcKfqs39
 1k2SeXfqsivjwffS+UiNe4CiexIPFMyLuOUkLRGkRxgtjKtXIWy6MWLvimklp2945SLIYX
 xUa6q0fdN4ggzCWRsalURcdIp+egl+M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-567-m0MLrCUhOxeZRT4HxOgKaA-1; Fri, 12 Mar 2021 08:19:33 -0500
X-MC-Unique: m0MLrCUhOxeZRT4HxOgKaA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 536B419057A0
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 13:19:32 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-110.ams2.redhat.com [10.36.114.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 349345D6CF;
 Fri, 12 Mar 2021 13:19:30 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] qom: Support JSON in user_creatable_parse_str()
Date: Fri, 12 Mar 2021 14:19:21 +0100
Message-Id: <20210312131921.421023-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, pbonzini@redhat.com, pkrempa@redhat.com,
 armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Support JSON for --object in all tools and in HMP object_add in the same
way as it is supported in qobject_input_visitor_new_str().

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
Based-on: <20210311144811.313451-1-kwolf@redhat.com>

 qom/object_interfaces.c | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/qom/object_interfaces.c b/qom/object_interfaces.c
index 62d7db7629..f5ea84b6c4 100644
--- a/qom/object_interfaces.c
+++ b/qom/object_interfaces.c
@@ -295,25 +295,35 @@ static void user_creatable_print_help_from_qdict(QDict *args)
 ObjectOptions *user_creatable_parse_str(const char *optarg, Error **errp)
 {
     ERRP_GUARD();
-    QDict *args;
+    QObject *obj;
     bool help;
     Visitor *v;
     ObjectOptions *options;
 
-    args = keyval_parse(optarg, "qom-type", &help, errp);
-    if (*errp) {
-        return NULL;
-    }
-    if (help) {
-        user_creatable_print_help_from_qdict(args);
-        qobject_unref(args);
-        return NULL;
+    if (optarg[0] == '{') {
+        obj = qobject_from_json(optarg, errp);
+        if (!obj) {
+            return NULL;
+        }
+        v = qobject_input_visitor_new(obj);
+    } else {
+        QDict *args = keyval_parse(optarg, "qom-type", &help, errp);
+        if (*errp) {
+            return NULL;
+        }
+        if (help) {
+            user_creatable_print_help_from_qdict(args);
+            qobject_unref(args);
+            return NULL;
+        }
+
+        obj = QOBJECT(args);
+        v = qobject_input_visitor_new_keyval(obj);
     }
 
-    v = qobject_input_visitor_new_keyval(QOBJECT(args));
     visit_type_ObjectOptions(v, NULL, &options, errp);
     visit_free(v);
-    qobject_unref(args);
+    qobject_unref(obj);
 
     return options;
 }
-- 
2.30.2



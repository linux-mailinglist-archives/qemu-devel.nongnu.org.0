Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D121B3396EB
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 19:49:53 +0100 (CET)
Received: from localhost ([::1]:38798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKmrA-00052X-Qe
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 13:49:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKlhc-0001OW-Na
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 12:35:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKlha-0005Mx-RQ
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 12:35:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615570554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D/S7zVYlssE3n9O5/GgMw1mOnPtBg3Z1mvHAKV0+wrU=;
 b=Zlz1F5Ch3D4X0g33Sv6KpzwRN/XY4LEoG0SOUCMtdt3dBhKGc+xYU9MJSpkR6S0YPYUqon
 qWdyO8PnuCqmtBNVesdz4LaYoYAqtkXHLk2jcga8TaLMRq0VFQYigg4QRjHJ7KdznAyezF
 owcj2BWIp3KOfhSPnovM7QoQUyA9vzs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-511-3B13CSUiOzmRbG6Wz2jN9Q-1; Fri, 12 Mar 2021 12:35:52 -0500
X-MC-Unique: 3B13CSUiOzmRbG6Wz2jN9Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3369E8189C7
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 17:35:50 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A2F6A5C1C5;
 Fri, 12 Mar 2021 17:35:49 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/3] vl: allow passing JSON to -object
Date: Fri, 12 Mar 2021 12:35:47 -0500
Message-Id: <20210312173547.1283477-4-pbonzini@redhat.com>
In-Reply-To: <20210312173547.1283477-1-pbonzini@redhat.com>
References: <20210312173547.1283477-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
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
Cc: kwolf@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Extend the ObjectOption code that was added in the previous patch to
enable passing JSON to -object.  Even though we cannot yet add
non-scalar properties with the human-friendly comma-separated syntax,
they can now be added as JSON.

Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 softmmu/vl.c | 33 +++++++++++++++++++++------------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index ae017de46c..0e3fa53057 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -31,6 +31,7 @@
 #include "hw/qdev-properties.h"
 #include "qapi/error.h"
 #include "qapi/qmp/qdict.h"
+#include "qapi/qmp/qjson.h"
 #include "qemu-version.h"
 #include "qemu/cutils.h"
 #include "qemu/help_option.h"
@@ -1712,22 +1713,30 @@ static void object_option_parse(const char *optarg)
     const char *type;
     Visitor *v;
 
-    opts = qemu_opts_parse_noisily(qemu_find_opts("object"),
-                                   optarg, true);
-    if (!opts) {
-        exit(1);
-    }
+    if (optarg[0] == '{') {
+        QObject *obj = qobject_from_json(optarg, &error_fatal);
 
-    type = qemu_opt_get(opts, "qom-type");
-    if (!type) {
-        error_setg(&error_fatal, QERR_MISSING_PARAMETER, "qom-type");
-    }
-    if (user_creatable_print_help(type, opts)) {
-        exit(0);
+        v = qobject_input_visitor_new(obj);
+        qobject_unref(obj);
+    } else {
+        opts = qemu_opts_parse_noisily(qemu_find_opts("object"),
+                                       optarg, true);
+        if (!opts) {
+            exit(1);
+        }
+
+        type = qemu_opt_get(opts, "qom-type");
+        if (!type) {
+            error_setg(&error_fatal, QERR_MISSING_PARAMETER, "qom-type");
+        }
+        if (user_creatable_print_help(type, opts)) {
+            exit(0);
+        }
+
+        v = opts_visitor_new(opts);
     }
 
     opt = g_new0(ObjectOption, 1);
-    v = opts_visitor_new(opts);
     visit_type_ObjectOptions(v, NULL, &opt->opts, &error_fatal);
     visit_free(v);
 
-- 
2.26.2



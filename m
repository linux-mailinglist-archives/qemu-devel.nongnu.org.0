Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49476337849
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 16:42:54 +0100 (CET)
Received: from localhost ([::1]:48194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKNSf-0000Oi-5q
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 10:42:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lKMcv-0005vG-G6
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:49:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lKMcf-0003F3-ON
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:49:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615474144;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x2wvmYga1F9DZJcwR0OO0q424OJ86mIq2PQitttRFqo=;
 b=BxUpatXyckJJAIL3Eb+L2bxbnk/hTZI4Z++EY3WdzkVtaoRvl53UJ4rhzs+Tbfi1m7jcpl
 +IQ8JH+6C9iUL1GACwT2Dt2r74q8pIyzguThqvW2UiYg1XjXZ/2ITov/5s8azg0LHXuVD8
 FhjJvW+RA9DM/5GVnPYSaaRfVaKqM5Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-1aYTSxefM4CXnkA74JBN-g-1; Thu, 11 Mar 2021 09:49:02 -0500
X-MC-Unique: 1aYTSxefM4CXnkA74JBN-g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4FFD28030A0;
 Thu, 11 Mar 2021 14:49:01 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-112.ams2.redhat.com [10.36.114.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 487F35D9F2;
 Thu, 11 Mar 2021 14:49:00 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 30/38] qemu-storage-daemon: Implement --object with
 qmp_object_add()
Date: Thu, 11 Mar 2021 15:48:03 +0100
Message-Id: <20210311144811.313451-31-kwolf@redhat.com>
In-Reply-To: <20210311144811.313451-1-kwolf@redhat.com>
References: <20210311144811.313451-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This QAPIfies --object and ensures that QMP and the command line option
behave the same.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Acked-by: Peter Krempa <pkrempa@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 storage-daemon/qemu-storage-daemon.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/storage-daemon/qemu-storage-daemon.c b/storage-daemon/qemu-storage-daemon.c
index a118f3abfb..c793c423d5 100644
--- a/storage-daemon/qemu-storage-daemon.c
+++ b/storage-daemon/qemu-storage-daemon.c
@@ -38,6 +38,7 @@
 #include "qapi/qapi-visit-block-core.h"
 #include "qapi/qapi-visit-block-export.h"
 #include "qapi/qapi-visit-control.h"
+#include "qapi/qapi-visit-qom.h"
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qstring.h"
 #include "qapi/qobject-input-visitor.h"
@@ -134,15 +135,6 @@ enum {
 
 extern QemuOptsList qemu_chardev_opts;
 
-static QemuOptsList qemu_object_opts = {
-    .name = "object",
-    .implied_opt_name = "qom-type",
-    .head = QTAILQ_HEAD_INITIALIZER(qemu_object_opts.head),
-    .desc = {
-        { }
-    },
-};
-
 static void init_qmp_commands(void)
 {
     qmp_init_marshal(&qmp_commands);
@@ -282,14 +274,22 @@ static void process_options(int argc, char *argv[])
             {
                 QDict *args;
                 bool help;
+                Visitor *v;
+                ObjectOptions *options;
 
                 args = keyval_parse(optarg, "qom-type", &help, &error_fatal);
                 if (help) {
                     user_creatable_print_help_from_qdict(args);
                     exit(EXIT_SUCCESS);
                 }
-                user_creatable_add_dict(args, true, &error_fatal);
+
+                v = qobject_input_visitor_new_keyval(QOBJECT(args));
+                visit_type_ObjectOptions(v, NULL, &options, &error_fatal);
+                visit_free(v);
                 qobject_unref(args);
+
+                qmp_object_add(options, &error_fatal);
+                qapi_free_ObjectOptions(options);
                 break;
             }
         case OPTION_PIDFILE:
@@ -338,7 +338,6 @@ int main(int argc, char *argv[])
 
     module_call_init(MODULE_INIT_QOM);
     module_call_init(MODULE_INIT_TRACE);
-    qemu_add_opts(&qemu_object_opts);
     qemu_add_opts(&qemu_trace_opts);
     qcrypto_init(&error_fatal);
     bdrv_init();
-- 
2.29.2



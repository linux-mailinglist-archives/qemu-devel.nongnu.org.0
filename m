Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A625B2FA698
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 17:47:21 +0100 (CET)
Received: from localhost ([::1]:34188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1XgW-000677-NC
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 11:47:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l1XRT-0002QH-4d
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 11:31:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57085)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l1XRM-0001W0-4m
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 11:31:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610987498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8aL1b7WwqTyIDej+PdsviYOcvQcOFJwTIWoYWkKCTlU=;
 b=dfTjlvPTVb763Soe9SQs4XR4tci+RX/8cbw85Ar5EtzdpYlS+iUxIl9TeMsYFuzvO+/kaO
 bf3uUOYu1Jiv8D3YwETCY9ClgYUo3LuvciuRhrWbcbmfbffELipxDCv5b4zSIq6LB4alMt
 V6gHbo1rHHuoZf5uS2ACgoVHLOow6TQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-onWdjSoZMbGJMT3M92NzTQ-1; Mon, 18 Jan 2021 11:31:36 -0500
X-MC-Unique: onWdjSoZMbGJMT3M92NzTQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A3F8E107ACE3
 for <qemu-devel@nongnu.org>; Mon, 18 Jan 2021 16:31:35 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2EE1110023AE;
 Mon, 18 Jan 2021 16:31:35 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 17/25] qemu-io: use keyval for -object parsing
Date: Mon, 18 Jan 2021 11:31:05 -0500
Message-Id: <20210118163113.780171-18-pbonzini@redhat.com>
In-Reply-To: <20210118163113.780171-1-pbonzini@redhat.com>
References: <20210118163113.780171-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.175,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, imammedo@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Enable creation of object with non-scalar properties.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qemu-io.c | 42 +++++++++++++-----------------------------
 1 file changed, 13 insertions(+), 29 deletions(-)

diff --git a/qemu-io.c b/qemu-io.c
index ac88d8bd40..306086f767 100644
--- a/qemu-io.c
+++ b/qemu-io.c
@@ -477,23 +477,6 @@ enum {
     OPTION_IMAGE_OPTS = 257,
 };
 
-static QemuOptsList qemu_object_opts = {
-    .name = "object",
-    .implied_opt_name = "qom-type",
-    .head = QTAILQ_HEAD_INITIALIZER(qemu_object_opts.head),
-    .desc = {
-        { }
-    },
-};
-
-static bool qemu_io_object_print_help(const char *type, QemuOpts *opts)
-{
-    if (user_creatable_print_help(type, opts)) {
-        exit(0);
-    }
-    return true;
-}
-
 static QemuOptsList file_opts = {
     .name = "file",
     .implied_opt_name = "file",
@@ -550,7 +533,6 @@ int main(int argc, char **argv)
     qcrypto_init(&error_fatal);
 
     module_call_init(MODULE_INIT_QOM);
-    qemu_add_opts(&qemu_object_opts);
     qemu_add_opts(&qemu_trace_opts);
     bdrv_init();
 
@@ -612,14 +594,20 @@ int main(int argc, char **argv)
         case 'U':
             force_share = true;
             break;
-        case OPTION_OBJECT: {
-            QemuOpts *qopts;
-            qopts = qemu_opts_parse_noisily(&qemu_object_opts,
-                                            optarg, true);
-            if (!qopts) {
-                exit(1);
+        case OPTION_OBJECT:
+            {
+                QDict *args;
+                bool help;
+
+                args = keyval_parse(optarg, "qom-type", &help, &error_fatal);
+                if (help) {
+                    user_creatable_print_help_from_qdict(args);
+                    exit(EXIT_SUCCESS);
+                }
+                user_creatable_add_dict(args, true, &error_fatal);
+                qobject_unref(args);
+                break;
             }
-        }   break;
         case OPTION_IMAGE_OPTS:
             imageOpts = true;
             break;
@@ -644,10 +632,6 @@ int main(int argc, char **argv)
         exit(1);
     }
 
-    qemu_opts_foreach(&qemu_object_opts,
-                      user_creatable_add_opts_foreach,
-                      qemu_io_object_print_help, &error_fatal);
-
     if (!trace_init_backends()) {
         exit(1);
     }
-- 
2.26.2




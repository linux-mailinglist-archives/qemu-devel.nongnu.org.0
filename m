Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 604682AF38A
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 15:30:31 +0100 (CET)
Received: from localhost ([::1]:53796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcr8o-0004ZY-B4
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 09:30:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kcr4E-0008GW-3n
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 09:25:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kcr4C-0001mt-53
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 09:25:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605104743;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hbj7WtOxbzc0bZiQUOnwGOkB9Nshb+E+LIixao81N7o=;
 b=bwkSLWRrRiV6SXDmvwyoxqYhpfxHG/azwboPJ9JCDKYqupEpehdi+VKSk/EP8ktN6zSqZB
 a4TpwRVpOeeUW0OQaWtBPatEHAxUPcwQbV9/kHx+uxiHmZLWPVjnOheT8zoEViQkmOJJgS
 qHqJ34h9g/GCtUixa6HhtBt3b3TCFiA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-VHOw2UO0M2OtAuuRcb94Wg-1; Wed, 11 Nov 2020 09:25:41 -0500
X-MC-Unique: VHOw2UO0M2OtAuuRcb94Wg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B37BD8CD801
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 14:25:40 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6F6FC6115F;
 Wed, 11 Nov 2020 14:25:40 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/12] qemu-nbd: use keyval for -object parsing
Date: Wed, 11 Nov 2020 09:25:32 -0500
Message-Id: <20201111142537.1213209-8-pbonzini@redhat.com>
In-Reply-To: <20201111142537.1213209-1-pbonzini@redhat.com>
References: <20201111142537.1213209-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:49:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Enable creation of object with non-scalar properties.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qemu-nbd.c | 42 +++++++++++++-----------------------------
 1 file changed, 13 insertions(+), 29 deletions(-)

diff --git a/qemu-nbd.c b/qemu-nbd.c
index a7075c5419..b4bd21a21e 100644
--- a/qemu-nbd.c
+++ b/qemu-nbd.c
@@ -407,23 +407,6 @@ static QemuOptsList file_opts = {
     },
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
-static bool qemu_nbd_object_print_help(const char *type, QemuOpts *opts)
-{
-    if (user_creatable_print_help(type, opts)) {
-        exit(0);
-    }
-    return true;
-}
-
 
 static QCryptoTLSCreds *nbd_get_tls_creds(const char *id, bool list,
                                           Error **errp)
@@ -599,7 +582,6 @@ int main(int argc, char **argv)
     qcrypto_init(&error_fatal);
 
     module_call_init(MODULE_INIT_QOM);
-    qemu_add_opts(&qemu_object_opts);
     qemu_add_opts(&qemu_trace_opts);
     qemu_init_exec_dir(argv[0]);
 
@@ -752,14 +734,20 @@ int main(int argc, char **argv)
         case '?':
             error_report("Try `%s --help' for more information.", argv[0]);
             exit(EXIT_FAILURE);
-        case QEMU_NBD_OPT_OBJECT: {
-            QemuOpts *opts;
-            opts = qemu_opts_parse_noisily(&qemu_object_opts,
-                                           optarg, true);
-            if (!opts) {
-                exit(EXIT_FAILURE);
+        case QEMU_NBD_OPT_OBJECT:
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
         case QEMU_NBD_OPT_TLSCREDS:
             tlscredsid = optarg;
             break;
@@ -807,10 +795,6 @@ int main(int argc, char **argv)
         export_name = "";
     }
 
-    qemu_opts_foreach(&qemu_object_opts,
-                      user_creatable_add_opts_foreach,
-                      qemu_nbd_object_print_help, &error_fatal);
-
     if (!trace_init_backends()) {
         exit(1);
     }
-- 
2.26.2




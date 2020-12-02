Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 819572CBAA2
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 11:36:40 +0100 (CET)
Received: from localhost ([::1]:50780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkPV1-0002tO-AI
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 05:36:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkO46-0003zf-2c
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 04:04:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkO3o-0004j9-5v
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 04:04:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606899865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hbj7WtOxbzc0bZiQUOnwGOkB9Nshb+E+LIixao81N7o=;
 b=cO+Hb7ZXY9WpVgBA1BzsVkgvnsjGhFJWMNYXAsGYW7QsjWLbX1pqdrfjrUDXqbbX4rzWdY
 IHq8dP2HASfZ+KYpiJJe/iAbYALavsFkJuhoWOWqcnhz9IqIipjF/oaxpa5ER6QmoALl8k
 55IYTxP3auwOte6RC/zpJqU7DkKpmFs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-UcQXQ4G8Nt-xmQpsEcYXpg-1; Wed, 02 Dec 2020 04:04:23 -0500
X-MC-Unique: UcQXQ4G8Nt-xmQpsEcYXpg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C587D100E43E;
 Wed,  2 Dec 2020 09:03:49 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4FD815C1B4;
 Wed,  2 Dec 2020 09:03:49 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 20/28] qemu-nbd: use keyval for -object parsing
Date: Wed,  2 Dec 2020 04:02:57 -0500
Message-Id: <20201202090305.4129317-21-pbonzini@redhat.com>
In-Reply-To: <20201202090305.4129317-1-pbonzini@redhat.com>
References: <20201202090305.4129317-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
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
Cc: kwolf@redhat.com, imammedo@redhat.com, armbru@redhat.com,
 qemu-block@nongnu.org
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




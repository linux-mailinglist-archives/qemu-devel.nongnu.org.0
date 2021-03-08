Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8CC331494
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 18:22:28 +0100 (CET)
Received: from localhost ([::1]:34082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJJaN-00085W-1v
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 12:22:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lJJC0-0004tE-BC
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 11:57:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lJJBy-0000Dj-Cl
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 11:57:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615222632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fDIbs5uQHuyfOCfukvdD7zDHBerAQWCKLrNHJGQGNrw=;
 b=Vgkmv35RrPsfudvNz8qkxhxCasSxNTSarNasGsLNMSNw8vF1wjpud5mqT2Xk7n/epGlW+e
 mm4ie7EKm8fT2Wnv+0tNRZvTJJvDGjBVn4vezcM+w4Z2sKpjAw5h4/DsElPd1E3l3cBdxi
 o6amw1CeEaCD0AK1VvMpbsrqIf10MMY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-259-fBCaAKngMbiAJ_XT1UcKfQ-1; Mon, 08 Mar 2021 11:57:10 -0500
X-MC-Unique: fBCaAKngMbiAJ_XT1UcKfQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 85F891054FA5;
 Mon,  8 Mar 2021 16:57:09 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-112-100.ams2.redhat.com [10.36.112.100])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C4CFE5D9DB;
 Mon,  8 Mar 2021 16:56:59 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 23/30] qemu-io: Use user_creatable_process_cmdline() for
 --object
Date: Mon,  8 Mar 2021 17:54:33 +0100
Message-Id: <20210308165440.386489-24-kwolf@redhat.com>
In-Reply-To: <20210308165440.386489-1-kwolf@redhat.com>
References: <20210308165440.386489-1-kwolf@redhat.com>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: kwolf@redhat.com, lvivier@redhat.com, thuth@redhat.com, pkrempa@redhat.com,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, jasowang@redhat.com, armbru@redhat.com,
 mreitz@redhat.com, kraxel@redhat.com, pbonzini@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This switches qemu-io from a QemuOpts-based parser for --object to
user_creatable_process_cmdline() which uses a keyval parser and enforces
the QAPI schema.

Apart from being a cleanup, this makes non-scalar properties accessible.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Acked-by: Peter Krempa <pkrempa@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 qemu-io.c | 33 +++------------------------------
 1 file changed, 3 insertions(+), 30 deletions(-)

diff --git a/qemu-io.c b/qemu-io.c
index ac88d8bd40..bf902302e9 100644
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
 
@@ -612,14 +594,9 @@ int main(int argc, char **argv)
         case 'U':
             force_share = true;
             break;
-        case OPTION_OBJECT: {
-            QemuOpts *qopts;
-            qopts = qemu_opts_parse_noisily(&qemu_object_opts,
-                                            optarg, true);
-            if (!qopts) {
-                exit(1);
-            }
-        }   break;
+        case OPTION_OBJECT:
+            user_creatable_process_cmdline(optarg);
+            break;
         case OPTION_IMAGE_OPTS:
             imageOpts = true;
             break;
@@ -644,10 +621,6 @@ int main(int argc, char **argv)
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
2.29.2



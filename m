Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 498EA2B0C4D
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 19:07:52 +0100 (CET)
Received: from localhost ([::1]:39448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdH0h-0001Wq-AC
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 13:07:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kdGt3-0001BM-Ke
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 12:59:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33160)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kdGsp-0000m9-Qg
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 12:59:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605203980;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NmA3MmZqTxiwtBEfqDIKt2m4ARbVg0BIQ6mvwBFM2S4=;
 b=XuSlxmgILIxEV53n9uTLn5/Tv/3hNq31mnDnRG3BQfr/esfrhSqsgH78neOAPozurmpIZO
 cUSmIxOlBePBp75OjpkFUrZyH9nQDW05IGw8ogKQLl0KQn9H0JSWytLggzCyuYSysqWF5T
 nlmcYzmxkKJPctglPbFjfHHI/g3sw2Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-247-R1AmfjQXNpC5rU9H6cSqRg-1; Thu, 12 Nov 2020 12:59:35 -0500
X-MC-Unique: R1AmfjQXNpC5rU9H6cSqRg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3C4D3801817
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 17:59:34 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-57.ams2.redhat.com [10.36.115.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 94DAB1002C13;
 Thu, 12 Nov 2020 17:59:32 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/13] char: Add mux option to ChardevOptions
Date: Thu, 12 Nov 2020 18:59:00 +0100
Message-Id: <20201112175905.404472-9-kwolf@redhat.com>
In-Reply-To: <20201112175905.404472-1-kwolf@redhat.com>
References: <20201112175905.404472-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 08:00:44
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
Cc: kwolf@redhat.com, armbru@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The final missing piece to achieve compatibility between
qemu_chr_parse_cli_str()/qemu_chr_new_cli() and the legacy command line
is support for the 'mux' option. Implement it.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 qapi/char.json |  4 +++-
 chardev/char.c | 41 +++++++++++++++++++++++++++++++++++------
 2 files changed, 38 insertions(+), 7 deletions(-)

diff --git a/qapi/char.json b/qapi/char.json
index e1f9347044..d6733a5473 100644
--- a/qapi/char.json
+++ b/qapi/char.json
@@ -453,12 +453,14 @@
 #
 # @id: the chardev's ID, must be unique
 # @backend: backend type and parameters
+# @mux: enable multiplexing mode (default: false)
 #
 # Since: 6.0
 ##
 { 'struct': 'ChardevOptions',
   'data': { 'id': 'str',
-            'backend': 'ChardevBackend' },
+            'backend': 'ChardevBackend',
+            '*mux': 'bool' },
   'aliases': [ { 'source': ['backend'] } ] }
 
 ##
diff --git a/chardev/char.c b/chardev/char.c
index a5d6be9dc8..3bb6a743f7 100644
--- a/chardev/char.c
+++ b/chardev/char.c
@@ -742,11 +742,6 @@ void qemu_chr_translate_legacy_options(QDict *args)
 
     /* name may refer to a QDict entry, so delete it only now */
     qdict_del(args, "backend");
-
-    /*
-     * TODO:
-     * All backend types: "mux"
-     */
 }
 
 Chardev *qemu_chr_new_noreplay(const char *label, const char *filename,
@@ -1105,7 +1100,41 @@ ChardevReturn *qmp_chardev_add(const char *id, ChardevBackend *backend,
 
 Chardev *qemu_chr_new_cli(ChardevOptions *options, Error **errp)
 {
-    return chardev_new_qapi(options->id, options->backend, errp);
+    Chardev *chr;
+    char *bid = NULL;
+
+    if (options->mux) {
+        bid = g_strdup_printf("%s-base", options->id);
+    }
+
+    chr = chardev_new_qapi(bid ?: options->id, options->backend, errp);
+    if (!chr) {
+        goto out;
+    }
+
+    if (options->mux) {
+        Chardev *mux;
+        ChardevMux mux_data = {
+            .chardev = bid,
+        };
+        ChardevBackend backend = {
+            .type = CHARDEV_BACKEND_KIND_MUX,
+            .u.mux.data = &mux_data,
+        };
+
+        mux = qemu_chardev_new(options->id, TYPE_CHARDEV_MUX, &backend, NULL,
+                               errp);
+        if (mux == NULL) {
+            object_unparent(OBJECT(chr));
+            chr = NULL;
+            goto out;
+        }
+        chr = mux;
+    }
+
+out:
+    g_free(bid);
+    return chr;
 }
 
 ChardevOptions *qemu_chr_parse_cli_dict(QDict *args, bool help,
-- 
2.28.0



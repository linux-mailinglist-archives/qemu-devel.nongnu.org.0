Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA77B2B0C21
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 19:02:01 +0100 (CET)
Received: from localhost ([::1]:50828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdGv2-0002qV-GG
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 13:02:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kdGsb-0000uV-50
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 12:59:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kdGsX-0000fo-Sm
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 12:59:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605203963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KcUhZsrL+ski9bi9B4iBEMulBP+XCAux3g/xrg6Tyww=;
 b=OP2d23t3R7XBZdjpzTxCB+WW4ASXV3dQYsAtY/rMkX4ONrkNw9ptwhSsjPpQVWEQh93HZM
 PUwYl7+rZCgeFrLZRfM2fqup0FjYbGI+8Jx0CITXmfl4y48BIUOkPqA9Hk2E40w/IaSREb
 y9vOwe5BTlBpi8FFFZ7OVx8nspLZNMA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-390-kztVKnCKN-CZIOl88b_M8Q-1; Thu, 12 Nov 2020 12:59:22 -0500
X-MC-Unique: kztVKnCKN-CZIOl88b_M8Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2BAC3802ED7
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 17:59:21 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-57.ams2.redhat.com [10.36.115.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7B3AE1002C1B;
 Thu, 12 Nov 2020 17:59:19 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/13] char: Factor out qemu_chr_print_types()
Date: Thu, 12 Nov 2020 18:58:53 +0100
Message-Id: <20201112175905.404472-2-kwolf@redhat.com>
In-Reply-To: <20201112175905.404472-1-kwolf@redhat.com>
References: <20201112175905.404472-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 00:52:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

We'll want to call the same from a non-QemuOpts code path.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
---
 include/chardev/char.h |  1 +
 chardev/char.c         | 16 ++++++++++------
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/include/chardev/char.h b/include/chardev/char.h
index db42f0a8c6..3b91645081 100644
--- a/include/chardev/char.h
+++ b/include/chardev/char.h
@@ -212,6 +212,7 @@ void qemu_chr_be_update_read_handlers(Chardev *s,
  */
 void qemu_chr_be_event(Chardev *s, QEMUChrEvent event);
 
+void qemu_chr_print_types(void);
 int qemu_chr_add_client(Chardev *s, int fd);
 Chardev *qemu_chr_find(const char *name);
 
diff --git a/chardev/char.c b/chardev/char.c
index f9e297185d..de39e2d79b 100644
--- a/chardev/char.c
+++ b/chardev/char.c
@@ -644,6 +644,15 @@ ChardevBackend *qemu_chr_parse_opts(QemuOpts *opts, Error **errp)
     return backend;
 }
 
+void qemu_chr_print_types(void)
+{
+    g_autoptr(GString) str = g_string_new("");
+
+    chardev_name_foreach(help_string_append, str);
+
+    qemu_printf("Available chardev backend types: %s\n", str->str);
+}
+
 Chardev *qemu_chr_new_from_opts(QemuOpts *opts, GMainContext *context,
                                 Error **errp)
 {
@@ -655,12 +664,7 @@ Chardev *qemu_chr_new_from_opts(QemuOpts *opts, GMainContext *context,
     char *bid = NULL;
 
     if (name && is_help_option(name)) {
-        GString *str = g_string_new("");
-
-        chardev_name_foreach(help_string_append, str);
-
-        qemu_printf("Available chardev backend types: %s\n", str->str);
-        g_string_free(str, true);
+        qemu_chr_print_types();
         return NULL;
     }
 
-- 
2.28.0



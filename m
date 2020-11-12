Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D3D2B0C3B
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 19:05:02 +0100 (CET)
Received: from localhost ([::1]:59582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdGxx-0006Rt-8m
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 13:05:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kdGse-0000zw-39
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 12:59:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kdGsc-0000id-5i
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 12:59:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605203969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PwGmz9tmglOIJ2F0kmo9wDUc9dyIypq6pHdcqyM+wpA=;
 b=BE2bCKi4Iy8385wEN25gtrBX2ZAiDfXMBdCe0Bc0ykO7DgrjBVRXCIHFuxBDcvchtcN1Up
 doFFsGkYXdK2qm8gc5XLgJQh+QOC0Wbf5XKdsa3C8frK8/Yb09OLcW7SH2ITfCdncQIBUa
 pI8Lafj38ZJWftkNCkgEqhEFnCVYDdk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-VU45RMZvMXGzeGCmloKV3Q-1; Thu, 12 Nov 2020 12:59:27 -0500
X-MC-Unique: VU45RMZvMXGzeGCmloKV3Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9AEC080474A
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 17:59:26 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-57.ams2.redhat.com [10.36.115.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2059A1002C1B;
 Thu, 12 Nov 2020 17:59:24 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/13] char: Add qemu_chr_translate_legacy_options()
Date: Thu, 12 Nov 2020 18:58:56 +0100
Message-Id: <20201112175905.404472-5-kwolf@redhat.com>
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

This translates legacy command line options that can't be made
compatible with QAPI just by using aliases from the traditional command
line structure into the structure of ChardevOptions.

As a first step, add support for backend name aliases if 'backend' is
given instead of 'type'.

Also add a todo comment for everything that is still incompatible
between the QemuOpts based -chardev and chardev creation by going
through a keyval parser, qemu_chr_translate_legacy_options() and
qemu_chr_new_cli().

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/chardev/char.h | 13 +++++++++++++
 chardev/char.c         | 23 +++++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/include/chardev/char.h b/include/chardev/char.h
index 54fa2ed8e2..7795e17ca5 100644
--- a/include/chardev/char.h
+++ b/include/chardev/char.h
@@ -94,6 +94,19 @@ Chardev *qemu_chr_new_from_opts(QemuOpts *opts,
  */
 Chardev *qemu_chr_new_cli(ChardevOptions *options, Error **errp);
 
+/**
+ * qemu_chr_translate_legacy_options:
+ * @args: Character device creation options as returned by the keyval parser
+ *
+ * Change @args so that the legacy command line options in it are translated
+ * and @args can be used as the input for a ChardevOptions visitor.
+ *
+ * If @args was not a valid legacy command line, translation may be partially
+ * skipped and the visitor may return an error if @args was not already
+ * suitable for QAPI parsing.
+ */
+void qemu_chr_translate_legacy_options(QDict *args);
+
 /**
  * qemu_chr_parse_common:
  * @opts: the options that still need parsing
diff --git a/chardev/char.c b/chardev/char.c
index 9f00e475d4..40c3f02ec9 100644
--- a/chardev/char.c
+++ b/chardev/char.c
@@ -32,6 +32,7 @@
 #include "chardev/char.h"
 #include "qapi/error.h"
 #include "qapi/qapi-commands-char.h"
+#include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qerror.h"
 #include "sysemu/replay.h"
 #include "qemu/help_option.h"
@@ -717,6 +718,28 @@ out:
     return chr;
 }
 
+void qemu_chr_translate_legacy_options(QDict *args)
+{
+    const char *name;
+
+    /* "backend" instead of "type" enables legacy CLI compatibility */
+    name = qdict_get_try_str(args, "backend");
+    if (!name || qdict_haskey(args, "type")) {
+        return;
+    }
+
+    name = chardev_alias_translate(name);
+    qdict_put_str(args, "type", name);
+    qdict_del(args, "backend");
+
+    /*
+     * TODO:
+     * All backend types: "mux"
+     * socket: "addr.type", "delay", "server", "wait", "fd"
+     * udp: defaults for "host"/"localaddr"/"localport"
+     */
+}
+
 Chardev *qemu_chr_new_noreplay(const char *label, const char *filename,
                                bool permit_mux_mon, GMainContext *context)
 {
-- 
2.28.0



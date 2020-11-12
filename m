Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FD32B0C38
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 19:04:54 +0100 (CET)
Received: from localhost ([::1]:59296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdGxo-0006KZ-Mv
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 13:04:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kdGsh-00016d-TA
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 12:59:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kdGsg-0000k7-4k
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 12:59:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605203973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XfBtdCrHrY0GE11uvQp4B1YBBuunGOE6QdtyUEXq38k=;
 b=JrusxmJUZL4wizIwQE5irNQImrWjmBgx0/BsGE1+wpuab7lnP3Lkj+ZeVlYO7Gt7XSLW5U
 r8N+bKfqeadxDD340eb8gcaSOsB8uN90sRu/Hx8/ynhKQsCB57theN2mnB+iOlFqEWR6iR
 kHZiFBh7LjldJPbfE4d5Ru0LKyH9g84=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-358--D5bhXLJPvOrGr-otlQhmg-1; Thu, 12 Nov 2020 12:59:31 -0500
X-MC-Unique: -D5bhXLJPvOrGr-otlQhmg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B9ACAF061
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 17:59:30 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-57.ams2.redhat.com [10.36.115.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BC0BE1002C1B;
 Thu, 12 Nov 2020 17:59:28 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/13] char-udp: Implement compat code for CLI QAPIfication
Date: Thu, 12 Nov 2020 18:58:58 +0100
Message-Id: <20201112175905.404472-7-kwolf@redhat.com>
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

UDP backends have a few differences between CLI and QMP. This adds
QAPI aliases and a .translate_legacy_options() implementation that
converts CLI inputs to a form that's usable for a QAPIfied --chardev.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 qapi/char.json     |  7 ++++++-
 chardev/char-udp.c | 33 +++++++++++++++++++++++++++++++++
 chardev/char.c     |  1 -
 3 files changed, 39 insertions(+), 2 deletions(-)

diff --git a/qapi/char.json b/qapi/char.json
index 1930e90e95..e1f9347044 100644
--- a/qapi/char.json
+++ b/qapi/char.json
@@ -303,7 +303,12 @@
 { 'struct': 'ChardevUdp',
   'data': { 'remote': 'SocketAddressLegacy',
             '*local': 'SocketAddressLegacy' },
-  'base': 'ChardevCommon' }
+  'base': 'ChardevCommon',
+  'aliases': [
+    { 'source': ['remote'] },
+    { 'alias': 'localaddr', 'source': ['local', 'host'] },
+    { 'alias': 'localport', 'source': ['local', 'port'] }
+  ]}
 
 ##
 # @ChardevMux:
diff --git a/chardev/char-udp.c b/chardev/char-udp.c
index 16b5dbce58..61752b1c51 100644
--- a/chardev/char-udp.c
+++ b/chardev/char-udp.c
@@ -23,9 +23,11 @@
  */
 
 #include "qemu/osdep.h"
+#include "block/qdict.h"
 #include "chardev/char.h"
 #include "io/channel-socket.h"
 #include "qapi/error.h"
+#include "qapi/qmp/qdict.h"
 #include "qemu/module.h"
 #include "qemu/option.h"
 
@@ -190,6 +192,36 @@ static void qemu_chr_parse_udp(QemuOpts *opts, ChardevBackend *backend,
     }
 }
 
+static void qemu_chr_translate_udp(QDict *args)
+{
+    QDict *remote;
+    QDict *local;
+
+    /*
+     * If "local" or "remote" are given, it's not a legacy command line.
+     * Not translating in this case saves us checking whether an alias is
+     * already given before applying defaults.
+     */
+    if (qdict_haskey(args, "local") || qdict_haskey(args, "remote")) {
+        return;
+    }
+
+    remote = qdict_new();
+    qdict_put_str(remote, "type", "inet");
+    qdict_put(args, "remote", remote);
+
+    qdict_set_default_str(args, "host", "localhost");
+
+    if (qdict_haskey(args, "localaddr") || qdict_haskey(args, "localport")) {
+        local = qdict_new();
+        qdict_put_str(local, "type", "inet");
+        qdict_put(args, "local", local);
+
+        qdict_set_default_str(args, "localaddr", "");
+        qdict_set_default_str(args, "localport", "0");
+    }
+}
+
 static void qmp_chardev_open_udp(Chardev *chr,
                                  ChardevBackend *backend,
                                  bool *be_opened,
@@ -225,6 +257,7 @@ static void char_udp_class_init(ObjectClass *oc, void *data)
     ChardevClass *cc = CHARDEV_CLASS(oc);
 
     cc->parse = qemu_chr_parse_udp;
+    cc->translate_legacy_options = qemu_chr_translate_udp;
     cc->open = qmp_chardev_open_udp;
     cc->chr_write = udp_chr_write;
     cc->chr_update_read_handler = udp_chr_update_read_handler;
diff --git a/chardev/char.c b/chardev/char.c
index 91b44e53b6..99feaae275 100644
--- a/chardev/char.c
+++ b/chardev/char.c
@@ -744,7 +744,6 @@ void qemu_chr_translate_legacy_options(QDict *args)
     /*
      * TODO:
      * All backend types: "mux"
-     * udp: defaults for "host"/"localaddr"/"localport"
      */
 }
 
-- 
2.28.0



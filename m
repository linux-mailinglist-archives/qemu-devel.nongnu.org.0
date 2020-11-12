Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8502B0C50
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 19:08:34 +0100 (CET)
Received: from localhost ([::1]:43052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdH1N-0002zq-T3
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 13:08:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kdGt4-0001EI-KC
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 12:59:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26262)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kdGst-0000mU-NX
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 12:59:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605203985;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tbXhAvTDC3ngvTRF4fxcFWl9aUU/7PWKDGgGq4/e7c4=;
 b=WUvyrzERsNKt95t8ytHZ9He3QKKL5w/tK20Y1jI53NOD7wUmPe9MQYCsbbgqGIoDPp8+m8
 OApLF54JwVGtmKjg0WCfBKvUbewpl5Y/8/M42D+4K8B5D7TmnmQUanImg4UkxGitDRhVJ6
 D/VB1iZvXlIM1UEgkuCOW/rvu5Y7cJk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-511--Gge9Gx-MhqCnygezJMKlw-1; Thu, 12 Nov 2020 12:59:43 -0500
X-MC-Unique: -Gge9Gx-MhqCnygezJMKlw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C9DE0AF060
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 17:59:42 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-57.ams2.redhat.com [10.36.115.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4E4BA1002C13;
 Thu, 12 Nov 2020 17:59:41 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/13] hmp/char: Use qemu_chr_parse_cli_str() for
 chardev-change
Date: Thu, 12 Nov 2020 18:59:03 +0100
Message-Id: <20201112175905.404472-12-kwolf@redhat.com>
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

Instead of going through the QemuOpts-based parser, go directly from the
given option string to ChardevOptions. This doesn't only avoid legacy
code, but it also simplifies the implementation.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 monitor/hmp-cmds.c | 27 +++++++++------------------
 1 file changed, 9 insertions(+), 18 deletions(-)

diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index a6a6684df1..0244068de8 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -1793,34 +1793,25 @@ void hmp_chardev_add(Monitor *mon, const QDict *qdict)
 void hmp_chardev_change(Monitor *mon, const QDict *qdict)
 {
     const char *args = qdict_get_str(qdict, "args");
-    const char *id;
+    const char *id = qdict_get_str(qdict, "id");
+    char *optstr;
     Error *err = NULL;
-    ChardevBackend *backend = NULL;
+    ChardevOptions *options = NULL;
     ChardevReturn *ret = NULL;
-    QemuOpts *opts = qemu_opts_parse_noisily(qemu_find_opts("chardev"), args,
-                                             true);
-    if (!opts) {
-        error_setg(&err, "Parsing chardev args failed");
-        goto end;
-    }
 
-    id = qdict_get_str(qdict, "id");
-    if (qemu_opts_id(opts)) {
-        error_setg(&err, "Unexpected 'id' parameter");
-        goto end;
-    }
+    optstr = g_strdup_printf("%s,id=%s", args, id);
 
-    backend = qemu_chr_parse_opts(opts, &err);
-    if (!backend) {
+    options = qemu_chr_parse_cli_str(optstr, &err);
+    if (!options) {
         goto end;
     }
 
-    ret = qmp_chardev_change(id, backend, &err);
+    ret = qmp_chardev_change(options->id, options->backend, &err);
 
 end:
+    g_free(optstr);
     qapi_free_ChardevReturn(ret);
-    qapi_free_ChardevBackend(backend);
-    qemu_opts_del(opts);
+    qapi_free_ChardevOptions(options);
     hmp_handle_error(mon, err);
 }
 
-- 
2.28.0



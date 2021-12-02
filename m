Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B0B465EEF
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 08:52:03 +0100 (CET)
Received: from localhost ([::1]:38274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msgss-0008Dv-Qo
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 02:52:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1msg9P-0005Ut-QS
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 02:05:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1msg9N-0006FM-QJ
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 02:05:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638428701;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ISNeR02c5b3tk8GCIpJBOCyn5mtLC5rckNy+rLiam5Q=;
 b=XJ21P4qq8KSz+/M/G34VJIrzVzz6GdfntbYAUflAl9TUpVV7XR02lOAWQ7Vz4wxHcuek2G
 5MDvi82ST8rJC4uhwdRDhUjmRwmWAVGocViE8oAD0N/41j48M1RPhjZBmZTTb+BFA/h9v8
 M+Uca+e/gB2kir7S7y17b7mnM6FUI+E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-410-R5l9yjSGOlCdfDKsByWMKA-1; Thu, 02 Dec 2021 02:04:58 -0500
X-MC-Unique: R5l9yjSGOlCdfDKsByWMKA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4AB788042EA;
 Thu,  2 Dec 2021 07:04:57 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D64E60843;
 Thu,  2 Dec 2021 07:04:53 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1EF9811385BF; Thu,  2 Dec 2021 08:04:50 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 05/11] vl: Demonstrate (bad) CLI wrapped around QMP
Date: Thu,  2 Dec 2021 08:04:44 +0100
Message-Id: <20211202070450.264743-6-armbru@redhat.com>
In-Reply-To: <20211202070450.264743-1-armbru@redhat.com>
References: <20211202070450.264743-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: damien.hedde@greensocs.com, berrange@redhat.com, mark.burton@greensocs.com,
 edgar.iglesias@gmail.co, mirela.grujic@greensocs.com,
 marcandre.lureau@redhat.com, pbonzini@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To ensure you can do everything with QMP, the CLI should wrap around
QMP, like HMP should.

This commit does that in the stupidest way I can think of: each CLI
argument is parsed as QMP command, and fed to the QMP machinery.
Errors are reported, return values thrown away.

This is of course *bad* CLI.  To get decent CLI, we'll want to
translate from CLI syntax to QMP.  We may want to target QMP's C
interface instead of parse trees.

Note that this CLI processing code is cleanly separated from other
startup code, unlike the old CLI code I axed.

Only QMP commands with 'allow-preconfig': true work at this time.
This is because CLI is processed early in startup.  The remainder of
the series is about letting the user interleave CLI and then QMP with
startup.  This will make arbitrary QMP commands available in the CLI.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 softmmu/vl.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index 07be92d5c0..916cba35b7 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -129,6 +129,7 @@
 
 #include "config-host.h"
 
+#include "monitor/monitor-internal.h"
 #include "qapi/qapi-commands-char.h"
 #include "qapi/qapi-types-control.h"
 
@@ -1011,6 +1012,31 @@ void qemu_init(int argc, char **argv, char **envp)
 
     qemu_init_subsystems();
 
+    /*
+     * HACK to demonstrate feeding CLI to QMP
+     * Missing: translate CLI to QMP.  Instead, each CLI argument is
+     * parsed as a QMP command.
+     */
+    {
+        int i;
+        QObject *req;
+        QDict *resp, *error;
+
+        for (i = 1; argv[i]; i++) {
+            loc_set_cmdline(argv, i, 1);
+            req = qobject_from_json(argv[i], &error_fatal);
+            resp = qmp_dispatch(&qmp_commands, req, false, NULL);
+            error = qdict_get_qdict(resp, "error");
+            if (error) {
+                error_report("%s", qdict_get_str(error, "desc"));
+                exit(1);
+            }
+            /* TODO do something with the command's return valud? */
+            qobject_unref(resp);
+            qobject_unref(req);
+        }
+    }
+
     qemu_process_early_options();
 
     qemu_maybe_daemonize(pid_file);
-- 
2.31.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7D23B053E
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 14:53:33 +0200 (CEST)
Received: from localhost ([::1]:57792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvfuG-0007if-B5
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 08:53:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lvfqK-0002Ow-Px
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 08:49:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29299)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lvfqG-0008Uv-Sw
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 08:49:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624366163;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jfljyWXSZEW1kG4lwXWraAl2HkCjYwBi4zyLzKaOYE4=;
 b=d+9sbqhsCf/OShQFqnBA13gOCFseORnMUBpNDDSMSK6z6cpjDmPRqZvq8SQntx2HpBOsVN
 +k/xjhbhlEK21pRY191Z4/j7tCpDoPjuS5HcnZ8L2CzoI8Hl/PpdAJ3TQZoLN8cL0o9ENv
 b6pIUDG0R6+9BX/jY5wuVP6kPbA9iy0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-104-cmP-lY7aMMK3_H8mQnnRiw-1; Tue, 22 Jun 2021 08:49:21 -0400
X-MC-Unique: cmP-lY7aMMK3_H8mQnnRiw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 96BF5101C8AA;
 Tue, 22 Jun 2021 12:49:20 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EF3A55C1CF;
 Tue, 22 Jun 2021 12:49:16 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 55E511800840; Tue, 22 Jun 2021 14:49:15 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/5] monitor: allow register hmp commands
Date: Tue, 22 Jun 2021 14:49:11 +0200
Message-Id: <20210622124915.261060-2-kraxel@redhat.com>
In-Reply-To: <20210622124915.261060-1-kraxel@redhat.com>
References: <20210622124915.261060-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.223,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Greg Kurz <groug@kaod.org>, Markus Armbruster <armbru@redhat.com>,
 qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Allow commands having a NULL cmd pointer, add a function to set the
pointer later.  Use case: allow modules implement hmp commands.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/monitor/monitor.h |  3 +++
 monitor/hmp.c             |  7 +++++++
 monitor/misc.c            | 15 +++++++++++++++
 3 files changed, 25 insertions(+)

diff --git a/include/monitor/monitor.h b/include/monitor/monitor.h
index 1211d6e6d69f..1a8a369b50b2 100644
--- a/include/monitor/monitor.h
+++ b/include/monitor/monitor.h
@@ -51,4 +51,7 @@ int monitor_fdset_dup_fd_add(int64_t fdset_id, int flags);
 void monitor_fdset_dup_fd_remove(int dup_fd);
 int64_t monitor_fdset_dup_fd_find(int dup_fd);
 
+void monitor_register_hmp(const char *name, bool info,
+                          void (*cmd)(Monitor *mon, const QDict *qdict));
+
 #endif /* MONITOR_H */
diff --git a/monitor/hmp.c b/monitor/hmp.c
index 6c0b33a0b19d..d50c3124e1e1 100644
--- a/monitor/hmp.c
+++ b/monitor/hmp.c
@@ -1089,6 +1089,13 @@ void handle_hmp_command(MonitorHMP *mon, const char *cmdline)
         return;
     }
 
+    if (!cmd->cmd) {
+        /* FIXME: is it useful to try autoload modules here ??? */
+        monitor_printf(&mon->common, "Command \"%.*s\" is not available.\n",
+                       (int)(cmdline - cmd_start), cmd_start);
+        return;
+    }
+
     qdict = monitor_parse_arguments(&mon->common, &cmdline, cmd);
     if (!qdict) {
         while (cmdline > cmd_start && qemu_isspace(cmdline[-1])) {
diff --git a/monitor/misc.c b/monitor/misc.c
index 1539e18557f0..672267008b02 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -1974,6 +1974,21 @@ static void sortcmdlist(void)
           compare_mon_cmd);
 }
 
+void monitor_register_hmp(const char *name, bool info,
+                          void (*cmd)(Monitor *mon, const QDict *qdict))
+{
+    HMPCommand *table = info ? hmp_info_cmds : hmp_cmds;
+
+    while (table->name != NULL) {
+        if (strcmp(table->name, name) == 0) {
+            table->cmd = cmd;
+            return;
+        }
+        table++;
+    }
+    g_assert_not_reached();
+}
+
 void monitor_init_globals(void)
 {
     monitor_init_globals_core();
-- 
2.31.1



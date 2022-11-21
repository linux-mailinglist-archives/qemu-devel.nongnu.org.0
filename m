Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7453E631C1C
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 09:54:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox2WD-0003Rb-NV; Mon, 21 Nov 2022 03:51:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ox2WA-0003Qp-R6
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 03:51:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ox2W6-000187-G8
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 03:51:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669020662;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Up+QvkqicLsYw24nwgOZ1rYw4IwHaA+47npc0C+bRLI=;
 b=OnqLRhGaV0vnhlYx9r7v1LkfOyzTUQaZql1mCD+1aE6JryRI5yqEdroXG2LZvgNv55qisp
 voc1F9dcaIB7rS2nG5KvPYE3fyD5faCDpTka5EZivkZ5Vyptbd9rFHiQuC5Mee/7OzgXLM
 kf7afRzXDvTUHldt8RQRJ0rT5cEsXvQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-226-wPp6GiQ9OrKGOan6ygFv8g-1; Mon, 21 Nov 2022 03:50:58 -0500
X-MC-Unique: wPp6GiQ9OrKGOan6ygFv8g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C3DE93814940;
 Mon, 21 Nov 2022 08:50:57 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6AE9117595;
 Mon, 21 Nov 2022 08:50:57 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5A13121E66CA; Mon, 21 Nov 2022 09:50:54 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: eblake@redhat.com, vsementsov@yandex-team.ru,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PATCH 04/10] monitor: Simplify monitor_fd_param()'s error handling
Date: Mon, 21 Nov 2022 09:50:48 +0100
Message-Id: <20221121085054.683122-5-armbru@redhat.com>
In-Reply-To: <20221121085054.683122-1-armbru@redhat.com>
References: <20221121085054.683122-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 monitor/misc.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/monitor/misc.c b/monitor/misc.c
index 205487e2b9..83d7f4ffde 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -1086,6 +1086,7 @@ int monitor_get_fd(Monitor *mon, const char *fdname, Error **errp)
         }
 
         fd = monfd->fd;
+        assert(fd >= 0);
 
         /* caller takes ownership of fd */
         QLIST_REMOVE(monfd, next);
@@ -1403,23 +1404,16 @@ void monitor_fdset_dup_fd_remove(int dup_fd)
 int monitor_fd_param(Monitor *mon, const char *fdname, Error **errp)
 {
     int fd;
-    Error *local_err = NULL;
 
     if (!qemu_isdigit(fdname[0]) && mon) {
-        fd = monitor_get_fd(mon, fdname, &local_err);
+        fd = monitor_get_fd(mon, fdname, errp);
     } else {
         fd = qemu_parse_fd(fdname);
-        if (fd == -1) {
-            error_setg(&local_err, "Invalid file descriptor number '%s'",
+        if (fd < 0) {
+            error_setg(errp, "Invalid file descriptor number '%s'",
                        fdname);
         }
     }
-    if (local_err) {
-        error_propagate(errp, local_err);
-        assert(fd == -1);
-    } else {
-        assert(fd != -1);
-    }
 
     return fd;
 }
-- 
2.37.3



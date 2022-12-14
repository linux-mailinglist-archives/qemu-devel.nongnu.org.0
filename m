Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4478C64CE5F
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 17:51:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5Uu5-0004yo-PL; Wed, 14 Dec 2022 11:46:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p5Uu2-0004x6-0j
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 11:46:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p5Uu0-0002Q8-G6
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 11:46:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671036399;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0updPPD8NQPAaUQbHqF/8edlYMcvyiyoNMStpNGe+Pc=;
 b=aTs1OD0ui18IcVF9uGfmu8mlJHvqh3SA/IYcmzv2/1zzzoyErIlMptvrvxhQNg3ThiLCOD
 9veEzn4WevUeKAOWVLFZXbRWxeuD6q66AFpVjy0u2o2Hvdo6oshlee3CJrlQS4LuZQMRNd
 ERet27Xgmv5Y3UYr8NM/Xp0sgUix5Xw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-400-HcpMAQBuOcagpvXbP35Qew-1; Wed, 14 Dec 2022 11:46:36 -0500
X-MC-Unique: HcpMAQBuOcagpvXbP35Qew-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 16C7387A381;
 Wed, 14 Dec 2022 16:46:36 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E7AA8C15BA0;
 Wed, 14 Dec 2022 16:46:35 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3D94121E688F; Wed, 14 Dec 2022 17:46:29 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PULL 05/14] monitor: Simplify monitor_fd_param()'s error handling
Date: Wed, 14 Dec 2022 17:46:20 +0100
Message-Id: <20221214164629.919880-6-armbru@redhat.com>
In-Reply-To: <20221214164629.919880-1-armbru@redhat.com>
References: <20221214164629.919880-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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
Message-Id: <20221121085054.683122-5-armbru@redhat.com>
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



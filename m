Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 834912D6294
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 17:54:15 +0100 (CET)
Received: from localhost ([::1]:37408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knPCo-0005zF-Hv
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 11:54:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1knOrk-0008Q7-Oq
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 11:32:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1knOrZ-0003TH-8d
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 11:32:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607617931;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CTjlXH9+ni6jMSauDvvkugFLear1OvDjGp2TKIrmroo=;
 b=ClShIteZcvrBYWnjKbtok+GE7HfxfgKGYHwSLLVPdjVPkE3CZDk9xHxHf7BZc+6AXpSC7g
 1Uk4NExO9/Qj+FbE4mtpw95/nJaVWkdGPFSufAzJQ7gtlrb3U1oJL4a/FAzw2zRHLeapVw
 WoIvlRCFYK1xus2P8aBXKqLr7/2+M1c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-sa3B_y4SP3auuciYFe4VPQ-1; Thu, 10 Dec 2020 11:32:07 -0500
X-MC-Unique: sa3B_y4SP3auuciYFe4VPQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 892A3195D575;
 Thu, 10 Dec 2020 16:31:34 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 583CF5D6D3;
 Thu, 10 Dec 2020 16:31:34 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C336111328AA; Thu, 10 Dec 2020 17:31:32 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/13] qerror: Eliminate QERR_ macros used in just one place
Date: Thu, 10 Dec 2020 17:31:22 +0100
Message-Id: <20201210163132.2919935-4-armbru@redhat.com>
In-Reply-To: <20201210163132.2919935-1-armbru@redhat.com>
References: <20201210163132.2919935-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20201113082626.2725812-3-armbru@redhat.com>
---
 include/qapi/qmp/qerror.h | 9 ---------
 monitor/misc.c            | 8 ++++----
 net/net.c                 | 2 +-
 3 files changed, 5 insertions(+), 14 deletions(-)

diff --git a/include/qapi/qmp/qerror.h b/include/qapi/qmp/qerror.h
index 3eabd451d8..c272e3fc29 100644
--- a/include/qapi/qmp/qerror.h
+++ b/include/qapi/qmp/qerror.h
@@ -25,21 +25,12 @@
 #define QERR_DEVICE_HAS_NO_MEDIUM \
     "Device '%s' has no medium"
 
-#define QERR_DEVICE_INIT_FAILED \
-    "Device '%s' could not be initialized"
-
 #define QERR_DEVICE_IN_USE \
     "Device '%s' is in use"
 
 #define QERR_DEVICE_NO_HOTPLUG \
     "Device '%s' does not support hotplugging"
 
-#define QERR_FD_NOT_FOUND \
-    "File descriptor named '%s' not found"
-
-#define QERR_FD_NOT_SUPPLIED \
-    "No file descriptor supplied via SCM_RIGHTS"
-
 #define QERR_FEATURE_DISABLED \
     "The feature '%s' is not enabled"
 
diff --git a/monitor/misc.c b/monitor/misc.c
index 398211a034..c563e901c0 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -1232,7 +1232,7 @@ void qmp_getfd(const char *fdname, Error **errp)
 
     fd = qemu_chr_fe_get_msgfd(&cur_mon->chr);
     if (fd == -1) {
-        error_setg(errp, QERR_FD_NOT_SUPPLIED);
+        error_setg(errp, "No file descriptor supplied via SCM_RIGHTS");
         return;
     }
 
@@ -1286,7 +1286,7 @@ void qmp_closefd(const char *fdname, Error **errp)
     }
 
     qemu_mutex_unlock(&cur_mon->mon_lock);
-    error_setg(errp, QERR_FD_NOT_FOUND, fdname);
+    error_setg(errp, "File descriptor named '%s' not found", fdname);
 }
 
 int monitor_get_fd(Monitor *mon, const char *fdname, Error **errp)
@@ -1357,7 +1357,7 @@ AddfdInfo *qmp_add_fd(bool has_fdset_id, int64_t fdset_id, bool has_opaque,
 
     fd = qemu_chr_fe_get_msgfd(&mon->chr);
     if (fd == -1) {
-        error_setg(errp, QERR_FD_NOT_SUPPLIED);
+        error_setg(errp, "No file descriptor supplied via SCM_RIGHTS");
         goto error;
     }
 
@@ -1410,7 +1410,7 @@ error:
     } else {
         snprintf(fd_str, sizeof(fd_str), "fdset-id:%" PRId64, fdset_id);
     }
-    error_setg(errp, QERR_FD_NOT_FOUND, fd_str);
+    error_setg(errp, "File descriptor named '%s' not found", fd_str);
 }
 
 FdsetInfoList *qmp_query_fdsets(Error **errp)
diff --git a/net/net.c b/net/net.c
index 6a2c3d9567..e1035f21d1 100644
--- a/net/net.c
+++ b/net/net.c
@@ -1013,7 +1013,7 @@ static int net_client_init1(const Netdev *netdev, bool is_netdev, Error **errp)
     if (net_client_init_fun[netdev->type](netdev, netdev->id, peer, errp) < 0) {
         /* FIXME drop when all init functions store an Error */
         if (errp && !*errp) {
-            error_setg(errp, QERR_DEVICE_INIT_FAILED,
+            error_setg(errp, "Device '%s' could not be initialized",
                        NetClientDriver_str(netdev->type));
         }
         return -1;
-- 
2.26.2



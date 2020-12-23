Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 142102E2258
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 23:14:35 +0100 (CET)
Received: from localhost ([::1]:34062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksCOv-00065S-N8
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 17:14:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ksCLg-0004II-5W
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 17:11:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ksCLe-0001fq-2M
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 17:11:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608761469;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xVaB9VoDZ4sHfqfU/GsLDHq4ReoLs7LXtU7plGMJcL8=;
 b=jWsq11j4hjRFg5xIBt0qKl7YkQ3CrOUUjQi6AoJujQpxDlGQklKqR9L4xhJsXCYoLPS4hZ
 LsJLapZ4Q7eyp9/Be6tA57RG9+QdiZgQ7DSUPAOPCs3yAlpKts3ImkRfH2o3jwmgP38SjM
 zYzCM9Tm6ZQzZsuQS3u7d9BepIOJTx0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-220-8GiZpsF4Mmq6y9Fk5s5rMg-1; Wed, 23 Dec 2020 17:11:07 -0500
X-MC-Unique: 8GiZpsF4Mmq6y9Fk5s5rMg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B3A1F107ACF5;
 Wed, 23 Dec 2020 22:11:06 +0000 (UTC)
Received: from blue.redhat.com (ovpn-113-9.phx2.redhat.com [10.3.113.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CDFE45D747;
 Wed, 23 Dec 2020 22:11:05 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/7] rocker: Revamp fp_port_get_info
Date: Wed, 23 Dec 2020 16:10:57 -0600
Message-Id: <20201223221102.390740-3-eblake@redhat.com>
In-Reply-To: <20201223221102.390740-1-eblake@redhat.com>
References: <20201223221102.390740-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Cc: Jason Wang <jasowang@redhat.com>, Jiri Pirko <jiri@resnulli.us>,
 armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of modifying the value member of a list element passed as a
parameter, and open-coding the manipulation of that list, it's nicer
to just return a freshly allocated value to be prepended to a list
using QAPI_LIST_PREPEND.

Signed-off-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
---
 hw/net/rocker/rocker_fp.h |  2 +-
 hw/net/rocker/rocker.c    |  8 +-------
 hw/net/rocker/rocker_fp.c | 17 ++++++++++-------
 3 files changed, 12 insertions(+), 15 deletions(-)

diff --git a/hw/net/rocker/rocker_fp.h b/hw/net/rocker/rocker_fp.h
index dbe1dd329a4b..7ff57aac0180 100644
--- a/hw/net/rocker/rocker_fp.h
+++ b/hw/net/rocker/rocker_fp.h
@@ -28,7 +28,7 @@ int fp_port_eg(FpPort *port, const struct iovec *iov, int iovcnt);

 char *fp_port_get_name(FpPort *port);
 bool fp_port_get_link_up(FpPort *port);
-void fp_port_get_info(FpPort *port, RockerPortList *info);
+RockerPort *fp_port_get_info(FpPort *port);
 void fp_port_get_macaddr(FpPort *port, MACAddr *macaddr);
 void fp_port_set_macaddr(FpPort *port, MACAddr *macaddr);
 uint8_t fp_port_get_learning(FpPort *port);
diff --git a/hw/net/rocker/rocker.c b/hw/net/rocker/rocker.c
index 1af1e6fa2f9b..c53a02315e54 100644
--- a/hw/net/rocker/rocker.c
+++ b/hw/net/rocker/rocker.c
@@ -127,13 +127,7 @@ RockerPortList *qmp_query_rocker_ports(const char *name, Error **errp)
     }

     for (i = r->fp_ports - 1; i >= 0; i--) {
-        RockerPortList *info = g_malloc0(sizeof(*info));
-        info->value = g_malloc0(sizeof(*info->value));
-        struct fp_port *port = r->fp_port[i];
-
-        fp_port_get_info(port, info);
-        info->next = list;
-        list = info;
+        QAPI_LIST_PREPEND(list, fp_port_get_info(r->fp_port[i]));
     }

     return list;
diff --git a/hw/net/rocker/rocker_fp.c b/hw/net/rocker/rocker_fp.c
index 4aa7da79b81d..cbeed65bd5ec 100644
--- a/hw/net/rocker/rocker_fp.c
+++ b/hw/net/rocker/rocker_fp.c
@@ -51,14 +51,17 @@ bool fp_port_get_link_up(FpPort *port)
     return !qemu_get_queue(port->nic)->link_down;
 }

-void fp_port_get_info(FpPort *port, RockerPortList *info)
+RockerPort *fp_port_get_info(FpPort *port)
 {
-    info->value->name = g_strdup(port->name);
-    info->value->enabled = port->enabled;
-    info->value->link_up = fp_port_get_link_up(port);
-    info->value->speed = port->speed;
-    info->value->duplex = port->duplex;
-    info->value->autoneg = port->autoneg;
+    RockerPort *value = g_malloc0(sizeof(*value));
+
+    value->name = g_strdup(port->name);
+    value->enabled = port->enabled;
+    value->link_up = fp_port_get_link_up(port);
+    value->speed = port->speed;
+    value->duplex = port->duplex;
+    value->autoneg = port->autoneg;
+    return value;
 }

 void fp_port_get_macaddr(FpPort *port, MACAddr *macaddr)
-- 
2.29.2



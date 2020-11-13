Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0134D2B13BA
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 02:16:06 +0100 (CET)
Received: from localhost ([::1]:53052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdNh6-0003Ws-Tc
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 20:16:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kdNf4-0001o9-V7
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 20:13:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kdNf3-00036I-6M
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 20:13:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605230036;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DcYWlFiDPX0kq7l0FYGOKFr18Hst2o2xIotv7vhYvwI=;
 b=HbxUl4mHLnCwM8zvFajXLSmVYRwedga0VwTPp0ah4Ig4MAEly2O7TAIxA3T9HQEH1WAfpE
 JyNVkWnko+nm78EsWxyVOdBS7svf2zmeFwE1b5bpoSOFxT6hs8j/Zx8Nd6X2JvD1LLAumk
 ZSHp/ZeFJxlOXHILVe3w0RpNUdX29D8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-593-eHvBiHJfNYuZCn8ZLgmnmA-1; Thu, 12 Nov 2020 20:13:54 -0500
X-MC-Unique: eHvBiHJfNYuZCn8ZLgmnmA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E844802B6A;
 Fri, 13 Nov 2020 01:13:53 +0000 (UTC)
Received: from blue.redhat.com (ovpn-113-51.phx2.redhat.com [10.3.113.51])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C4CA719D6C;
 Fri, 13 Nov 2020 01:13:50 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/7] rocker: Revamp fp_port_get_info
Date: Thu, 12 Nov 2020 19:13:35 -0600
Message-Id: <20201113011340.463563-3-eblake@redhat.com>
In-Reply-To: <20201113011340.463563-1-eblake@redhat.com>
References: <20201113011340.463563-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
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
Cc: Jason Wang <jasowang@redhat.com>, Jiri Pirko <jiri@resnulli.us>,
 armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of modifying the value member of a list element passed as a
parameter, and open-coding the manipulation of that list, it's nicer
to just return a freshly allocated value to be prepended to a list
using QAPI_LIST_PREPEND.

Signed-off-by: Eric Blake <eblake@redhat.com>
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
2.28.0



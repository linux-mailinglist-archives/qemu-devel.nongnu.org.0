Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CED2DEE40
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Dec 2020 11:57:25 +0100 (CET)
Received: from localhost ([::1]:41884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqZvQ-0006VL-Qz
	for lists+qemu-devel@lfdr.de; Sat, 19 Dec 2020 05:57:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kqZtl-0004cR-Af
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 05:55:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kqZti-0007Du-UN
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 05:55:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608375337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ftD+ab12Mnv8bQftkg2cB+Xv1xKs7O8+U/Oklx5mKro=;
 b=SBaPvwNdDDn/F8OjqDPuQ3aPu/GxABz/N8MngegCmpkHYB5xyZZ4/M9uCNdyqenbG8bLhF
 FicPVZpqJ/1bAcJhpHGa0vQZfzJ+0slAmc5cyPcdKsAj9usq/3N297q9Ug/0pxR+mNisRi
 KNAEN7VHKvPvjfBQ1fWn6bu2MunIA1M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-193-EIcJHGlyPl-mqmgnXIHp1Q-1; Sat, 19 Dec 2020 05:55:35 -0500
X-MC-Unique: EIcJHGlyPl-mqmgnXIHp1Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A1261005504;
 Sat, 19 Dec 2020 10:55:34 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B81B45191C;
 Sat, 19 Dec 2020 10:55:33 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 495021141D30; Sat, 19 Dec 2020 11:55:32 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/33] rocker: Revamp fp_port_get_info
Date: Sat, 19 Dec 2020 11:55:00 +0100
Message-Id: <20201219105532.1734134-2-armbru@redhat.com>
In-Reply-To: <20201219105532.1734134-1-armbru@redhat.com>
References: <20201219105532.1734134-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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

From: Eric Blake <eblake@redhat.com>

Instead of modifying the value member of a list element passed as a
parameter, and open-coding the manipulation of that list, it's nicer
to just return a freshly allocated value to be prepended to a list
using QAPI_LIST_PREPEND.

Signed-off-by: Eric Blake <eblake@redhat.com>
Message-Id: <20201113011340.463563-3-eblake@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/net/rocker/rocker_fp.h |  2 +-
 hw/net/rocker/rocker.c    |  8 +-------
 hw/net/rocker/rocker_fp.c | 17 ++++++++++-------
 3 files changed, 12 insertions(+), 15 deletions(-)

diff --git a/hw/net/rocker/rocker_fp.h b/hw/net/rocker/rocker_fp.h
index dbe1dd329a..7ff57aac01 100644
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
index 1af1e6fa2f..c53a02315e 100644
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
index 4aa7da79b8..cbeed65bd5 100644
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
2.26.2



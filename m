Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2F67FD0A
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Aug 2019 17:08:57 +0200 (CEST)
Received: from localhost ([::1]:35580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1htZAu-0002UX-7L
	for lists+qemu-devel@lfdr.de; Fri, 02 Aug 2019 11:08:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47234)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <jfreimann@redhat.com>) id 1htZ8q-000662-Cb
 for qemu-devel@nongnu.org; Fri, 02 Aug 2019 11:06:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jfreimann@redhat.com>) id 1htZ8p-0005T0-C2
 for qemu-devel@nongnu.org; Fri, 02 Aug 2019 11:06:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43134)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jfreimann@redhat.com>)
 id 1htZ8p-0005Sg-6w
 for qemu-devel@nongnu.org; Fri, 02 Aug 2019 11:06:47 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 36A6781F01
 for <qemu-devel@nongnu.org>; Fri,  2 Aug 2019 15:06:46 +0000 (UTC)
Received: from localhost (dhcp-192-195.str.redhat.com [10.33.192.195])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 04B505D9E2;
 Fri,  2 Aug 2019 15:06:40 +0000 (UTC)
From: Jens Freimann <jfreimann@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri,  2 Aug 2019 17:06:02 +0200
Message-Id: <20190802150605.5880-7-jfreimann@redhat.com>
In-Reply-To: <20190802150605.5880-1-jfreimann@redhat.com>
References: <20190802150605.5880-1-jfreimann@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Fri, 02 Aug 2019 15:06:46 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 6/9] qapi: Add failover negotiated event
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
Cc: pkrempa@redhat.com, berrange@redhat.com, ehabkost@redhat.com,
 mst@redhat.com, aadam@redhat.com, laine@redhat.com, ailan@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This event is sent to let libvirt know that VIRTIO_NET_F_STANDBY
feature was not negotiated during virtio feature negotiation. If this
event is received it means any primary devices hotplugged before
this were were never really added to QEMU devices.

Signed-off-by: Jens Freimann <jfreimann@redhat.com>
---
 qapi/net.json | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/qapi/net.json b/qapi/net.json
index 728990f4fb..8c5f3f1fb2 100644
--- a/qapi/net.json
+++ b/qapi/net.json
@@ -737,3 +737,19 @@
 ##
 { 'command': 'announce-self', 'boxed': true,
   'data' : 'AnnounceParameters'}
+
+##
+# @FAILOVER_NEGOTIATED:
+#
+# Emitted when VIRTIO_NET_F_STANDBY was negotiated during feature negoti=
ation
+#
+# Since: 4.2
+#
+# Example:
+#
+# <- { "event": "FAILOVER_NEGOTIATED",
+#      "data": {} }
+#
+##
+{ 'event': 'FAILOVER_NEGOTIATED',
+  'data': {} }
--=20
2.21.0



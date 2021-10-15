Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C4142F63A
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 16:51:02 +0200 (CEST)
Received: from localhost ([::1]:46096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbOY0-0002Cs-Lv
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 10:51:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mbOVY-00086w-BT
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 10:48:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mbOVV-0001T6-0I
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 10:48:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634309303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ckAhHJNXd2DDZTBa58nv8L2ZuPl5dBrsmiXNpboTThU=;
 b=GzsyAeGOKILDWvrC5lKe+JCywEjD4sqdcsmZaCpA9blHlDJGg5ULuRaTc4nAtlAiFitdaY
 4QRTuOU2QDDhN2UeMAiL9mRR8CeYDs4ld4ZUH92Q2kyDlXC7mcAEHGEd+NyUJhcgg5SGvp
 WPvZqhsm2KHf2nAe2BddjK2Hqhxi2xk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-128-Vonz5hmBOQ6QboIn9qTC0g-1; Fri, 15 Oct 2021 10:48:21 -0400
X-MC-Unique: Vonz5hmBOQ6QboIn9qTC0g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CE39780365C
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 14:48:20 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.193.44])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3386619736;
 Fri, 15 Oct 2021 14:48:20 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/15] net: Introduce NetClientInfo.check_peer_type()
Date: Fri, 15 Oct 2021 16:46:26 +0200
Message-Id: <20211015144640.198044-2-kwolf@redhat.com>
In-Reply-To: <20211015144640.198044-1-kwolf@redhat.com>
References: <20211015144640.198044-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some network backends (vhost-user and vhost-vdpa) work only with
specific devices. At startup, they second guess what the command line
option handling will do and error out if they think a non-virtio device
will attach to them.

This second guessing is not only ugly, it can lead to wrong error
messages ('-device floppy,netdev=foo' should complain about an unknown
property, not about the wrong kind of network device being attached) and
completely ignores hotplugging.

Add a callback where backends can check compatibility with a device when
it actually tries to attach, even on hotplug.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20211008133442.141332-2-kwolf@redhat.com>
Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Tested-by: Peter Krempa <pkrempa@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/net/net.h                | 2 ++
 hw/core/qdev-properties-system.c | 6 ++++++
 2 files changed, 8 insertions(+)

diff --git a/include/net/net.h b/include/net/net.h
index 5d1508081f..986288eb07 100644
--- a/include/net/net.h
+++ b/include/net/net.h
@@ -62,6 +62,7 @@ typedef struct SocketReadState SocketReadState;
 typedef void (SocketReadStateFinalize)(SocketReadState *rs);
 typedef void (NetAnnounce)(NetClientState *);
 typedef bool (SetSteeringEBPF)(NetClientState *, int);
+typedef bool (NetCheckPeerType)(NetClientState *, ObjectClass *, Error **);
 
 typedef struct NetClientInfo {
     NetClientDriver type;
@@ -84,6 +85,7 @@ typedef struct NetClientInfo {
     SetVnetBE *set_vnet_be;
     NetAnnounce *announce;
     SetSteeringEBPF *set_steering_ebpf;
+    NetCheckPeerType *check_peer_type;
 } NetClientInfo;
 
 struct NetClientState {
diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-system.c
index e71f5d64d1..a91f60567a 100644
--- a/hw/core/qdev-properties-system.c
+++ b/hw/core/qdev-properties-system.c
@@ -431,6 +431,12 @@ static void set_netdev(Object *obj, Visitor *v, const char *name,
             goto out;
         }
 
+        if (peers[i]->info->check_peer_type) {
+            if (!peers[i]->info->check_peer_type(peers[i], obj->class, errp)) {
+                goto out;
+            }
+        }
+
         ncs[i] = peers[i];
         ncs[i]->queue_index = i;
     }
-- 
2.31.1



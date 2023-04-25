Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CAAA6EDBC7
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 08:43:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prCNv-0003wy-SG; Tue, 25 Apr 2023 02:42:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1prCNq-0003rK-62
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 02:42:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1prCNk-0004M7-5E
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 02:42:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682404951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7D0x+7C+MvhzYpgX6YUAoAIatGCvC2iHtUDGAlLTcHU=;
 b=Q0hu6YF5CKBcsvBqr898m2OFx+Dn1M/FNm94Zyn/Nk2t7/oNYmqvN82PUGPIsbQi1KbUjn
 8Ba2rZOlu/ckz5v6Ht4Krh3N8S3zn2FYYoMZKRObLSmXnn2GKa4f8mItfkKlImAFvHwtZ2
 CiEJQyBdLsu2Spiz9NbQErx2G0shrrU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-100-e2cUoHCTMImtKP0_1Rx3PA-1; Tue, 25 Apr 2023 02:42:27 -0400
X-MC-Unique: e2cUoHCTMImtKP0_1Rx3PA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 71FB4101A5D1;
 Tue, 25 Apr 2023 06:42:26 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4DF0A4C83A;
 Tue, 25 Apr 2023 06:42:26 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DA47C21F9829; Tue, 25 Apr 2023 08:42:23 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: michael.roth@amd.com, eblake@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com, pbonzini@redhat.com, marcandre.lureau@redhat.com,
 arei.gonglei@huawei.com, pizhenwei@bytedance.com, jsnow@redhat.com,
 vsementsov@yandex-team.ru, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, quintela@redhat.com, jasowang@redhat.com,
 yuval.shaia.ml@gmail.com, stefanha@redhat.com, kraxel@redhat.com,
 kkostiuk@redhat.com, qemu-block@nongnu.org, marcandre.lureau@gmail.com,
 david@redhat.com
Subject: [PATCH v2 13/16] qapi: Replace ad hoc "since" documentation by member
 documentation
Date: Tue, 25 Apr 2023 08:42:20 +0200
Message-Id: <20230425064223.820979-14-armbru@redhat.com>
In-Reply-To: <20230425064223.820979-1-armbru@redhat.com>
References: <20230425064223.820979-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

MemoryDeviceInfoKind, NetClientDriver, and GuestPanicAction mention
some members only in ad hoc since documentation.  The generated
documentation shows these members as "Not documented".

Replace by formal member documentation.

Add actual documentation text for the GuestPanicAction members, to
match existing member documentation there.  For the others, merely
move existing "since" information.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 qapi/machine.json   | 11 ++++++++---
 qapi/net.json       | 21 ++++++++-------------
 qapi/run-state.json |  6 +++++-
 3 files changed, 21 insertions(+), 17 deletions(-)

diff --git a/qapi/machine.json b/qapi/machine.json
index 1a90376f4e..5a18913767 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1260,6 +1260,14 @@
 ##
 # @MemoryDeviceInfoKind:
 #
+# @nvdimm: since 2.12
+#
+# @virtio-pmem: since 4.1
+#
+# @virtio-mem: since 5.1
+#
+# @sgx-epc: since 6.2.
+#
 # Since: 2.1
 ##
 { 'enum': 'MemoryDeviceInfoKind',
@@ -1302,9 +1310,6 @@
 #
 # Union containing information about a memory device
 #
-# nvdimm is included since 2.12. virtio-pmem is included since 4.1.
-# virtio-mem is included since 5.1. sgx-epc is included since 6.2.
-#
 # Since: 2.1
 ##
 { 'union': 'MemoryDeviceInfo',
diff --git a/qapi/net.json b/qapi/net.json
index ec66b39b70..3606d9d27f 100644
--- a/qapi/net.json
+++ b/qapi/net.json
@@ -641,14 +641,15 @@
 #
 # Available netdev drivers.
 #
-# Since: 2.7
+# @l2tpv3: since 2.1
+# @vhost-vdpa: since 5.1
+# @vmnet-host: since 7.1
+# @vmnet-shared: since 7.1
+# @vmnet-bridged: since 7.1
+# @stream: since 7.2
+# @dgram: since 7.2
 #
-#        @vhost-vdpa since 5.1
-#        @vmnet-host since 7.1
-#        @vmnet-shared since 7.1
-#        @vmnet-bridged since 7.1
-#        @stream since 7.2
-#        @dgram since 7.2
+# Since: 2.7
 ##
 { 'enum': 'NetClientDriver',
   'data': [ 'none', 'nic', 'user', 'tap', 'l2tpv3', 'socket', 'stream',
@@ -669,12 +670,6 @@
 #
 # Since: 1.2
 #
-#        'l2tpv3' - since 2.1
-#        'vmnet-host' - since 7.1
-#        'vmnet-shared' - since 7.1
-#        'vmnet-bridged' - since 7.1
-#        'stream' since 7.2
-#        'dgram' since 7.2
 ##
 { 'union': 'Netdev',
   'base': { 'id': 'str', 'type': 'NetClientDriver' },
diff --git a/qapi/run-state.json b/qapi/run-state.json
index bfc15ecad5..e5f5d31395 100644
--- a/qapi/run-state.json
+++ b/qapi/run-state.json
@@ -467,7 +467,11 @@
 #
 # @pause: system pauses
 #
-# Since: 2.1 (poweroff since 2.8, run since 5.0)
+# @poweroff: system powers off (since 2.8)
+#
+# @run: system continues to run (since 5.0)
+#
+# Since: 2.1
 ##
 { 'enum': 'GuestPanicAction',
   'data': [ 'pause', 'poweroff', 'run' ] }
-- 
2.39.2



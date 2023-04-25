Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8BE6EDBC9
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 08:43:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prCNw-0003ym-Ut; Tue, 25 Apr 2023 02:42:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1prCNs-0003ux-VX
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 02:42:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1prCNk-0004MX-Ji
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 02:42:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682404951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mrHMrosKDQaKSe8rxiYwmF82/vlFDdSh72QjQ16rbYg=;
 b=e8gaiIpRoJgWF1KhlayBxXkc3lbm6e48Y5zF4ZW+umWk1lAa7pbLrVyaynzvFbVWW39Rgr
 0jatETIYyBaSnRWIEBIbEOrp8RMPyDflReOmXWmJsFSLNg0Vo9GTVmrm8SYOru7rBKms+V
 JPrCI2wXv66TINyA9rhIT1+5Oqk+K5E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-635-QubYTjSGP4-6qAMqte4wzA-1; Tue, 25 Apr 2023 02:42:28 -0400
X-MC-Unique: QubYTjSGP4-6qAMqte4wzA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7AE88858289;
 Tue, 25 Apr 2023 06:42:27 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3835414171B8;
 Tue, 25 Apr 2023 06:42:27 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E43C421F9836; Tue, 25 Apr 2023 08:42:23 +0200 (CEST)
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
Subject: [PATCH v2 16/16] qapi storage-daemon/qapi: Fix documentation section
 structure
Date: Tue, 25 Apr 2023 08:42:23 +0200
Message-Id: <20230425064223.820979-17-armbru@redhat.com>
In-Reply-To: <20230425064223.820979-1-armbru@redhat.com>
References: <20230425064223.820979-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

In the QEMU QMP Reference Manual, subsection "Block core (VM
unrelated)" is empty.  Its contents is at the end of subsection
"Background jobs" instead.  That's because qapi/job.json is included
first from qapi/block-core.json, which makes qapi/job.json's
documentation go between qapi/block-core.json's subsection heading and
contents.

In the QEMU Storage Daemon QMP Reference Manual, section "Block
Devices" contains nothing but an empty subsection "Block core (VM
unrelated)".  The latter's contents is at the end section "Socket data
types", along with subsection "Block device exports".  Subsection
"Background jobs" is at the end of section "Cryptography".  All this
is because storage-daemon/qapi/qapi-schema.json includes modules in a
confused order.

Fix both as follows.

Turn subsection "Background jobs" into a section.

Move it before section "Block devices" in the QEMU QMP Reference
Manual, by including qapi/jobs.json right before qapi/block.json.

Reorder include directives in storage-daemon/qapi/qapi-schema.json to
match the order in qapi/qapi-schema.json, so that the QEMU Storage
Daemon QMP Reference Manual's section structure the QEMU QMP Reference
Manual's.

In the QEMU QMP Reference Manual, qapi/cryptodev.json's documentation
is at the end of section "Virtio devices".  That's because it lacks a
section heading, and therefore gets squashed into whatever section
happens to precede it.

Add section heading so it's in section "Cryptography devices".

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Acked-by: zhenwei pi <pizhenwei@bytedance.com>
---
 qapi/cryptodev.json                  |  4 ++++
 qapi/job.json                        |  2 +-
 qapi/qapi-schema.json                |  2 +-
 storage-daemon/qapi/qapi-schema.json | 22 +++++++++++++++-------
 4 files changed, 21 insertions(+), 9 deletions(-)

diff --git a/qapi/cryptodev.json b/qapi/cryptodev.json
index f33f96a692..cf960ea81f 100644
--- a/qapi/cryptodev.json
+++ b/qapi/cryptodev.json
@@ -4,6 +4,10 @@
 # This work is licensed under the terms of the GNU GPL, version 2 or later.
 # See the COPYING file in the top-level directory.
 
+##
+# = Cryptography devices
+##
+
 ##
 # @QCryptodevBackendAlgType:
 #
diff --git a/qapi/job.json b/qapi/job.json
index bc4104757a..9e29a796c5 100644
--- a/qapi/job.json
+++ b/qapi/job.json
@@ -2,7 +2,7 @@
 # vim: filetype=python
 
 ##
-# == Background jobs
+# = Background jobs
 ##
 
 ##
diff --git a/qapi/qapi-schema.json b/qapi/qapi-schema.json
index e57d8ff801..bb7217da26 100644
--- a/qapi/qapi-schema.json
+++ b/qapi/qapi-schema.json
@@ -43,11 +43,11 @@
 { 'include': 'sockets.json' }
 { 'include': 'run-state.json' }
 { 'include': 'crypto.json' }
+{ 'include': 'job.json' }
 { 'include': 'block.json' }
 { 'include': 'block-export.json' }
 { 'include': 'char.json' }
 { 'include': 'dump.json' }
-{ 'include': 'job.json' }
 { 'include': 'net.json' }
 { 'include': 'rdma.json' }
 { 'include': 'rocker.json' }
diff --git a/storage-daemon/qapi/qapi-schema.json b/storage-daemon/qapi/qapi-schema.json
index 67749d1101..f10c949490 100644
--- a/storage-daemon/qapi/qapi-schema.json
+++ b/storage-daemon/qapi/qapi-schema.json
@@ -15,18 +15,26 @@
 
 { 'include': '../../qapi/pragma.json' }
 
+# Documentation generated with qapi-gen.py is in source order, with
+# included sub-schemas inserted at the first include directive
+# (subsequent include directives have no effect).  To get a sane and
+# stable order, it's best to include each sub-schema just once, or
+# include it first right here.
+
+{ 'include': '../../qapi/common.json' }
+{ 'include': '../../qapi/sockets.json' }
+{ 'include': '../../qapi/crypto.json' }
+{ 'include': '../../qapi/job.json' }
+
 ##
 # = Block devices
 ##
 { 'include': '../../qapi/block-core.json' }
 { 'include': '../../qapi/block-export.json' }
+
 { 'include': '../../qapi/char.json' }
-{ 'include': '../../qapi/common.json' }
-{ 'include': '../../qapi/control.json' }
-{ 'include': '../../qapi/crypto.json' }
-{ 'include': '../../qapi/introspect.json' }
-{ 'include': '../../qapi/job.json' }
 { 'include': '../../qapi/authz.json' }
-{ 'include': '../../qapi/qom.json' }
-{ 'include': '../../qapi/sockets.json' }
 { 'include': '../../qapi/transaction.json' }
+{ 'include': '../../qapi/control.json' }
+{ 'include': '../../qapi/introspect.json' }
+{ 'include': '../../qapi/qom.json' }
-- 
2.39.2



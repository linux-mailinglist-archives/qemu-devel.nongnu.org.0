Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D016D5FE2
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 14:04:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjfKA-0002Tr-LU; Tue, 04 Apr 2023 07:59:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pjfJz-0002Ro-Ra
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 07:59:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pjfJq-0007zO-Rf
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 07:59:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680609561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tm+AZtld0KU2phoUUleLXa3sfEWecpZeedMY8gF+Gvo=;
 b=HMb/wdNAhE+zKxRwnhPWoxgyaJb1QEhx9xkjNgYeImi5dEvNn1Jy81UUFXnYYDNB7bpuBf
 Yxw8CrvxoTMyWOjLaKQ5kie3RksYMvRJ0vc57by/HuQFHE0BDA+8h0Q01BKWl/68JNj4X+
 +qv51YmsgINsmN6nL0HUOogxesBbdRc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-7--zZof2FuNZCpj0awtQVZrQ-1; Tue, 04 Apr 2023 07:59:17 -0400
X-MC-Unique: -zZof2FuNZCpj0awtQVZrQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8F76A101A531;
 Tue,  4 Apr 2023 11:59:16 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B35F1415117;
 Tue,  4 Apr 2023 11:59:16 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E8A0D21E5DC4; Tue,  4 Apr 2023 13:59:12 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: michael.roth@amd.com, eblake@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com, pbonzini@redhat.com, marcandre.lureau@redhat.com,
 arei.gonglei@huawei.com, pizhenwei@bytedance.com, jsnow@redhat.com,
 vsementsov@yandex-team.ru, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, quintela@redhat.com, jasowang@redhat.com,
 yuval.shaia.ml@gmail.com, stefanha@redhat.com, kraxel@redhat.com,
 kkostiuk@redhat.com, qemu-block@nongnu.org
Subject: [PATCH 15/16] qapi: Format since information the conventional way:
 (since X.Y)
Date: Tue,  4 Apr 2023 13:59:11 +0200
Message-Id: <20230404115912.2829251-16-armbru@redhat.com>
In-Reply-To: <20230404115912.2829251-1-armbru@redhat.com>
References: <20230404115912.2829251-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qapi/block-core.json | 6 +++---
 qapi/stats.json      | 2 +-
 qapi/tpm.json        | 3 +--
 qapi/ui.json         | 6 +++---
 4 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 9dd5ed9a47..b57978957f 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -1318,10 +1318,10 @@
 #          value is monotonically increasing.
 #
 # @busy: false if the job is known to be in a quiescent state, with
-#        no pending I/O.  Since 1.3.
+#        no pending I/O.  (Since 1.3)
 #
 # @paused: whether the job is paused or, if @busy is true, will
-#          pause itself as soon as possible.  Since 1.3.
+#          pause itself as soon as possible.  (Since 1.3)
 #
 # @speed: the rate limit, bytes per second
 #
@@ -2741,7 +2741,7 @@
 #
 # @on-error: the action to take on an error (default report).
 #            'stop' and 'enospc' can only be used if the block device
-#            supports io-status (see BlockInfo).  Since 1.3.
+#            supports io-status (see BlockInfo).  (Since 1.3)
 #
 # @filter-node-name: the node name that should be assigned to the
 #                    filter driver that the stream job inserts into the graph
diff --git a/qapi/stats.json b/qapi/stats.json
index f17495ee65..36d5f4dc94 100644
--- a/qapi/stats.json
+++ b/qapi/stats.json
@@ -69,7 +69,7 @@
 #
 # @vcpu: statistics that apply to a single virtual CPU.
 #
-# @cryptodev: statistics that apply to a crypto device. since 8.0
+# @cryptodev: statistics that apply to a crypto device (since 8.0)
 #
 # Since: 7.1
 ##
diff --git a/qapi/tpm.json b/qapi/tpm.json
index 4e2ea9756a..eac87d30b2 100644
--- a/qapi/tpm.json
+++ b/qapi/tpm.json
@@ -44,8 +44,7 @@
 # An enumeration of TPM types
 #
 # @passthrough: TPM passthrough type
-# @emulator: Software Emulator TPM type
-#            Since: 2.11
+# @emulator: Software Emulator TPM type (since 2.11)
 #
 # Since: 1.5
 ##
diff --git a/qapi/ui.json b/qapi/ui.json
index e9599dea50..88de458ba9 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -1207,13 +1207,13 @@
 #               window resizes (virtio-gpu) this will default to "on",
 #               assuming the guest will resize the display to match
 #               the window size then.  Otherwise it defaults to "off".
-#               Since 3.1
+#               (Since 3.1)
 # @show-tabs:   Display the tab bar for switching between the various graphical
 #               interfaces (e.g. VGA and virtual console character devices)
 #               by default.
-#               Since 7.1
+#               (Since 7.1)
 # @show-menubar: Display the main window menubar. Defaults to "on".
-#                Since 8.0
+#                (Since 8.0)
 #
 # Since: 2.12
 ##
-- 
2.39.2



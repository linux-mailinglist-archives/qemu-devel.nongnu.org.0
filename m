Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 709586EDBD8
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 08:45:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prCNv-0003wI-Ew; Tue, 25 Apr 2023 02:42:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1prCNs-0003tJ-9S
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 02:42:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1prCNk-0004MW-Gv
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 02:42:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682404951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QDpQV06NfgVcspa4es6zhNZleoHG7UY4WS2OAhGfowg=;
 b=WG7PfpHW5jb4wdl+tJTbZjLHLy/7P5KVngyTVh4UU0nypUQcdHRBr7qmaAfTj9z5cTWyCV
 neOA0G4k3D17Twu5S/Ei5Ui9Z7A8W2TrImjvOnoIY9o2eArpSdjznBY+yAS0QfCVDbdI6L
 5YzKcrL8RJCks/P4oA074rlCHeRQlbI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-637-QkPe6hPtMlCYM3fmpa7X9Q-1; Tue, 25 Apr 2023 02:42:28 -0400
X-MC-Unique: QkPe6hPtMlCYM3fmpa7X9Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 59650811E7C;
 Tue, 25 Apr 2023 06:42:27 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3676740C2064;
 Tue, 25 Apr 2023 06:42:27 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E0EED21F9835; Tue, 25 Apr 2023 08:42:23 +0200 (CEST)
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
Subject: [PATCH v2 15/16] qapi: Format since information the conventional way:
 (since X.Y)
Date: Tue, 25 Apr 2023 08:42:22 +0200
Message-Id: <20230425064223.820979-16-armbru@redhat.com>
In-Reply-To: <20230425064223.820979-1-armbru@redhat.com>
References: <20230425064223.820979-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
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



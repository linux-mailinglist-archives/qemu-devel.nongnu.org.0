Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 611486EDBD4
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 08:45:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prCNs-0003tD-L6; Tue, 25 Apr 2023 02:42:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1prCNo-0003ou-NV
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 02:42:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1prCNj-0004LI-CH
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 02:42:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682404950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W6le+9+a75N0/4Rn66845924IWAndAGfIivbp0OvYTI=;
 b=GbsIGdVpxCNmx/Hnel+xDKZQX1rlTjZz1INwVioIksi7o6RUnpzTUUjAOR6T8O6g6VHNIl
 TRPAI+AyxzPc8kqsEjCMTW8msApobXI6isknxWvUeBGfIGEr+xQL4YV0dZzYmixfzO0ODU
 g2Flxvbq+jUX+DrzQGCUUY4qtL9wIVU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-619-C1mDXNk4Os-Hz3Abtlb_3Q-1; Tue, 25 Apr 2023 02:42:27 -0400
X-MC-Unique: C1mDXNk4Os-Hz3Abtlb_3Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 521741C06ED2;
 Tue, 25 Apr 2023 06:42:26 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E3B040C6E68;
 Tue, 25 Apr 2023 06:42:26 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id CDEED21F9818; Tue, 25 Apr 2023 08:42:23 +0200 (CEST)
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
Subject: [PATCH v2 09/16] qapi: Fix bullet list markup in documentation
Date: Tue, 25 Apr 2023 08:42:16 +0200
Message-Id: <20230425064223.820979-10-armbru@redhat.com>
In-Reply-To: <20230425064223.820979-1-armbru@redhat.com>
References: <20230425064223.820979-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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

Peter Maydell's commit 100cc4fe0f08 explains:

    rST insists on a blank line before and after a bulleted list [...]
    Add some extra blank lines in the doc comments so they're
    acceptable rST input.

It missed one in qapi/trace.json.

Paolo Bonzini later added another instance in qapi/stats.json,
providing further, if unintended, evidence for his quip that rST is
the Perl of ASCII-based markups.

Both are parsed as ordinary paragraph, resulting in garbled output.

Add the blank lines we need to get the bullet lists recognized as
such.

Kevin Wolf and Lukas Straub added two more, but indented.  Sphinx
recognizes them as (indented) bullet lists.  The indentation looks
slightly off.

Insert a blank line and delete the extra indentation.

Fixes: 100cc4fe0f0827f8da1a5c05f9c65e2aaa40e03d (qapi: Add blank lines before bulleted lists)
Fixes: 467ef823d83e (qmp: add filtering of statistics by target vCPU)
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 qapi/block-export.json |  7 ++++---
 qapi/stats.json        |  1 +
 qapi/trace.json        |  1 +
 qapi/yank.json         | 21 +++++++++++----------
 4 files changed, 17 insertions(+), 13 deletions(-)

diff --git a/qapi/block-export.json b/qapi/block-export.json
index 4627bbc4e6..3be3de357f 100644
--- a/qapi/block-export.json
+++ b/qapi/block-export.json
@@ -275,9 +275,10 @@
 # @deprecated: This command is deprecated. Use @block-export-del instead.
 #
 # Returns: error if
-#            - the server is not running
-#            - export is not found
-#            - mode is 'safe' and there are existing connections
+#
+#          - the server is not running
+#          - export is not found
+#          - mode is 'safe' and there are existing connections
 #
 # Since: 2.12
 ##
diff --git a/qapi/stats.json b/qapi/stats.json
index 1f5d3c59ab..f17495ee65 100644
--- a/qapi/stats.json
+++ b/qapi/stats.json
@@ -107,6 +107,7 @@
 # The arguments to the query-stats command; specifies a target for which to
 # request statistics and optionally the required subset of information for
 # that target:
+#
 # - which vCPUs to request statistics for
 # - which providers to request statistics from
 # - which named values to return within each provider
diff --git a/qapi/trace.json b/qapi/trace.json
index 6c6982a587..f425d10764 100644
--- a/qapi/trace.json
+++ b/qapi/trace.json
@@ -87,6 +87,7 @@
 # @vcpu: The vCPU to act upon (all by default; since 2.7).
 #
 # An event's state is modified if:
+#
 # - its name matches the @name pattern, and
 # - if @vcpu is given, the event has the "vcpu" property.
 #
diff --git a/qapi/yank.json b/qapi/yank.json
index 167a775594..1639744ada 100644
--- a/qapi/yank.json
+++ b/qapi/yank.json
@@ -50,16 +50,17 @@
 # hanging QEMU.
 #
 # Currently implemented yank instances:
-#  - nbd block device:
-#    Yanking it will shut down the connection to the nbd server without
-#    attempting to reconnect.
-#  - socket chardev:
-#    Yanking it will shut down the connected socket.
-#  - migration:
-#    Yanking it will shut down all migration connections. Unlike
-#    @migrate_cancel, it will not notify the migration process, so migration
-#    will go into @failed state, instead of @cancelled state. @yank should be
-#    used to recover from hangs.
+#
+# - nbd block device:
+#   Yanking it will shut down the connection to the nbd server without
+#   attempting to reconnect.
+# - socket chardev:
+#   Yanking it will shut down the connected socket.
+# - migration:
+#   Yanking it will shut down all migration connections. Unlike
+#   @migrate_cancel, it will not notify the migration process, so migration
+#   will go into @failed state, instead of @cancelled state. @yank should be
+#   used to recover from hangs.
 #
 # Since: 6.0
 ##
-- 
2.39.2



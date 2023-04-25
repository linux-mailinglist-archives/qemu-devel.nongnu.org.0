Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 870956EDBD2
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 08:45:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prCNq-0003qX-Es; Tue, 25 Apr 2023 02:42:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1prCNn-0003kt-4w
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 02:42:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1prCNi-0004LF-Ta
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 02:42:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682404950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/NH69U59Jgca1Vf5HweOGs2oX5HqBAz/Qsu4ziWQdyE=;
 b=PVeu3KWF2cCEaP9P0sg83COR4hNCZxyixxnvtZJNW8fUUKrrGE+K60SnKXipqa6bXIJFz1
 2Z5cXBxHtNHXJhKuMG2OXLh6SHXoI6h6T3y8AsHEJmUzeil6WIHNgS8ksR08VObji9WYgJ
 iuSYeou2JjyyoAKM0LXnlQG6rsZFozY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-100-doNaFpXwNEGRKN8PC2SaSg-1; Tue, 25 Apr 2023 02:42:27 -0400
X-MC-Unique: doNaFpXwNEGRKN8PC2SaSg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 73C49886063;
 Tue, 25 Apr 2023 06:42:26 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D882492B0F;
 Tue, 25 Apr 2023 06:42:26 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D0EB621F981C; Tue, 25 Apr 2023 08:42:23 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: michael.roth@amd.com, eblake@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com, pbonzini@redhat.com, marcandre.lureau@redhat.com,
 arei.gonglei@huawei.com, pizhenwei@bytedance.com, jsnow@redhat.com,
 vsementsov@yandex-team.ru, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, quintela@redhat.com, jasowang@redhat.com,
 yuval.shaia.ml@gmail.com, stefanha@redhat.com, kraxel@redhat.com,
 kkostiuk@redhat.com, qemu-block@nongnu.org, marcandre.lureau@gmail.com,
 david@redhat.com, Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 10/16] qapi: Fix unintended definition lists in
 documentation
Date: Tue, 25 Apr 2023 08:42:17 +0200
Message-Id: <20230425064223.820979-11-armbru@redhat.com>
In-Reply-To: <20230425064223.820979-1-armbru@redhat.com>
References: <20230425064223.820979-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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

rST parses something like

    first line
        second line

as a definition list item, where "first line" is the term being
defined by "second line".

This bites us in a couple of places.  Here's one:

    # @bps_max: total throughput limit during bursts,
    #                     in bytes (Since 1.7)

scripts/qapi/parser.py parses this into an "argument section" with
name "bps_max" and text

    total throughput limit during bursts,
	      in bytes (Since 1.7)

docs/sphinx/qapidoc.py duly passes the text to the rST parser, which
parses it as another definition list.  Comes out as nested
definitions: term "bps_max: int (optional)" defined as term "total
throughput limit during bursts," defined as "in bytes (Since 1.7)".

rST truly is the Perl of ASCII-based markups.

Fix by deleting the extra indentation.

Fixes: 26ec4e53f2bf (qapi: Fix indent level on doc comments in json files)
Fixes: c0ac533b6f97 (qapi: Stop using whitespace for alignment in comments)
Fixes: 81ad2964e938 (net/vmnet: add vmnet backends to qapi/net)
Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 qapi/block-core.json | 52 ++++++++++++++++++++++----------------------
 qapi/control.json    |  2 +-
 qapi/machine.json    |  4 ++--
 qapi/net.json        |  2 +-
 4 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index a5a5007b28..2382772e17 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -488,41 +488,41 @@
 #
 # @image: the info of image used (since: 1.6)
 #
-# @bps_max: total throughput limit during bursts,
-#                     in bytes (Since 1.7)
+# @bps_max: total throughput limit during bursts, in bytes
+#           (Since 1.7)
 #
-# @bps_rd_max: read throughput limit during bursts,
-#                        in bytes (Since 1.7)
+# @bps_rd_max: read throughput limit during bursts, in bytes
+#              (Since 1.7)
 #
-# @bps_wr_max: write throughput limit during bursts,
-#                        in bytes (Since 1.7)
+# @bps_wr_max: write throughput limit during bursts, in bytes
+#              (Since 1.7)
 #
-# @iops_max: total I/O operations per second during bursts,
-#                      in bytes (Since 1.7)
+# @iops_max: total I/O operations per second during bursts, in bytes
+#            (Since 1.7)
 #
-# @iops_rd_max: read I/O operations per second during bursts,
-#                         in bytes (Since 1.7)
+# @iops_rd_max: read I/O operations per second during bursts, in bytes
+#               (Since 1.7)
 #
-# @iops_wr_max: write I/O operations per second during bursts,
-#                         in bytes (Since 1.7)
+# @iops_wr_max: write I/O operations per second during bursts, in
+#               bytes (Since 1.7)
 #
-# @bps_max_length: maximum length of the @bps_max burst
-#                            period, in seconds. (Since 2.6)
+# @bps_max_length: maximum length of the @bps_max burst period, in
+#                  seconds. (Since 2.6)
 #
-# @bps_rd_max_length: maximum length of the @bps_rd_max
-#                               burst period, in seconds. (Since 2.6)
+# @bps_rd_max_length: maximum length of the @bps_rd_max burst period,
+#                     in seconds. (Since 2.6)
 #
-# @bps_wr_max_length: maximum length of the @bps_wr_max
-#                               burst period, in seconds. (Since 2.6)
+# @bps_wr_max_length: maximum length of the @bps_wr_max burst period,
+#                     in seconds. (Since 2.6)
 #
-# @iops_max_length: maximum length of the @iops burst
-#                             period, in seconds. (Since 2.6)
+# @iops_max_length: maximum length of the @iops burst period, in
+#                   seconds. (Since 2.6)
 #
-# @iops_rd_max_length: maximum length of the @iops_rd_max
-#                                burst period, in seconds. (Since 2.6)
+# @iops_rd_max_length: maximum length of the @iops_rd_max burst
+#                      period, in seconds. (Since 2.6)
 #
-# @iops_wr_max_length: maximum length of the @iops_wr_max
-#                                burst period, in seconds. (Since 2.6)
+# @iops_wr_max_length: maximum length of the @iops_wr_max burst
+#                      period, in seconds. (Since 2.6)
 #
 # @iops_size: an I/O size in bytes (Since 1.7)
 #
@@ -948,7 +948,7 @@
 #                           by the device (Since 4.2)
 #
 # @invalid_rd_operations: The number of invalid read operations
-#                          performed by the device (Since 2.5)
+#                         performed by the device (Since 2.5)
 #
 # @invalid_wr_operations: The number of invalid write operations
 #                         performed by the device (Since 2.5)
@@ -3735,7 +3735,7 @@
 # Driver specific block device options for Quorum
 #
 # @blkverify: true if the driver must print content mismatch
-#                  set to false by default
+#             set to false by default
 #
 # @children: the children block devices to use
 #
diff --git a/qapi/control.json b/qapi/control.json
index afca2043af..f83499280a 100644
--- a/qapi/control.json
+++ b/qapi/control.json
@@ -195,7 +195,7 @@
 # @id: Name of the monitor
 #
 # @mode: Selects the monitor mode (default: readline in the system
-#           emulator, control in qemu-storage-daemon)
+#        emulator, control in qemu-storage-daemon)
 #
 # @pretty: Enables pretty printing (QMP only)
 #
diff --git a/qapi/machine.json b/qapi/machine.json
index 20541cb319..1a90376f4e 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -457,7 +457,7 @@
 # @nodeid: NUMA node ID (increase by 1 from 0 if omitted)
 #
 # @cpus: VCPUs belonging to this node (assign VCPUS round-robin
-#         if omitted)
+#        if omitted)
 #
 # @mem: memory size of this node; mutually exclusive with @memdev.
 #       Equally divide total memory among nodes if both @mem and @memdev are
@@ -690,7 +690,7 @@
 # 5.2.27.5: Table 5-147 of ACPI 6.3 spec.
 #
 # @none: None (no memory side cache in this proximity domain,
-#              or cache associativity unknown)
+#        or cache associativity unknown)
 #
 # @direct: Direct Mapped
 #
diff --git a/qapi/net.json b/qapi/net.json
index 1f1e148f01..ec66b39b70 100644
--- a/qapi/net.json
+++ b/qapi/net.json
@@ -533,7 +533,7 @@
 #               Must be specified along with @start-address and @subnet-mask.
 #
 # @subnet-mask: The IPv4 subnet mask to use on the interface. Must
-#                be specified along with @start-address and @subnet-mask.
+#               be specified along with @start-address and @subnet-mask.
 #
 # @isolated: Enable isolation for this interface. Interface isolation
 #            ensures that vmnet interface is not able to communicate
-- 
2.39.2



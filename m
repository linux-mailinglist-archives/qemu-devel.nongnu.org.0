Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 875D01E7EE0
	for <lists+qemu-devel@lfdr.de>; Fri, 29 May 2020 15:35:13 +0200 (CEST)
Received: from localhost ([::1]:56934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jefAG-0005Wv-HK
	for lists+qemu-devel@lfdr.de; Fri, 29 May 2020 09:35:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1jef99-0003jM-9v
 for qemu-devel@nongnu.org; Fri, 29 May 2020 09:34:03 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:41115
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1jef98-0000Vp-DU
 for qemu-devel@nongnu.org; Fri, 29 May 2020 09:34:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590759241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+qKCJYY1eLXH3iNqNa3XOp3oHRdpyFizDgWDOHjCZRE=;
 b=TbNsTa9vzJDTJQIUchx/AW5dk+B4q2CpJNIwsKtSvFfQpW33OHdK8iJ2lE0gkrfue5+HBy
 DOwHgLPi4+G1l+QGkEhFJv4Lb5B4w772HI2kYDXgTbVjOEYPwNkb2yLwXG5W6aVMplUrK0
 tqwy8OH8oqm4JB50LIViqhAEsnUmpp8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-_mtn-UkYMLqINoFEuoZqWQ-1; Fri, 29 May 2020 09:34:00 -0400
X-MC-Unique: _mtn-UkYMLqINoFEuoZqWQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE7D580183C;
 Fri, 29 May 2020 13:33:58 +0000 (UTC)
Received: from lisa.redhat.com (unknown [10.40.192.165])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8E2265D9D5;
 Fri, 29 May 2020 13:33:55 +0000 (UTC)
From: Michal Privoznik <mprivozn@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] numa: Initialize node initiator with respect to .has_cpu
Date: Fri, 29 May 2020 15:33:48 +0200
Message-Id: <d3039c47e4ce1118bc7c4d4f51da6412c6669339.1590753455.git.mprivozn@redhat.com>
In-Reply-To: <cover.1590753455.git.mprivozn@redhat.com>
References: <cover.1590753455.git.mprivozn@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=mprivozn@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/29 03:05:19
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: jingqi.liu@intel.com, tao3.xu@intel.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The initiator attribute of a NUMA node is documented as the 'NUMA
node that has best performance to given NUMA node'. If a NUMA
node has at least one CPU there can hardly be a different node
with better performace and thus all NUMA nodes which have a CPU
are initiators to themselves. Reflect this fact when initializing
the attribute.

Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
---
 hw/core/numa.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/hw/core/numa.c b/hw/core/numa.c
index 338453461c..1c9bc761cc 100644
--- a/hw/core/numa.c
+++ b/hw/core/numa.c
@@ -136,11 +136,15 @@ static void parse_numa_node(MachineState *ms, NumaNodeOptions *node,
         numa_info[nodenr].node_memdev = MEMORY_BACKEND(o);
     }
 
-    /*
-     * If not set the initiator, set it to MAX_NODES. And if
-     * HMAT is enabled and this node has no cpus, QEMU will raise error.
-     */
-    numa_info[nodenr].initiator = MAX_NODES;
+    /* Initialize initiator to either the current NUMA node (if
+     * it has at least one CPU), or to MAX_NODES. If HMAT is
+     * enabled an error will be raised later in
+     * numa_validate_initiator(). */
+    if (numa_info[nodenr].has_cpu)
+        numa_info[nodenr].initiator = nodenr;
+    else
+        numa_info[nodenr].initiator = MAX_NODES;
+
     if (node->has_initiator) {
         if (!ms->numa_state->hmat_enabled) {
             error_setg(errp, "ACPI Heterogeneous Memory Attribute Table "
-- 
2.26.2



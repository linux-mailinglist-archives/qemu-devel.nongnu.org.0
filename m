Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B08E4423B80
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 12:28:46 +0200 (CEST)
Received: from localhost ([::1]:43920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY4AH-0000hI-PH
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 06:28:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1mY46E-0006sX-MO
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 06:24:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22283)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1mY46C-0005Dd-RW
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 06:24:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633515871;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yhs34EERipMHpCaWkNf7UUhwHsfLDbqmjf/5Y2UztuE=;
 b=HXJMRGy7u9yCAnBINiYHicfj7eIbuF1vNzYpyjHibtdm88r7IIUr9NOYO4F2Np9Hp5PXvk
 ZhuSSFCgQkPoNZQcWjJ9KsPTwSVI2q4DuXOkqKKmpJ+FSz4OhaODWuBfEdVzAVxsRTAA/C
 Jv9Sx3snvfkPWcstvwfMSR9GDTlxm7g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-KCdPwbqNMfO1SlsshvoWoA-1; Wed, 06 Oct 2021 06:22:56 -0400
X-MC-Unique: KCdPwbqNMfO1SlsshvoWoA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DFEEE108468E;
 Wed,  6 Oct 2021 10:22:54 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-56.bne.redhat.com [10.64.54.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E696C5F4E7;
 Wed,  6 Oct 2021 10:22:51 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Subject: [PATCH 1/2] numa: Set default distance map if needed
Date: Wed,  6 Oct 2021 18:22:08 +0800
Message-Id: <20211006102209.6989-2-gshan@redhat.com>
In-Reply-To: <20211006102209.6989-1-gshan@redhat.com>
References: <20211006102209.6989-1-gshan@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, qemu-devel@nongnu.org,
 shan.gavin@gmail.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following option is used to specify the distance map. It's
possible the option isn't provided by user. In this case, the
distance map isn't populated and exposed to platform. On the
other hand, the empty NUMA node, where no memory resides, is
allowed on ARM64 virt platform. For these empty NUMA nodes,
their corresponding device-tree nodes aren't populated, but
their NUMA IDs should be included in the "/distance-map"
device-tree node, so that kernel can probe them properly if
device-tree is used.

  -numa,dist,src=<numa_id>,dst=<numa_id>,val=<distance>

So when user doesn't specify distance map, we need to generate
the default distance map, where the local and remote distances
are 10 and 20 separately. This adds an extra parameter to the
exiting complete_init_numa_distance() to generate the default
distance map for this case.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 hw/core/numa.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/hw/core/numa.c b/hw/core/numa.c
index 510d096a88..fdb3a4aeca 100644
--- a/hw/core/numa.c
+++ b/hw/core/numa.c
@@ -594,7 +594,7 @@ static void validate_numa_distance(MachineState *ms)
     }
 }
 
-static void complete_init_numa_distance(MachineState *ms)
+static void complete_init_numa_distance(MachineState *ms, bool is_default)
 {
     int src, dst;
     NodeInfo *numa_info = ms->numa_state->nodes;
@@ -609,6 +609,8 @@ static void complete_init_numa_distance(MachineState *ms)
             if (numa_info[src].distance[dst] == 0) {
                 if (src == dst) {
                     numa_info[src].distance[dst] = NUMA_DISTANCE_MIN;
+                } else if (is_default) {
+                    numa_info[src].distance[dst] = NUMA_DISTANCE_DEFAULT;
                 } else {
                     numa_info[src].distance[dst] = numa_info[dst].distance[src];
                 }
@@ -716,13 +718,20 @@ void numa_complete_configuration(MachineState *ms)
          * A->B != distance B->A, then that means the distance table is
          * asymmetric. In this case, the distances for both directions
          * of all node pairs are required.
+         *
+         * The default node pair distances, which are 10 and 20 for the
+         * local and remote nodes separatly, are provided if user doesn't
+         * specify any node pair distances.
          */
         if (ms->numa_state->have_numa_distance) {
             /* Validate enough NUMA distance information was provided. */
             validate_numa_distance(ms);
 
             /* Validation succeeded, now fill in any missing distances. */
-            complete_init_numa_distance(ms);
+            complete_init_numa_distance(ms, false);
+        } else {
+            complete_init_numa_distance(ms, true);
+            ms->numa_state->have_numa_distance = true;
         }
     }
 }
-- 
2.23.0



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7137B254EA5
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Aug 2020 21:33:44 +0200 (CEST)
Received: from localhost ([::1]:58512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kBNeZ-0002wY-DT
	for lists+qemu-devel@lfdr.de; Thu, 27 Aug 2020 15:33:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kBNSq-0005y3-2j
 for qemu-devel@nongnu.org; Thu, 27 Aug 2020 15:21:36 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:22881
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kBNSo-0000Lo-7F
 for qemu-devel@nongnu.org; Thu, 27 Aug 2020 15:21:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598556092;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y2WCrKlLVKjdPQ5JEb97UgqOg47yB7G6CZC7w1sa5Hw=;
 b=hTAFGGk+3Nwj5+q2XN43k4jM5dfO2JL6WSbglvIx9IZcUPxtNz0X88lA0ZFVxrPv3uKC8x
 2g5ahVpbyPKt094MSrhzGSWeCt9B1mSvPuSeCt5bUUWmK6k+HEH/J9lOP50Biqkkq4xunO
 zBwmT6ilRZBLUEbjIXMbtwux8vqJkYE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-124-aig2shUHOWC-TKJnQTJOpw-1; Thu, 27 Aug 2020 15:21:30 -0400
X-MC-Unique: aig2shUHOWC-TKJnQTJOpw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5CBA61009636;
 Thu, 27 Aug 2020 19:21:29 +0000 (UTC)
Received: from localhost (unknown [10.10.67.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0C351702FF;
 Thu, 27 Aug 2020 19:21:28 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 01/53] numa: hmat: fix cache size check
Date: Thu, 27 Aug 2020 15:20:30 -0400
Message-Id: <20200827192122.658035-2-ehabkost@redhat.com>
In-Reply-To: <20200827192122.658035-1-ehabkost@redhat.com>
References: <20200827192122.658035-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/27 07:16:16
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.959,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

when QEMU is started like:

qemu-system-x86_64 -smp 2 -machine hmat=on \
 -m 2G \
 -object memory-backend-ram,size=1G,id=m0 \
 -object memory-backend-ram,size=1G,id=m1 \
 -numa node,nodeid=0,memdev=m0 \
 -numa node,nodeid=1,memdev=m1,initiator=0 \
 -numa cpu,node-id=0,socket-id=0 \
 -numa cpu,node-id=0,socket-id=1 \
 -numa hmat-lb,initiator=0,target=0,hierarchy=memory,data-type=access-latency,latency=5 \
 -numa hmat-lb,initiator=0,target=0,hierarchy=memory,data-type=access-bandwidth,bandwidth=200M \
 -numa hmat-lb,initiator=0,target=1,hierarchy=memory,data-type=access-latency,latency=10 \
 -numa hmat-lb,initiator=0,target=1,hierarchy=memory,data-type=access-bandwidth,bandwidth=100M \
 -numa hmat-cache,node-id=0,size=8K,level=1,associativity=direct,policy=write-back,line=5 \
 -numa hmat-cache,node-id=0,size=16K,level=2,associativity=direct,policy=write-back,line=5

it errors out with:
 -numa hmat-cache,node-id=0,size=16K,level=2,associativity=direct,policy=write-back,line=5:
        Invalid size=16384, the size of level=2 should be less than the size(8192) of level=1

which doesn't look right as one would expect that L1 < L2 < L3 ...
Fix it by sawpping relevant size checks.

Fixes: c412a48d4d91 (numa: Extend CLI to provide memory side cache information)
Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20200821100519.1325691-1-imammedo@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/core/numa.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/core/numa.c b/hw/core/numa.c
index d1a94a14f8..f9593ec716 100644
--- a/hw/core/numa.c
+++ b/hw/core/numa.c
@@ -425,10 +425,10 @@ void parse_numa_hmat_cache(MachineState *ms, NumaHmatCacheOptions *node,
 
     if ((node->level > 1) &&
         ms->numa_state->hmat_cache[node->node_id][node->level - 1] &&
-        (node->size >=
+        (node->size <=
             ms->numa_state->hmat_cache[node->node_id][node->level - 1]->size)) {
         error_setg(errp, "Invalid size=%" PRIu64 ", the size of level=%" PRIu8
-                   " should be less than the size(%" PRIu64 ") of "
+                   " should be larger than the size(%" PRIu64 ") of "
                    "level=%u", node->size, node->level,
                    ms->numa_state->hmat_cache[node->node_id]
                                              [node->level - 1]->size,
@@ -438,10 +438,10 @@ void parse_numa_hmat_cache(MachineState *ms, NumaHmatCacheOptions *node,
 
     if ((node->level < HMAT_LB_LEVELS - 1) &&
         ms->numa_state->hmat_cache[node->node_id][node->level + 1] &&
-        (node->size <=
+        (node->size >=
             ms->numa_state->hmat_cache[node->node_id][node->level + 1]->size)) {
         error_setg(errp, "Invalid size=%" PRIu64 ", the size of level=%" PRIu8
-                   " should be larger than the size(%" PRIu64 ") of "
+                   " should be less than the size(%" PRIu64 ") of "
                    "level=%u", node->size, node->level,
                    ms->numa_state->hmat_cache[node->node_id]
                                              [node->level + 1]->size,
-- 
2.26.2



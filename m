Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 209F83BE8EE
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 15:42:08 +0200 (CEST)
Received: from localhost ([::1]:55702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m17oS-0004ln-1W
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 09:42:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1m17nO-0003Od-5e
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 09:40:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1m17nL-0005pe-BS
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 09:40:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625665254;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3HjlwmESVpEjbGfN8zTtZaYxgPfUUAzJBkSEpd89M6E=;
 b=FdcYENttDE491iX1T2/pKLotEBQJO7ViP0XyJwixYck8nLtnTXAFnXhvLPzJ1UeUs2mJxe
 2mBowVZh+3N86sL3lWy536RpLLmW4ZWHYL78EwTQN20j/VBIpz2EEALs6mU/jvA0LwTM/T
 XCBC9fEidWpQETK7QLD9C0KlPG3cvNs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561-Pk1qg028NYa98qp_O1M3ww-1; Wed, 07 Jul 2021 09:40:51 -0400
X-MC-Unique: Pk1qg028NYa98qp_O1M3ww-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2514B1023F4E;
 Wed,  7 Jul 2021 13:40:50 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.40.194.190])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DFE0D5D6AB;
 Wed,  7 Jul 2021 13:40:48 +0000 (UTC)
From: Michal Privoznik <mprivozn@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] numa: Report expected initiator
Date: Wed,  7 Jul 2021 15:40:29 +0200
Message-Id: <ebdf871551ea995bafa7a858899a26aa9bc153d3.1625662776.git.mprivozn@redhat.com>
In-Reply-To: <cover.1625662776.git.mprivozn@redhat.com>
References: <cover.1625662776.git.mprivozn@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mprivozn@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mprivozn@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: imammedo@redhat.com, tao3.xu@intel.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When setting up NUMA with HMAT enabled there's a check performed
in machine_set_cpu_numa_node() that reports an error when a NUMA
node has a CPU but the node's initiator is not itself. The error
message reported contains only the expected value and not the
actual value (which is different because an error is being
reported). Report both values in the error message.

Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
---
 hw/core/machine.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 57c18f909a..6f59fb0b7f 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -728,7 +728,8 @@ void machine_set_cpu_numa_node(MachineState *machine,
             if ((numa_info[props->node_id].initiator < MAX_NODES) &&
                 (props->node_id != numa_info[props->node_id].initiator)) {
                 error_setg(errp, "The initiator of CPU NUMA node %" PRId64
-                        " should be itself", props->node_id);
+                           " should be itself (got %" PRIu16 ")",
+                           props->node_id, numa_info[props->node_id].initiator);
                 return;
             }
             numa_info[props->node_id].has_cpu = true;
-- 
2.31.1



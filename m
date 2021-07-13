Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD4B3C747C
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 18:28:19 +0200 (CEST)
Received: from localhost ([::1]:43362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3LGc-0006sG-FQ
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 12:28:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1m3L85-0003qj-6D
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 12:19:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1m3L81-0006zM-1y
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 12:19:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626193163;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jvjPtzgSCNEaPmg+JuQjS0ZcjYXLwadqB4W92gvCUts=;
 b=NkD/yagT3FFpDH9kgQuoNKRkhDYCpMVvB8myC8Q0JwkhTE/T2QS0u4wMDDi5AI8nB8cjUC
 3kDlctey8DnD+OvfHTsDdAPFbCW59vhMEQVCnGZ+6jQGFgGZEV2CBvNXlyjVFFES7DQZMU
 jwN2qG2zAxTync2zvIt08DOrlrulbTE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-SkkdjDW0ORiU3Y1YfV-4DA-1; Tue, 13 Jul 2021 12:19:21 -0400
X-MC-Unique: SkkdjDW0ORiU3Y1YfV-4DA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 67F8C80006E;
 Tue, 13 Jul 2021 16:19:20 +0000 (UTC)
Received: from localhost (ovpn-113-28.rdu2.redhat.com [10.10.113.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 225C119C44;
 Tue, 13 Jul 2021 16:19:20 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 10/11] numa: Report expected initiator
Date: Tue, 13 Jul 2021 12:09:56 -0400
Message-Id: <20210713160957.3269017-11-ehabkost@redhat.com>
In-Reply-To: <20210713160957.3269017-1-ehabkost@redhat.com>
References: <20210713160957.3269017-1-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Michal Privoznik <mprivozn@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Pankaj Gupta <pankaj.gupta@ionos.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Michal Privoznik <mprivozn@redhat.com>

When setting up NUMA with HMAT enabled there's a check performed
in machine_set_cpu_numa_node() that reports an error when a NUMA
node has a CPU but the node's initiator is not itself. The error
message reported contains only the expected value and not the
actual value (which is different because an error is being
reported). Report both values in the error message.

Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>
Message-Id: <ebdf871551ea995bafa7a858899a26aa9bc153d3.1625662776.git.mprivozn@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/core/machine.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 57c18f909ab..6f59fb0b7f2 100644
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



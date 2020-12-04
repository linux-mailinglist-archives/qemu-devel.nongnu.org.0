Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7512CF53F
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 21:04:56 +0100 (CET)
Received: from localhost ([::1]:51546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klHK2-0000N1-LZ
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 15:04:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1klEcg-0007T6-13
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 12:11:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1klEbJ-0006hX-GG
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 12:11:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607101799;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9+PRIhEw0Acp4vDOwexFGwxUZr8HOu8lb/nNqXfnFsg=;
 b=QRUNDyLijQD9Vs0EPu7a5I8t1Kwfckv2yBPjedTAPZ1xC6Q+LlpKc8TeSXOmddulaoYZU1
 uOB3Z54/x8PsVVISbe14RzyORytGMJXmBVIcLGMKzYVp4ckZm5etdsB4Vldr1YLmiYwMKZ
 NHvEkvU93xh3l9GfiVQHq6OAjK66SBk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-_I5rEQrrPNyciUIumV3nDQ-1; Fri, 04 Dec 2020 12:09:56 -0500
X-MC-Unique: _I5rEQrrPNyciUIumV3nDQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 40992107ACE4;
 Fri,  4 Dec 2020 17:09:55 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 44F05620D7;
 Fri,  4 Dec 2020 17:09:54 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 7/8] x86: ich9: factor out "guest_cpu_hotplug_features"
Date: Fri,  4 Dec 2020 12:09:38 -0500
Message-Id: <20201204170939.1815522-8-imammedo@redhat.com>
In-Reply-To: <20201204170939.1815522-1-imammedo@redhat.com>
References: <20201204170939.1815522-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: lersek@redhat.com, ankur.a.arora@oracle.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

it will be reused by next patch to check validity of unplug
feature.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/isa/lpc_ich9.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
index 087a18d04d..da80430144 100644
--- a/hw/isa/lpc_ich9.c
+++ b/hw/isa/lpc_ich9.c
@@ -366,6 +366,7 @@ static void smi_features_ok_callback(void *opaque)
 {
     ICH9LPCState *lpc = opaque;
     uint64_t guest_features;
+    uint64_t guest_cpu_hotplug_features;
 
     if (lpc->smi_features_ok) {
         /* negotiation already complete, features locked */
@@ -378,9 +379,12 @@ static void smi_features_ok_callback(void *opaque)
         /* guest requests invalid features, leave @features_ok at zero */
         return;
     }
+
+    guest_cpu_hotplug_features = guest_features &
+                                 (BIT_ULL(ICH9_LPC_SMI_F_CPU_HOTPLUG_BIT) |
+                                  BIT_ULL(ICH9_LPC_SMI_F_CPU_HOT_UNPLUG_BIT));
     if (!(guest_features & BIT_ULL(ICH9_LPC_SMI_F_BROADCAST_BIT)) &&
-        guest_features & (BIT_ULL(ICH9_LPC_SMI_F_CPU_HOTPLUG_BIT) |
-                          BIT_ULL(ICH9_LPC_SMI_F_CPU_HOT_UNPLUG_BIT))) {
+        guest_cpu_hotplug_features) {
         /*
          * cpu hot-[un]plug with SMI requires SMI broadcast,
          * leave @features_ok at zero
-- 
2.27.0



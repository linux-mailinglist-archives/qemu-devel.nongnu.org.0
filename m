Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DAB51DB507
	for <lists+qemu-devel@lfdr.de>; Wed, 20 May 2020 15:30:48 +0200 (CEST)
Received: from localhost ([::1]:44194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jbOo3-0005V5-84
	for lists+qemu-devel@lfdr.de; Wed, 20 May 2020 09:30:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jbOeN-0002Ta-97
 for qemu-devel@nongnu.org; Wed, 20 May 2020 09:20:47 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:25239
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jbOeJ-0000NF-3Z
 for qemu-devel@nongnu.org; Wed, 20 May 2020 09:20:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589980841;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=DhTu4SHuEE+qnNe/cas8B3sShJ0o08ypXNC4O0JdhEc=;
 b=a8knkYXH8WEjgk1RHmXavmagjQ+g2x80EHTucRDTG6YkwfmUw0l4VKrRR3/4KTCiMjsUNx
 plPvBHSXGH302vDo3kQXYjOiGwD4ogI9SpGWCkjk3TVFF7GH9QJuBjeguKfAAe6D8d0pOY
 6aNBpCZOtQyB8PO4wGpugp3uyUU7iFM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-LJnAUd0KMz--apsdEF2McA-1; Wed, 20 May 2020 09:20:37 -0400
X-MC-Unique: LJnAUd0KMz--apsdEF2McA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2EC98EC1A7;
 Wed, 20 May 2020 13:20:36 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-50.ams2.redhat.com
 [10.36.113.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3B00A6EA22;
 Wed, 20 May 2020 13:20:27 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 26D349D60; Wed, 20 May 2020 15:20:04 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 13/22] x86: coldplug cpus
Date: Wed, 20 May 2020 15:19:54 +0200
Message-Id: <20200520132003.9492-14-kraxel@redhat.com>
In-Reply-To: <20200520132003.9492-1-kraxel@redhat.com>
References: <20200520132003.9492-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/20 02:22:41
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

microvm needs this, for correct madt creation
(make sure enable bit is set).

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/i386/x86.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 7a3bc7ab6639..ac7a0a958781 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -118,6 +118,7 @@ uint32_t x86_cpu_apic_id_from_index(X86MachineState *x86ms,
 
 void x86_cpu_new(X86MachineState *x86ms, int64_t apic_id, Error **errp)
 {
+    MachineClass *mc = MACHINE_GET_CLASS(x86ms);
     Object *cpu = NULL;
     Error *local_err = NULL;
 
@@ -126,6 +127,16 @@ void x86_cpu_new(X86MachineState *x86ms, int64_t apic_id, Error **errp)
     object_property_set_uint(cpu, apic_id, "apic-id", &local_err);
     object_property_set_bool(cpu, true, "realized", &local_err);
 
+    if (!mc->has_hotpluggable_cpus) {
+        /* coldplug cpu */
+        MachineState *ms = MACHINE(x86ms);
+        int i = 0;
+        while (ms->possible_cpus->cpus[i].arch_id != apic_id) {
+            i++;
+        }
+        ms->possible_cpus->cpus[i].cpu = cpu;
+    }
+
     object_unref(cpu);
     error_propagate(errp, local_err);
 }
-- 
2.18.4



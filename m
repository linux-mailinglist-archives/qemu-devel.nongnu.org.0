Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F1B6A1ECE
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 16:44:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVa9Z-0003tC-VN; Fri, 24 Feb 2023 10:38:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pVa9Q-0003nj-Uq
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 10:38:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pVa9O-00071j-Rp
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 10:38:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677253102;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rGdD8nWtph/fDq1vVtxc2R7LaD/ySuhOm4YpWD4sn60=;
 b=RR2i/lJopcFDGogZ2PEWFLAIbciYeFjNsTGPsNCLQ4edgbqpiBdXKTFvCvNv7VfBdk7i1L
 +zEgL8vOTOXopqGt1+xwaf6+ucNOjo9B+FdlKylKIgHSauYZZ2ku2B6bpgp6nSOAPx6fFV
 E2fPRWqizcGofJvzKDq+SYhiUYvqzIM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-204-kq4IRGRCOS-U0iV-7wj-VQ-1; Fri, 24 Feb 2023 10:38:20 -0500
X-MC-Unique: kq4IRGRCOS-U0iV-7wj-VQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 00E9429A9D38;
 Fri, 24 Feb 2023 15:38:20 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 55676492B12;
 Fri, 24 Feb 2023 15:38:19 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com,
	ani@anisinha.ca,
	berrange@redhat.com
Subject: [PATCH 06/33] x86: pcihp: fix missing PCNT callchain when
 intermediate root-port has 'hotplug=off' set
Date: Fri, 24 Feb 2023 16:37:45 +0100
Message-Id: <20230224153812.4176226-7-imammedo@redhat.com>
In-Reply-To: <20230224153812.4176226-1-imammedo@redhat.com>
References: <20230224153812.4176226-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Beside BSEL numbers change (due to 2 extra root-ports in q35/miltibridge test),
following change is expected:

       Scope (\_SB.PCI0)
       {
  ...
  +        Scope (S50)
  +        {
  +            Scope (S00)
  +            {
  +                Method (PCNT, 0, NotSerialized)
  +                {
  +                    BNUM = Zero
  +                    DVNT (PCIU, One)
  +                    DVNT (PCID, 0x03)
  +                }
  +            }
  +
  +            Method (PCNT, 0, NotSerialized)
  +            {
  +                ^S00.PCNT
  +            }
  +        }
  ...
           Method (PCNT, 0, NotSerialized)
           {
  +            ^S50.PCNT ()
               ^S13.PCNT ()
               ^S12.PCNT ()
               ^S11.PCNT ()

I practice [1] hasn't broke anything since on hardware side we unset
hotplug_handler on such intermediate port => hotplug behind it has
not been properly wired and as result not worked.

1)
Fixes: ddab4d3fae4e8 ("pcihp: compose PCNT callchain right before its user _GPE._E01")
Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/i386/acpi-build.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index b67dcbbb37..c0674ae2d1 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -516,16 +516,24 @@ static bool build_append_notfication_callback(Aml *parent_scope,
     PCIBus *sec;
     QObject *bsel;
     int nr_notifiers = 0;
+    GQueue *pcnt_bus_list = g_queue_new();
 
     QLIST_FOREACH(sec, &bus->child, sibling) {
         Aml *br_scope = aml_scope("S%.02X", sec->parent_dev->devfn);
-        if (pci_bus_is_root(sec) ||
-            !object_property_find(OBJECT(sec), ACPI_PCIHP_PROP_BSEL)) {
+        if (pci_bus_is_root(sec)) {
             continue;
         }
         nr_notifiers = nr_notifiers +
                        build_append_notfication_callback(br_scope, sec);
-        aml_append(parent_scope, br_scope);
+        /*
+         * add new child scope to parent
+         * and keep track of bus that have PCNT,
+         * bus list is used later to call children PCNTs from this level PCNT
+         */
+        if (nr_notifiers) {
+            g_queue_push_tail(pcnt_bus_list, sec);
+            aml_append(parent_scope, br_scope);
+        }
     }
 
     /*
@@ -549,17 +557,13 @@ static bool build_append_notfication_callback(Aml *parent_scope,
     }
 
     /* Notify about child bus events in any case */
-    QLIST_FOREACH(sec, &bus->child, sibling) {
-        if (pci_bus_is_root(sec) ||
-            !object_property_find(OBJECT(sec), ACPI_PCIHP_PROP_BSEL)) {
-            continue;
-        }
-
+    while ((sec = g_queue_pop_head(pcnt_bus_list))) {
         aml_append(method, aml_name("^S%.02X.PCNT", sec->parent_dev->devfn));
     }
 
     aml_append(parent_scope, method);
     qobject_unref(bsel);
+    g_queue_free(pcnt_bus_list);
     return !!nr_notifiers;
 }
 
-- 
2.39.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E10B060C6D7
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 10:47:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onFVb-0001TY-Dl; Tue, 25 Oct 2022 04:42:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1onEwy-0004iO-Ie
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 04:06:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1onEwj-0007wD-La
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 04:06:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666685150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MFtTdBeO1NcvPJkQubXwqNNsLZ5/OVsHsuoQyb9aRts=;
 b=ciqXW0sAALtdMFSJS56ouUa4TK9MIquK9N4xNlAq+vZQ6M5sJtmGEp7v7zkmdn4VpzjIPv
 7kctUJ1IXx3AL1dQZ7rKqs72nbmc9clvhpKeP4o2pC1EA28L81RDOtkzLoyo3X6oL5hkUB
 0gGDLC3BhpYAgHsTV30GoZK1ZQbw/jU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-649-N7ooCoyOPVCFPWYQFrbM7A-1; Tue, 25 Oct 2022 04:05:45 -0400
X-MC-Unique: N7ooCoyOPVCFPWYQFrbM7A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4DD7E3C0F22A;
 Tue, 25 Oct 2022 08:05:45 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.118])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B2DC32028E98;
 Tue, 25 Oct 2022 08:05:44 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 49F1321E60C9; Tue, 25 Oct 2022 10:05:41 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
	Jiri Pirko <jiri@resnulli.us>
Subject: [PULL 20/28] qapi rocker: Elide redundant has_FOO in generated C
Date: Tue, 25 Oct 2022 10:05:33 +0200
Message-Id: <20221025080541.271547-21-armbru@redhat.com>
In-Reply-To: <20221025080541.271547-1-armbru@redhat.com>
References: <20221025080541.271547-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.503,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The has_FOO for pointer-valued FOO are redundant, except for arrays.
They are also a nuisance to work with.  Recent commit "qapi: Start to
elide redundant has_FOO in generated C" provided the means to elide
them step by step.  This is the step for qapi/rocker.json.

Said commit explains the transformation in more detail.  The invariant
violations mentioned there do not occur here.

Cc: Jiri Pirko <jiri@resnulli.us>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20221018062849.3420573-21-armbru@redhat.com>
---
 hw/net/rocker/rocker_of_dpa.c | 13 ++-----------
 monitor/hmp-cmds.c            | 22 +++++++++++-----------
 scripts/qapi/schema.py        |  1 -
 3 files changed, 13 insertions(+), 23 deletions(-)

diff --git a/hw/net/rocker/rocker_of_dpa.c b/hw/net/rocker/rocker_of_dpa.c
index b3b8c5bb6d..dfe4754469 100644
--- a/hw/net/rocker/rocker_of_dpa.c
+++ b/hw/net/rocker/rocker_of_dpa.c
@@ -2348,23 +2348,19 @@ static void of_dpa_flow_fill(void *cookie, void *value, void *user_data)
 
     if (memcmp(key->eth.src.a, zero_mac.a, ETH_ALEN) ||
         memcmp(mask->eth.src.a, zero_mac.a, ETH_ALEN)) {
-        nkey->has_eth_src = true;
         nkey->eth_src = qemu_mac_strdup_printf(key->eth.src.a);
     }
 
-    if (nkey->has_eth_src && memcmp(mask->eth.src.a, ff_mac.a, ETH_ALEN)) {
-        nmask->has_eth_src = true;
+    if (nkey->eth_src && memcmp(mask->eth.src.a, ff_mac.a, ETH_ALEN)) {
         nmask->eth_src = qemu_mac_strdup_printf(mask->eth.src.a);
     }
 
     if (memcmp(key->eth.dst.a, zero_mac.a, ETH_ALEN) ||
         memcmp(mask->eth.dst.a, zero_mac.a, ETH_ALEN)) {
-        nkey->has_eth_dst = true;
         nkey->eth_dst = qemu_mac_strdup_printf(key->eth.dst.a);
     }
 
-    if (nkey->has_eth_dst && memcmp(mask->eth.dst.a, ff_mac.a, ETH_ALEN)) {
-        nmask->has_eth_dst = true;
+    if (nkey->eth_dst && memcmp(mask->eth.dst.a, ff_mac.a, ETH_ALEN)) {
         nmask->eth_dst = qemu_mac_strdup_printf(mask->eth.dst.a);
     }
 
@@ -2400,7 +2396,6 @@ static void of_dpa_flow_fill(void *cookie, void *value, void *user_data)
             if (key->ipv4.addr.dst || mask->ipv4.addr.dst) {
                 char *dst = inet_ntoa(*(struct in_addr *)&key->ipv4.addr.dst);
                 int dst_len = of_dpa_mask2prefix(mask->ipv4.addr.dst);
-                nkey->has_ip_dst = true;
                 nkey->ip_dst = g_strdup_printf("%s/%d", dst, dst_len);
             }
             break;
@@ -2501,12 +2496,10 @@ static void of_dpa_group_fill(void *key, void *value, void *user_data)
             ngroup->set_vlan_id = ntohs(group->l2_rewrite.vlan_id);
         }
         if (memcmp(group->l2_rewrite.src_mac.a, zero_mac.a, ETH_ALEN)) {
-            ngroup->has_set_eth_src = true;
             ngroup->set_eth_src =
                 qemu_mac_strdup_printf(group->l2_rewrite.src_mac.a);
         }
         if (memcmp(group->l2_rewrite.dst_mac.a, zero_mac.a, ETH_ALEN)) {
-            ngroup->has_set_eth_dst = true;
             ngroup->set_eth_dst =
                 qemu_mac_strdup_printf(group->l2_rewrite.dst_mac.a);
         }
@@ -2532,12 +2525,10 @@ static void of_dpa_group_fill(void *key, void *value, void *user_data)
             ngroup->set_vlan_id = ntohs(group->l3_unicast.vlan_id);
         }
         if (memcmp(group->l3_unicast.src_mac.a, zero_mac.a, ETH_ALEN)) {
-            ngroup->has_set_eth_src = true;
             ngroup->set_eth_src =
                 qemu_mac_strdup_printf(group->l3_unicast.src_mac.a);
         }
         if (memcmp(group->l3_unicast.dst_mac.a, zero_mac.a, ETH_ALEN)) {
-            ngroup->has_set_eth_dst = true;
             ngroup->set_eth_dst =
                 qemu_mac_strdup_printf(group->l3_unicast.dst_mac.a);
         }
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index b180c6fc6b..8f8bd93df1 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -2031,35 +2031,35 @@ void hmp_rocker_of_dpa_flows(Monitor *mon, const QDict *qdict)
             }
         }
 
-        if (key->has_eth_src) {
+        if (key->eth_src) {
             if ((strcmp(key->eth_src, "01:00:00:00:00:00") == 0) &&
-                (mask->has_eth_src) &&
+                mask->eth_src &&
                 (strcmp(mask->eth_src, "01:00:00:00:00:00") == 0)) {
                 monitor_printf(mon, " src <any mcast/bcast>");
             } else if ((strcmp(key->eth_src, "00:00:00:00:00:00") == 0) &&
-                (mask->has_eth_src) &&
+                mask->eth_src &&
                 (strcmp(mask->eth_src, "01:00:00:00:00:00") == 0)) {
                 monitor_printf(mon, " src <any ucast>");
             } else {
                 monitor_printf(mon, " src %s", key->eth_src);
-                if (mask->has_eth_src) {
+                if (mask->eth_src) {
                     monitor_printf(mon, "(%s)", mask->eth_src);
                 }
             }
         }
 
-        if (key->has_eth_dst) {
+        if (key->eth_dst) {
             if ((strcmp(key->eth_dst, "01:00:00:00:00:00") == 0) &&
-                (mask->has_eth_dst) &&
+                mask->eth_dst &&
                 (strcmp(mask->eth_dst, "01:00:00:00:00:00") == 0)) {
                 monitor_printf(mon, " dst <any mcast/bcast>");
             } else if ((strcmp(key->eth_dst, "00:00:00:00:00:00") == 0) &&
-                (mask->has_eth_dst) &&
+                mask->eth_dst &&
                 (strcmp(mask->eth_dst, "01:00:00:00:00:00") == 0)) {
                 monitor_printf(mon, " dst <any ucast>");
             } else {
                 monitor_printf(mon, " dst %s", key->eth_dst);
-                if (mask->has_eth_dst) {
+                if (mask->eth_dst) {
                     monitor_printf(mon, "(%s)", mask->eth_dst);
                 }
             }
@@ -2079,7 +2079,7 @@ void hmp_rocker_of_dpa_flows(Monitor *mon, const QDict *qdict)
             }
         }
 
-        if (key->has_ip_dst) {
+        if (key->ip_dst) {
             monitor_printf(mon, " dst %s", key->ip_dst);
         }
 
@@ -2158,7 +2158,7 @@ void hmp_rocker_of_dpa_groups(Monitor *mon, const QDict *qdict)
                            group->set_vlan_id & VLAN_VID_MASK);
         }
 
-        if (group->has_set_eth_src) {
+        if (group->set_eth_src) {
             if (!set) {
                 set = true;
                 monitor_printf(mon, " set");
@@ -2166,7 +2166,7 @@ void hmp_rocker_of_dpa_groups(Monitor *mon, const QDict *qdict)
             monitor_printf(mon, " src %s", group->set_eth_src);
         }
 
-        if (group->has_set_eth_dst) {
+        if (group->set_eth_dst) {
             if (!set) {
                 monitor_printf(mon, " set");
             }
diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index 2b6644f1c3..1b3195bc87 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -759,7 +759,6 @@ def need_has(self):
         assert self.type
         # Temporary hack to support dropping the has_FOO in reviewable chunks
         opt_out = [
-            'qapi/rocker.json',
             'qapi/run-state.json',
             'qapi/stats.json',
             'qapi/tpm.json',
-- 
2.37.3



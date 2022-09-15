Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A915BA221
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Sep 2022 23:01:49 +0200 (CEST)
Received: from localhost ([::1]:43666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYvzY-0003nh-Ps
	for lists+qemu-devel@lfdr.de; Thu, 15 Sep 2022 17:01:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oYvhx-00025G-0A
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 16:43:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oYvhn-0000JO-Kq
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 16:43:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663274606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5Z8tL24D/602OW56NCLzk9QSXBJiwn/cvJj7CECMtfg=;
 b=WM/cRchPSIprXKYIMNXpIb+1Xyusw8zSE469xL3QD7aD9C70mpL+G1+/88QEyVT6zCp1W6
 YysBSPlnLtdarVKmjfJ4Op4JbhIvvRIy0HoySceGtUabeRQ8Gqi0GS+AOKT6UPv2FubNxu
 Foe4haD6TNK5zlMZ6t+pj9sagVsXz6Y=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-372-ZtcN0CGzPlyX9GUE4tX2Qw-1; Thu, 15 Sep 2022 16:43:23 -0400
X-MC-Unique: ZtcN0CGzPlyX9GUE4tX2Qw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 40B041C07588;
 Thu, 15 Sep 2022 20:43:23 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F01BB2087440;
 Thu, 15 Sep 2022 20:43:22 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1269621E66FE; Thu, 15 Sep 2022 22:43:18 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: michael.roth@amd.com, jsnow@redhat.com, eblake@redhat.com,
 Jiri Pirko <jiri@resnulli.us>
Subject: [PATCH 20/27] qapi rocker: Elide redundant has_FOO in generated C
Date: Thu, 15 Sep 2022 22:43:10 +0200
Message-Id: <20220915204317.3766007-21-armbru@redhat.com>
In-Reply-To: <20220915204317.3766007-1-armbru@redhat.com>
References: <20220915204317.3766007-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The has_FOO for pointer-valued FOO are redundant, except for arrays.
They are also a nuisance to work with.  Recent commit "qapi: Start to
elide redundant has_FOO in generated C" provided the means to elide
them step by step.  This is the step for qapi/rocker.json.

Said commit explains the transformation in more detail.  The invariant
violations mentioned there do not occur here.

Cc: Jiri Pirko <jiri@resnulli.us>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
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
index 8f4038c6f4..7ae986ab10 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -2029,35 +2029,35 @@ void hmp_rocker_of_dpa_flows(Monitor *mon, const QDict *qdict)
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
@@ -2077,7 +2077,7 @@ void hmp_rocker_of_dpa_flows(Monitor *mon, const QDict *qdict)
             }
         }
 
-        if (key->has_ip_dst) {
+        if (key->ip_dst) {
             monitor_printf(mon, " dst %s", key->ip_dst);
         }
 
@@ -2156,7 +2156,7 @@ void hmp_rocker_of_dpa_groups(Monitor *mon, const QDict *qdict)
                            group->set_vlan_id & VLAN_VID_MASK);
         }
 
-        if (group->has_set_eth_src) {
+        if (group->set_eth_src) {
             if (!set) {
                 set = true;
                 monitor_printf(mon, " set");
@@ -2164,7 +2164,7 @@ void hmp_rocker_of_dpa_groups(Monitor *mon, const QDict *qdict)
             monitor_printf(mon, " src %s", group->set_eth_src);
         }
 
-        if (group->has_set_eth_dst) {
+        if (group->set_eth_dst) {
             if (!set) {
                 monitor_printf(mon, " set");
             }
diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index 3aba200abb..793387f251 100644
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
2.37.2



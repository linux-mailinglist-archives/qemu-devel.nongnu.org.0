Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF8664C53D
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 09:46:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5MUR-0003XV-Pe; Wed, 14 Dec 2022 02:47:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p5MUM-0003SW-Jb
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 02:47:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p5MUI-0003ez-Na
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 02:47:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671004053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6icPNvg6Lh6O2W3eKU3QL0p5PLssdBFWDF4IqVi9ZHk=;
 b=Rd4aO+ZM/syTPtYC3AFC+S45ewlcQ5MQaCo54EjIYFQm8saAtuDhY370np0oZ6VRgcdMTR
 1DO71LBoRYnCkHSJGxfBVglFX4q9hTGl3C0vGXiXwuLwGwJXtLmaMK/TnhQsUkdZ68SxoV
 cCep5Gr9JfeK24dMoQivVhHq4bhjBMg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-439-C6A2iBu1OcKVldAa_LUNbQ-1; Wed, 14 Dec 2022 02:47:32 -0500
X-MC-Unique: C6A2iBu1OcKVldAa_LUNbQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F23638030CF;
 Wed, 14 Dec 2022 07:47:31 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 771F214171C2;
 Wed, 14 Dec 2022 07:47:31 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 84E8121E61BE; Wed, 14 Dec 2022 08:47:21 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: Jiri Pirko <jiri@resnulli.us>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 22/30] qapi rocker: Elide redundant has_FOO in generated C
Date: Wed, 14 Dec 2022 08:47:13 +0100
Message-Id: <20221214074721.731441-25-armbru@redhat.com>
In-Reply-To: <20221214074721.731441-1-armbru@redhat.com>
References: <20221214074721.731441-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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

The has_FOO for pointer-valued FOO are redundant, except for arrays.
They are also a nuisance to work with.  Recent commit "qapi: Start to
elide redundant has_FOO in generated C" provided the means to elide
them step by step.  This is the step for qapi/rocker.json.

Said commit explains the transformation in more detail.  The invariant
violations mentioned there do not occur here.

Cc: Jiri Pirko <jiri@resnulli.us>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20221104160712.3005652-23-armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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
index ae5ebe765a..a41f94a34a 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -2010,35 +2010,35 @@ void hmp_rocker_of_dpa_flows(Monitor *mon, const QDict *qdict)
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
@@ -2058,7 +2058,7 @@ void hmp_rocker_of_dpa_flows(Monitor *mon, const QDict *qdict)
             }
         }
 
-        if (key->has_ip_dst) {
+        if (key->ip_dst) {
             monitor_printf(mon, " dst %s", key->ip_dst);
         }
 
@@ -2137,7 +2137,7 @@ void hmp_rocker_of_dpa_groups(Monitor *mon, const QDict *qdict)
                            group->set_vlan_id & VLAN_VID_MASK);
         }
 
-        if (group->has_set_eth_src) {
+        if (group->set_eth_src) {
             if (!set) {
                 set = true;
                 monitor_printf(mon, " set");
@@ -2145,7 +2145,7 @@ void hmp_rocker_of_dpa_groups(Monitor *mon, const QDict *qdict)
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



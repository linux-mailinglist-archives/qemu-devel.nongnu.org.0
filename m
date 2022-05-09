Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA82B51FD08
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 14:37:16 +0200 (CEST)
Received: from localhost ([::1]:38394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no2dX-0000sF-Qu
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 08:37:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1no22k-0007uS-PP
 for qemu-devel@nongnu.org; Mon, 09 May 2022 07:59:14 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:45640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1no22j-0001IW-55
 for qemu-devel@nongnu.org; Mon, 09 May 2022 07:59:14 -0400
Received: by mail-wr1-x42a.google.com with SMTP id w4so19070775wrg.12
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 04:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=YLPDbkbC5BUT53wo2jLeCb34qH34ZBTypIl7O2mGU7o=;
 b=jKEKt9mSyDPu2mqArGI5a1O2mZydnsLJEfX7bkpeUBS1gqAnBzymOSwfjlGk+wOIZa
 kbDa32xe2je0ZCN9VfZF+ppMvtrQmEkvWAHLwk26BFkL4a03GP3YB/qmS2WRw/Bie3y7
 bRlia1h6VQYcCjYOXAWdeuqPhh1bfgSn6AhkClYazqcqOTadthW//1aZCMPajEhr5DvW
 PDRjLOjLBY6isEAzqX79ocly52lJ0zxclTVOquO7DNCPsttHQY0ht5d9YV+IbQMkg2h3
 6J4LmfqQgQjpuM5NC/Sb5Hgc8VreGU7/4If86TVvt4s6NgKAUQ2nIhcSmoPigTrekp1t
 85vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YLPDbkbC5BUT53wo2jLeCb34qH34ZBTypIl7O2mGU7o=;
 b=Y9Q71GDK/pwn5jDg7XJPTjXq7YOup2CeFC9feedA5q4HtlS6l8IJwWObfIA3sLPU1j
 TW/3adOAKXWjp816utoLQOYaMvPOlCBaQVtfW5UHBuWT75g1mHF+0NXUjUu5WxAJwRwy
 4AsFcqYqm9jV6YFUq3QNCLTqqXScwfhmfKncvjJYW8a+veApF0H91kB7Q589t4DJpPNV
 O8Ooeq1PWwQP9PHjeKhJdbpkNzctZkNwTEP6MuAG/Y4/G7aaKMFhbq19D/3Z7apqtFNr
 +P+scRtYYvQ6eZFibXb7u8aqgUXPVv/s1xTnzZpa5+glPgKUexPenuqvOLD+r2FwFMwz
 g3Vw==
X-Gm-Message-State: AOAM531KUp7Lr2dwETH+rwHzI3f8b3TIMFzm/y60/qVzqqS+2ET8/zRi
 4yGS+iyam7aOL4XUvLUeY3qARp2uznwJMw==
X-Google-Smtp-Source: ABdhPJw/gmj5yi7t769q7AoUMo0G5LEje0xU00MkhfmBu5ilE7Wpj2GOowlgROEToIxP6brDCcQ8yg==
X-Received: by 2002:a05:6000:178d:b0:20c:b1fb:abe9 with SMTP id
 e13-20020a056000178d00b0020cb1fbabe9mr9442318wrg.452.1652097552362; 
 Mon, 09 May 2022 04:59:12 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bs6-20020a056000070600b0020c5253d8bdsm12199928wrb.9.2022.05.09.04.59.11
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 04:59:11 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 27/32] qapi/machine.json: Add cluster-id
Date: Mon,  9 May 2022 12:58:43 +0100
Message-Id: <20220509115848.3521805-28-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220509115848.3521805-1-peter.maydell@linaro.org>
References: <20220509115848.3521805-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Gavin Shan <gshan@redhat.com>

This adds cluster-id in CPU instance properties, which will be used
by arm/virt machine. Besides, the cluster-id is also verified or
dumped in various spots:

  * hw/core/machine.c::machine_set_cpu_numa_node() to associate
    CPU with its NUMA node.

  * hw/core/machine.c::machine_numa_finish_cpu_init() to record
    CPU slots with no NUMA mapping set.

  * hw/core/machine-hmp-cmds.c::hmp_hotpluggable_cpus() to dump
    cluster-id.

Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
Acked-by: Igor Mammedov <imammedo@redhat.com>
Message-id: 20220503140304.855514-2-gshan@redhat.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 qapi/machine.json          |  6 ++++--
 hw/core/machine-hmp-cmds.c |  4 ++++
 hw/core/machine.c          | 16 ++++++++++++++++
 3 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/qapi/machine.json b/qapi/machine.json
index d25a481ce40..4c417e32a5d 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -868,10 +868,11 @@
 # @node-id: NUMA node ID the CPU belongs to
 # @socket-id: socket number within node/board the CPU belongs to
 # @die-id: die number within socket the CPU belongs to (since 4.1)
-# @core-id: core number within die the CPU belongs to
+# @cluster-id: cluster number within die the CPU belongs to (since 7.1)
+# @core-id: core number within cluster the CPU belongs to
 # @thread-id: thread number within core the CPU belongs to
 #
-# Note: currently there are 5 properties that could be present
+# Note: currently there are 6 properties that could be present
 #       but management should be prepared to pass through other
 #       properties with device_add command to allow for future
 #       interface extension. This also requires the filed names to be kept in
@@ -883,6 +884,7 @@
   'data': { '*node-id': 'int',
             '*socket-id': 'int',
             '*die-id': 'int',
+            '*cluster-id': 'int',
             '*core-id': 'int',
             '*thread-id': 'int'
   }
diff --git a/hw/core/machine-hmp-cmds.c b/hw/core/machine-hmp-cmds.c
index 4e2f319aebd..5cb5eecbfc9 100644
--- a/hw/core/machine-hmp-cmds.c
+++ b/hw/core/machine-hmp-cmds.c
@@ -77,6 +77,10 @@ void hmp_hotpluggable_cpus(Monitor *mon, const QDict *qdict)
         if (c->has_die_id) {
             monitor_printf(mon, "    die-id: \"%" PRIu64 "\"\n", c->die_id);
         }
+        if (c->has_cluster_id) {
+            monitor_printf(mon, "    cluster-id: \"%" PRIu64 "\"\n",
+                           c->cluster_id);
+        }
         if (c->has_core_id) {
             monitor_printf(mon, "    core-id: \"%" PRIu64 "\"\n", c->core_id);
         }
diff --git a/hw/core/machine.c b/hw/core/machine.c
index cb9bbc844d2..700c1e76b88 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -682,6 +682,11 @@ void machine_set_cpu_numa_node(MachineState *machine,
             return;
         }
 
+        if (props->has_cluster_id && !slot->props.has_cluster_id) {
+            error_setg(errp, "cluster-id is not supported");
+            return;
+        }
+
         if (props->has_socket_id && !slot->props.has_socket_id) {
             error_setg(errp, "socket-id is not supported");
             return;
@@ -701,6 +706,11 @@ void machine_set_cpu_numa_node(MachineState *machine,
                 continue;
         }
 
+        if (props->has_cluster_id &&
+            props->cluster_id != slot->props.cluster_id) {
+                continue;
+        }
+
         if (props->has_die_id && props->die_id != slot->props.die_id) {
                 continue;
         }
@@ -995,6 +1005,12 @@ static char *cpu_slot_to_string(const CPUArchId *cpu)
         }
         g_string_append_printf(s, "die-id: %"PRId64, cpu->props.die_id);
     }
+    if (cpu->props.has_cluster_id) {
+        if (s->len) {
+            g_string_append_printf(s, ", ");
+        }
+        g_string_append_printf(s, "cluster-id: %"PRId64, cpu->props.cluster_id);
+    }
     if (cpu->props.has_core_id) {
         if (s->len) {
             g_string_append_printf(s, ", ");
-- 
2.25.1



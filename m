Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BA93FCDB5
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 21:34:51 +0200 (CEST)
Received: from localhost ([::1]:47052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL9X0-0007Vz-EJ
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 15:34:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1mL9QV-0008ET-VL
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 15:28:07 -0400
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130]:34813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1mL9QS-0001ka-GI
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 15:28:07 -0400
Received: by mail-lf1-x130.google.com with SMTP id z2so1204059lft.1
 for <qemu-devel@nongnu.org>; Tue, 31 Aug 2021 12:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oE/CTQccPGQwH7DHVloQHpvY33VY/8DHBhYmKwKIpCU=;
 b=rJfmRWEYkbcNiMAVij76Cmv5qXclovHajEqZldw0+Td5nX20EhVYijBiNDOuEMEPzz
 kwXXqEZA7Mw2oG1jEK3sEKcJE9UvT+QdRNxmBSFg1QuuHzRGppohKcw4wXZCON1NAFN6
 3toOR/47byQlkdwd3yiPrNPFb+MbpkyZqjgtQCBCeWHMxfBm9VwnazuFqXGYRbeepUB6
 kOCVjeBc7xe/oTKhN6FiLYxljMNOHUlFrd4RtXI+K7UzQpTe/4NyaR6JHv3qR55YVnWv
 sxR5IiAq8kX5bs71gnqoQzdGv8iPwkU+O2Tt2BwpYmSa1R/uBZqjRfj3sddtqRWV2gpc
 XE9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oE/CTQccPGQwH7DHVloQHpvY33VY/8DHBhYmKwKIpCU=;
 b=sinGekUrSsZ49Npnj4AwX8OFvzhL2HxPe1aFyhzxYARnrU3ah9ZzIk1VfqGvQxxbXD
 hhWzGmaTSJ8ZOar6mPejhbymwfYtC0omekkJRQmpVwuEQSW9qEzvM5eSThvUDicTf/Lc
 JWEwy5cD5sX97jZogoal4WN+PZi/r4xTd2M1L8CiC6wDgihmG4XYqfEtKXB59lgPyBXm
 760vgr5WRsELYw7gf/SmvRoTodFdsetPVarCCZgdgVGROGwnQIYkCBfMLALlA827xQ8W
 CW1JHRqlU935feRh5hCH3jXsko3I38KlALpNEl8rPGuP8wgDOPtHy3ub9cPLydQ5RQE5
 U9Rw==
X-Gm-Message-State: AOAM531zZzCGYklF/zi3BQkOJkaZWFfz5wGUQsoH65iK916pM5VXL6WJ
 3uxd7k7MKmsXE7XH6suS9Z4Vqgbxih0org==
X-Google-Smtp-Source: ABdhPJzUjk5vKY25kKvxNK6EXHMpea/0dsLNMhsNSA56/vJ5qLdCnhq9wJS/NR+G9N7bNJuP8IGGlw==
X-Received: by 2002:a05:6512:2291:: with SMTP id
 f17mr19407271lfu.489.1630438082717; 
 Tue, 31 Aug 2021 12:28:02 -0700 (PDT)
Received: from UNIT-808.lan ([217.12.73.131])
 by smtp.gmail.com with ESMTPSA id u13sm1254791lfq.254.2021.08.31.12.28.02
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 31 Aug 2021 12:28:02 -0700 (PDT)
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/6] net/vmnet: implement host mode (vmnet-host)
Date: Tue, 31 Aug 2021 22:27:18 +0300
Message-Id: <20210831192720.33406-5-yaroshchuk2000@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210831192720.33406-1-yaroshchuk2000@gmail.com>
References: <20210831192720.33406-1-yaroshchuk2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-lf1-x130.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: jasowang@redhat.com, r.bolshakov@yadro.com,
 Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Still not implemented:
- port forwarding

Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
---
 net/vmnet-host.c | 75 ++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 72 insertions(+), 3 deletions(-)

diff --git a/net/vmnet-host.c b/net/vmnet-host.c
index 1d3484b51e..77a2c20b48 100644
--- a/net/vmnet-host.c
+++ b/net/vmnet-host.c
@@ -17,8 +17,77 @@
 
 #include <vmnet/vmnet.h>
 
+typedef struct VmnetHostState {
+  VmnetCommonState common;
+
+} VmnetHostState;
+
+static xpc_object_t create_if_desc(const Netdev *netdev, Error **errp);
+
+static NetClientInfo net_vmnet_host_info = {
+    .type = NET_CLIENT_DRIVER_VMNET_HOST,
+    .size = sizeof(VmnetHostState),
+    .receive = vmnet_receive_common,
+    .cleanup = vmnet_cleanup_common,
+};
+
 int net_init_vmnet_host(const Netdev *netdev, const char *name,
-                        NetClientState *peer, Error **errp) {
-  error_setg(errp, "vmnet-host is not implemented yet");
-  return -1;
+                        NetClientState *peer, Error **errp)
+{
+    NetClientState *nc;
+    xpc_object_t if_desc;
+
+    nc = qemu_new_net_client(&net_vmnet_host_info,
+                             peer, "vmnet-host", name);
+    if_desc = create_if_desc(netdev, errp);
+    return vmnet_if_create(nc, if_desc, errp, NULL);
+}
+
+static xpc_object_t create_if_desc(const Netdev *netdev, Error **errp)
+{
+    const NetdevVmnetHostOptions *options;
+    xpc_object_t if_desc;
+
+    if_desc = xpc_dictionary_create(NULL, NULL, 0);
+    xpc_dictionary_set_uint64(
+        if_desc,
+        vmnet_operation_mode_key,
+        VMNET_HOST_MODE
+    );
+
+    xpc_dictionary_set_bool(
+        if_desc,
+        vmnet_allocate_mac_address_key,
+        false
+    );
+
+    options = &(netdev->u.vmnet_host);
+
+    if (options->has_dhcpstart ||
+        options->has_dhcpend ||
+        options->has_subnetmask) {
+
+        if (options->has_dhcpstart &&
+            options->has_dhcpend &&
+            options->has_subnetmask) {
+
+            xpc_dictionary_set_string(if_desc,
+                                      vmnet_start_address_key,
+                                      options->dhcpstart);
+            xpc_dictionary_set_string(if_desc,
+                                      vmnet_end_address_key,
+                                      options->dhcpend);
+            xpc_dictionary_set_string(if_desc,
+                                      vmnet_subnet_mask_key,
+                                      options->subnetmask);
+        } else {
+            error_setg(
+                errp,
+                "'dhcpstart', 'dhcpend', 'subnetmask' "
+                "must be provided together"
+            );
+        }
+    }
+
+    return if_desc;
 }
-- 
2.23.0



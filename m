Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0DD42A366
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 13:36:31 +0200 (CEST)
Received: from localhost ([::1]:52716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maG58-000620-Cz
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 07:36:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1maFST-0003BC-09
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 06:56:33 -0400
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134]:42524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1maFSQ-0003yR-PI
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 06:56:32 -0400
Received: by mail-lf1-x134.google.com with SMTP id x27so85836740lfa.9
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 03:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XvbfWANzOylVPbjFB39mnB/oU0QzTY2VWLyPIZOBoOk=;
 b=pIW8OzZdopdxGrXGzIrwOWdmqGbHWavuQsGROVla3rEoNRV7oW3wTBS0xI7gtGPz5Y
 GjM8jCYAqSg8fM1nNT901FptxFJO+8ceTtnCopHBShqmGUjDRcxGTCoNZtzhxfrIbak2
 cNmlwDphln+FEV8ke7eHBE2fL3QUWBs8sTE85ugwfdwfpnIQSn7tZeEiqKvAGw3tsRiF
 sc/Yg6g6d6b/cTlYTzANridIHrk50Zb78Fk3Ci8DmlV9pWnKHiL6UFLS6j3cHO8Lszl8
 GBIFsHoIiWqckzmdk9ew3IqpOp2VIvg/dNBwXNc5KBFlMXyDZMYAXUYCLn70sy5LbZTh
 Y0dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XvbfWANzOylVPbjFB39mnB/oU0QzTY2VWLyPIZOBoOk=;
 b=YqnVKVZn3s5SqJBGpfcxOf/QVClZq6NrEQmFNG3p+KXEEPhLxvGi3Jzr8fZ5MUKVJ7
 CsQJBuNlfitnfFZDu24ZkAxCSNJ8Wsol1wAG42/233ErUlkFYvuGauw5VxPtOqye7yAN
 9YJ8nqnIY7tGUzxXQWZBVxEAnJm640Ev3N0zm9spbhs4p9/u/T5HGA1MQa0TQwPwfjui
 NdQYuNiddZLrtpGhyLGbLE1a63HsNTtjm0xndgVDG1SAijdXzwgmRmey36iv4aPdwW29
 ztOFObKZSVO6U9AHKf33TCqKMDrN9ORJAp+BNipi9CPRA7EK4FyF6Bw5Yf5K6uUz11OL
 FIjQ==
X-Gm-Message-State: AOAM531H4Y8mxUuPGXSQXTxc5u9IKD3BCSwlkEkS41e3UTTrYIL2eCJP
 04ryHxTl30jMIAivIj49jcVMjq+7Hb2NSU6H
X-Google-Smtp-Source: ABdhPJxWGQYq8AdNW3pMhQBD2JbQgO2D/isrvwPdN3j4QcITygTkY8HmLKOb1x8K2VkRgwxyQJi/FA==
X-Received: by 2002:a05:6512:12d3:: with SMTP id
 p19mr33967427lfg.280.1634036188087; 
 Tue, 12 Oct 2021 03:56:28 -0700 (PDT)
Received: from localhost.localdomain ([77.234.205.3])
 by smtp.gmail.com with ESMTPSA id p16sm995361lfe.166.2021.10.12.03.56.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 12 Oct 2021 03:56:27 -0700 (PDT)
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 4/6] net/vmnet: implement host mode (vmnet-host)
Date: Tue, 12 Oct 2021 13:55:56 +0300
Message-Id: <20211012105558.21530-5-yaroshchuk2000@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211012105558.21530-1-yaroshchuk2000@gmail.com>
References: <20211012105558.21530-1-yaroshchuk2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-lf1-x134.google.com
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
Cc: jasowang@redhat.com, eblake@redhat.com, r.bolshakov@yadro.com,
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
index 4a5ef99dc7..fe7211d61b 100644
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



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D863AB61F
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 16:38:19 +0200 (CEST)
Received: from localhost ([::1]:52030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltt9u-00045v-U2
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 10:38:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1ltt5b-0004ER-4b
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 10:33:57 -0400
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129]:36503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1ltt5P-0001NX-G9
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 10:33:50 -0400
Received: by mail-lf1-x129.google.com with SMTP id d16so3459245lfn.3
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 07:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oE/CTQccPGQwH7DHVloQHpvY33VY/8DHBhYmKwKIpCU=;
 b=aclhlSyc/ZjrL/UVBh4yzBvhhPSR67vjdzDuxJz23BDuqTKIx0ACxzAFPB39kxTShg
 c0uBZj8uTwHb+lt+ZsS+fLRyY6AKB6UWJnkxY/AQvaS8DABP5UVc0izu0tHsTAtgSjX+
 A1+FvkHPIu0c83/eVjvmGzf98xZHxBhjSS/kLKwJsiPysiDqrJrRcCb+/eqX/5uuG/hI
 XJWOlgEkDtHBwnnSUUJ9ENG61dMX4ClLlAT6mcydW5Cu/MGhO6+aPmYd7yLVCxrz/ROi
 /5VIMH/hcFMlY2w9TyuqWi6fL/59PVH+RhJXe5YLucRQMqRyPhcrBESRTzWqLMD9Zrxl
 HzDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oE/CTQccPGQwH7DHVloQHpvY33VY/8DHBhYmKwKIpCU=;
 b=LtGyQxyzKbVKRGOT+ReItMITcX8J+NmvzqVPjqyZdEd9eeHsIOfSVCeQyUokyYJ1Ov
 XJSqDSOXBkBTMYEMLmKGuWAQ2nc6ADons8+eNASj+u7zpIzTX32Jm1GwSV9pSn1pa9iT
 JoCnoEvPl3Gd9ReotXVTgY0W/NBt2K90g20Ffdpd0/NxlW0Md17SonCjRV2R3nT1Yljh
 1bXBSpNFv9dxDr5F5AyoqXUwoO9GvRT+jOdhtuTl8HVlgrcAZlXqVBfC85twoR4k9tS4
 +DK36FahXfTD4QRNiJAtSH7iyPm1jobTDnhF1g9LCgjt1Cpw/JvThVCQ4KoGUa1nQRmw
 Pl+w==
X-Gm-Message-State: AOAM532QIyErmW+2K3rnMmxGl8JLaJO+rygkzv+eETgKK/1d/qEoIGeA
 xpssHG0P0o8EFmeEknDOTjB5G5CingMJdQZs
X-Google-Smtp-Source: ABdhPJxpsiRT6fAaNYIpTxg6sOoNo1tfhV00OHLyd/cNwkzFcxq6zlv/iHRQ1m+IAVMtjRz8mi6rkA==
X-Received: by 2002:ac2:425a:: with SMTP id m26mr4319677lfl.458.1623940417620; 
 Thu, 17 Jun 2021 07:33:37 -0700 (PDT)
Received: from localhost.localdomain ([5.18.249.207])
 by smtp.gmail.com with ESMTPSA id d9sm597406lfv.47.2021.06.17.07.33.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 17 Jun 2021 07:33:37 -0700 (PDT)
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/7] net/vmnet: implement host mode (vmnet-host)
Date: Thu, 17 Jun 2021 17:32:44 +0300
Message-Id: <20210617143246.55336-6-yaroshchuk2000@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210617143246.55336-1-yaroshchuk2000@gmail.com>
References: <20210617143246.55336-1-yaroshchuk2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-lf1-x129.google.com
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



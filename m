Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9A842A35C
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 13:32:41 +0200 (CEST)
Received: from localhost ([::1]:43976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maG1Q-0008GP-EG
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 07:32:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1maFSS-0003Ay-Ul
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 06:56:32 -0400
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a]:34492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1maFSQ-0003yX-PQ
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 06:56:32 -0400
Received: by mail-lf1-x12a.google.com with SMTP id t9so84638333lfd.1
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 03:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8kKTJD6wLIaHfuJugchUxmyTTpfbII7eu8WMvF57C64=;
 b=IKw48IlNOR9TxZoZd1rSeUPKbG7fEzBRMA1hDYYD5DqmQ2Mrp4uIL88KdzwcWUDUDq
 a+5EF4fZ5TFCNQ7FbaG2ZlpDpxTw/YduhCFRrWhern+6PVqAEA2NHTgrRoLGANXKRcAG
 JNJkE/4mUoN2xdpbeY9AOUvEkNB0OfBaufVYo63Fksa7INNLL8Kx3vKRlLozzuqJl2og
 dGWJtXp1iZCyIQizNm4eKaffpLiA3U8OlDsQpajcB79SseOOTPIrJypPtKhCfTFbsu8L
 YlgxOnA9ih1MMPVtR7sbu9jzdnBygfMvnVS+vbvt9TS0CV0RqbvwmP6yfMIGjtKLqBgi
 Yckw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8kKTJD6wLIaHfuJugchUxmyTTpfbII7eu8WMvF57C64=;
 b=czoQ3eX4/lWS+/Ho7FL3ZcrioHT1XqQqbveIXOVsNVeMjgke/h+Q8Mn25KuMjejE8r
 kQqI2ygTcntowwQfipUfvZ4kraagt3wCXQy3xQ/coGFPZQyJJ5Z8tw1nqX0C9g6V4tZ2
 DN3Oo+V0tP098Xfi0laW6AxliSWIxqzZxKMdxvGmnmS/HLizHE6hXQSigEVceyQJLI9/
 rSXmLUH5LaBOAreYaHOCveZEYVerCvMmHZsnzXpkOAAeIdHf3oHXVMGuckDpdAHpb2a3
 /1BpK0C/DT1xzIPIWYPaqZuZ8NsaSw4pJM1pHUzanxWPWAO8ZqLqqYr6tnxQqc+wTUGl
 epmA==
X-Gm-Message-State: AOAM5330V2TmaGqyyMXXYJcXzLCWa1j+ORDCm3En6ddfH7yw3T1Wrgr9
 Pf6u0pGW+1U946clfw0iyvAWmnFmYIJDn0UJ
X-Google-Smtp-Source: ABdhPJzLCZkWklqfpY6hZYjBxc6Bw69yj8lKAkTSQ/KDmulutmo3YMAhuJQOPIUp55cLzQJKliCnJw==
X-Received: by 2002:a2e:92ce:: with SMTP id k14mr27153002ljh.27.1634036188732; 
 Tue, 12 Oct 2021 03:56:28 -0700 (PDT)
Received: from localhost.localdomain ([77.234.205.3])
 by smtp.gmail.com with ESMTPSA id p16sm995361lfe.166.2021.10.12.03.56.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 12 Oct 2021 03:56:28 -0700 (PDT)
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 5/6] net/vmnet: implement bridged mode (vmnet-bridged)
Date: Tue, 12 Oct 2021 13:55:57 +0300
Message-Id: <20211012105558.21530-6-yaroshchuk2000@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211012105558.21530-1-yaroshchuk2000@gmail.com>
References: <20211012105558.21530-1-yaroshchuk2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-lf1-x12a.google.com
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

Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
---
 net/vmnet-bridged.m | 102 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 100 insertions(+), 2 deletions(-)

diff --git a/net/vmnet-bridged.m b/net/vmnet-bridged.m
index 4e42a90391..9097181841 100644
--- a/net/vmnet-bridged.m
+++ b/net/vmnet-bridged.m
@@ -17,9 +17,107 @@
 
 #include <vmnet/vmnet.h>
 
+typedef struct VmnetBridgedState {
+  VmnetCommonState common;
+
+} VmnetBridgedState;
+
+static NetClientInfo net_vmnet_bridged_info = {
+    .type = NET_CLIENT_DRIVER_VMNET_BRIDGED,
+    .size = sizeof(VmnetBridgedState),
+    .receive = vmnet_receive_common,
+    .cleanup = vmnet_cleanup_common,
+};
+
+static xpc_object_t create_if_desc(const Netdev *netdev, Error **errp);
+
+static bool validate_ifname(const char *ifname);
+
+static const char *get_valid_ifnames(void);
+
 int net_init_vmnet_bridged(const Netdev *netdev, const char *name,
                            NetClientState *peer, Error **errp)
 {
-  error_setg(errp, "vmnet-bridged is not implemented yet");
-  return -1;
+    NetClientState *nc;
+    xpc_object_t if_desc;
+
+    nc = qemu_new_net_client(&net_vmnet_bridged_info,
+                             peer, "vmnet-bridged", name);
+    if_desc = create_if_desc(netdev, errp);
+    if (!if_desc) {
+        error_setg(errp,
+                   "unsupported ifname, should be one of: %s",
+                   get_valid_ifnames());
+        return -1;
+    }
+
+    return vmnet_if_create(nc, if_desc, errp, NULL);
+}
+
+static xpc_object_t create_if_desc(const Netdev *netdev, Error **errp)
+{
+    const NetdevVmnetBridgedOptions *options;
+    xpc_object_t if_desc;
+
+    if_desc = xpc_dictionary_create(NULL, NULL, 0);
+    xpc_dictionary_set_uint64(
+        if_desc,
+        vmnet_operation_mode_key,
+        VMNET_BRIDGED_MODE
+    );
+
+    xpc_dictionary_set_bool(
+        if_desc,
+        vmnet_allocate_mac_address_key,
+        false
+    );
+
+    options = &(netdev->u.vmnet_bridged);
+    if (validate_ifname(options->ifname)) {
+        xpc_dictionary_set_string(if_desc,
+                                  vmnet_shared_interface_name_key,
+                                  options->ifname);
+    } else {
+        return NULL;
+    }
+    return if_desc;
+}
+
+static bool validate_ifname(const char *ifname)
+{
+    xpc_object_t shared_if_list = vmnet_copy_shared_interface_list();
+    __block bool match = false;
+
+    xpc_array_apply(
+        shared_if_list,
+        ^bool(size_t index, xpc_object_t value) {
+          if (strcmp(xpc_string_get_string_ptr(value), ifname) == 0) {
+              match = true;
+              return false;
+          }
+          return true;
+        });
+
+    return match;
+}
+
+static const char *get_valid_ifnames(void)
+{
+    xpc_object_t shared_if_list = vmnet_copy_shared_interface_list();
+    __block char *if_list = NULL;
+
+    xpc_array_apply(
+        shared_if_list,
+        ^bool(size_t index, xpc_object_t value) {
+          if_list = g_strconcat(xpc_string_get_string_ptr(value),
+                                " ",
+                                if_list,
+                                NULL);
+          return true;
+        });
+
+    if (if_list) {
+        return if_list;
+    }
+    return "[no interfaces]";
 }
-- 
2.23.0



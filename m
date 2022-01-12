Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC00448C510
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 14:44:06 +0100 (CET)
Received: from localhost ([::1]:42796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7dv3-0004gG-Uq
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 08:44:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1n7ceH-0006p5-O7
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 07:22:44 -0500
Received: from [2a00:1450:4864:20::135] (port=41527
 helo=mail-lf1-x135.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1n7ce1-0003i8-GH
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 07:22:37 -0500
Received: by mail-lf1-x135.google.com with SMTP id x7so7427659lfu.8
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 04:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R13DoJVbs6zoVyv20VepuDuAx8j1kFO5EzEa0/nJLEI=;
 b=LoVR4N7zPPgQex31etfdI2ANJG+z+pntrAJi1cyUo4AIZCCOo8z56ZNfk92yy0GCFS
 64dl/hc10J3lV4lFH1M3sHuVlrUAZ6XdAyX8fQrEZ71O6zxLp4uyuBBnkcgu0RaLHTLZ
 NmlDLpUeMpWlYzKifOUzI6tkyofBsSLGgIQcNXMQ3mR+q4j0DrSBV/0E0z/Rbun4GFeM
 BQRU/n6JzYreeAnUJdQDnvq5Y3USOP557UKTNi7ALRKpE0mzcyYGbPO4cy2mcPP+1aag
 kazMkZmPZBpOMsnxPMV30oKVxRo8OlmjhowJS7B718ukUCpR8sVQ7ilt8FOTjSI8nYbP
 LE7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R13DoJVbs6zoVyv20VepuDuAx8j1kFO5EzEa0/nJLEI=;
 b=HLMtFDEyLVSag7BFrLh1KQ4kWuz6ljK7iVxjTwN7SgpPpwG02kQ0b4Y+0fCb3bxSWG
 /yO29I25FyeCXua3fPnCSjacP3YwDwesjmH/E6ukjUS25LSXzxsvdecI6lzEwITUfTJu
 P/dYn1TRNmRNkVX5T9pDqHj4XneYfboqsnNOZZuJok08hTC62xAV3hCULzV2rSliXhiw
 bcwXs9Fgc70M+8mudh4KKLTMAuKekG/srXNrsYZ3jzOuLTG071xxml1xQ18H54L5w9gq
 4sBkQK89Hf3Alyp4AYKjygbKUN3CiQOLIgSYZQA0JrWZxmuW8/+cuJQv8OykPbntfFEC
 AHYQ==
X-Gm-Message-State: AOAM533TarCbW0uCli/dktTXQZzVikoexN58Sz8V/JjfI6n/zd7x+bzd
 R0NTxwEP5tbU16PDxEiws1nrCyt2QM+7WKrV
X-Google-Smtp-Source: ABdhPJzB6s2B2HaJ3WfqmIVAwj+GPYQS3eENT+L4tW8ngPALBXBzR6UWovpooHwZpLPacY3RQi+7DQ==
X-Received: by 2002:a05:6512:2810:: with SMTP id
 cf16mr6654189lfb.541.1641990143783; 
 Wed, 12 Jan 2022 04:22:23 -0800 (PST)
Received: from localhost.localdomain ([77.234.205.2])
 by smtp.gmail.com with ESMTPSA id u7sm1623035lfs.218.2022.01.12.04.22.22
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 Jan 2022 04:22:22 -0800 (PST)
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v11 4/7] net/vmnet: implement host mode (vmnet-host)
Date: Wed, 12 Jan 2022 15:21:47 +0300
Message-Id: <20220112122150.37049-5-yaroshchuk2000@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20220112122150.37049-1-yaroshchuk2000@gmail.com>
References: <20220112122150.37049-1-yaroshchuk2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::135
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-lf1-x135.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>, jasowang@redhat.com,
 phillip.ennen@gmail.com, armbru@redhat.com, r.bolshakov@yadro.com,
 phillip@axleos.com, akihiko.odaki@gmail.com, hsp.cat7@gmail.com, hello@adns.io,
 eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
---
 net/vmnet-host.c | 96 +++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 90 insertions(+), 6 deletions(-)

diff --git a/net/vmnet-host.c b/net/vmnet-host.c
index 4a5ef99dc7..eee4daf74b 100644
--- a/net/vmnet-host.c
+++ b/net/vmnet-host.c
@@ -9,16 +9,100 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/uuid.h"
 #include "qapi/qapi-types-net.h"
-#include "vmnet_int.h"
-#include "clients.h"
-#include "qemu/error-report.h"
 #include "qapi/error.h"
+#include "clients.h"
+#include "vmnet_int.h"
 
 #include <vmnet/vmnet.h>
 
+typedef struct VmnetHostState {
+  VmnetCommonState cs;
+  QemuUUID network_uuid;
+} VmnetHostState;
+
+static xpc_object_t create_if_desc(const Netdev *netdev,
+                                   NetClientState *nc,
+                                   Error **errp)
+{
+    const NetdevVmnetHostOptions *options = &(netdev->u.vmnet_host);
+
+    xpc_object_t if_desc = xpc_dictionary_create(NULL, NULL, 0);
+
+    xpc_dictionary_set_uint64(
+        if_desc,
+        vmnet_operation_mode_key,
+        VMNET_HOST_MODE
+    );
+
+#ifdef CONFIG_VMNET_11_0_API
+    VmnetCommonState *cs = DO_UPCAST(VmnetCommonState, nc, nc);
+    VmnetHostState *hs = DO_UPCAST(VmnetHostState, cs, cs);
+
+    xpc_dictionary_set_bool(
+        if_desc,
+        vmnet_enable_isolation_key,
+        options->isolated
+    );
+
+    if (options->has_net_uuid) {
+        if (qemu_uuid_parse(options->net_uuid, &hs->network_uuid) < 0) {
+            error_setg(errp, "Invalid UUID provided in 'net-uuid'");
+        }
+
+        xpc_dictionary_set_uuid(
+            if_desc,
+            vmnet_network_identifier_key,
+            hs->network_uuid.data
+        );
+    }
+#endif /* CONFIG_VMNET_11_0_API */
+
+    if (options->has_start_address ||
+        options->has_end_address ||
+        options->has_subnet_mask) {
+
+        if (options->has_start_address &&
+            options->has_end_address &&
+            options->has_subnet_mask) {
+
+            xpc_dictionary_set_string(if_desc,
+                                      vmnet_start_address_key,
+                                      options->start_address);
+            xpc_dictionary_set_string(if_desc,
+                                      vmnet_end_address_key,
+                                      options->end_address);
+            xpc_dictionary_set_string(if_desc,
+                                      vmnet_subnet_mask_key,
+                                      options->subnet_mask);
+        } else {
+            error_setg(
+                errp,
+                "'start-address', 'end-address', 'subnet-mask' "
+                "should be provided together"
+            );
+        }
+    }
+
+    return if_desc;
+}
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
+    if_desc = create_if_desc(netdev, nc, errp);
+    return vmnet_if_create(nc, if_desc, errp, NULL);
 }
-- 
2.23.0



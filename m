Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B6848757B
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 11:28:08 +0100 (CET)
Received: from localhost ([::1]:33218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5mTf-0002BK-6B
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 05:28:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1n5mMm-0001rI-UJ
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 05:21:01 -0500
Received: from [2a00:1450:4864:20::12a] (port=37454
 helo=mail-lf1-x12a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1n5mMl-0001e4-FW
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 05:21:00 -0500
Received: by mail-lf1-x12a.google.com with SMTP id h7so13899447lfu.4
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 02:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jtMW004Au7CrDB93vS6nalJFyRXcqbDatoHFcN9NphY=;
 b=kTfakbJ2NrHJzyCkZ0GN1FJs4krvxK+c+13AgcVRu3u6JG5WAm1zsw0PKPCdQWwT+A
 0jrJ6tKAdd8jYJQ43FEfuOP1hWKW9U5DEN+Cao13PUedPP/oozwt2IoB4tbJMdALCN7v
 j0b8WMsaoo1PPrBMsoMz2AJAa4eoa+Qu5UehZ7jhKCLzVmu2saJLPKfu8auZT2E0Gls9
 H3Vv8vc+cDCdKs1ZXyUORK7HBtycU2PEGoJHpFEsIbRwUXyO4BhdSttMeB8JoEMWsx6E
 7JTEIFxs7o+xLDqAqnmPL8iTLQxbp18iM7M3so47pZJiGZH3v4SvGdbG/hWl5gBsRPpw
 8nyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jtMW004Au7CrDB93vS6nalJFyRXcqbDatoHFcN9NphY=;
 b=E+WeFywrz9lycnoHJkrdeG5GSLh4Ndvhx+ezX1qEk+/q6yEBV0tFzBtHnUJW/TEkSq
 s6q9f43YzCHrw5JbJbk4tzOkQ1bSsy0wmmdU0klS9XVbc+J08cIh6SVlXqNiBmurZBz8
 SMYUWS6ULAvKpUIIQSuYVJoqVCNE/GKhA/LVJQji5Gn0EnKbJU1cqOLvR86ILJu0F3Ib
 t7r/u5pHBiHpq+NrFmYGrrALF/APnCo2iQsoYpEUHm1eQxT2PXzQ9uoOuEjyAIHRhw2r
 jOrFJNywvDGZN80zDzTFIGRKSNav16ifKCqDkKxg4lPaqWAZINBx55NuXFgopKW1Vsh8
 XBEQ==
X-Gm-Message-State: AOAM530EPzlksipd0wbRqEcsYqW1O7aDvnxq6sx23AcwQQSBLv2fJUSj
 qzU07aAlld8YtSHEADdvNkTj9mJfNsI=
X-Google-Smtp-Source: ABdhPJyGEzAEg1bwmE9ZggXKf9OM4r8D4T6lsZD9LRTlRKDmxj2gxGEVi6OpPtDAnyWjABn+r7CXVg==
X-Received: by 2002:a19:8c54:: with SMTP id i20mr53668546lfj.565.1641550857307; 
 Fri, 07 Jan 2022 02:20:57 -0800 (PST)
Received: from localhost.localdomain ([62.140.238.4])
 by smtp.gmail.com with ESMTPSA id p15sm524259lfd.69.2022.01.07.02.20.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 07 Jan 2022 02:20:56 -0800 (PST)
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 4/7] net/vmnet: implement host mode (vmnet-host)
Date: Fri,  7 Jan 2022 13:20:16 +0300
Message-Id: <20220107102019.37013-5-yaroshchuk2000@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20220107102019.37013-1-yaroshchuk2000@gmail.com>
References: <20220107102019.37013-1-yaroshchuk2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-lf1-x12a.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 net/vmnet-host.c | 93 ++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 87 insertions(+), 6 deletions(-)

diff --git a/net/vmnet-host.c b/net/vmnet-host.c
index 4a5ef99dc7..9c2e760ed1 100644
--- a/net/vmnet-host.c
+++ b/net/vmnet-host.c
@@ -9,16 +9,97 @@
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
+    VmnetCommonState *cs = DO_UPCAST(VmnetCommonState, nc, nc);
+    VmnetHostState *hs = DO_UPCAST(VmnetHostState, cs, cs);
+
+    xpc_object_t if_desc = xpc_dictionary_create(NULL, NULL, 0);
+
+    xpc_dictionary_set_uint64(
+        if_desc,
+        vmnet_operation_mode_key,
+        VMNET_HOST_MODE
+    );
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
+                "'start-address', 'end-address', 'subnet_mask' "
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



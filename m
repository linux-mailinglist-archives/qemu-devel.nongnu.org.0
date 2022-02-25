Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 259F14C4C32
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 18:33:33 +0100 (CET)
Received: from localhost ([::1]:49408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNeTD-0001gD-7u
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 12:33:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vladislav.yaroshchuk@jetbrains.com>)
 id 1nNeAc-0007ID-HO
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 12:14:18 -0500
Received: from [2a00:1450:4864:20::12d] (port=44899
 helo=mail-lf1-x12d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vladislav.yaroshchuk@jetbrains.com>)
 id 1nNeAZ-0000SZ-2T
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 12:14:18 -0500
Received: by mail-lf1-x12d.google.com with SMTP id j15so10482479lfe.11
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 09:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jetbrains.com; s=googleapps;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5ajCMN7Hf38FdTOUp33VX671rn7l1LNMVvJ339CBG5c=;
 b=dGenMnmdPOO8mih1bd/45PesGYWFlX1x0pw1xIEciAinIJhpmGBAyV15LfB2Px9zU7
 4qnzVe2VZ5NFdVEf99nHd/sHpD7UmSTgk17ZAF+HYGeUvxzihymoOmfK5MgGJnkf2p86
 Ee2Npdu+vKlZblxYBBgOZHlQvyJyyxSOJczIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5ajCMN7Hf38FdTOUp33VX671rn7l1LNMVvJ339CBG5c=;
 b=TIzjQLrDFyM0sts9Zp5X05aXfqlw932gjFyJA/UPoE8vLtYv8C5EVdvsLJ80rKY2hV
 JFvyyvCc4yPgkYKOXX5fgE5THRyq6ArGkboGSTARCNuqtMpIVkSTpjE6xzCxDjeQxLFH
 YwIyamxc2UeZWFXDEdUDDIh7prjPleV11dkR49PTe6YtbC+piUCGGA3hvAi2adosdGTh
 hAQbOFPtoPys4nd9LDJX49/C/jKiYI3eo9U/atclJtAil2yPI3hRGgXpQ+ch3mdenNp5
 4PMYW3SIS+pxvJ6qHKNNheWxL+JQpXHjLAmBqzGEHdf6NX06uLUzC3VFbtTNPN3N6PQl
 fZAQ==
X-Gm-Message-State: AOAM530FIM5IXaGMryOmLjsIT1CqCfqhloGnS7ZydCJn/61PdmAwE+EC
 5IdT2cOCcr3p/tjvtU+c38imdeUFHf9oTQ==
X-Google-Smtp-Source: ABdhPJz1a+YtwKdrCF6j+DQKm3Wr0XuiJ/FoKY3Q05Hzd3s7ddvDkwqoTEPvLIHRZgEjlp8gz/1jTA==
X-Received: by 2002:a05:6512:1103:b0:443:31e0:508c with SMTP id
 l3-20020a056512110300b0044331e0508cmr5599648lfg.129.1645809252966; 
 Fri, 25 Feb 2022 09:14:12 -0800 (PST)
Received: from UNIT-808.lan ([2a02:2698:6c2a:768f:813e:378d:5c94:9b97])
 by smtp.gmail.com with ESMTPSA id
 bq5-20020a056512150500b004433c791651sm252024lfb.69.2022.02.25.09.14.12
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 25 Feb 2022 09:14:12 -0800 (PST)
From: Vladislav Yaroshchuk <vladislav.yaroshchuk@jetbrains.com>
X-Google-Original-From: Vladislav Yaroshchuk
 <Vladislav.Yaroshchuk@jetbrains.com>
To: qemu-devel@nongnu.org
Cc: jasowang@redhat.com, r.bolshakov@yadro.com, eblake@redhat.com,
 phillip.ennen@gmail.com, phillip@axleos.com, akihiko.odaki@gmail.com,
 armbru@redhat.com, hsp.cat7@gmail.com, hello@adns.io, roman@roolebo.dev,
 peter.maydell@linaro.org, dirty@apple.com, f4bug@amsat.org,
 agraf@csgraf.de, kraxel@redhat.com, alex.bennee@linaro.org,
 qemu_oss@crudebyte.com,
 Vladislav Yaroshchuk <Vladislav.Yaroshchuk@jetbrains.com>
Subject: [PATCH v15 5/8] net/vmnet: implement bridged mode (vmnet-bridged)
Date: Fri, 25 Feb 2022 20:13:59 +0300
Message-Id: <20220225171402.64861-6-Vladislav.Yaroshchuk@jetbrains.com>
X-Mailer: git-send-email 2.34.1.vfs.0.0
In-Reply-To: <20220225171402.64861-1-Vladislav.Yaroshchuk@jetbrains.com>
References: <20220225171402.64861-1-Vladislav.Yaroshchuk@jetbrains.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=vladislav.yaroshchuk@jetbrains.com;
 helo=mail-lf1-x12d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 25 Feb 2022 12:16:18 -0500
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

Signed-off-by: Vladislav Yaroshchuk <Vladislav.Yaroshchuk@jetbrains.com>
---
 net/vmnet-bridged.m | 129 ++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 124 insertions(+), 5 deletions(-)

diff --git a/net/vmnet-bridged.m b/net/vmnet-bridged.m
index c735901666..a19b10909e 100644
--- a/net/vmnet-bridged.m
+++ b/net/vmnet-bridged.m
@@ -10,16 +10,135 @@
 
 #include "qemu/osdep.h"
 #include "qapi/qapi-types-net.h"
-#include "vmnet_int.h"
-#include "clients.h"
-#include "qemu/error-report.h"
 #include "qapi/error.h"
+#include "clients.h"
+#include "vmnet_int.h"
 
 #include <vmnet/vmnet.h>
 
+typedef struct VmnetBridgedState {
+    VmnetCommonState cs;
+} VmnetBridgedState;
+
+
+static bool validate_ifname(const char *ifname)
+{
+    xpc_object_t shared_if_list = vmnet_copy_shared_interface_list();
+    bool match = false;
+    if (!xpc_array_get_count(shared_if_list)) {
+        goto done;
+    }
+
+    match = !xpc_array_apply(
+        shared_if_list,
+        ^bool(size_t index, xpc_object_t value) {
+            return strcmp(xpc_string_get_string_ptr(value), ifname) != 0;
+        });
+
+done:
+    xpc_release(shared_if_list);
+    return match;
+}
+
+
+static bool get_valid_ifnames(char *output_buf)
+{
+    xpc_object_t shared_if_list = vmnet_copy_shared_interface_list();
+    __block const char *ifname = NULL;
+    __block int str_offset = 0;
+    bool interfaces_available = true;
+
+    if (!xpc_array_get_count(shared_if_list)) {
+        interfaces_available = false;
+        goto done;
+    }
+
+    xpc_array_apply(
+        shared_if_list,
+        ^bool(size_t index, xpc_object_t value) {
+            /* build list of strings like "en0 en1 en2 " */
+            ifname = xpc_string_get_string_ptr(value);
+            strcpy(output_buf + str_offset, ifname);
+            strcpy(output_buf + str_offset + strlen(ifname), " ");
+            str_offset += strlen(ifname) + 1;
+            return true;
+        });
+
+done:
+    xpc_release(shared_if_list);
+    return interfaces_available;
+}
+
+static bool validate_options(const Netdev *netdev, Error **errp)
+{
+    const NetdevVmnetBridgedOptions *options = &(netdev->u.vmnet_bridged);
+    char ifnames[256];
+
+    if (!validate_ifname(options->ifname)) {
+        if (get_valid_ifnames(ifnames)) {
+            error_setg(errp,
+                       "unsupported ifname '%s', expected one of [ %s]",
+                       options->ifname,
+                       ifnames);
+            return false;
+        }
+        error_setg(errp,
+                   "unsupported ifname '%s', no supported "
+                   "interfaces available",
+                   options->ifname);
+        return false;
+    }
+
+#if !defined(MAC_OS_VERSION_11_0) || \
+    MAC_OS_X_VERSION_MIN_REQUIRED < MAC_OS_VERSION_11_0
+    if (options->has_isolated) {
+        error_setg(errp,
+                   "vmnet-bridged.isolated feature is "
+                   "unavailable: outdated vmnet.framework API");
+        return false;
+    }
+#endif
+    return true;
+}
+
+static xpc_object_t build_if_desc(const Netdev *netdev)
+{
+    const NetdevVmnetBridgedOptions *options = &(netdev->u.vmnet_bridged);
+    xpc_object_t if_desc = xpc_dictionary_create(NULL, NULL, 0);
+
+    xpc_dictionary_set_uint64(if_desc,
+                              vmnet_operation_mode_key,
+                              VMNET_BRIDGED_MODE
+    );
+
+    xpc_dictionary_set_string(if_desc,
+                              vmnet_shared_interface_name_key,
+                              options->ifname);
+
+#if defined(MAC_OS_VERSION_11_0) && \
+    MAC_OS_X_VERSION_MIN_REQUIRED >= MAC_OS_VERSION_11_0
+    xpc_dictionary_set_bool(if_desc,
+                            vmnet_enable_isolation_key,
+                            options->isolated);
+#endif
+    return if_desc;
+}
+
+static NetClientInfo net_vmnet_bridged_info = {
+    .type = NET_CLIENT_DRIVER_VMNET_BRIDGED,
+    .size = sizeof(VmnetBridgedState),
+    .receive = vmnet_receive_common,
+    .cleanup = vmnet_cleanup_common,
+};
+
+
 int net_init_vmnet_bridged(const Netdev *netdev, const char *name,
                            NetClientState *peer, Error **errp)
 {
-  error_setg(errp, "vmnet-bridged is not implemented yet");
-  return -1;
+    NetClientState *nc = qemu_new_net_client(&net_vmnet_bridged_info,
+                                             peer, "vmnet-bridged", name);
+    if (!validate_options(netdev, errp)) {
+        g_assert_not_reached();
+    }
+    return vmnet_if_create(nc, build_if_desc(netdev), errp);
 }
-- 
2.34.1.vfs.0.0



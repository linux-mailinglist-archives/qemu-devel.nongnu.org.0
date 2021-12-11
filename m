Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFCC471367
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Dec 2021 11:46:48 +0100 (CET)
Received: from localhost ([::1]:39730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvztv-0003CJ-Cx
	for lists+qemu-devel@lfdr.de; Sat, 11 Dec 2021 05:46:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1mvzrk-0000tv-1J
 for qemu-devel@nongnu.org; Sat, 11 Dec 2021 05:44:32 -0500
Received: from [2a00:1450:4864:20::22d] (port=35568
 helo=mail-lj1-x22d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1mvzrh-00083q-Rx
 for qemu-devel@nongnu.org; Sat, 11 Dec 2021 05:44:31 -0500
Received: by mail-lj1-x22d.google.com with SMTP id l7so17126416lja.2
 for <qemu-devel@nongnu.org>; Sat, 11 Dec 2021 02:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vlN7d0rtidqdQWLCIgN5N1fcLK+0qLzuCPNMY3+d1oo=;
 b=BANcUhjcammP13zRdC9Z/2pX43TL1aMHUqJ/gv5HQeIxp2eqFweajp+D7fddVF+Emo
 3BaowWOFwg5g5wI/QueBr4uDf4vc5H7El1zvdmDECV+AD5aWCF4ILst0mnA/5cF+gwpa
 vkchmazigErDa49Otb79V/y3CeDYdCQjOr/h7NP34RotouUkIfY8LNKTshDnW6feIbkR
 j26a6bd1x2JI8W0DLwIRTJA4gDraPj9x3lR0jcOLan2fUYW9J+yinrD1eLXaYpqEhVPX
 wlDTeMl2SBFxsbo21/uHYoUgxRYz6PXfajdirBdj/xeh4foo9NQgp5TABD8RoAHmAxJy
 GKzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vlN7d0rtidqdQWLCIgN5N1fcLK+0qLzuCPNMY3+d1oo=;
 b=KFVPDGWze3exCU9IWPF/N5x1kKdBQCjMSBiyunFthRY79N2yvD1mS6IQGO+yntfcyB
 oewjgEaH5ege4BRTd0zQzRKt7wrEpGqEyR206/BJsIMYvub7eGLvAoHGF5cVB2iGoB5O
 o4TozJJ6Sm6VT61Cp9si+ukyYbB4o7jxUO+4bIDxXM6mEUvDzgfOwX0xg6/Mnh3L5hms
 9HqaOkFVVYpXpxF40XmZFmnlCuoKIKQEIDYYPcIrJouf+FOV9zkoM322jM0LaiiAq1wP
 sJLrPs2QLlyqH5rDb9t2cr8lJKRYWiYoBquzP3/HQImFA7mf0ZsGAIK1AFkX6KhT3n3S
 cANA==
X-Gm-Message-State: AOAM531MfS60fPVjmV3V/Ws61y+dkF78Q0gXmGC/AzaPNPSLZzf6KfcP
 a5k/D4RWzYQAhli9kg5jzzLmtHGuDoA=
X-Google-Smtp-Source: ABdhPJx9Dl0UYdBvpX3xV85/DnD2cr6Aompw6/OM1fc5Wkr6TDhZuM8D/g5UMXTxiTk/yQEmHyz15A==
X-Received: by 2002:a05:651c:549:: with SMTP id
 q9mr18425855ljp.25.1639219468085; 
 Sat, 11 Dec 2021 02:44:28 -0800 (PST)
Received: from UNIT-808.lan ([2a02:2698:6c2a:abdc:fce0:e51a:d86:d956])
 by smtp.gmail.com with ESMTPSA id h22sm581971lfc.137.2021.12.11.02.44.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 11 Dec 2021 02:44:27 -0800 (PST)
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 5/7] net/vmnet: implement bridged mode (vmnet-bridged)
Date: Sat, 11 Dec 2021 13:44:11 +0300
Message-Id: <20211211104413.50524-6-yaroshchuk2000@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211211104413.50524-1-yaroshchuk2000@gmail.com>
References: <20211211104413.50524-1-yaroshchuk2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::22d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::22d;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-lj1-x22d.google.com
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
 net/vmnet-bridged.m | 98 ++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 92 insertions(+), 6 deletions(-)

diff --git a/net/vmnet-bridged.m b/net/vmnet-bridged.m
index 4e42a90391..3c9da9dc8b 100644
--- a/net/vmnet-bridged.m
+++ b/net/vmnet-bridged.m
@@ -10,16 +10,102 @@
 
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
+  VmnetCommonState cs;
+} VmnetBridgedState;
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
+}
+
+static xpc_object_t create_if_desc(const Netdev *netdev, Error **errp)
+{
+    const NetdevVmnetBridgedOptions *options = &(netdev->u.vmnet_bridged);
+    xpc_object_t if_desc = xpc_dictionary_create(NULL, NULL, 0);
+
+    xpc_dictionary_set_uint64(
+        if_desc,
+        vmnet_operation_mode_key,
+        VMNET_BRIDGED_MODE
+    );
+
+    xpc_dictionary_set_bool(
+        if_desc,
+        vmnet_enable_isolation_key,
+        options->isolated
+    );
+
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
+static NetClientInfo net_vmnet_bridged_info = {
+    .type = NET_CLIENT_DRIVER_VMNET_BRIDGED,
+    .size = sizeof(VmnetBridgedState),
+    .receive = vmnet_receive_common,
+    .cleanup = vmnet_cleanup_common,
+};
+
 int net_init_vmnet_bridged(const Netdev *netdev, const char *name,
                            NetClientState *peer, Error **errp)
 {
-  error_setg(errp, "vmnet-bridged is not implemented yet");
-  return -1;
-}
+    NetClientState *nc = qemu_new_net_client(&net_vmnet_bridged_info,
+                                             peer, "vmnet-bridged", name);
+    xpc_object_t if_desc = create_if_desc(netdev, errp);;
+
+    if (!if_desc) {
+        error_setg(errp,
+                   "unsupported ifname, should be one of: %s",
+                   get_valid_ifnames());
+        return -1;
+    }
+
+    return vmnet_if_create(nc, if_desc, errp, NULL);
+}
\ No newline at end of file
-- 
2.23.0



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F2A6F2F2D
	for <lists+qemu-devel@lfdr.de>; Mon,  1 May 2023 09:41:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptO8Q-00054L-3E; Mon, 01 May 2023 03:39:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1ptO8H-00053g-Vg
 for qemu-devel@nongnu.org; Mon, 01 May 2023 03:39:41 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1ptO8F-0004lf-Vs
 for qemu-devel@nongnu.org; Mon, 01 May 2023 03:39:37 -0400
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-957dbae98b4so336249066b.1
 for <qemu-devel@nongnu.org>; Mon, 01 May 2023 00:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682926774; x=1685518774;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=33AS8B1IZS6Hdu8UrCY4VxYkqsKGt4JXdzeanvC1mog=;
 b=0rB9pj96fe+Q8xHhNuxZg+SfX3MZKtOvjT0u/Hs0kMdeNcvUtPCwOUWnZ/HkcBdRik
 H+LkWfOkAWCVqoUO/JY6q73Zck0nrkysuXs6n3RmOIcD/W9duZFaxgsfJZFb0aaqaLs1
 eQhP2UiZvzs9XeJg6Wh9W41I/SLvep985M5hKR14x8CJTJZhE3nbx5/rxVAPCyInyT/d
 M3x7DvOOhX2UCMO6LLYWu74hIPnTOO+NJh815QW/T1B5c3JY2hFi5DZ2UAYEXxBB9ozz
 3oakdwFUhB0kBf2wOlTmk+rZEwhb9TqLIoFcR+WYj/FaDhumFGKOq0u4ZzjcqIE0adOD
 WhAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682926774; x=1685518774;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=33AS8B1IZS6Hdu8UrCY4VxYkqsKGt4JXdzeanvC1mog=;
 b=Z7F/qplJgFv5OcYjaYI2X1aO90fJ/sXVb8u7xGWbmH3p3j0xKdivkNDfPdIF2HtPWw
 V10uoqttRNd8tVGlktsVT9fbXzva1ANsocvtUT8KIFsM7s/GWZlJsnYoOus4G6U2WaG0
 /3iBRMMcxSZPN5oscKb2lIQFF0W7gBup+XuU5GJ64EVMdZyZxWSq6Uq0d4sjwRd2foKX
 VfuKceKSUd0ge+o1SWRkyigRwdmxSvevj/2Y/BudVvXBftN6yV1eQdAlo1w4/w3G5JOl
 5/cOe8oIzFoFL44a2LakvG7EvpS2VJ4RTeHi9+Z6LXhDMwk9b4+NbKSdTewxBGT7YW5G
 QbCA==
X-Gm-Message-State: AC+VfDxl4GfjBc7CzcQav4KVmULSPkXoS4DAfp5xBGhBlU9RyVcyIgQs
 k3V10mvMhDw8MCglChXw4fZWCg==
X-Google-Smtp-Source: ACHHUZ6eJGc3hpIAOt9YJvWBj9F5RZnvGuPiCmx8gAn+PX3yObErca6znGVJfr39Cto9ggPMkao/Tg==
X-Received: by 2002:a17:907:9482:b0:94e:ed5d:c864 with SMTP id
 dm2-20020a170907948200b0094eed5dc864mr11456661ejc.19.1682926774575; 
 Mon, 01 May 2023 00:39:34 -0700 (PDT)
Received: from localhost.localdomain (178-133-125-224.mobile.vf-ua.net.
 [178.133.125.224]) by smtp.gmail.com with ESMTPSA id
 d21-20020aa7c1d5000000b005027d31615dsm11708182edp.62.2023.05.01.00.39.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 May 2023 00:39:34 -0700 (PDT)
From: Andrew Melnychenko <andrew@daynix.com>
To: jasowang@redhat.com, mst@redhat.com, armbru@redhat.com, eblake@redhat.com,
 qemu-devel@nongnu.org, berrange@redhat.com
Cc: yuri.benditovich@daynix.com,
	yan@daynix.com
Subject: [PATCH 4/5] qmp: Added new command to retrieve eBPF blob.
Date: Mon,  1 May 2023 10:21:00 +0300
Message-Id: <20230501072101.22890-5-andrew@daynix.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230501072101.22890-1-andrew@daynix.com>
References: <20230501072101.22890-1-andrew@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::62a;
 envelope-from=andrew@daynix.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Added command "request-ebpf". This command returns
eBPF program encoded base64. The program taken from the
skeleton and essentially is an ELF object that can be
loaded in the future with libbpf.

Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
---
 monitor/qmp-cmds.c | 16 ++++++++++++++++
 qapi/misc.json     | 28 ++++++++++++++++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index b0f948d3376..f7641bb55b9 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -32,6 +32,7 @@
 #include "hw/mem/memory-device.h"
 #include "hw/intc/intc.h"
 #include "hw/rdma/rdma.h"
+#include "ebpf/ebpf.h"
 
 NameInfo *qmp_query_name(Error **errp)
 {
@@ -209,3 +210,18 @@ static void __attribute__((__constructor__)) monitor_init_qmp_commands(void)
                          qmp_marshal_qmp_capabilities,
                          QCO_ALLOW_PRECONFIG, 0);
 }
+
+EbpfObject *qmp_request_ebpf(const char *id, Error **errp)
+{
+    EbpfObject *ret = NULL;
+    size_t size = 0;
+    const void *data = ebpf_find_binary_by_id(id, &size, errp);
+    if (!data) {
+        return NULL;
+    }
+
+    ret = g_new0(EbpfObject, 1);
+    ret->object = g_base64_encode(data, size);
+
+    return ret;
+}
diff --git a/qapi/misc.json b/qapi/misc.json
index 6ddd16ea283..81613fd1b13 100644
--- a/qapi/misc.json
+++ b/qapi/misc.json
@@ -618,3 +618,31 @@
 { 'event': 'VFU_CLIENT_HANGUP',
   'data': { 'vfu-id': 'str', 'vfu-qom-path': 'str',
             'dev-id': 'str', 'dev-qom-path': 'str' } }
+
+##
+# @EbpfObject:
+#
+# Structure that holds eBPF ELF object encoded in base64.
+#
+# Since: 8.1
+#
+##
+{ 'struct': 'EbpfObject',
+  'data': {'object': 'str'} }
+
+##
+# @request-ebpf:
+#
+# Function returns eBPF object that can be loaded with libbpf.
+# Management applications (g.e. libvirt) may load it and pass file
+# descriptors to QEMU. Which allows running QEMU without BPF capabilities.
+#
+# Returns: RSS eBPF object encoded in base64.
+#
+# Since: 8.1
+#
+##
+{ 'command': 'request-ebpf',
+  'data': { 'id': 'str' },
+  'returns': 'EbpfObject' }
+
-- 
2.39.1



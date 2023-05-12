Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD13F70085E
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 14:48:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxSBz-0003Jz-Ve; Fri, 12 May 2023 08:48:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1pxSBn-0003E5-Sh
 for qemu-devel@nongnu.org; Fri, 12 May 2023 08:48:04 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1pxSBm-0000M4-9d
 for qemu-devel@nongnu.org; Fri, 12 May 2023 08:48:03 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-50bdd7b229cso17860053a12.0
 for <qemu-devel@nongnu.org>; Fri, 12 May 2023 05:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1683895680; x=1686487680;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XG0HWV4Ioti9VxfOxsft6M5zdqbu1B1VtJC36fscMnE=;
 b=Kwrn5HUv2UPujh+Cc8Q9x1JTzFAG2q38ZNH3f8ZXjMHvAvNL67FCfm3fo5u2qlvNMC
 Dk9cYem1tcc3vZXnewwRQ25S2kwrtUq149KQ7OjXBumZVe0vc9vNsndCfh9pPz5ewrF+
 KwxUhOuaGqHhThZ6syJ7WqdpfnEkDRbmwz8XeVBdmbww098dkbSlfI3Qj+LboLjVj8aI
 X5wD0dVTCRbxPvd/PhMGOkj4pFPCcUwVWbHq4cbZph79p6Fe9pSXJu8BuQvi8a4A74uK
 Ymhcf399d0Ekvnva4WrLUWK+xD9a43UoKvQNlQ7IhlX5BXrz9/vxRS7fkxSYYcjPOmmR
 6CaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683895680; x=1686487680;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XG0HWV4Ioti9VxfOxsft6M5zdqbu1B1VtJC36fscMnE=;
 b=NMM9oFR3JjoC5LiQ3qJs6qb7GhGP5yGBFqBuvjt1Y8I2fQQNsWprXwXnEdAj36/GQC
 m0aU6spgH24cArwQFZ/Gpn9qNIkdWHQJ990BKxPG6D6GMu8GWuKDmWeaBWhvF5mcCAPj
 1ZW+CRyadK7hzgBtyOD0J+6NqcVPrR1Mtd4TxKhpT0Di5J+tLJh/pa3dW8jvJs+Rz7KL
 LhyHxYCWLmSssOaD66ncQT64RkivXLHbYfNJxVfz9cQbak0nFX6KoLnV+Q7gpnLD7EQv
 tXyuvfFqBQNzx1iKNpKK6WFO0YN0YIkIE2CElPKRWixN62elfWF2XnEa12B0hzECzRcj
 4Hqg==
X-Gm-Message-State: AC+VfDzAnwFPfBQw8BM04XBip/YIVQyYBTS0Sb0Y6PSOYdfpDe/FuA6Y
 /mY//Rc6fbzL9xHMF1MyJcPd0KBqqoEicx1ipNA=
X-Google-Smtp-Source: ACHHUZ5SolmUcYmNEI8n9+CTzYw7CwA9s/M0FGpmBoI9S6n6bKtNcZlFRDPN3gF5ywuzLdHhpY1ZFw==
X-Received: by 2002:a17:907:86a3:b0:96a:8e03:35b3 with SMTP id
 qa35-20020a17090786a300b0096a8e0335b3mr2834225ejc.63.1683895680552; 
 Fri, 12 May 2023 05:48:00 -0700 (PDT)
Received: from localhost.localdomain (178-133-109-64.mobile.vf-ua.net.
 [178.133.109.64]) by smtp.gmail.com with ESMTPSA id
 ze11-20020a170906ef8b00b00965b0eb7b0csm5322585ejb.103.2023.05.12.05.47.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 05:48:00 -0700 (PDT)
From: Andrew Melnychenko <andrew@daynix.com>
To: jasowang@redhat.com, mst@redhat.com, armbru@redhat.com, eblake@redhat.com,
 qemu-devel@nongnu.org, berrange@redhat.com
Cc: yuri.benditovich@daynix.com,
	yan@daynix.com
Subject: [PATCH v2 5/6] qmp: Added new command to retrieve eBPF blob.
Date: Fri, 12 May 2023 15:29:01 +0300
Message-Id: <20230512122902.34345-6-andrew@daynix.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230512122902.34345-1-andrew@daynix.com>
References: <20230512122902.34345-1-andrew@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::52d;
 envelope-from=andrew@daynix.com; helo=mail-ed1-x52d.google.com
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
 qapi/misc.json     | 38 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index b0f948d3376..259bc87ccb1 100644
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
+EbpfObject *qmp_request_ebpf(EbpfProgramID id, Error **errp)
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
index 6ddd16ea283..e96dac8482b 100644
--- a/qapi/misc.json
+++ b/qapi/misc.json
@@ -618,3 +618,41 @@
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
+# @EbpfProgramID:
+#
+# An enumeration of the eBPF programs. Currently, only RSS is presented.
+#
+# Since: 8.1
+##
+{ 'enum': 'EbpfProgramID',
+  'data': [ { 'name': 'rss', 'if': 'CONFIG_EBPF' } ] }
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
+  'data': { 'id': 'EbpfProgramID' },
+  'returns': 'EbpfObject' }
+
-- 
2.39.1



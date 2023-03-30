Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BFB76CF845
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 02:34:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phgEG-00084O-9S; Wed, 29 Mar 2023 20:33:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1phgED-00083c-Dl
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 20:33:21 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1phgEB-0004FA-U2
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 20:33:21 -0400
Received: by mail-wm1-x32a.google.com with SMTP id n19so9906917wms.0
 for <qemu-devel@nongnu.org>; Wed, 29 Mar 2023 17:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112; t=1680136398;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wrfwKePkllnALnkJ2zV/3yw/+BvIeTv0XWFEcNBw8YA=;
 b=UFwYHXN85wMtiEl7I+gKFRNJ0LNP6qYLPj4DNoGcsbomlyljv5KMzUNKLp9lc0uBNR
 Lz0XYx8Z3IdbHGpqzxZH1DcGzm//orViFbGewjo13quEgwQGUFfJrh7VCcdW/+JpPiF2
 Z00gJDe8bEmtSB0wplKFm18ed2ae9klmxZkfbQhozoIySqIg7qKQqsSv0xM693ktVxya
 lhM7TzoHDUEYQgwFUhDOosiCnT2fi5fXNmNsv6jyM3MiK/jmGAaDTpkLjV3qNOsD1i5Z
 Ss28BEkP+UvJeHp0mPmf9H3v1RX75YtSY146bKf/6HRnANVg7aVOuLVtosSv959QeU3n
 Ut9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680136398;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wrfwKePkllnALnkJ2zV/3yw/+BvIeTv0XWFEcNBw8YA=;
 b=t6U1pxtODba2lj1Kc8ckXyRTBw6Gr3XC4G7At2fJz0v2bA+Ow6HuIDWq1alg7ot8Ev
 JE3xhEfXgeha6Oz1VzBR7GqyeaOEQZe9bSOSQ+aQm1LZ0tyQn8bjjqpSnxntlU3rxcN8
 xzJzCLGK7aJLtiRwLs60cp3YTELS986ooWUegg56l3wJ1g9IDUG4seBYhi/8LEt4zz0I
 pvKy8JM/Sk/XkjEuS80QoLOWERXVfjrwufo2QiIo98/cXuh1nWQeQlCKueRJZvBE9fhw
 8DgVA2pLpumga83CAigjC/bG2iSATsqovhghZUVbee1a6S0aKCyHrgWig3wuckRI6ZdP
 4dPQ==
X-Gm-Message-State: AO0yUKVRajKjtSUvq4tyKnNpWW0C9cXLExReERzDNX2ijprnZsepUh01
 wv2cURKm2n3YeyWGnuuH38RNpQ==
X-Google-Smtp-Source: AK7set9fmPUqX5J1dOV4oQfDpKZrL6xhhnZhXgh/7LDCtSdOA203w15IMsdAY004QK818Gy/eHGzsg==
X-Received: by 2002:a05:600c:ac3:b0:3ed:af6b:7faa with SMTP id
 c3-20020a05600c0ac300b003edaf6b7faamr15800097wmr.17.1680136398491; 
 Wed, 29 Mar 2023 17:33:18 -0700 (PDT)
Received: from localhost.localdomain (178-133-100-41.mobile.vf-ua.net.
 [178.133.100.41]) by smtp.gmail.com with ESMTPSA id
 n19-20020a7bcbd3000000b003ef684c5e32sm3724480wmi.48.2023.03.29.17.33.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Mar 2023 17:33:18 -0700 (PDT)
From: Andrew Melnychenko <andrew@daynix.com>
To: jasowang@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, thuth@redhat.com,
 philmd@linaro.org, armbru@redhat.com, eblake@redhat.com,
 qemu-devel@nongnu.org, toke@redhat.com, mprivozn@redhat.com
Cc: yuri.benditovich@daynix.com,
	yan@daynix.com
Subject: [RFC PATCH 4/5] qmp: Added new command to retrieve eBPF blob.
Date: Thu, 30 Mar 2023 03:15:21 +0300
Message-Id: <20230330001522.120774-5-andrew@daynix.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230330001522.120774-1-andrew@daynix.com>
References: <20230330001522.120774-1-andrew@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::32a;
 envelope-from=andrew@daynix.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
 monitor/qmp-cmds.c | 17 +++++++++++++++++
 qapi/misc.json     | 25 +++++++++++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index b0f948d337..8f2fc3e7ec 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -32,6 +32,7 @@
 #include "hw/mem/memory-device.h"
 #include "hw/intc/intc.h"
 #include "hw/rdma/rdma.h"
+#include "ebpf/ebpf.h"
 
 NameInfo *qmp_query_name(Error **errp)
 {
@@ -209,3 +210,19 @@ static void __attribute__((__constructor__)) monitor_init_qmp_commands(void)
                          qmp_marshal_qmp_capabilities,
                          QCO_ALLOW_PRECONFIG, 0);
 }
+
+EbpfObject *qmp_request_ebpf(const char *id, Error **errp)
+{
+    EbpfObject *ret = NULL;
+    size_t size = 0;
+    const guchar *data = ebpf_find_binary_by_id(id, &size);
+
+    if (data) {
+        ret = g_new0(EbpfObject, 1);
+        ret->object = g_base64_encode(data, size);
+    } else {
+        error_setg(errp, "can't find eBPF object with id: %s", id);
+    }
+
+    return ret;
+}
diff --git a/qapi/misc.json b/qapi/misc.json
index 6ddd16ea28..4689802460 100644
--- a/qapi/misc.json
+++ b/qapi/misc.json
@@ -618,3 +618,28 @@
 { 'event': 'VFU_CLIENT_HANGUP',
   'data': { 'vfu-id': 'str', 'vfu-qom-path': 'str',
             'dev-id': 'str', 'dev-qom-path': 'str' } }
+
+##
+# @EbpfObject:
+#
+# Structure that holds eBPF ELF object encoded in base64.
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
+# Since: 7.3
+#
+##
+{ 'command': 'request-ebpf',
+  'data': { 'id': 'str' },
+  'returns': 'EbpfObject' }
+
-- 
2.39.1



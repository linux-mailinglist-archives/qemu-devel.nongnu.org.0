Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D01EA70085D
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 14:48:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxSC1-0003Ra-LJ; Fri, 12 May 2023 08:48:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1pxSBo-0003EC-8X
 for qemu-devel@nongnu.org; Fri, 12 May 2023 08:48:04 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1pxSBm-0000Ll-96
 for qemu-devel@nongnu.org; Fri, 12 May 2023 08:48:04 -0400
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-96a2b6de3cbso569027866b.1
 for <qemu-devel@nongnu.org>; Fri, 12 May 2023 05:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1683895679; x=1686487679;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=stL9JGlCPtQI67Wu05/1F0dxLYAOWDS1rmwefejHmNg=;
 b=oKh/JHcUQmcN76TdnQi8sl/JbcePItZxy1s5NXrQmA9LSemn+Is7tpZHHci9iwKeFb
 nUJOenTe3zbp3ry1dZFcS4SLkOonRYenGxLgTxc9zXjzfV1q9cUvQCZeFDrb3wLvOYWm
 WRCnB0lPfrmq2ikWlcKWoFxE+r7TZbyXo15QIz8K47cUij44ub6Sx/luaWI/mrvQGUXo
 fSMpQ3luMVNAtdAHzAoCnx/CjWkThiw5oozVT/v+ZP4DFqKokJje7yHz2MRCei8uvlgf
 4xip9tbksjwoTPnmFrUYjeUG/ZKY43OMociIrxiFddZIy86aQX0Sl80/QiVofeoq53RW
 iFyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683895679; x=1686487679;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=stL9JGlCPtQI67Wu05/1F0dxLYAOWDS1rmwefejHmNg=;
 b=Kc3b6K86yR5YrSe8MC/f5MXoDByLP4JEh1GuFNa98oCBur63DZnpkmcdw5LdQgtYAl
 zJuTTwSfNMc3fqlo1lx2pH10PN7bDQILMqhcD4SQfSd69gSbvI0oTdfLmzXO9C2sbuUL
 eDxYEPONRkPWwaIGTKYQuhAKZUuERuRTITcmiE6BN9rAsUWDwOr/eO12fdaCRwTTyMne
 lu451hKYl4+mc+BAJtPWVY0VxN61dSLKam/8Thi03xfqYFBaLcsfMFMMRUDh/+GdjDr5
 ylpp2sHNitvzUP1Z8hWOdOXLiAQpNgF0ZymG09qnhCXzyAVZ4xFmkn4ZFXR5i6qEjkcD
 imfw==
X-Gm-Message-State: AC+VfDyX0WrFWGybll1us8jihYKRA8H3h+OL3g5p2V1kkpEe7dRvw96t
 qAQCTalRJZc0+8N88qVNZFK2cg==
X-Google-Smtp-Source: ACHHUZ6bwtggQLOn+qG+Om2ffoCstB/1El0dJ6uDww2CdnubHgD0naBeusYUvx6uc5o+Ixufr/nUOw==
X-Received: by 2002:a17:907:360b:b0:94e:aa8e:b56e with SMTP id
 bk11-20020a170907360b00b0094eaa8eb56emr20427423ejc.33.1683895679046; 
 Fri, 12 May 2023 05:47:59 -0700 (PDT)
Received: from localhost.localdomain (178-133-109-64.mobile.vf-ua.net.
 [178.133.109.64]) by smtp.gmail.com with ESMTPSA id
 ze11-20020a170906ef8b00b00965b0eb7b0csm5322585ejb.103.2023.05.12.05.47.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 05:47:58 -0700 (PDT)
From: Andrew Melnychenko <andrew@daynix.com>
To: jasowang@redhat.com, mst@redhat.com, armbru@redhat.com, eblake@redhat.com,
 qemu-devel@nongnu.org, berrange@redhat.com
Cc: yuri.benditovich@daynix.com,
	yan@daynix.com
Subject: [PATCH v2 4/6] ebpf: Added declaration/initialization routines.
Date: Fri, 12 May 2023 15:29:00 +0300
Message-Id: <20230512122902.34345-5-andrew@daynix.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230512122902.34345-1-andrew@daynix.com>
References: <20230512122902.34345-1-andrew@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::629;
 envelope-from=andrew@daynix.com; helo=mail-ej1-x629.google.com
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

Now, the binary objects may be retrieved by id.
It would require for future qmp commands that may require specific
eBPF blob.

Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
---
 ebpf/ebpf.c      | 54 ++++++++++++++++++++++++++++++++++++++++++++++++
 ebpf/ebpf.h      | 31 +++++++++++++++++++++++++++
 ebpf/ebpf_rss.c  |  5 +++++
 ebpf/meson.build |  1 +
 4 files changed, 91 insertions(+)
 create mode 100644 ebpf/ebpf.c
 create mode 100644 ebpf/ebpf.h

diff --git a/ebpf/ebpf.c b/ebpf/ebpf.c
new file mode 100644
index 00000000000..8870a9b3f50
--- /dev/null
+++ b/ebpf/ebpf.c
@@ -0,0 +1,54 @@
+/*
+ * QEMU eBPF binary declaration routine.
+ *
+ * Developed by Daynix Computing LTD (http://www.daynix.com)
+ *
+ * Authors:
+ *  Andrew Melnychenko <andrew@daynix.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or
+ * later.  See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/queue.h"
+#include "qapi/error.h"
+#include "ebpf/ebpf.h"
+
+struct ElfBinaryDataEntry {
+    int id;
+    const void *data;
+    size_t datalen;
+
+    QSLIST_ENTRY(ElfBinaryDataEntry) node;
+};
+
+static QSLIST_HEAD(, ElfBinaryDataEntry) ebpf_elf_obj_list =
+                                            QSLIST_HEAD_INITIALIZER();
+
+void ebpf_register_binary_data(int id, const void *data, size_t datalen)
+{
+    struct ElfBinaryDataEntry *dataentry = NULL;
+
+    dataentry = g_new0(struct ElfBinaryDataEntry, 1);
+    dataentry->data = data;
+    dataentry->datalen = datalen;
+    dataentry->id = id;
+
+    QSLIST_INSERT_HEAD(&ebpf_elf_obj_list, dataentry, node);
+}
+
+const void *ebpf_find_binary_by_id(int id, size_t *sz, Error **errp)
+{
+    struct ElfBinaryDataEntry *it = NULL;
+    QSLIST_FOREACH(it, &ebpf_elf_obj_list, node) {
+        if (id == it->id) {
+            *sz = it->datalen;
+            return it->data;
+        }
+    }
+
+    error_setg(errp, "can't find eBPF object with id: %d", id);
+
+    return NULL;
+}
diff --git a/ebpf/ebpf.h b/ebpf/ebpf.h
new file mode 100644
index 00000000000..b6266b28b8c
--- /dev/null
+++ b/ebpf/ebpf.h
@@ -0,0 +1,31 @@
+/*
+ * QEMU eBPF binary declaration routine.
+ *
+ * Developed by Daynix Computing LTD (http://www.daynix.com)
+ *
+ * Authors:
+ *  Andrew Melnychenko <andrew@daynix.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or
+ * later.  See the COPYING file in the top-level directory.
+ */
+
+#ifndef EBPF_H
+#define EBPF_H
+
+struct Error;
+
+void ebpf_register_binary_data(int id, const void *data,
+                               size_t datalen);
+const void *ebpf_find_binary_by_id(int id, size_t *sz,
+                                   struct Error **errp);
+
+#define ebpf_binary_init(id, fn)                                           \
+static void __attribute__((constructor)) ebpf_binary_init_ ## fn(void)     \
+{                                                                          \
+    size_t datalen = 0;                                                    \
+    const void *data = fn(&datalen);                                       \
+    ebpf_register_binary_data(id, data, datalen);                          \
+}
+
+#endif /* EBPF_H */
diff --git a/ebpf/ebpf_rss.c b/ebpf/ebpf_rss.c
index 24bc6cc409e..213a8ac79ad 100644
--- a/ebpf/ebpf_rss.c
+++ b/ebpf/ebpf_rss.c
@@ -13,6 +13,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/error-report.h"
+#include "qapi/qapi-types-misc.h"
 
 #include <bpf/libbpf.h>
 #include <bpf/bpf.h>
@@ -21,6 +22,8 @@
 
 #include "ebpf/ebpf_rss.h"
 #include "ebpf/rss.bpf.skeleton.h"
+#include "ebpf/ebpf.h"
+
 #include "trace.h"
 
 void ebpf_rss_init(struct EBPFRSSContext *ctx)
@@ -261,3 +264,5 @@ void ebpf_rss_unload(struct EBPFRSSContext *ctx)
     ctx->map_toeplitz_key = -1;
     ctx->map_indirections_table = -1;
 }
+
+ebpf_binary_init(EBPF_PROGRAMID_RSS, rss_bpf__elf_bytes)
diff --git a/ebpf/meson.build b/ebpf/meson.build
index 2dd0fd89480..67c3f53aa9d 100644
--- a/ebpf/meson.build
+++ b/ebpf/meson.build
@@ -1 +1,2 @@
+softmmu_ss.add(files('ebpf.c'))
 softmmu_ss.add(when: libbpf, if_true: files('ebpf_rss.c'), if_false: files('ebpf_rss-stub.c'))
-- 
2.39.1



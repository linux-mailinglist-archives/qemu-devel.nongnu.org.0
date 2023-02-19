Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C14869C15A
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Feb 2023 17:39:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pTmhf-0006QH-4L; Sun, 19 Feb 2023 11:38:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1pTmhc-0006PP-PJ
 for qemu-devel@nongnu.org; Sun, 19 Feb 2023 11:38:16 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1pTmha-0006n4-Qt
 for qemu-devel@nongnu.org; Sun, 19 Feb 2023 11:38:16 -0500
Received: by mail-ed1-x52f.google.com with SMTP id er22so3215957edb.4
 for <qemu-devel@nongnu.org>; Sun, 19 Feb 2023 08:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lVsMk5ChWyGsUbCE/J8puVv+yoyoDMi0ZC6FtH8BaZc=;
 b=PS9oxCc4GqQKGaKnReRr8kPCauzvsH2lIR/IVoSWsezzwXIDd0wDNO9seQ9luXQZqH
 9gkJB8/iKhoj6c0VNGeHvFI26ZLvPTqTzZZ07vu+2ZhFY2a32xbY55dx+5lmprgzDeNH
 nTAUEoa0H7zBckxoN8sZJKRxnCgnBFXjVuHtKAKPh6RUuWYGyd1S+1dGVmwQhNzktTAh
 TBGZSC/MHE9+rqTIe30+bXgZx1xkffL9F0OP0NoVBGqf0b2q/KcpdkUwdu4PMQa0+lDi
 e8ELCZsvBhbeEYpfyKBC5j725+SUNuQrsBEsvQ2W8b/XjDlndkdbBmtD3c2LRGXyMRko
 H2nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lVsMk5ChWyGsUbCE/J8puVv+yoyoDMi0ZC6FtH8BaZc=;
 b=bvsdXo2eeBH6KdDMKedCwoHalXlL78a+l6vCdRTlQ9GLFQUWu9cabU4pqxL83QHACW
 EPiZVIBSEMR8vcCHJ8ko/Q5LdyBf3ULni3n/fDXrzm+lj/2U5EENpxkreIsnEFfG/CEV
 2dnIUu0/ByKhVpp1oDyl5Dx0qCaJuD22faAPP55xETDM19q5+rB3hL5DdQXkRUk5S0rf
 oYkbdavHmjI42gqSxG3s8VwZrnQ3bZORC0C5+hwyUpN1JajvsQ4z2FznctI6DgEcF/77
 SUnZrn1JrY+BjaMLK62mxxlV2VKSEtMF+yHCQkxfvLn9GL0bmFXoDdE0yI6wIQjVPJpm
 s2hQ==
X-Gm-Message-State: AO0yUKX5mDTug3guXj9QpWZswECiD9weDM90nu9s6RWf+CRZc96Ipmr2
 VbtVMTveeHs++TCb3YF6J6tKug==
X-Google-Smtp-Source: AK7set/gdKPwFU3JS/V4Pm8VQLBTSn3jnmQX1iRWcIiCxe4lZFIUNwbnP04ifPJM1C74mO4mHoW0Qw==
X-Received: by 2002:a17:906:af18:b0:88a:8e57:f063 with SMTP id
 lx24-20020a170906af1800b0088a8e57f063mr9134921ejb.62.1676824693622; 
 Sun, 19 Feb 2023 08:38:13 -0800 (PST)
Received: from localhost.localdomain ([193.33.38.48])
 by smtp.gmail.com with ESMTPSA id
 l13-20020a1709066b8d00b008cdb0628991sm647516ejr.57.2023.02.19.08.38.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Feb 2023 08:38:12 -0800 (PST)
From: Andrew Melnychenko <andrew@daynix.com>
To: jasowang@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, thuth@redhat.com,
 philmd@linaro.org, armbru@redhat.com, eblake@redhat.com,
 qemu-devel@nongnu.org, toke@redhat.com, mprivozn@redhat.com
Cc: yuri.benditovich@daynix.com,
	yan@daynix.com
Subject: [PATCH 5/5] qmp: Added find-ebpf-rss-helper command.
Date: Sun, 19 Feb 2023 18:21:00 +0200
Message-Id: <20230219162100.174318-6-andrew@daynix.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230219162100.174318-1-andrew@daynix.com>
References: <20230219162100.174318-1-andrew@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::52f;
 envelope-from=andrew@daynix.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: 14
X-Spam_score: 1.4
X-Spam_bar: +
X-Spam_report: (1.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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

New qmp command to query ebpf helper.
It's crucial that QEMU and helper are in sync.
Technically helper should pass eBPF fds that QEMU may accept.
And different QEMU's builds may have different eBPF programs.
QEMU returns helper that should "fit" to virtio-net.
QEMU would check the stamp of the helper to make sure
that eBPF program is valid.

Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
---
 monitor/qmp-cmds.c | 28 ++++++++++++++++++++++++++++
 qapi/misc.json     | 42 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 70 insertions(+)

diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index 859012aef4..2f91c34bbb 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -31,6 +31,7 @@
 #include "hw/mem/memory-device.h"
 #include "hw/intc/intc.h"
 #include "hw/rdma/rdma.h"
+#include "qemu-ebpf-rss-helper-stamp-utils.h"
 
 NameInfo *qmp_query_name(Error **errp)
 {
@@ -202,3 +203,30 @@ static void __attribute__((__constructor__)) monitor_init_qmp_commands(void)
                          qmp_marshal_qmp_capabilities,
                          QCO_ALLOW_PRECONFIG, 0);
 }
+
+HelperPath *qmp_find_ebpf_rss_helper(bool has_path,
+                                     strList *path, Error **errp)
+{
+    HelperPath *ret = NULL;
+    char *helperbin = NULL;
+
+    /* Look for helper in the suggested pathes */
+    if (has_path) {
+        strList *str_list = NULL;
+        for (str_list = path;
+             str_list && !helperbin;
+             str_list = str_list->next) {
+            helperbin = qemu_check_suggested_ebpf_rss_helper(str_list->value);
+        }
+    }
+
+    if (helperbin == NULL) {
+        helperbin = qemu_find_default_ebpf_rss_helper();
+    }
+
+    if (helperbin) {
+        ret = g_new0(HelperPath, 1);
+        ret->path = helperbin;
+    }
+    return ret;
+}
diff --git a/qapi/misc.json b/qapi/misc.json
index 27ef5a2b20..1dfb3c132e 100644
--- a/qapi/misc.json
+++ b/qapi/misc.json
@@ -584,3 +584,45 @@
 { 'event': 'VFU_CLIENT_HANGUP',
   'data': { 'vfu-id': 'str', 'vfu-qom-path': 'str',
             'dev-id': 'str', 'dev-qom-path': 'str' } }
+
+##
+# @HelperPath:
+#
+# Name of the helper and binary location.
+##
+{ 'struct': 'HelperPath',
+  'data': {'path': 'str'} }
+
+##
+# @find-ebpf-rss-helper:
+#
+# Query helper paths to find qemu-ebpf-rss-helper.
+# The qemu would check "the stamp" and
+# returns the proper helper.
+# It's possible to provide paths where to look for a helper.
+# If the path is provided to a file - qemu would check the file for the stamp.
+# If the path is provided to a directory - qemu would look for
+# a file "qemu-ebpf-rss-helper" and check its stamp.
+#
+# Returns: path to the helper with a valid stamp.
+#
+# Note: Provided path arguments have the highest priority where to look
+#       for a helper. Then, default "helper directory" and then
+#       near the qemu binary.
+#
+# Since: 7.2
+#
+# Example:
+#
+# -> { "execute": "find-ebpf-rss-helper", "arguments": { "path": "/opt/qemu_helpers/" } }
+# <- { "return": [
+#        {
+#          "path": "/usr/local/libexec/qemu-ebpf-rss-helper"
+#        }
+#      ]
+#    }
+#
+##
+{ 'command': 'find-ebpf-rss-helper',
+  'data': {'*path': ['str']},
+  'returns': 'HelperPath' }
-- 
2.39.1



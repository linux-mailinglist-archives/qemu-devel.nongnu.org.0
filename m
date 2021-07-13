Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6443C7371
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 17:41:27 +0200 (CEST)
Received: from localhost ([::1]:55590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3KXG-0007iy-IK
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 11:41:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1m3KU6-0001tx-Pk
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 11:38:10 -0400
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e]:38479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1m3KU5-0003O1-5W
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 11:38:10 -0400
Received: by mail-lf1-x12e.google.com with SMTP id q16so14787226lfa.5
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 08:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AXRaVZ81sdUkaQmM5XZhjm3TzpQKjAewwlE2hYHdDng=;
 b=UmfxdA83iBGlUh+7j9o6NY6oxLazI7B2dfvJDalvYp6lcUQqScAXk8XThurPXCz0BF
 dLm1A1lmMNiI2ivDiV8bSAsy6i+318yt1TIfW9yS6ZPaST4DL8DQZiEFSRC9bh0ot+iI
 mH2cu3DymoCzpR9K9wORGOKcvGpUUjmIFFgFwrjRxAqTbGISJj+e7gC3n8v/oByxHzVb
 ufbtxYNkc4N8RSUmjQsnRogcbMoNoFNQL+RB6hIKo0PhyeeQxjFZsqNKSrHsutzhmnRy
 1JltmHm9co7pDqoFuEum/8ID2nPkdmyZFfayqbBP9Qxjb4/wEDXxJNusXwq0KjK6KTCV
 wyjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AXRaVZ81sdUkaQmM5XZhjm3TzpQKjAewwlE2hYHdDng=;
 b=Rep+XsEe0zJWzMTBxdepV0jR1vM/XidoddZb7lBVQqljcSH23d3Tz5ULIV5krnuXGk
 Sz6XbF5LRwb/YmdK7R7x5QsGQ0xUQDWnD9Tnew5pakdw7KlFKfvSnHSNUJZjnCP/NQOQ
 Ufij5PWds5IL4TjjQRWtumMbIgh3XpkgrOSBQ5URUmv7BtnVW1qc7As9b7U3scQ+2I07
 pH6Q70X9jAchKD6zls7c6DkG6I64+ggoJv4C5KJFrkf7kJJgjjRMSLyv0L0Q8eDy3bcB
 IsRywa6aMPT8bDOKxwLERcaytSLIS+LBWOGw4DytkXz02l/62iL1g9HEQdoNXZKs44Bg
 Lj/A==
X-Gm-Message-State: AOAM533CeXPgHmv+x7wVqzN4eDS4FuwPkOqc93zlkqhN00+B3zy4qdPM
 UkoWsGBNKHto1pactMvSNP61bg==
X-Google-Smtp-Source: ABdhPJwf+lBY+EjVf1XqSQwnhRTN3oLh5WGIyjxjKoAaq8Xlu29ATagfJyfIkWRmicoOmvIBucBwgA==
X-Received: by 2002:a05:6512:b96:: with SMTP id
 b22mr4111461lfv.155.1626190687742; 
 Tue, 13 Jul 2021 08:38:07 -0700 (PDT)
Received: from navi.cosmonova.net.ua ([95.67.24.131])
 by smtp.gmail.com with ESMTPSA id i5sm131447lfv.246.2021.07.13.08.38.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 08:38:07 -0700 (PDT)
From: Andrew Melnychenko <andrew@daynix.com>
To: mst@redhat.com, yuri.benditovich@daynix.com, jasowang@redhat.com,
 armbru@redhat.com, eblake@redhat.com, berrange@redhat.com
Subject: [PATCH 5/5] qmp: Added qemu-ebpf-rss-path command.
Date: Tue, 13 Jul 2021 18:37:58 +0300
Message-Id: <20210713153758.323614-6-andrew@daynix.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210713153758.323614-1-andrew@daynix.com>
References: <20210713153758.323614-1-andrew@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::12e;
 envelope-from=andrew@daynix.com; helo=mail-lf1-x12e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: yan@daynix.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

New qmp command to query ebpf helper.
It's crucial that qemu and helper are in sync and in touch.
Technically helper should pass eBPF fds that qemu may accept.
And different qemu's builds may have different eBPF programs and helpers.
Qemu returns helper that should "fit" to virtio-net.

Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
---
 monitor/qmp-cmds.c | 32 ++++++++++++++++++++++++++++++++
 qapi/misc.json     | 33 +++++++++++++++++++++++++++++++++
 2 files changed, 65 insertions(+)

diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index f7d64a6457..c042ab5466 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -40,6 +40,7 @@
 #include "qapi/qmp/qerror.h"
 #include "hw/mem/memory-device.h"
 #include "hw/acpi/acpi_dev_interface.h"
+#include "qemu-helper-stamp-utils.h"
 
 NameInfo *qmp_query_name(Error **errp)
 {
@@ -351,3 +352,34 @@ void qmp_display_reload(DisplayReloadOptions *arg, Error **errp)
         abort();
     }
 }
+
+HelperPathList *qmp_query_helper_paths(Error **errp)
+{
+    HelperPathList *ret = NULL;
+    struct {
+        const char *helper;
+        bool check_stamp;
+    } helpers_list[] = {
+#ifdef CONFIG_EBPF
+        { "qemu-ebpf-rss-helper", true },
+#endif
+        { "qemu-pr-helper", false },
+        { "qemu-bridge-helper", false },
+        { NULL, false },
+    }, *helper_iter;
+    helper_iter = helpers_list;
+
+    for (; helper_iter->helper != NULL; ++helper_iter) {
+        char *path = qemu_find_helper(helper_iter->helper,
+                                      helper_iter->check_stamp);
+        if (path) {
+            HelperPath *helper = g_new0(HelperPath, 1);
+            helper->name = g_strdup(helper_iter->helper);
+            helper->path = path;
+
+            QAPI_LIST_PREPEND(ret, helper);
+        }
+    }
+
+    return ret;
+}
diff --git a/qapi/misc.json b/qapi/misc.json
index 156f98203e..9aaf8fbcca 100644
--- a/qapi/misc.json
+++ b/qapi/misc.json
@@ -519,3 +519,36 @@
  'data': { '*option': 'str' },
  'returns': ['CommandLineOptionInfo'],
  'allow-preconfig': true }
+
+##
+# @HelperPath:
+#
+# Name of the helper and binary location.
+##
+{ 'struct': 'HelperPath',
+  'data': {'name': 'str', 'path': 'str'} }
+
+##
+# @query-helper-paths:
+#
+# Query helper paths. Initially, this command was added for
+# qemu-ebpf-rss-helper. The qemu would check "the stamp" and
+# returns proper helper.
+#
+# Returns: list of object that contains name and path for helper.
+#
+# Since: 6.1
+#
+# Example:
+#
+# -> { "execute": "query-helper-paths" }
+# <- { "return": [
+#        {
+#          "name": "qemu-ebpf-rss-helper",
+#          "path": "/usr/local/libexec/qemu-ebpf-rss-helper"
+#        }
+#      ]
+#    }
+#
+##
+{ 'command': 'query-helper-paths', 'returns': ['HelperPath'] }
-- 
2.31.1



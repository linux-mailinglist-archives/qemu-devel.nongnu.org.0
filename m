Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9893A0FF6
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 12:09:23 +0200 (CEST)
Received: from localhost ([::1]:58876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqv9G-0008CC-Pz
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 06:09:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1lqv5F-0000Ld-VN
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 06:05:14 -0400
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136]:42516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1lqv5D-0006u1-D1
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 06:05:13 -0400
Received: by mail-lf1-x136.google.com with SMTP id j2so9514817lfg.9
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 03:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LJT8VRcYS9KQvYEHyPuMGZ6CdJ8/1KVNk860uBev24k=;
 b=aYM4U0G9T8mAIk0wN0tft19NRcvVqAseUYSetFcbdzwjVLlSBz+IOLTGwQfdLYMEpR
 V/3RVeS6iMu8ltBCRRKW1D8cUXWPwQKMPnLfKn6Y4AvR5KZF79/EbfXm0g9FgGBiV8n4
 Hu0u//ifNVk1UQzW1RLuQEd6n2dn391s8aL70KaEgbsLiM/yg15wf7JdxJ+4F1o4FInB
 SvEg+1hm4EtlxXa4hLWwPyGRbhweGvMcI6vnjhcTgzkJ9YTZTkWfr72Nlkhn9IGcnl/5
 QItxDzAM6XVH/6Wu3IQDnSBRQZKCJNyfKL3n4sHHbjBz1QTlumw01NOhWR9Q13D2/sbS
 6aGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LJT8VRcYS9KQvYEHyPuMGZ6CdJ8/1KVNk860uBev24k=;
 b=eG65HnCds00kGuo5lAIxqbmtS1YFNmIsEA2m2BP+PB5jgL2vjmaFLyl8T2AbrF2TOL
 st4iJA8QfjLPxWopLcAkZNFuuWv7SdD/9aGgZkEClAOyLX084O2tYefg/FatbmjL33wX
 EA3VatDuLcJ3e5zoDrP7jasu0Zj/egWY+ZQO/1p0BtWwAA2jKjG36bHBhnsFkxg57qT8
 BaljObynrPFWo473JVjWNiJXkUwRDEIGopHI1h4ctlY8IGChOUFrfp4GHY83cfezzzbW
 Dvh59ARD4uqj81Pr/s4QZSb6TkZD+0iEBJI6ByCdUWJ/CSqwm+/EBRJfGjr9a6YT0TGA
 bNZQ==
X-Gm-Message-State: AOAM530h8Z/a1eygWoPVJqqRAbaxOBfWxoW2elU1kgZXpL4lOFpK9M4k
 VdFDOj/jZ0xkdamWK68K7OA2Ag==
X-Google-Smtp-Source: ABdhPJx2BRtcSTGZY6L1/smatg5BqZal0KzSb9ev84fZ3LlwVwUo88wXxmyVL6tZPDLgKH14OjXApQ==
X-Received: by 2002:a05:6512:1c3:: with SMTP id
 f3mr18747601lfp.79.1623233109971; 
 Wed, 09 Jun 2021 03:05:09 -0700 (PDT)
Received: from navi.cosmonova.net.ua ([95.67.24.131])
 by smtp.gmail.com with ESMTPSA id l12sm333590lfk.10.2021.06.09.03.05.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 03:05:09 -0700 (PDT)
From: Andrew Melnychenko <andrew@daynix.com>
To: mst@redhat.com, yuri.benditovich@daynix.com, jasowang@redhat.com,
 armbru@redhat.com, eblake@redhat.com, berrange@redhat.com
Subject: [RFC PATCH 4/5] qmp: Added qemu-ebpf-rss-path command.
Date: Wed,  9 Jun 2021 13:04:56 +0300
Message-Id: <20210609100457.142570-5-andrew@daynix.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210609100457.142570-1-andrew@daynix.com>
References: <20210609100457.142570-1-andrew@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::136;
 envelope-from=andrew@daynix.com; helo=mail-lf1-x136.google.com
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
 monitor/qmp-cmds.c | 78 ++++++++++++++++++++++++++++++++++++++++++++++
 qapi/misc.json     | 29 +++++++++++++++++
 2 files changed, 107 insertions(+)

diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index f7d64a6457..5dd2a58ea2 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -351,3 +351,81 @@ void qmp_display_reload(DisplayReloadOptions *arg, Error **errp)
         abort();
     }
 }
+
+#ifdef CONFIG_LINUX
+
+static const char *get_dirname(char *path)
+{
+    char *sep;
+
+    sep = strrchr(path, '/');
+    if (sep == path) {
+        return "/";
+    } else if (sep) {
+        *sep = 0;
+        return path;
+    }
+    return ".";
+}
+
+static char *find_helper(const char *name)
+{
+    char qemu_exec[PATH_MAX];
+    const char *qemu_dir = NULL;
+    char *helper = NULL;
+
+    if (name == NULL) {
+        return NULL;
+    }
+
+    if (readlink("/proc/self/exe", qemu_exec, PATH_MAX) > 0) {
+        qemu_dir = get_dirname(qemu_exec);
+
+        helper = g_strdup_printf("%s/%s", qemu_dir, name);
+        if (access(helper, F_OK) == 0) {
+            return helper;
+        }
+        g_free(helper);
+    }
+
+    helper = g_strdup_printf("%s/%s", CONFIG_QEMU_HELPERDIR, name);
+    if (access(helper, F_OK) == 0) {
+        return helper;
+    }
+    g_free(helper);
+
+    return NULL;
+}
+
+HelperPathList *qmp_query_helper_paths(Error **errp)
+{
+    HelperPathList *ret = NULL;
+    const char *helpers_list[] = {
+#ifdef CONFIG_EBPF
+        "qemu-ebpf-rss-helper",
+#endif
+        NULL
+    };
+    const char **helper_iter = helpers_list;
+
+    for (; *helper_iter != NULL; ++helper_iter) {
+        char *path = find_helper(*helper_iter);
+        if (path) {
+            HelperPath *helper = g_new0(HelperPath, 1);
+            helper->name = g_strdup(*helper_iter);
+            helper->path = path;
+
+            QAPI_LIST_PREPEND(ret, helper);
+        }
+    }
+
+    return ret;
+}
+#else
+
+HelperPathList *qmp_query_helper_paths(Error **errp)
+{
+    return NULL;
+}
+
+#endif
diff --git a/qapi/misc.json b/qapi/misc.json
index 156f98203e..023bd2120d 100644
--- a/qapi/misc.json
+++ b/qapi/misc.json
@@ -519,3 +519,32 @@
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
+# Query specific eBPF RSS helper for current qemu binary.
+#
+# Returns: list of object that contains name and path for helper.
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



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24DBD5EB1DB
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 22:10:30 +0200 (CEST)
Received: from localhost ([::1]:47368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocuQv-0001gc-6T
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 16:10:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1ocu8E-0008L2-6K
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 15:51:11 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:52589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1ocu87-0005vp-1M
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 15:51:05 -0400
Received: from lenovo-t14s.redhat.com ([82.142.8.70]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MgARS-1pAcJE2BQs-00hbmD; Mon, 26 Sep 2022 21:50:54 +0200
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Thomas Huth <thuth@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v9 03/16] net: simplify net_client_parse() error management
Date: Mon, 26 Sep 2022 21:50:35 +0200
Message-Id: <20220926195048.487915-4-lvivier@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220926195048.487915-1-lvivier@redhat.com>
References: <20220926195048.487915-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ZbFtdsscagZoHPQ/AQBAmbp9pHe8EML9zMaQd8tnycZcfncQ3Yx
 iXhBIRAMngyaG0X7giXV8WW9h07H5BZdr+GFbbdbSiEZVq62IY3eKFDWq8KND1cVzJxO0EK
 rpIOAqTu0a9GaB5bqZBoilcxgTk7R0Ba2ADi2+exY63phU7e8z44XlfnNXqqmSLHzNVwrwc
 9lIIJzbB2ni8dZ/nmv+cQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:0PuI45HNrVU=:V+Su+5goffauZmgNGz9k7w
 NvHk6pFOgOR6vScjtO5FmolxixcjrS8XvTJulHem6l6SGZ5lgq5dGvtnRKOiSgQeSPaNyOHAz
 2jx4Fh4BEybbXahQgTaIacsknF/YOn9cbdjooJxFZZjGQMFEqtj3Eqdi69h/xj9n/YUZ8TVlo
 g9o469vA1gVarbs5YB7GzjchggqvNpo1ynpBOpg43kIUePulqDKNYdCpOwQ8bOs+9cYpwUWwc
 jPC5FoNa2iUtUONTJ6/RldlzgA5wcgg7/+3q8M1UAvQ2fYWr4TsUCCsKVbXYw6xyHCazuGDj0
 oCdEiBs5Lz3dO1FjSKGRtQ6CmYGfQfn+v3jRDImHTN1yQd+HOPgTWjR+E2qA9tYPZgdKm+AGg
 tA5jEqtvFa9UI35e8LN/3/WMlrT5YeuAfAbwLB0cbfGW7AY6gL17UZ1M6YFjKyEx67VI0VVKE
 hqyXTlT5q/cZukxGTkKHSbq1JnJvSN05lu1jQe6NL1S3XQGzfZCx6wkhyTI6AhgKzXUjeluuz
 AiVrDXzkAluCHwJ089I6oOXScUkl3JOt+uUnqYOmbSg0NEAlShyFze0Fa7nXpp8WdSvhsxTcb
 ZACUaMKlXqwygKyQstSRUPu2MkytpiIcRvdB6rZq1SHec2cYvmsapatwKXEqJZnMKZ+v+qMFc
 zxNEMVCmmJIg+w5kPNdl/vSYuGHwfgFukCJATj1Ki5xt7FkRVnw8zEjy/guxxIaeptcN+7jbk
 pngq98f2aru22T9aElz7vZlvG7LD8bwnLgFZVIRkh8gUkB02tKuV6mSkXnLHqoFk8WMFBjaF7
 PJv6V86
Received-SPF: permerror client-ip=212.227.126.131;
 envelope-from=lvivier@redhat.com; helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_FAIL=0.001,
 SPF_HELO_NONE=0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All net_client_parse() callers exit in case of error.

Move exit(1) to net_client_parse() and remove error checking from
the callers.

Suggested-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
---
 include/net/net.h |  2 +-
 net/net.c         |  6 ++----
 softmmu/vl.c      | 12 +++---------
 3 files changed, 6 insertions(+), 14 deletions(-)

diff --git a/include/net/net.h b/include/net/net.h
index c1c34a58f849..55023e7e9fa9 100644
--- a/include/net/net.h
+++ b/include/net/net.h
@@ -220,7 +220,7 @@ extern NICInfo nd_table[MAX_NICS];
 extern const char *host_net_devices[];
 
 /* from net.c */
-int net_client_parse(QemuOptsList *opts_list, const char *str);
+void net_client_parse(QemuOptsList *opts_list, const char *str);
 void show_netdevs(void);
 void net_init_clients(void);
 void net_check_clients(void);
diff --git a/net/net.c b/net/net.c
index 15958f881776..f056e8aebfb2 100644
--- a/net/net.c
+++ b/net/net.c
@@ -1579,13 +1579,11 @@ void net_init_clients(void)
                       &error_fatal);
 }
 
-int net_client_parse(QemuOptsList *opts_list, const char *optarg)
+void net_client_parse(QemuOptsList *opts_list, const char *optarg)
 {
     if (!qemu_opts_parse_noisily(opts_list, optarg, true)) {
-        return -1;
+        exit(1);
     }
-
-    return 0;
 }
 
 /* From FreeBSD */
diff --git a/softmmu/vl.c b/softmmu/vl.c
index b172134a62cb..f71fca2a9f73 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2809,21 +2809,15 @@ void qemu_init(int argc, char **argv, char **envp)
                 break;
             case QEMU_OPTION_netdev:
                 default_net = 0;
-                if (net_client_parse(qemu_find_opts("netdev"), optarg) == -1) {
-                    exit(1);
-                }
+                net_client_parse(qemu_find_opts("netdev"), optarg);
                 break;
             case QEMU_OPTION_nic:
                 default_net = 0;
-                if (net_client_parse(qemu_find_opts("nic"), optarg) == -1) {
-                    exit(1);
-                }
+                net_client_parse(qemu_find_opts("nic"), optarg);
                 break;
             case QEMU_OPTION_net:
                 default_net = 0;
-                if (net_client_parse(qemu_find_opts("net"), optarg) == -1) {
-                    exit(1);
-                }
+                net_client_parse(qemu_find_opts("net"), optarg);
                 break;
 #ifdef CONFIG_LIBISCSI
             case QEMU_OPTION_iscsi:
-- 
2.37.3



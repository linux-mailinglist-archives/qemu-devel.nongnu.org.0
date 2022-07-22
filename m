Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C01357E72E
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 21:17:58 +0200 (CEST)
Received: from localhost ([::1]:54942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEy9t-0003pt-EQ
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 15:17:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oExxk-0006e0-8o
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 15:05:24 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:33863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oExxh-00059h-36
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 15:05:23 -0400
Received: from thinkpad.redhat.com ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1M42zo-1oExxA2FO4-0000Oi; Fri, 22 Jul 2022 21:04:48 +0200
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v7 03/14] net: simplify net_client_parse() error management
Date: Fri, 22 Jul 2022 21:04:31 +0200
Message-Id: <20220722190442.301310-4-lvivier@redhat.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220722190442.301310-1-lvivier@redhat.com>
References: <20220722190442.301310-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:yai9V2YwdGqaGDVOM38gF5jrkr0C48seEco88/uFNrFZk7e9Bxp
 0pgipcHoKyNw1IP4EV3jwCdbMOLNGnFv8DjUwHZcyGuElo+IZAK3srJ3zkLaU0+97lAvG9p
 y+A75PIhtJzjBEL7os+qAgghxiy41BtimOomF1ze+WOZFlShsUUjONl0ilznkeQvFH47QFX
 lw7HKjTSU9aQvryY2pNlQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:BofZXZkFywA=:1XJjbcCftY3sNfIr/3NqO3
 SjDUCtX2yZE9yUfd7AGDNQdeg92hNrcCggFjV645FBIPdr4H80vnr7GhMB/JI4CK9D/rAuiW8
 fh3EVK7dnfWN6vT5obsxu0WNGVML12RkVsn6ZHNDb1hTmNE/pbKRXwp6YATLOJTivuVYAGyM6
 URUJTrXU1XY0v9y0v04SZXB1zp6JZOCLBqc6VopMYU/YTarwqS0LUGaTcYICBeRQlX3pSJlD+
 90EzHrU8yRcVJy79OqXxdnFnIdqLJMZQFGxDQ7s5fiDACONzbKSCN62qgPoTJhR4B6l5JWtr3
 RWn4wURhT1YV5TrtyNhH8oYaJuL0CtMSRVzzGTbAeRJjN123Ykr/Lia4LzmBDvDJC0qUmKftb
 OFMTgJllQFm/2jrGPrO9G3E8aYLjroaodovkMbydU77GhiLuy5353VILHzkiPYc5NJBqO/ORM
 7cD0YnTgKtE3I2uWXlhufFqcdi9ajOBN/b2gYM2aWSg3icuNRDE1XIYtiw51XoHX5FXxL0/5l
 LE2sjDwX7ir/xyk2ZkoAu1YGGpUZVvxo5KUyX411stZAVAjFwHvPHdNazDPokuUubvSZy8XM9
 R3tljIat8PORtDOP4Q/aq7FY6m83qz5uK/LWTFnSEDf15oxijRhjNfSvJCIB5HD7dl2N5ITCQ
 B1QuemOVh2nHTiR8pqFUnBItsnvoYFZpYqULM3xwQMeWxeiSJbuUq9jF/P1srZs/Uv89G2UDi
 72o3zPpDq8MvmBnd8ELaRcQLfVe4TrT1pFbJrA==
Received-SPF: permerror client-ip=212.227.126.187;
 envelope-from=lvivier@redhat.com; helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_FAIL=0.001, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
index c53c64ac18c4..e755254443ea 100644
--- a/include/net/net.h
+++ b/include/net/net.h
@@ -214,7 +214,7 @@ extern NICInfo nd_table[MAX_NICS];
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
index 8f3f3bb74389..0478210f2e04 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2815,21 +2815,15 @@ void qemu_init(int argc, char **argv, char **envp)
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
2.37.1



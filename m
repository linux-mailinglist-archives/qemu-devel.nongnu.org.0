Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 014C85F5880
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Oct 2022 18:43:55 +0200 (CEST)
Received: from localhost ([::1]:38856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1og7Uw-0004eh-1L
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 12:43:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1og794-0007PK-Af
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 12:21:18 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:42961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1og78x-0002nf-F2
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 12:21:17 -0400
Received: from lenovo-t14s.redhat.com ([82.142.8.70]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MOzKk-1oq5Pq3ZWe-00PLqI; Wed, 05 Oct 2022 18:20:59 +0200
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Jason Wang <jasowang@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Greg Kurz <groug@kaod.org>,
 Laurent Vivier <lvivier@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH v10 03/17] net: simplify net_client_parse() error management
Date: Wed,  5 Oct 2022 18:20:37 +0200
Message-Id: <20221005162051.1120041-4-lvivier@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221005162051.1120041-1-lvivier@redhat.com>
References: <20221005162051.1120041-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:LTn9gCHCzHBSaiI423858RJie+oU0xjnNqPvNFuZ/mBwA+E7W+H
 XwpPIVxM2IuqPYhJ54rt+lvR3l3+xSx60CQKI3xViQPLHZhH09nIMUk0nJvERwlaPy5wgHv
 B/LfLPgxam52vpfmdZ2Qclrw0qq/rjt/SGkJZs1gwQ+Al8GoFBYFFq5NIvZ7FFJwsdjJ17u
 Byy1hNYS3rEyxa8Z5H79g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:X97xJnjK6+k=:erRJC7bMOEm5bn9g84KB6K
 l1d5E6ZFt3ZFAox/lCPZ4IYO8NW3ZO9gxsgkb/J7n7IDivlfEpkiAl5zSqdtxCd7rdmX0wMZ7
 XGnMKs693MBGV8MFhQ5oN113O5J+W5j5O9RDTJ4CMXD9OmqJk3Wfc3dhifDarzMYyoH0Oojjq
 9s7XnuNtECtqHGPJyn78m2O/bU4o6YHFf6MtqUo5YuBRbG8+/nL2RdZiSZcZALrfwhW8FMrfs
 WriIqpScdhB41BQcFB1lgQlqE/3tiYqjUYWkEG1CycoyCJ/tTnLf4XMduO3Nt15hwWTaJpDu2
 WKvxW0CucJjkrYB7zv02yioRwUdXiJ/+fib4zvZUvKeZxORK1vgGVPvp71/ogYK2k/C5AC2lO
 Mtlh5dEJnMhCYNm8N4iOU2QxnIi55EynX4iUdPDX+A9RF5HWp667ClOCXGxX6RSnmhIrSGP7e
 VoA4+4QKh4NmINB08b+1q2ZGjpZCdqwWREC/227yiIUpMajacNVfyBc8cWp+QAzjxMRJrxtLl
 hYglFGvmFOGGbytKLohomYTQY+/4+qrj2NLSm6TWcN/9rSxc1hGaCGWKgbwl481U/Az+heeDc
 G2Ekw2db6UB4UI7JYeWHYm+7p2ZhhKxY9kpQ/0rNEzXg4g5wO+1wFGyzUotouSSwQjaNp6r9j
 /1YQ7Fzx/Qr/TEJNCi60K6Pukx0kTrEgS4x9VHHqVn2loChA20jl5fK4pWOHm8KMTu+LyVXor
 QKRkWBCPC6bGpVSiL2YWJ9o7SQ7JUk515B9iP8twu94WEUpUSPdkPoyNYQ3lkyJYgaCop1gIe
 OziwGtL
Received-SPF: permerror client-ip=217.72.192.73;
 envelope-from=lvivier@redhat.com; helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_FAIL=0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
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
index 351eab4cd5f1..2bf2d66c6b49 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2809,21 +2809,15 @@ void qemu_init(int argc, char **argv)
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



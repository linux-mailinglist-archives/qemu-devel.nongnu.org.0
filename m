Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB5A60746C
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 11:48:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oloe3-00089Q-BQ
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 05:48:51 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olo2i-0004QJ-1q
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 05:10:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1olo2R-0003UV-9u
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 05:09:59 -0400
Received: from mout.kundenserver.de ([217.72.192.73])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1olo2B-0001QQ-15
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 05:09:58 -0400
Received: from lenovo-t14s.redhat.com ([82.142.8.70]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MRSdf-1oR8M03m6v-00NRsT; Fri, 21 Oct 2022 11:09:30 +0200
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, xen-devel@lists.xenproject.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, Stefan Weil <sw@weilnetz.de>,
 David Gibson <david@gibson.dropbear.id.au>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Eric Blake <eblake@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v14 03/17] net: simplify net_client_parse() error management
Date: Fri, 21 Oct 2022 11:09:08 +0200
Message-Id: <20221021090922.170074-4-lvivier@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221021090922.170074-1-lvivier@redhat.com>
References: <20221021090922.170074-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:IKic31ZwZSDUlRtZ5W/oJ6x9m74VEHK+o7kLTExWX9a8SaM3uhN
 GkxTsbGIwSTcbmCyxldyFEjYzzTi+ti+OLJC5OlyLSrsUrjeq2luwqMC1eP4Bv4cz83XnBT
 NkQ18fCd+4tAi+RuO3gYgMhwspdKX2WDeTk7ejR+8xaH1WMilCQlR25sTfFBVT+q4slUoor
 Xutz9Omr+F0o07fJRStMA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ug7mRa7M/zM=:/oMTRGSRN5urzOJnTQ1pG5
 TOn9OFGoETM9Vlcx3K86rB+Tx9Qvcprrlou0F4jCyt4jZts1jg2rGWigl8+4YJWYLliXMZCKN
 gKeSSLYij1XRV89VSfbHOuSiRQZsu9H2Iz6HVdyCSHZCup6ZKGOS5P16FUrAGzf+ZnB21eAQL
 8tqLs5tHwHdQRzHo7cDiVcbEB/Ylrp6srETEzKXFvoIuTSfPzYz/0skDk+72Yk/KyA6ykQv5E
 VdUGPLTdlREWXp1ybkVL/oyBEu+usG2vasOs+LcehkhEbvQsLtoDhLTTm1O5W3x5OXU9dlLH3
 gAL8iuUMZex3N6MtdZ24H/CtmrwL7o1epWE2GciVamYdiFXTmrrouypREshx6DtAyv3DxiX3B
 G4I84HArw7xcEngyJfLAMXHSx5QSeTO57XBnQYMlbOTstkPSdlpppDVjXczpiElk3ab06+X6y
 WhfvQOAW36O7JH6K+3YKYe1NeUP9Oin22ViTpe/KaUdevtiQxLHL65ZoWeN1KfwGBbuL97qiu
 Or7rV2c72M33MqVujY5T3AzOJ7dqVZbcNbEyj6TSP/5MeNr4jq+w6vle5NgHX8Yv894wYexyc
 9j928T1XeeZOsXt0nE1+lt5MbiQD8KtEu/VWRdjQ08Qo+BsXmYeOa70fv/30OJeeVN5dZ9smN
 3RHpt8ZUGy7XR0J3nd4KZ2pHh9f4NF3r0bQOk7A1Gm1E7f6sI+s4zDF+2ziOxgnItANLCbfw8
 gLGvM+sceoBMdXekPT6KXFfqHN1p9J+WrbJXylRe0llWLVB1DQPFyeSPiZAjbeANgcWwe5KiX
 TliuWE2
Received-SPF: permerror client-ip=217.72.192.73;
 envelope-from=lvivier@redhat.com; helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_FAIL=0.001,
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
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
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
index a4ae131e4d61..e69aa43de469 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2801,21 +2801,15 @@ void qemu_init(int argc, char **argv)
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



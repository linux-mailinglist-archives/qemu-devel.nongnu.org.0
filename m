Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF11B5FBBFB
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 22:19:25 +0200 (CEST)
Received: from localhost ([::1]:59708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiLil-0001YY-Q0
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 16:19:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oiLVs-0006P0-1S
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 16:06:05 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:52813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oiLVp-0003ja-8U
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 16:06:03 -0400
Received: from lenovo-t14s.redhat.com ([82.142.8.70]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1M1YtP-1okocB3Lid-0039YN; Tue, 11 Oct 2022 22:05:49 +0200
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, Greg Kurz <groug@kaod.org>,
 Eric Blake <eblake@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Thomas Huth <thuth@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Markus Armbruster <armbru@redhat.com>, Paul Durrant <paul@xen.org>,
 David Gibson <david@gibson.dropbear.id.au>, xen-devel@lists.xenproject.org
Subject: [PATCH v11 03/17] net: simplify net_client_parse() error management
Date: Tue, 11 Oct 2022 22:05:25 +0200
Message-Id: <20221011200539.1486809-4-lvivier@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221011200539.1486809-1-lvivier@redhat.com>
References: <20221011200539.1486809-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:A9ouqfM3UJq93QDzTpjBZLmdCU8DHJePfXwKGc5MkczBHI3sW8v
 8hg1116Rahdg3557QLZwWeMx2dlypFtcnm6WSWZqA1+64PK3n1gcB7RspijG0Yd38/ejcRU
 6+zV5dp+TvSzYC+DcjNcbGW7mfyHPiIhKhuijsG5g5SFyDH2C+rBL0qYJSqs7DHUVgmwGnB
 1D8u3TEscMxLfJXrxK6WA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ln7jyWV2rEg=:P8ap6lfjsJUu5IQwLMkGnM
 fX7aX/43ttx5lC6LF5fVsDhsCqxOfMUT3AiMYuL+GGIzZiwIlc5GaWpx4+ESYUIn/RQW4F235
 KtCawN2/RYu1EEZgnmi6vnmzq3aqSNr5JcswxUAR3sgaN73BtFzkn2o7OUNMeCWsCqlJWs7cT
 RQNBNv5cYxnTINJoHPCAjjbjq5zvVMQU6yPG0KtMVgJcZZyWUsr3/ECvA7DxmxTSD9jAMTT8b
 dnzn8PuA7siPXVL7IWGTKqoqmSeqsyRmMUSwI+n4dFoXyh2l1U76cjNUmBusiZHSQWYC+ytsv
 RxpEki7wHOdIxVcupm9AjjTqjVx7XlTF+D98T4FZn0RCRf4e94ZaXhO4mO/fKk3ZWQMZVZIX6
 ATUc7FtpwCD4h9oy3wb7ZB4Agu0AH4/Q8is8eYEaxfde7mP9W5JAnHqIkP74SY5CNpGBeelUR
 arq5AeZK2HQKqTqWwmlISc5U2Gc6bmUSchTJ9CBCfw9pksZ5EbmwFxlFl4GFofL0zL19VO/Ei
 UVxjn6o1eAT8AviW+4IR0E+O+JTxmb1Z9vN0keMooA5rBCvhURH//tBJe3H5G4oLgnmSrmFnD
 DDt6yjOjPtZ25tzlOLfH4LZTQatrx4lRTOekr93kNye4M8Y53/WZDLHuz0c5TmDjEHBZSsGCT
 rReOOSXjzI/bGnE+kUy4PBaO8Qq19a/Azj6QOv7vsCty9Pf9HVQUbu/wXRQXMp1uHcFgVf+1+
 twgPB/11Q/s9jwnVvRMC/ixzqPCPX3DnZej/iJwjfysRzcf3/epvKyG11lxEXGrA1ATUGggBW
 x0zLqsa
Received-SPF: permerror client-ip=212.227.126.133;
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



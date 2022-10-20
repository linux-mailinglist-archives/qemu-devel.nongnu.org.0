Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4E6606648
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 18:52:28 +0200 (CEST)
Received: from localhost ([::1]:60788 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olYmC-0003Mi-SA
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 12:52:21 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olYls-0007fh-FX
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 12:51:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1olYND-0004eH-08
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 12:26:24 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:47467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1olYNB-0006yV-9O
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 12:26:22 -0400
Received: from lenovo-t14s.redhat.com ([82.142.8.70]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MHVWT-1opcyc0Rqj-00DXAA; Thu, 20 Oct 2022 18:26:07 +0200
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>, Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 David Gibson <david@gibson.dropbear.id.au>, Eric Blake <eblake@redhat.com>,
 xen-devel@lists.xenproject.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Anthony Perard <anthony.perard@citrix.com>
Subject: [PATCH v13 03/17] net: simplify net_client_parse() error management
Date: Thu, 20 Oct 2022 18:25:44 +0200
Message-Id: <20221020162558.123284-4-lvivier@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221020162558.123284-1-lvivier@redhat.com>
References: <20221020162558.123284-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:UnptyTLHE1UrXhvV5IayGde0xhTF2LT+HxEJr86MNaYlMjtZs9f
 uZSCojBpLJ4i5ybhn/VQ++GrwwkVh3qsSje9dlEOSMiTIwGQlp5R0d04q9KC6TcqOeycGqQ
 IhRFDKvHoXpRKlXAjq9itMR2rc4LBuibyFHaCvJbecN75ZLCDyBNf6afzTs5fG4PXxsgzrl
 VMC8slVXfqzy0QJSyWdzg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:9/B0G1nb1ig=:breztTMgDzpagS8YBYztab
 YqE69z17bjlJYt87PMVWW29U1XtEv+xCZFP3PBZGCy7lbGPW6O4L23vV+Kd96A+bfhM1wNDhS
 qmg4Ul5J23nK+21irVGaB6MGZMg2L+JKFNsxTBrICIlO5f4u/j1akIWt6CPr883aIkvyA0uVf
 /WvYTHD8QGGjFzcZij+TCTIK3eAmYb5V/vjmaP0InftKHjcQEEJOBc0bY9g3ouzpCkEmrXqh1
 qRgYe+EKPlsZyacQIDjwN9GTQWPr1g5C+w290AB25RCcnOm8ycXmD4cbAEkxmOm587K/aFUWA
 pRuj6JjFkvRr9Z4LED2FgSYz2RZN4GPLxWubF1hx6WJMlL2TTzmpf4Y4jkYZkidU4hZf9EfCO
 BTqF1HyesLBV2vp6GXmi7nkh0m2NQBSLQNc/upgoIk/o5nki6b6cTi7hXdtbXbrX6sE2R4COV
 lthHk+Beg99Z0rqFOc4RukicfsgkRU06tq43KG6UQkuhIbPL/Kbe8ZaFHu8bPr+uB5j5Tp+BP
 Xqq5IMfQ6YJV+kIao3ezy8tZNoilJOFfe/sbV64Mo7+w2XZEoX8PJfLcBRT/Cpd8S35PmUApb
 GP/gGo3EwKBafLb0Pubc3THZhyCgNCydkUs6cX86vrUMs2+kqfoDR+HjqGm4Al7KYUAnzwaPl
 6wNbJzuCUW4ExsY+YgwNNZhctBpKJnXni7bMNVCFTXitUxbjn4he4s3IBBU4IW0rLiuJVxYw5
 F6E/HRnQUufyHUSQgZe8KATyy0C/XdUwahS/jWY6r4tvKtk07V5VV+kAgBjZ/hz4cb11QQuLB
 uKSbdIF
Received-SPF: permerror client-ip=212.227.126.130;
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



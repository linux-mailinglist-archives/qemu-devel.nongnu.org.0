Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C95BE5B682C
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 08:54:26 +0200 (CEST)
Received: from localhost ([::1]:44528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXzoP-0006ff-E1
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 02:54:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oXzg1-0000g6-AA
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 02:45:48 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:51867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oXzfs-0004D1-9W
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 02:45:41 -0400
Received: from lenovo-t14s.redhat.com ([82.142.8.70]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1Mo6WJ-1p5wdw4B6x-00pbF7; Tue, 13 Sep 2022 08:40:08 +0200
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Gregory Kurz <gregory.kurz@free.fr>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PATCH v8 03/14] net: simplify net_client_parse() error management
Date: Tue, 13 Sep 2022 08:39:49 +0200
Message-Id: <20220913064000.79353-4-lvivier@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220913064000.79353-1-lvivier@redhat.com>
References: <20220913064000.79353-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Ehj/texYFn1M1XSI2kB6EHlxetjR6Htmb//IpC7jZZ5xNsltTkR
 NmQmZz8q2uA5vCVsu+I9RdKqM+ORg5Z5AiSgECTvdxhSNjNWvCCGU7M1R2IXL3OoVVLOoa0
 l7mdFGLglu+z6mDt7oxS/gvb/xSs+a6iUEkx+Y1L67b4/fgU77XLKd/Uwudc2NL7Cm40/A7
 0eSMf0HEUoSqPhtHhl4xA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:BaUMsu8SRf8=:fxSGVjEse0v82B5lkQms19
 p1BPq+ASy4JI7EeLO15/KvO70pvIv9P2jkTuJLijOhKd5uF5MWeyzzIFuW4AJazaKoXzHyno+
 AIZHILUQ1NFoSpit91r9KZ/jNFwu8N6LVbeY+y7o06NHwWQ/ONcT3m8VExsbJ1a3rQ5WRZFGg
 VoZS4KMz5eKthIs4hj7INVKuvA8enb3nmVeiolLUPQaxS2SXMS0YMpPRSXezy1DR0Y7U+T5C9
 ff+B0h7kkqMKT8lsrjxhCUkGd0z6mheESj1FiaayZx4bfkvSi408098ZqPqAGnzbVFiDmk/wA
 mHIofVDNpdVWXRR3bRMHeWtXrEwzY5zSWxxyaBSIGkMF8nhB/sAktTweSvjeJBtfUO8xO5Ut0
 RQNAu4ZbAAKHLlqU30pKnsOi0spXxxI7cZh4WK6Xh4zbZ5mvewcX2pWPrIRZhB30/0bLFvea5
 x25LsEfL+AGmAvwebmn4czOq8e+REai7hULriu0dboDA8BNLW+AVWJKlHMXUe55QF26JgB/6S
 u4sh5MscTNU5CL0+y96qCbbUJAnh76y2tDHjGuchv+g02/lj7mtIIHlohv2z3XoBI4++T5I/3
 6dCYHZxlSHziFbPPRE1Qm2CVvdOa17+qwfq9R4hr8ay2eehGpr8iXpkEA/oJlYrabrJ+PWaBP
 oYkGUu3Re3zRvJulrwP3HZRQ2TCwBJnpVd/4OEQ8uDdWa8Km5ass1skNCHdRal3KbhjbzDi6V
 ggNsGMIQJbcShiPIX19uqnZCALoZ8gP/N7TqCmbZ5QLEVt0d13bwUY9vXkxsZcw/6VxFNj5gw
 x0yIXEh
Received-SPF: permerror client-ip=212.227.126.130;
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
index 1fe8b5c5a120..55d163475e9e 100644
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



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD3B605B24
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 11:30:40 +0200 (CEST)
Received: from localhost ([::1]:39470 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olRsr-0007lt-4U
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 05:30:38 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olRsq-0007Ar-0N
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 05:30:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1olRfY-0002ZC-6S
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 05:16:52 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:54509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1olRfT-0005Hs-K1
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 05:16:50 -0400
Received: from lenovo-t14s.redhat.com ([82.142.8.70]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1N63NQ-1p9sIG1hkm-016OzW; Thu, 20 Oct 2022 11:16:36 +0200
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 xen-devel@lists.xenproject.org, Eric Blake <eblake@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Greg Kurz <groug@kaod.org>,
 Jason Wang <jasowang@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, Thomas Huth <thuth@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paul Durrant <paul@xen.org>, Stefan Weil <sw@weilnetz.de>,
 Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v12 03/17] net: simplify net_client_parse() error management
Date: Thu, 20 Oct 2022 11:16:10 +0200
Message-Id: <20221020091624.48368-4-lvivier@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221020091624.48368-1-lvivier@redhat.com>
References: <20221020091624.48368-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:4+NFKSFp2Hij0apaps/Q2/rgGc65iwBfvVhBoGdLBuqqtEwusC+
 q0jNyFjcVAi6iQic8jBMtjYjKLmz/ULbh4oSvJeTiOjSOPkOvQs0quJnczPXxei7Wdqez3v
 vhd/NixhpoJaSNFv80dHO+BZ9caakqorWtZoUeW8+Pu3rOHyy9fvr0XtdAbu9koYTcxPavE
 hcqc0pXAUecXdcxTKPVQA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:iiuq1lxlvJU=:nysntMu7Wj00UYdxw8Xhpt
 MaPLgD3i/jHiAlOnBA9XhZTAg7pcQHrPaQZuUcEafIdg4x8FkefKXLSelNP843i0tWC//x5nb
 R6IBUVMany+OkZfHAJXHQXyB4YuYen+1Ejg674gPuCyZF8zIKv26OUpWBdEU2/cSfNsKNE0tr
 Q4LV8XQ/Im1zQ0v9DcCVtTAoJRL8LHt8Ebx8NZPSUpNZNdAYOPQ3efdaxGiPuxcDqRTA0EhJO
 XAJ9g8NCsaMqB3Skj1LM7Z+ig7TNnhaFWJo+fs6DrTLOJM7VpGH+T9AE/ErMV8XO1SEjj0iIF
 CiXCcyeor1rzKlPpwg3QHhHUbWXGCyY/1COahsWzuhU+c36pz0QDmvzjsPxGI3p0t5dzyJB1z
 ejjKQgIaM1BgCwqQxs09VMuSRwmw4vHcYrM9L1/DHGCyQZYNZ3JmkM9/ZrH2v2rNcdqLDwBEf
 hCYDHhCzuCOAu+D2cOq9/Ryb3rnEEoh+C2vS9nIvSfcSR1nhu6FdJTsU3XHYBAMxXlh61b6be
 2KO+6e6fis5TFDZxZnn1C6R5iCdKqzbg4LjQGfmQdfp3T/zOheyeQ0nMWwtl1K0rYipFjmaT2
 3IutMyfT+EYO/Kma3dgdawzSx6Jss9d/DsNM5W3CuK9HBlhAKp/j+Geoew4AJfWfTKqKDfqhn
 sSzFY4dduGQ3FS90VXfs6sMhJ6eJOXDG4TK8Gz7Vs8mbCZSf9zfgWKgwcrpbHGBQxGrG6bZqx
 Ypl4DUX3FUTAxRaBJFOTQI1UWnfmjaayIXJ/I+QWvZOQN6rFRYE97R/iZvMGYul8jS6yd4B4L
 +OPbakG
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



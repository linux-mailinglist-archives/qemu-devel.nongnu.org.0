Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3CC160740C
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 11:29:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oloLC-0000ng-Dn
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 05:29:22 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olo2q-00053L-LU
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 05:10:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1olo2V-0003fi-7F
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 05:10:05 -0400
Received: from mout.kundenserver.de ([212.227.17.13])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1olo2N-0001xr-JG
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 05:10:00 -0400
Received: from lenovo-t14s.redhat.com ([82.142.8.70]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MpUlO-1pSptO1ifc-00psqq; Fri, 21 Oct 2022 11:09:46 +0200
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
Subject: [PATCH v14 14/17] qemu-sockets: update socket_uri() and
 socket_parse() to be consistent
Date: Fri, 21 Oct 2022 11:09:19 +0200
Message-Id: <20221021090922.170074-15-lvivier@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221021090922.170074-1-lvivier@redhat.com>
References: <20221021090922.170074-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:IlbjGyBRLP3bwFE38/66E2QOC+4jmzRhUTvPDJprnXGju0Xs3m/
 ZSn7mUgHb33GOOso/Sy9gfu9GrxaemOiliAfeQM4Hs08f10PsWEdCQ8nUuWpE0lP2ECUvMd
 cDF5ZT5mbXqk6sE1ySNAKptZVSCcX3RlA0lbb84Jo8TesMytwMEVvKCWZ6QebVU/GwFWntS
 cs9ndA9jEbpDip2iqTX8w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:PUEEo2WJJ2I=:SeIJ3r7pHTb3tnyE+jhkOY
 d0HwTUPIyYxf67h2zDeW9WRPXuGwOW8U+J8g5kn9xeIKJc9JZMT8RBn0QTy+cyhBQl1hMuKAe
 fNfzmHKMmKkjUMNtcBBNyY4u6L63+eqeX2wRvB7myBffQAugV+BDP6cVfHG6yaYAOvvA+syPa
 GT1gmGM5TwPSEXJJn+e0DIQfYl60/EIQn/t8FayptZNUKHKQYunozXtjPFMay3rh+dmiVgjND
 Hi/z6c5dkPhAcjf9hjyIn0xPWO3Mn30l7iiCfpnUOwfBrhZpHBurFaKroMNMs2BpkZCcosgWH
 toXAYfAm0CIcChqjabeAvglqJzVud2as6OC+Xn0LRXZn48d401HIp1g8uU7dzrus+WB1KvEtt
 vVCENJi+gi35fvRw8X5NTsJzCTHIravfVEOOjCfXJK6Bd2hkbM+qmG4Ni5yAL79dlII02XDJb
 r5mT9fpKjBVBu0gm24uDMrmNtWRsKJ2s1vd61WDwd2kU7/GPVp/Ea5PLwrYp0ADNzPoa3Lg/X
 nN4iJfM5x6DPbHSA6yfj/QAhG42zEITJ+FXqdzfXCpaEk8bq+125aK9dlU3Xz1lWcgt7DX7Ob
 2jAktwDP787HjfpbKJoZDaqrdRiV1I7nFg1Oc3+XohqYS2FAnrAL0k2OgDsiHGJMnmQgo3wcw
 MhwvjcWnag/soxMczzfnbV5+a9wuENB/D3rJ8Qhzqy/2+vM2bQBq/dIWSuenTwOchIzvwfP8I
 SC1VHL1LnWQ0ExG1WbIwePtRSxC0dA/RsaW5HPyaEqJ/fJXJ71yN4kpf8iccEFUfGTU0n5m5g
 cagRz2Q
Received-SPF: permerror client-ip=212.227.17.13;
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

To be consistent with socket_uri(), add 'tcp:' prefix for inet type in
socket_parse(), by default socket_parse() use tcp when no prefix is
provided (format is host:port).

In socket_uri(), use 'vsock:' prefix for vsock type rather than 'tcp:'
because it makes a vsock address look like an inet address with CID
misinterpreted as host.
Goes back to commit 9aca82ba31 "migration: Create socket-address parameter"

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
---
 util/qemu-sockets.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index 9f6f655fd526..a9926af714c4 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -1090,7 +1090,7 @@ char *socket_uri(SocketAddress *addr)
     case SOCKET_ADDRESS_TYPE_FD:
         return g_strdup_printf("fd:%s", addr->u.fd.str);
     case SOCKET_ADDRESS_TYPE_VSOCK:
-        return g_strdup_printf("tcp:%s:%s",
+        return g_strdup_printf("vsock:%s:%s",
                                addr->u.vsock.cid,
                                addr->u.vsock.port);
     default:
@@ -1124,6 +1124,11 @@ SocketAddress *socket_parse(const char *str, Error **errp)
         if (vsock_parse(&addr->u.vsock, str + strlen("vsock:"), errp)) {
             goto fail;
         }
+    } else if (strstart(str, "tcp:", NULL)) {
+        addr->type = SOCKET_ADDRESS_TYPE_INET;
+        if (inet_parse(&addr->u.inet, str + strlen("tcp:"), errp)) {
+            goto fail;
+        }
     } else {
         addr->type = SOCKET_ADDRESS_TYPE_INET;
         if (inet_parse(&addr->u.inet, str, errp)) {
-- 
2.37.3



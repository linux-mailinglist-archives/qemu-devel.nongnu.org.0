Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 664065FBBFD
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 22:21:23 +0200 (CEST)
Received: from localhost ([::1]:53420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiLkg-0002wx-9I
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 16:21:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oiLWP-0006TC-4n
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 16:06:38 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:49327)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oiLWM-0003mu-VE
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 16:06:36 -0400
Received: from lenovo-t14s.redhat.com ([82.142.8.70]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1Mow4E-1pWINf2lw6-00qT0M; Tue, 11 Oct 2022 22:06:05 +0200
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
Subject: [PATCH v11 14/17] qemu-sockets: update socket_uri() and
 socket_parse() to be consistent
Date: Tue, 11 Oct 2022 22:05:36 +0200
Message-Id: <20221011200539.1486809-15-lvivier@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221011200539.1486809-1-lvivier@redhat.com>
References: <20221011200539.1486809-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ey0Bb/M2Z6F/4rYMomeFku/q8uwdpNMAl8SJ1jirWX+TzOcfMvc
 C4KO5r754mdDxXvdeYX20ijKUgPucKg/ixxH0Sw7PjdFSZ2DcBeD/I8FpLvnvtoQHKUQw8h
 YTynCh7urNtjxP+WDb+wVvbIAR0RJ0vpp/w6KEfVsrh4V5Eo5mqT8RuL40YD9wKD4oDe0Jd
 wW9K/RD0rgAcSHHFQvNHQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:+1PMrstufmY=:k4HfV+kqjAzzgqeMBOLfwE
 rD5yjo3Bnu718rEHlAcZEo0BqD+Oj2TQ/ZHF145z0+kw58k7Qikfo15Gobs9IEmLB3B58Ynnh
 Adt8Il9Kw1OOOani8YoI4lshGo22uUoMcT433R5voB87FDrOKndu9uCvhzYjZK8Ci8PgviSGN
 5MDpebMBUlQ1t2jmteIGpgSIIcRE4zi96AFURP15ZX4kwf4ZMKImuq3jJufRy6T/DWm8kO0UL
 s9ZuD17P4jjY6oqhsFCGS37Lb2BYfEs4zak/GCMuQT72qFU4MS2DpYxQe/AUzULU8IJU8zmHx
 hAtrbsmvHr50Xvb3sIoDbwHTQpZcTrzjShuPeslXWe3RVWXjzA50RqBtMQeGp/n8ySGsbnwIz
 mzU8iM6yR10qponNKd5ZCHcODA9D+k90aoOGh0nPRCSDAybgN5uEIbm3axB5j0ptC5/jHST4t
 yXoWCQnhuZbdHLaGFXeMWqtk1WMf+rjrkrtLss03FcRtacJepmqGAWsk/gKshx0UYGl6spw9x
 LORGN1465IrMCacVBNuYbQzX5CaQFtlA3FeYWcBWbfy1BGpSwwx0APY8zQ+xSwrov5XJkgSj9
 OSx2rmPOylVK3oe7SrygDb3rTtxGhTUxa0LkyEfvAdIxKUD9LwThOPN+oD8LPvsd9v6t0Hb8+
 u/Rpw99dVZcCqgscSxsXfEZphWb3ihn9AxRS8bdI/NDlWUwJ3ML80dNfbyvf6k+OAH+YQMhx7
 kQo9yi2s5XsyoRX1pEzAKCJVqtpvGSDY6/rGTtF1pFsUBUmX5G75Tyn540SG+z/gKiI9YAD6r
 OXmyRDr
Received-SPF: permerror client-ip=212.227.126.134;
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



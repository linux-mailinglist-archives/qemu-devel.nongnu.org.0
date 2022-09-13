Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03AD85B6862
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 09:10:15 +0200 (CEST)
Received: from localhost ([::1]:32980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oY03h-00030E-Ks
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 03:10:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oXzg0-0000g3-M4
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 02:45:48 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:55861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oXzfo-0004Ae-H5
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 02:45:40 -0400
Received: from lenovo-t14s.redhat.com ([82.142.8.70]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MjPYI-1p1FoR2Qos-00kwY0; Tue, 13 Sep 2022 08:40:17 +0200
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Gregory Kurz <gregory.kurz@free.fr>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PATCH v8 12/14] qemu-sockets: update socket_uri() and socket_parse()
 to be consistent
Date: Tue, 13 Sep 2022 08:39:58 +0200
Message-Id: <20220913064000.79353-13-lvivier@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220913064000.79353-1-lvivier@redhat.com>
References: <20220913064000.79353-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ULkTRjHX1EO4OuSt9aPSNgQ574jrlPG9gWpOce0FhF7DtQqyE3k
 P0efyxth5m8uaVirJX4AmPx9yJKswquXYPKdSoMGTAYlnt8bo01dRIWTW3riVYZSSm/Ukjc
 y68BSbvZoIuh3cto6TV2f5ytwBwb9SeCE7WRLPHFXuMdCo45kp/qPyxEGRLgSe63SWM/3fl
 1JBkyir/1nq+hQI5ZDQ6Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:PtJHlVDFxQk=:fe4e7nAO8qIxDNmVc7WzmV
 5BANbQP2l/ufofBM8A1EK8eMSqbkr8vnMXyWBNWGYe7+sr3zl71IdU08HzdXCavnibOeQ3n9x
 3fMXD77+92+bMGBVZQbERhXvj+FekaMaURSbkgRM9TADSeXp8EWkBbFuc+J0rFtU7TSSjkGvY
 mpnwXQ64pcjSuF/44naWoqoTvmvOcmcOLOyUok4wOEuoTLpInLWnpSL32HhFUrlOmDIt3XvE9
 zUzRbVFtvERmBqP2lgKzn3YjY9f7/387fj79I7IkjdyTw96PPCW0JIAyk6gYxjPzDLJfOKYec
 ysa6297rPhT/akO3b4ngj+EC4UNYqg96boA+Q+5EB0E6lQMNZiOWhqKobuousTywrgSwaLTF5
 dz2af7OPidSwXUDqvft4I+Q2gzSo6WJBzazEbo4P58HCg3+qSOwxur0UNU8spTuu6yBlhWy+j
 41OZpPQg1p/ioGTwx6sPCnWUsmmHPyM6PO8zMBNm+2wULuZi4ofgiJz8NkoW6gMlTikJ3w5Ik
 U4ZAxGr+8xYNJA5fq3DRu+K5Iz1m0PC6uMG4JS3U+VyObXVqpLl/uPOX7zX2vjSk/7C1zTv2u
 av9QmoUy/aXPcmBwiSpT1BzH5nPPp57rO9wP/l3lWBkwDDEPKpkl26QefXVRu+RLvT2JY+bWO
 7TzMj0c1g8db9/lKbhhu7wS9vAX1/Dsva4t8wIG6JeKq8ZQIWl9YVPmNQk4po54BI0qNWweL7
 Vkmsfyf0WqofuELTcaHWMt3eBnrDwrVq3Yz7V6SRRulqaGij3wvz9dbjVoMzPAGBj/BS3fyho
 0nc/zQp
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

To be consistent with socket_uri(), add 'tcp:' prefix for inet type in
socket_parse(), by default socket_parse() use tcp when no prefix is
provided (format is host:port).

In socket_uri(), use 'vsock:' prefix for vsock type rather than 'tcp:'
because it makes a vsock address look like an inet address with CID
misinterpreted as host.
Goes back to commit 9aca82ba31 "migration: Create socket-address parameter"

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
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



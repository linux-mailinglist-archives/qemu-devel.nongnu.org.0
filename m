Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 497B85F5899
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Oct 2022 18:49:26 +0200 (CEST)
Received: from localhost ([::1]:45340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1og7aG-0001Lm-QS
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 12:49:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1og795-0007Ra-Nw
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 12:21:20 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:55049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1og790-0002pA-SB
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 12:21:19 -0400
Received: from lenovo-t14s.redhat.com ([82.142.8.70]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1M9Frd-1oatwd12TH-006SDN; Wed, 05 Oct 2022 18:21:12 +0200
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
Subject: [PATCH v10 14/17] qemu-sockets: update socket_uri() and
 socket_parse() to be consistent
Date: Wed,  5 Oct 2022 18:20:48 +0200
Message-Id: <20221005162051.1120041-15-lvivier@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221005162051.1120041-1-lvivier@redhat.com>
References: <20221005162051.1120041-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:GWWVYRFEntX6I/jSjnd2IEjmhnoeCfWWgc/s2sp+ncSRf9AxXA7
 rtOW4Ceoj0to8VlYAFktx3rlhRSydqfF1ahX0LkAvCKBF6fMflpj8u2+DBT1P1V00G0Y685
 tUfSS7PZK8a5cNOX8fYM+lgs7SJEJ0DlcSC4sGJ6VSl6XC5evs7tQR4zl6QA46hKl2Hp7bw
 +5NoiZ2TB9EN3wamSn/oQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:eesP6tPN5LU=:6CYM2mqKk6LE+83FIgiBnj
 CAC6yeSWZ7+Y49VQuJBkmA6utdbhSeple7Qr+kocHHEQhUHNSTjJvVl3+a0KTVOscVzS5lX0L
 l6/3Ddw59kWAk9YvCRQmbZceqWeikBCk9kB6L26O/UN6No63ucU6fLdSLeyc5nwUGLi9PDT1E
 07HPGIyMwZaTOgTBG2PWIqsk8pqqXcnZOAXuJ3Y9pD0CBCiSy6RbS5u1KwWq0V1nvd/kEMZs4
 PS/PkIyU0LqB+o+kL0QWwbrsJuRKAqXe+hzPN6KVGaSOIzJECXAbyMAN05NfonCWmU+KacUdi
 d8fLz3MzhAfqxS0JomlPUrbA43n8mDUm/ocBIou6stbc21N5Nw90CzYCxNT8xAUuokyyMdZ+l
 Y8iQ3x64kSOCeGX6zLdpgGs1lojgV/escvfMacZKZOMMZGURWyTQ7i96LGuwv5ofnyatUSFTH
 c3v01UWf46WpXdXl0miOEf2OToPfLBMOIJvqEKT/OJXH/T9NRKjX9p60IqQJaH7k8MMEEs7ZN
 503e9AaGfW5Hsz46Nba1cCvjzejYMG+/z0vQKeepOmIj71czd+PzclQ2HBmAzELOjyB3ScW9B
 QPXZEFJ5Zu4KuId4Mkx40gUpp1yNpkPGT6OZ8CNoUKnSFjSvTxivm477cwr1+XCIsWEsHrG90
 pZjxpqQjpqlufZqRRbC5mD+L61ta7fBAn/V4oXs6QmCArDa6tfy3IUoaQ0vccYU1nrSaRN9Ux
 TmAGChygRJgTy53MHDtf8VO0Nb9nKmn4qTXYeuS5tN4sLAR+ttlPasbOYwYLEEgLVJgFM/lzI
 /WHvkrA
Received-SPF: permerror client-ip=212.227.17.24;
 envelope-from=lvivier@redhat.com; helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_FAIL=0.001, SPF_HELO_NONE=0.001 autolearn=no autolearn_force=no
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



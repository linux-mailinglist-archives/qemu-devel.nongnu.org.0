Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CB421963
	for <lists+qemu-devel@lfdr.de>; Fri, 17 May 2019 15:53:07 +0200 (CEST)
Received: from localhost ([127.0.0.1]:49000 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hRdII-0003Kl-Sw
	for lists+qemu-devel@lfdr.de; Fri, 17 May 2019 09:53:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35667)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sgarzare@redhat.com>) id 1hRdDU-0008St-8F
	for qemu-devel@nongnu.org; Fri, 17 May 2019 09:48:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sgarzare@redhat.com>) id 1hRdDS-0003Xo-AH
	for qemu-devel@nongnu.org; Fri, 17 May 2019 09:48:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43022)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sgarzare@redhat.com>) id 1hRdDQ-0003Vv-Im
	for qemu-devel@nongnu.org; Fri, 17 May 2019 09:48:06 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CDC4DC0A4F49
	for <qemu-devel@nongnu.org>; Fri, 17 May 2019 13:47:58 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-116-83.ams2.redhat.com
	[10.36.116.83])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 91CB37A463;
	Fri, 17 May 2019 13:47:57 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 17 May 2019 15:47:45 +0200
Message-Id: <20190517134748.340381-2-sgarzare@redhat.com>
In-Reply-To: <20190517134748.340381-1-sgarzare@redhat.com>
References: <20190517134748.340381-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Fri, 17 May 2019 13:47:58 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v3 1/4] net: fix assertion failure when
 ipv6-prefixlen is not a number
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Jason Wang <jasowang@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If 'ipv6-prefixlen' is not a number, the current behaviour
produces an assertion failure:
    $ qemu-system-x86_64 -net user,ipv6-net=3Dfeca::0/a
    qemu-system-x86_64: qemu/util/qemu-option.c:1175: qemu_opts_foreach:
    Assertion `!errp || !*errp' failed.
    Aborted (core dumped)

This patch fixes it, jumping to the end of the function when
'ipv6-prefixlen' is not a number, and printing the more friendly
message:
    $ qemu-system-x86_64 -net user,ipv6-net=3Dfeca::0/a
    qemu-system-x86_64: Parameter 'ipv6-prefixlen' expects a number

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
---
 net/net.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/net/net.c b/net/net.c
index 2cf5e76469..555504a404 100644
--- a/net/net.c
+++ b/net/net.c
@@ -1135,11 +1135,11 @@ static int net_client_init(QemuOpts *opts, bool i=
s_netdev, Error **errp)
=20
                 if (err) {
                     error_setg(errp, QERR_INVALID_PARAMETER_VALUE,
-                              "ipv6-prefix", "a number");
-                } else {
-                    qemu_opt_set_number(opts, "ipv6-prefixlen", len,
-                                        &error_abort);
+                               "ipv6-prefixlen", "a number");
+                    goto out;
                 }
+
+                qemu_opt_set_number(opts, "ipv6-prefixlen", len, &error_=
abort);
             }
             qemu_opt_unset(opts, "ipv6-net");
         }
@@ -1161,6 +1161,7 @@ static int net_client_init(QemuOpts *opts, bool is_=
netdev, Error **errp)
         qapi_free_NetLegacy(object);
     }
=20
+out:
     error_propagate(errp, err);
     visit_free(v);
     return ret;
--=20
2.20.1



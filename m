Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 754F55C7FE
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jul 2019 05:57:36 +0200 (CEST)
Received: from localhost ([::1]:48296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hi9vB-0007VJ-Qo
	for lists+qemu-devel@lfdr.de; Mon, 01 Jul 2019 23:57:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50372)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <jasowang@redhat.com>) id 1hi8aG-0004jA-MO
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 22:31:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jasowang@redhat.com>) id 1hi8aF-0003dM-0t
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 22:31:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45334)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jasowang@redhat.com>) id 1hi8aE-0003af-QU
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 22:31:50 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9693430872EA;
 Tue,  2 Jul 2019 02:31:42 +0000 (UTC)
Received: from jason-ThinkPad-T430s.redhat.com (ovpn-12-232.pek2.redhat.com
 [10.72.12.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DA25260C43;
 Tue,  2 Jul 2019 02:31:40 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Date: Tue,  2 Jul 2019 10:31:16 +0800
Message-Id: <1562034689-6539-5-git-send-email-jasowang@redhat.com>
In-Reply-To: <1562034689-6539-1-git-send-email-jasowang@redhat.com>
References: <1562034689-6539-1-git-send-email-jasowang@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Tue, 02 Jul 2019 02:31:42 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 04/17] net: fix assertion failure when
 ipv6-prefixlen is not a number
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Jason Wang <jasowang@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefano Garzarella <sgarzare@redhat.com>

If 'ipv6-prefixlen' is not a number, the current behaviour
produces an assertion failure:
    $ qemu-system-x86_64 -net user,ipv6-net=feca::0/a
    qemu-system-x86_64: qemu/util/qemu-option.c:1175: qemu_opts_foreach:
    Assertion `!errp || !*errp' failed.
    Aborted (core dumped)

This patch fixes it, jumping to the end of the function when
'ipv6-prefixlen' is not a number, and printing the more friendly
message:
    $ qemu-system-x86_64 -net user,ipv6-net=feca::0/a
    qemu-system-x86_64: Parameter 'ipv6-prefixlen' expects a number

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 net/net.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/net/net.c b/net/net.c
index 3e65c93..d21c2c7 100644
--- a/net/net.c
+++ b/net/net.c
@@ -1136,11 +1136,11 @@ static int net_client_init(QemuOpts *opts, bool is_netdev, Error **errp)
 
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
+                qemu_opt_set_number(opts, "ipv6-prefixlen", len, &error_abort);
             }
             qemu_opt_unset(opts, "ipv6-net");
         }
@@ -1162,6 +1162,7 @@ static int net_client_init(QemuOpts *opts, bool is_netdev, Error **errp)
         qapi_free_NetLegacy(object);
     }
 
+out:
     error_propagate(errp, err);
     visit_free(v);
     return ret;
-- 
2.5.0



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9594C607435
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 11:38:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oloTV-0001Zw-Tv
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 05:37:58 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olo2b-0003uE-MG
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 05:10:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1olo2I-0003ME-5V
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 05:09:53 -0400
Received: from mout.kundenserver.de ([217.72.192.73])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1olo2E-0001Zk-Mk
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 05:09:49 -0400
Received: from lenovo-t14s.redhat.com ([82.142.8.70]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MX0Xf-1ob0Fl1bC5-00XO1p; Fri, 21 Oct 2022 11:09:36 +0200
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
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefano Brivio <sbrivio@redhat.com>
Subject: [PATCH v14 07/17] net: socket: Don't ignore EINVAL on netdev socket
 connection
Date: Fri, 21 Oct 2022 11:09:12 +0200
Message-Id: <20221021090922.170074-8-lvivier@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221021090922.170074-1-lvivier@redhat.com>
References: <20221021090922.170074-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:bd+GEfX3VxfGbU9uQxgyK0I9xZKcP9lU6sbZ1cQiIG52z4WS3Es
 /LQbm/MXYJjkhbFCwEv/TgM9JyjYO8vYk9NLrNikDpZkleiObUICWJxLrjrxZWHTBwk47cN
 UX/vbrW2C1vbbJz3iiDT/01KoLue3SLSdmUxC1Iy2YLBUe9n3YdUaJ250nUfdueVygOl7Pu
 osvRgKANdZAEbxTToGTag==
X-UI-Out-Filterresults: notjunk:1;V03:K0:mkmviekNp8c=:WQ+FEdo19ymXo60ydZcbR4
 3kP52n0hTugu7HLO6S8Tm2slcIlNzQow+XtKta52lhGWgNdXDH/gP+HzolVeIXZeJ4uDIgPXt
 FziRx5AtAhxgBmRN2o13w4ryjg2DdmdM4SgfJVAc6njlP3htiy6f4U+PdRWm27uznXyEJa5AQ
 /iFCr4rHkBAvXR7z7+YcVU+JB0PjJYjov+0jTWFigcXAeE+KkNbfANYBKBggDIDgwCAZUhMs1
 CIl3990dkUjrnBamOR7CWB3etSydekTdkU16QqR/oMOE+y2S59s5H43ZA/A74XUhsrxpFLJq+
 usA7EfOJ+VCUyAZHL7b+m+EYy9I0yoxMmUts6TLdMUgeLEY/d9a4TKdAUCwY2+/Nv9GANBFk7
 O7JrBLq2u1QLOZIby7ANX5NMdhlD8dOFEp8SWjhg9KcZnWjpdoKvRQS8nhYyiqXo+jvwmRAAI
 Z+IB0D7bug+ybUjSEcd0OPsTtRaWlX5omRafca+I2DdlPTKJ/AamlE7mTcN3xUlbb9T7/zi1M
 AWd96D0lg+/enp9ktxESHAogVZWNoMChx9mTjPZ/RnfDG5YCxxps/y9BGK4dPgUyly6ha8JpN
 xdqUf82wK5vr7NhuB2O+QCidEE8bQ8AHtYbJXWlFBBrrUtZW7SbLTuQGvSIgf0Th10yL4U+5d
 +2zdDvk1SePidq68hJzOwCm5coxLPXKs1BTfRTX+ZUbJ3uu7KgP3+B6M4V/Y6DEd0N4w5QFja
 /NthcMxGH+FamiDIb7zr2xVNeCFHH6pZF0CRrluDy1oaDCeeI+RFGCD31S1Ah22Dfye4pjRh+
 aq3XA/a
Received-SPF: permerror client-ip=217.72.192.73;
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

From: Stefano Brivio <sbrivio@redhat.com>

Other errors are treated as failure by net_socket_connect_init(),
but if connect() returns EINVAL, we'll fail silently. Remove the
related exception.

Signed-off-by: Stefano Brivio <sbrivio@redhat.com>
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
---
 net/socket.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/net/socket.c b/net/socket.c
index ade1ecf38b87..4944bb70d580 100644
--- a/net/socket.c
+++ b/net/socket.c
@@ -577,8 +577,7 @@ static int net_socket_connect_init(NetClientState *peer,
             if (errno == EINTR || errno == EWOULDBLOCK) {
                 /* continue */
             } else if (errno == EINPROGRESS ||
-                       errno == EALREADY ||
-                       errno == EINVAL) {
+                       errno == EALREADY) {
                 break;
             } else {
                 error_setg_errno(errp, errno, "can't connect socket");
-- 
2.37.3



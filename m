Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03BEA5FBC1C
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 22:34:45 +0200 (CEST)
Received: from localhost ([::1]:51822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiLxc-0004pc-15
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 16:34:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oiLVy-0006PQ-FR
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 16:06:19 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:35899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oiLVu-0003kl-Vt
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 16:06:09 -0400
Received: from lenovo-t14s.redhat.com ([82.142.8.70]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1Mzyi6-1p3bSX1O22-00x1UI; Tue, 11 Oct 2022 22:05:55 +0200
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
 David Gibson <david@gibson.dropbear.id.au>, xen-devel@lists.xenproject.org,
 Stefano Brivio <sbrivio@redhat.com>
Subject: [PATCH v11 07/17] net: socket: Don't ignore EINVAL on netdev socket
 connection
Date: Tue, 11 Oct 2022 22:05:29 +0200
Message-Id: <20221011200539.1486809-8-lvivier@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221011200539.1486809-1-lvivier@redhat.com>
References: <20221011200539.1486809-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:s2d3Wu4MO8ol5DA6PF+FwRX2ngxklqX0Xg022HDVmevHfVNwSNH
 wNVip7KNnUp+1d6oD/lzE6UuU2ptIv0OUC+VJvfArwZSeHBalDq3QRxn9aursvew6XDrERc
 /dOp3LLGjARYN3oHDHZXdNFQvCtZZd07alTYAPeSy3wuoB56esM4Fv5u6IVhrkMxXYcxKpa
 5jTmu3R9fuCPRsqmZtIZg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:SsKt/PrHzOg=:RxXaAGqCcFTPq1Ui9f+XFu
 QvGhxbqWiHZ93SyVG59hGfTFa1pHKN7gxx4s5r1HazWDiCTWTqZgh1JOM0QjIAR2qVAIawO74
 F7UFf6X3vvQNZmy+cnbJMOfIW7FgvOG815DFO7IS5d8/1Jw9pEul+1jvw4SwyO7VYV1eNwjaz
 IDVf0LhI6rd8Y9lyKnHLrpSNIjooJYTeKyX8MhDgo5sR2BLGcNhqShiBbhB8mWeWw86NVVVhG
 rgKaUMU+P32b/fJ/xa0WqGa2ItdRfC9bpPhsmEhDwvFIeF7N5tNyNvWiK5YeDeAZ94KkLF5uK
 d6jkLKfETNs4Ist6FIMRTFs5Y1FliJ89R0cQ0/tagOcH998wYfIHWnM+z4YW9GTIxuJkUBR6F
 DWgGoHApOkSVQOwAb4p9vXeDhb/rdG8tgIy+3KhZYINESx5/0aL4miBAGAR6DyHYxG6vXqvqP
 e+Ah0OpluVNIb8ZLX6HrTZo4ITr9BnY5dbZpIOUWRXe36VIMxgX5lv8uDd3zvvsbHpZQe69Z/
 txcFYbX4pBEYiu/19N+ZA5KddJlT+Qwp15ra9W5TJnZ2qyfgCWtjj2sjpdB87I6nOY9vr4hYw
 2FBt0nOoWsD78F59XD6keFsE0sjo/b2xghk7A8K7wdkc2OI0BbIqmTVQQpykGTToyADJrGStn
 G997YVCvjhsCW/gyu7Fysj+2TXtFAuStHpH3Uadyaoqu8Ryc+aj5SHWMDlDn2ZDlSAXkGRBQj
 Yk2lf8kSWc7wJ+EJI5OuHXPeQXUqsZ1/ZXu+tmH0LtiU2SBZUUBQW6ac6rdFAW93/MfhicUoz
 fmWAe+T
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



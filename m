Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC67CD9C7
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Oct 2019 01:57:34 +0200 (CEST)
Received: from localhost ([::1]:37546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iHGP6-0001hC-SZ
	for lists+qemu-devel@lfdr.de; Sun, 06 Oct 2019 19:57:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52408)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1iHGNN-0000s2-8D
 for qemu-devel@nongnu.org; Sun, 06 Oct 2019 19:55:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1iHGNL-0008BE-OA
 for qemu-devel@nongnu.org; Sun, 06 Oct 2019 19:55:44 -0400
Received: from hera.aquilenet.fr ([185.233.100.1]:54130)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1iHGNL-0008As-Hv
 for qemu-devel@nongnu.org; Sun, 06 Oct 2019 19:55:43 -0400
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 507C91E8A;
 Mon,  7 Oct 2019 01:55:40 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vUduyMCM6u41; Mon,  7 Oct 2019 01:55:39 +0200 (CEST)
Received: from function.home (lfbn-bor-1-306-163.w109-215.abo.wanadoo.fr
 [109.215.28.163])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 3F4831FC5;
 Mon,  7 Oct 2019 01:55:39 +0200 (CEST)
Received: from samy by function.home with local (Exim 4.92.2)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1iHGNG-0008LA-8T; Mon, 07 Oct 2019 01:55:38 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 1/1] slirp: Allow non-local DNS address when restrict is off
Date: Mon,  7 Oct 2019 01:55:37 +0200
Message-Id: <20191006235537.32016-2-samuel.thibault@ens-lyon.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191006235537.32016-1-samuel.thibault@ens-lyon.org>
References: <20191006235537.32016-1-samuel.thibault@ens-lyon.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 185.233.100.1
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This can be used to set a DNS server to be used by the guest which is
different from the one configured on the host.

Buglink: https://bugs.launchpad.net/qemu/+bug/1010484
Signed-off-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 net/slirp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/slirp.c b/net/slirp.c
index f42f496641..c4334ee876 100644
--- a/net/slirp.c
+++ b/net/slirp.c
@@ -456,7 +456,7 @@ static int net_slirp_init(NetClientState *peer, const=
 char *model,
         error_setg(errp, "Failed to parse DNS");
         return -1;
     }
-    if ((dns.s_addr & mask.s_addr) !=3D net.s_addr) {
+    if (restricted && (dns.s_addr & mask.s_addr) !=3D net.s_addr) {
         error_setg(errp, "DNS doesn't belong to network");
         return -1;
     }
@@ -522,7 +522,7 @@ static int net_slirp_init(NetClientState *peer, const=
 char *model,
             error_setg(errp, "Failed to parse IPv6 DNS");
             return -1;
         }
-        if (!in6_equal_net(&ip6_prefix, &ip6_dns, vprefix6_len)) {
+        if (restricted && !in6_equal_net(&ip6_prefix, &ip6_dns, vprefix6=
_len)) {
             error_setg(errp, "IPv6 DNS doesn't belong to network");
             return -1;
         }
--=20
2.23.0



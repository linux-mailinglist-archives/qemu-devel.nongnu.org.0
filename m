Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8090C3990
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Oct 2019 17:53:23 +0200 (CEST)
Received: from localhost ([::1]:43772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iFKSo-00072s-Ik
	for lists+qemu-devel@lfdr.de; Tue, 01 Oct 2019 11:53:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48113)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1iFKGt-0002nk-Ku
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 11:41:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1iFKGs-0006xy-4G
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 11:41:03 -0400
Received: from hera.aquilenet.fr ([185.233.100.1]:48092)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1iFKGr-0006xD-UJ
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 11:41:02 -0400
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id D2F67C0EEF;
 Tue,  1 Oct 2019 17:41:00 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XQ75-pMmCk9r; Tue,  1 Oct 2019 17:41:00 +0200 (CEST)
Received: from function (unknown [109.190.253.14])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 02496C0EEE;
 Tue,  1 Oct 2019 17:41:00 +0200 (CEST)
Received: from samy by function with local (Exim 4.92.2)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1iFKGo-00076F-T7; Tue, 01 Oct 2019 17:40:58 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: qemu-devel@nongnu.org, jasowang@redhat.com, marcandre.lureau@gmail.com,
 philmd@redhat.com
Subject: [PATCHv2] slirp: Allow non-local DNS address when restrict is off
Date: Tue,  1 Oct 2019 17:40:57 +0200
Message-Id: <20191001154057.27250-1-samuel.thibault@ens-lyon.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This can be used to set a DNS server to be used by the guest which is
different from the one configured on the host.

Buglink: https://bugs.launchpad.net/qemu/+bug/1010484
Signed-off-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
---
Difference from first version:
- handle DNS IPv6 as well
- reference bug with Buglink

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



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D040A8001F
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Aug 2019 20:21:20 +0200 (CEST)
Received: from localhost ([::1]:36778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1htcB5-00037M-Qu
	for lists+qemu-devel@lfdr.de; Fri, 02 Aug 2019 14:21:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58768)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1htbvY-0007L2-DB
 for qemu-devel@nongnu.org; Fri, 02 Aug 2019 14:05:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1htbvU-0002C1-Ig
 for qemu-devel@nongnu.org; Fri, 02 Aug 2019 14:05:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41288)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1htbvQ-0001zJ-PF
 for qemu-devel@nongnu.org; Fri, 02 Aug 2019 14:05:11 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E561B99BAC;
 Fri,  2 Aug 2019 18:05:00 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-40.brq.redhat.com [10.40.204.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A6C155D9E2;
 Fri,  2 Aug 2019 18:04:58 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri,  2 Aug 2019 20:04:49 +0200
Message-Id: <20190802180449.10288-2-philmd@redhat.com>
In-Reply-To: <20190802180449.10288-1-philmd@redhat.com>
References: <20190802180449.10288-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Fri, 02 Aug 2019 18:05:00 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH-for-3.1.1 1/1] Fix heap overflow in ip_reass on
 big packet input
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, Jan Kiszka <jan.kiszka@siemens.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Samuel Thibault <samuel.thibault@ens-lyon.org>

When the first fragment does not fit in the preallocated buffer, q will
already be pointing to the ext buffer, so we mustn't try to update it.

Signed-off-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
(cherry picked from libslirp commit 126c04acbabd7ad32c2b018fe10dfac2a3bc1=
210)
Fixes: CVE-2019-14378
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 slirp/ip_input.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/slirp/ip_input.c b/slirp/ip_input.c
index 348e1dca5a..07d8808671 100644
--- a/slirp/ip_input.c
+++ b/slirp/ip_input.c
@@ -334,6 +334,8 @@ insert:
     q =3D fp->frag_link.next;
 	m =3D dtom(slirp, q);
=20
+	int was_ext =3D m->m_flags & M_EXT;
+
 	q =3D (struct ipasfrag *) q->ipf_next;
 	while (q !=3D (struct ipasfrag*)&fp->frag_link) {
 	  struct mbuf *t =3D dtom(slirp, q);
@@ -356,7 +358,7 @@ insert:
 	 * the old buffer (in the mbuf), so we must point ip
 	 * into the new buffer.
 	 */
-	if (m->m_flags & M_EXT) {
+	if (!was_ext && m->m_flags & M_EXT) {
 	  int delta =3D (char *)q - m->m_dat;
 	  q =3D (struct ipasfrag *)(m->m_ext + delta);
 	}
--=20
2.20.1



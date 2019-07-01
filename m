Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E84BE26A61
	for <lists+qemu-devel@lfdr.de>; Wed, 22 May 2019 21:01:26 +0200 (CEST)
Received: from localhost ([127.0.0.1]:49689 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTWUP-00047H-Uh
	for lists+qemu-devel@lfdr.de; Wed, 22 May 2019 15:01:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34795)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1hTWOY-00086e-If
	for qemu-devel@nongnu.org; Wed, 22 May 2019 14:55:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1hTWHS-0002MI-Fc
	for qemu-devel@nongnu.org; Wed, 22 May 2019 14:48:03 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:47800 helo=mail.rt-rk.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
	id 1hTWHS-0001mm-96
	for qemu-devel@nongnu.org; Wed, 22 May 2019 14:48:02 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.rt-rk.com (Postfix) with ESMTP id 0C1E61A4516;
	Wed, 22 May 2019 20:46:58 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
	[10.10.13.43])
	by mail.rt-rk.com (Postfix) with ESMTPSA id E759D1A2238;
	Wed, 22 May 2019 20:46:57 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Wed, 22 May 2019 20:46:21 +0200
Message-Id: <1558550785-20098-2-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558550785-20098-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1558550785-20098-1-git-send-email-aleksandar.markovic@rt-rk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH 1/5] linux-user: Fix sigismember() check
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
Cc: lvivier@redhat.com,
	=?UTF-8?q?Milo=C5=A1=20Stojanovi=C4=87?= <Milos.Stojanovic@rt-rk.com>,
	amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Milo=C5=A1 Stojanovi=C4=87 <Milos.Stojanovic@rt-rk.com>

Fix copying between the host and target signal sets for the case when
the target set is larger than the host set.

sigismember() returns 1 if the specified signal number is a member of
the specified signal set, but it can also return -1 if an error occurs
(e.g. an out of range signal number is specified). All non-zero values
would cause the signal to be added, so a comparison with 1 is added to
assure that only the signals which are really in the set get added to
the other set.

Signed-off-by: Milo=C5=A1 Stojanovi=C4=87 <Milos.Stojanovic@rt-rk.com>
Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
---
 linux-user/signal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/signal.c b/linux-user/signal.c
index 44b2d3b..c08a7fe 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -116,7 +116,7 @@ void host_to_target_sigset_internal(target_sigset_t *=
d,
     int i;
     target_sigemptyset(d);
     for (i =3D 1; i <=3D TARGET_NSIG; i++) {
-        if (sigismember(s, i)) {
+        if (sigismember(s, i) =3D=3D 1) {
             target_sigaddset(d, host_to_target_signal(i));
         }
     }
--=20
2.7.4



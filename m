Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F254317A99
	for <lists+qemu-devel@lfdr.de>; Wed,  8 May 2019 15:27:27 +0200 (CEST)
Received: from localhost ([127.0.0.1]:37192 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hOMbX-00010T-15
	for lists+qemu-devel@lfdr.de; Wed, 08 May 2019 09:27:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35004)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1hOMWe-00047t-7n
	for qemu-devel@nongnu.org; Wed, 08 May 2019 09:22:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1hOMWd-0001B1-Bi
	for qemu-devel@nongnu.org; Wed, 08 May 2019 09:22:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59116)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mreitz@redhat.com>)
	id 1hOMWb-00016A-3c; Wed, 08 May 2019 09:22:21 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 22200356FF;
	Wed,  8 May 2019 13:22:19 +0000 (UTC)
Received: from localhost (ovpn-204-94.brq.redhat.com [10.40.204.94])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A8F8B600D4;
	Wed,  8 May 2019 13:22:18 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Wed,  8 May 2019 15:22:07 +0200
Message-Id: <20190508132209.17707-4-mreitz@redhat.com>
In-Reply-To: <20190508132209.17707-1-mreitz@redhat.com>
References: <20190508132209.17707-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Wed, 08 May 2019 13:22:19 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 3/5] qemu-nbd: Do not close stderr
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
	Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We kept old_stderr specifically so we could keep emitting error message
on stderr.  However, qemu_daemon() closes stderr.  Therefore, we need to
dup() stderr to old_stderr before invoking qemu_daemon().

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 qemu-nbd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/qemu-nbd.c b/qemu-nbd.c
index 4866042160..62c547a363 100644
--- a/qemu-nbd.c
+++ b/qemu-nbd.c
@@ -1015,10 +1015,11 @@ int main(int argc, char **argv)
             exit(EXIT_FAILURE);
         } else if (pid =3D=3D 0) {
             close(stderr_fd[0]);
+
+            old_stderr =3D dup(STDERR_FILENO);
             ret =3D qemu_daemon(1, 0);
=20
             /* Temporarily redirect stderr to the parent's pipe...  */
-            old_stderr =3D dup(STDERR_FILENO);
             dup2(stderr_fd[1], STDERR_FILENO);
             if (ret < 0) {
                 error_report("Failed to daemonize: %s", strerror(errno))=
;
--=20
2.20.1



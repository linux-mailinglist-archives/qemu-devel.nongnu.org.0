Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89997A9D09
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Sep 2019 10:32:15 +0200 (CEST)
Received: from localhost ([::1]:43188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i5nBe-0007SG-Bv
	for lists+qemu-devel@lfdr.de; Thu, 05 Sep 2019 04:32:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32791)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1i5n9S-0006a6-J4
 for qemu-devel@nongnu.org; Thu, 05 Sep 2019 04:29:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1i5n9R-0005FK-JR
 for qemu-devel@nongnu.org; Thu, 05 Sep 2019 04:29:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48354)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1i5n9R-0005Es-E0
 for qemu-devel@nongnu.org; Thu, 05 Sep 2019 04:29:57 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6F7E6308AA11
 for <qemu-devel@nongnu.org>; Thu,  5 Sep 2019 08:29:56 +0000 (UTC)
Received: from localhost (ovpn-117-222.ams2.redhat.com [10.36.117.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 67CAD5C25B;
 Thu,  5 Sep 2019 08:29:48 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com
Date: Thu,  5 Sep 2019 09:29:45 +0100
Message-Id: <20190905082947.6633-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Thu, 05 Sep 2019 08:29:56 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH RESEND 0/2] virtiofsd: use "fuse_log.h" APIs
 instead of <err.h>
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
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

warn(3), warnx(3), err(3), and errx(3) print to stderr even when the --sy=
slog
option was given.  In this case messages to stderr are likely to be lost =
and
this makes troubleshooting hard.  Use "fuse_log.h" APIs instead of <err.h=
>.

Stefan Hajnoczi (2):
  virtiofsd: replace warn(3) and warnx(3) with fuse_warning()
  virtiofsd: replace err(3) and errx(3) with fuse_err()

 contrib/virtiofsd/passthrough_ll.c | 143 ++++++++++++++++++-----------
 contrib/virtiofsd/seccomp.c        |  15 ++-
 2 files changed, 99 insertions(+), 59 deletions(-)

--=20
2.21.0



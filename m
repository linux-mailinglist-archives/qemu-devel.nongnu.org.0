Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 670089AB4E
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Aug 2019 11:27:46 +0200 (CEST)
Received: from localhost ([::1]:53248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i15rF-0000Zk-8V
	for lists+qemu-devel@lfdr.de; Fri, 23 Aug 2019 05:27:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51741)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1i15nn-0004ZJ-O0
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 05:24:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1i15nm-0001xw-U5
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 05:24:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48590)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1i15nm-0001xP-PL
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 05:24:10 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9D02418C4277
 for <qemu-devel@nongnu.org>; Fri, 23 Aug 2019 09:24:08 +0000 (UTC)
Received: from localhost (ovpn-117-204.ams2.redhat.com [10.36.117.204])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 118EF4526;
 Fri, 23 Aug 2019 09:24:02 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 23 Aug 2019 10:23:59 +0100
Message-Id: <20190823092401.11883-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.62]); Fri, 23 Aug 2019 09:24:08 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 0/2] virtiofsd: use "fuse_log.h" APIs instead
 of <err.h>
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



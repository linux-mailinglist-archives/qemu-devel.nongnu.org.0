Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2609C9B274
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Aug 2019 16:51:51 +0200 (CEST)
Received: from localhost ([::1]:57318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i1Aur-0001nY-Sn
	for lists+qemu-devel@lfdr.de; Fri, 23 Aug 2019 10:51:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51296)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1i1Ah2-0003yD-9m
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 10:37:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1i1Ah0-0004Yk-Ba
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 10:37:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41474)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1i1Ah0-0004YC-0F
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 10:37:30 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5BBA918C8910;
 Fri, 23 Aug 2019 14:37:29 +0000 (UTC)
Received: from blue.redhat.com (ovpn-116-234.phx2.redhat.com [10.3.116.234])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D4F6E6CE58;
 Fri, 23 Aug 2019 14:37:26 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 23 Aug 2019 09:37:21 -0500
Message-Id: <20190823143726.27062-1-eblake@redhat.com>
In-Reply-To: <25ead363-4f37-5450-b985-1876374e314d@redhat.com>
References: <25ead363-4f37-5450-b985-1876374e314d@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.70]); Fri, 23 Aug 2019 14:37:29 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 0/5] Add NBD fast zero support to qemu client
 and server
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
Cc: libguestfs@redhat.com, nbd@other.debian.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

See the cross-post cover letter for more details:
https://www.redhat.com/archives/libguestfs/2019-August/msg00322.html

Based-on: https://lists.gnu.org/archive/html/qemu-devel/2019-08/msg04805.=
html
[Andrey Shinkevich block: workaround for unaligned byte range in fallocat=
e()]

Eric Blake (5):
  nbd: Improve per-export flag handling in server
  nbd: Prepare for NBD_CMD_FLAG_FAST_ZERO
  nbd: Implement client use of NBD FAST_ZERO
  nbd: Implement server use of NBD FAST_ZERO
  nbd: Tolerate more errors to structured reply request

 docs/interop/nbd.txt |  3 +-
 include/block/nbd.h  |  6 +++-
 block/nbd.c          |  7 +++++
 blockdev-nbd.c       |  3 +-
 nbd/client.c         | 39 ++++++++++++++----------
 nbd/common.c         |  5 ++++
 nbd/server.c         | 70 ++++++++++++++++++++++++++------------------
 qemu-nbd.c           |  7 +++--
 8 files changed, 88 insertions(+), 52 deletions(-)

--=20
2.21.0



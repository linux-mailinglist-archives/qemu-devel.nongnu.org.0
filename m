Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B98D9685
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Oct 2019 18:10:12 +0200 (CEST)
Received: from localhost ([::1]:45184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iKlsJ-000295-Le
	for lists+qemu-devel@lfdr.de; Wed, 16 Oct 2019 12:10:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57468)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1iKlkX-0003jT-Lt
 for qemu-devel@nongnu.org; Wed, 16 Oct 2019 12:02:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1iKlkV-00085h-AC
 for qemu-devel@nongnu.org; Wed, 16 Oct 2019 12:02:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:32652)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1iKlkV-000840-4x
 for qemu-devel@nongnu.org; Wed, 16 Oct 2019 12:02:07 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 09C5FC0546D5
 for <qemu-devel@nongnu.org>; Wed, 16 Oct 2019 16:02:05 +0000 (UTC)
Received: from localhost (unknown [10.36.118.69])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8571A601B7;
 Wed, 16 Oct 2019 16:01:58 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] virtiofsd: add net and pid namespace sandboxing
Date: Wed, 16 Oct 2019 17:01:55 +0100
Message-Id: <20191016160157.12414-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Wed, 16 Oct 2019 16:02:05 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: virtio-fs@redhat.com, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These patches are based on gitlab.com/virtio-fs/qemu.git virtio-fs-dev.

virtiofsd is sandboxed so that it does not have access to the system in t=
he
event that the process is compromised.  At the moment we use seccomp and =
mount
namespaces to restrict the list of allowed syscalls and only give access =
to the
shared directory.

This patch series enhances sandboxing by putting virtiofsd into an empty
network and pid namespace.  If the process is compromised it will be unab=
le to
perform network activity, even to localhost services running on the host.=
  It
will also be unable to see other processes running on the system since it=
 runs
as pid 1 in a new pid namespace.

These enhancements are inspired by the Crosvm virtio-fs device's jail
configuration.

Stefan Hajnoczi (2):
  virtiofsd: move to an empty network namespace
  virtiofsd: move to a new pid namespace

 contrib/virtiofsd/passthrough_ll.c | 109 +++++++++++++++++++++++------
 1 file changed, 86 insertions(+), 23 deletions(-)

--=20
2.21.0



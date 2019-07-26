Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E89C2760E4
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jul 2019 10:34:01 +0200 (CEST)
Received: from localhost ([::1]:37362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hqvfs-0000Ek-7o
	for lists+qemu-devel@lfdr.de; Fri, 26 Jul 2019 04:34:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43570)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <stefanha@redhat.com>) id 1hqvfR-0007si-Hi
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 04:33:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1hqvfP-0001Am-EN
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 04:33:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39000)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1hqvfP-0000yj-69
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 04:33:31 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 10FA730C34CA
 for <qemu-devel@nongnu.org>; Fri, 26 Jul 2019 08:33:29 +0000 (UTC)
Received: from localhost (ovpn-117-212.ams2.redhat.com [10.36.117.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DDF7D87B6;
 Fri, 26 Jul 2019 08:33:23 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com
Date: Fri, 26 Jul 2019 09:33:19 +0100
Message-Id: <20190726083322.13637-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Fri, 26 Jul 2019 08:33:29 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 0/3] virtiofsd: add FUSE_INIT map_alignment
 field
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
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The client must know the server's alignment constraints for FUSE_SETUPMAP=
PING
and FUSE_REMOVEMAPPING.  This is necessary because mmap(2)/munmap(2) have
alignment constraints and the guest may have a different page size from t=
he
host.  The new FUSE_INIT map_alignment field communicates this informatio=
n to
the client.

Stefan Hajnoczi (3):
  virtiofsd: sync up fuse.h Linux 5.1 header
  virtiofsd: add map_alignment to fuse_kernel.h
  virtiofsd: implement FUSE_INIT map_alignment field

 contrib/virtiofsd/fuse_kernel.h   | 56 +++++++++++++++++++++----------
 contrib/virtiofsd/fuse_lowlevel.c |  8 +++++
 2 files changed, 47 insertions(+), 17 deletions(-)

--=20
2.21.0



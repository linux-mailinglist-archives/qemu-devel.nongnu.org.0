Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 891FBCE573
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Oct 2019 16:39:22 +0200 (CEST)
Received: from localhost ([::1]:45578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iHUAS-0005tv-Tv
	for lists+qemu-devel@lfdr.de; Mon, 07 Oct 2019 10:39:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41199)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iHU81-0003yA-BZ
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 10:36:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iHU7z-0005QB-2P
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 10:36:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49142)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iHU7y-0005Pi-Sz
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 10:36:47 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9FBDD7F749
 for <qemu-devel@nongnu.org>; Mon,  7 Oct 2019 14:36:45 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-117-145.ams2.redhat.com
 [10.36.117.145])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C5D5B60C05;
 Mon,  7 Oct 2019 14:36:44 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	pbonzini@redhat.com,
	berrange@redhat.com
Subject: [PATCH v4 0/5] Automatic RCU read unlock
Date: Mon,  7 Oct 2019 15:36:36 +0100
Message-Id: <20191007143642.301445-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.71]); Mon, 07 Oct 2019 14:36:45 +0000 (UTC)
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

This patch uses glib's g_auto mechanism to automatically free
rcu_read_lock's at the end of the block.  Given that humans
have a habit of forgetting an error path somewhere it's
best to leave it to the compiler.

v4
  Mark the '_rcu_read_auto_' variable as 'unused'
  to work around a clang bug.


Dr. David Alan Gilbert (5):
  rcu: Add automatically released rcu_read_lock variants
  migration: Fix missing rcu_read_unlock
  migration: Use automatic rcu_read unlock in ram.c
  migration: Use automatic rcu_read unlock in rdma.c
  rcu: Use automatic rc_read unlock in core memory/exec code

 docs/devel/rcu.txt      |  16 +++
 exec.c                  | 116 +++++++---------
 include/exec/ram_addr.h | 138 +++++++++----------
 include/qemu/rcu.h      |  25 ++++
 memory.c                |  15 +--
 migration/ram.c         | 286 +++++++++++++++++++---------------------
 migration/rdma.c        |  57 ++------
 7 files changed, 304 insertions(+), 349 deletions(-)

--=20
2.23.0



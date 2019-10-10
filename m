Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA47BD3309
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Oct 2019 23:04:56 +0200 (CEST)
Received: from localhost ([::1]:44224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIfcF-0006ep-A3
	for lists+qemu-devel@lfdr.de; Thu, 10 Oct 2019 17:04:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60254)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1iIfY3-0004oM-Kh
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 17:00:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1iIfXx-0007Er-7e
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 17:00:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56422)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>)
 id 1iIfXr-0007Ch-IO; Thu, 10 Oct 2019 17:00:25 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 061463018ECB;
 Thu, 10 Oct 2019 21:00:19 +0000 (UTC)
Received: from blue.redhat.com (ovpn-116-168.phx2.redhat.com [10.3.116.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8501360600;
 Thu, 10 Oct 2019 21:00:18 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] Better NBD string length handling
Date: Thu, 10 Oct 2019 16:00:16 -0500
Message-Id: <20191010210018.22000-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Thu, 10 Oct 2019 21:00:19 +0000 (UTC)
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, qemu-block@nongnu.org,
 mlevitsk@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Patch 1 is a revised version after Maxim's comments - it moves the
length checks earlier into the system (for cleaner error messages
as soon as possible) and adds asserts at the later points that
are now guaranteed by the earlier checks. It also covers more
string handling, both in the client and in the server, by
ensuring that outgoing strings are properly constrained and
incoming strings are checked for validity before blind use.

Patch 2 is a new patch, written to make testing of description
strings in patch 1 easier.

Eric Blake (2):
  nbd: Don't send oversize strings
  nbd: Allow description when creating NBD blockdev

 qapi/block.json            |  8 +++++---
 include/block/nbd.h        |  1 +
 block/nbd.c                |  9 +++++++++
 blockdev-nbd.c             | 14 +++++++++++++-
 monitor/hmp-cmds.c         |  4 ++--
 nbd/client.c               | 16 +++++++++++++---
 nbd/server.c               | 14 ++++++++++++--
 qemu-nbd.c                 |  9 +++++++++
 tests/qemu-iotests/223     |  2 +-
 tests/qemu-iotests/223.out |  1 +
 10 files changed, 66 insertions(+), 12 deletions(-)

--=20
2.21.0



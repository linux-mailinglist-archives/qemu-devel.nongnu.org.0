Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E79D498C
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Oct 2019 22:57:41 +0200 (CEST)
Received: from localhost ([::1]:56916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iJ1ym-0007hA-1T
	for lists+qemu-devel@lfdr.de; Fri, 11 Oct 2019 16:57:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51708)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1iJ1xR-0006Uq-S6
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 16:56:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1iJ1xQ-0001NZ-TT
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 16:56:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54024)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>)
 id 1iJ1xO-0001Ml-8k; Fri, 11 Oct 2019 16:56:14 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 81CA530624D0;
 Fri, 11 Oct 2019 20:56:13 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.36.118.111])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 60E8E60A97;
 Fri, 11 Oct 2019 20:56:12 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 0/4] qemu-img/io/nbd: Support help options for --object
Date: Fri, 11 Oct 2019 22:55:47 +0200
Message-Id: <20191011205551.32149-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Fri, 11 Oct 2019 20:56:13 +0000 (UTC)
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series fixes that the tools don't consider help options for
--object and just treat them as regular object properties. For example:

    $ ./qemu-io --object secret,help
    qemu-io: Parameter 'id' is missing

With these patches, we get the expected behaviour like in the system
emulator.

Kevin Wolf (4):
  vl: Split off user_creatable_print_help()
  qemu-io: Support help options for --object
  qemu-img: Support help options for --object
  qemu-nbd: Support help options for --object

 include/qom/object_interfaces.h | 12 +++++++
 qemu-img.c                      | 34 +++++++++++-------
 qemu-io.c                       |  9 ++++-
 qemu-nbd.c                      |  9 ++++-
 qom/object_interfaces.c         | 61 +++++++++++++++++++++++++++++++++
 vl.c                            | 52 +---------------------------
 6 files changed, 111 insertions(+), 66 deletions(-)

--=20
2.20.1



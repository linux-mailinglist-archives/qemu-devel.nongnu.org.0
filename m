Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6030A1BDA7E
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Apr 2020 13:20:48 +0200 (CEST)
Received: from localhost ([::1]:43128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jTklj-0006Hh-2D
	for lists+qemu-devel@lfdr.de; Wed, 29 Apr 2020 07:20:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47000)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1jTkii-00059W-67
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 07:19:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1jTkh0-0005qM-Lo
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 07:17:39 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:53549
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jTkh0-0005p3-55
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 07:15:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588158953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8K9ILy4NisMzFpmvEtSfXwMGA2d4XlbDY/73o8lKr8A=;
 b=HZ1UdHdzgLkRwBiyx3oiehvtxDW1ayHWJz7o2EAbhkutl9pXC0KnmF4PWVOHEKRCfrqVer
 Al3cnTJ92uJ8WfpKaaQWcPi+Pgm8v64tq9jTSBaB2plyCMDgmtK4osXAp64KhfWHIfrzDp
 gh3PODxeNbFbyBuE9+rqVg/97vcdDGE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-300-diHfmZDOPY6U6rQv_6dIEw-1; Wed, 29 Apr 2020 07:15:49 -0400
X-MC-Unique: diHfmZDOPY6U6rQv_6dIEw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 99169107ACCA;
 Wed, 29 Apr 2020 11:15:48 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-114-66.ams2.redhat.com [10.36.114.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1CDB060BF4;
 Wed, 29 Apr 2020 11:15:46 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 0/3] backup: Make sure that source and target size match
Date: Wed, 29 Apr 2020 13:15:36 +0200
Message-Id: <20200429111539.42103-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/29 00:53:13
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kevin Wolf (3):
  backup: Improve error for bdrv_getlength() failure
  backup: Make sure that source and target size match
  iotests: Backup with different source/target size

 block/backup-top.c         | 12 +++++---
 block/backup.c             | 18 ++++++++++--
 tests/qemu-iotests/055     | 60 ++++++++++++++++++++++++++++++++++++--
 tests/qemu-iotests/055.out |  4 +--
 4 files changed, 83 insertions(+), 11 deletions(-)

--=20
2.25.3



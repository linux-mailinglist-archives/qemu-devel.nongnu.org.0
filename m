Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5416519DD59
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Apr 2020 20:01:58 +0200 (CEST)
Received: from localhost ([::1]:59148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jKQdg-0000lQ-PD
	for lists+qemu-devel@lfdr.de; Fri, 03 Apr 2020 14:01:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38673)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1jKQb9-0007qJ-74
 for qemu-devel@nongnu.org; Fri, 03 Apr 2020 13:59:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1jKQb7-0006sb-CX
 for qemu-devel@nongnu.org; Fri, 03 Apr 2020 13:59:18 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:58133
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1jKQb7-0006qS-8h
 for qemu-devel@nongnu.org; Fri, 03 Apr 2020 13:59:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585936756;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=MXLaJnz0dTzFJCZeI+MOn2vphKqe8QQnmWinGoiqH50=;
 b=KYt2ZDVRIrUu1e8x3FXls0pOelWxgGLkvFoCDDrO/n5qHDEqUTVMgz9zBpnl32fK3SUaFW
 /YsJUWSzszv3U/1bE6etJLpYb1+7Z/5KWNJPrpcU7M/+PJF+a1OHQGDQUAI5IsoW3coWVz
 bPv3SI5mnu5H8cbJOk6Ed4PB4v5oUP4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-xHgjrrfWONytj5v63hgaGw-1; Fri, 03 Apr 2020 13:59:12 -0400
X-MC-Unique: xHgjrrfWONytj5v63hgaGw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BCDC48017FC;
 Fri,  3 Apr 2020 17:59:11 +0000 (UTC)
Received: from blue.redhat.com (ovpn-113-246.phx2.redhat.com [10.3.113.246])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 160FF5C553;
 Fri,  3 Apr 2020 17:59:00 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 for-5.0? 0/7] Tighten qemu-img rules on missing backing
 format
Date: Fri,  3 Apr 2020 12:58:52 -0500
Message-Id: <20200403175859.863248-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: kwolf@redhat.com, pkrempa@redhat.com, qemu-block@nongnu.org,
 kchamart@redhat.com, libvir-list@redhat.com, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v4 was here:
https://lists.gnu.org/archive/html/qemu-devel/2020-03/msg03775.html
In v5:
- fix 'qemu-img convert -B' to actually warn [Kashyap]
- squash in followups
- a couple more iotest improvements

If we decide this is not 5.0 material, then patches 4 and 7 need a
tweak to s/5.0/5.1/ as the start of the deprecation clock.

Eric Blake (7):
  sheepdog: Add trivial backing_fmt support
  vmdk: Add trivial backing_fmt support
  qcow: Tolerate backing_fmt=3D, but warn on backing_fmt=3Draw
  qcow2: Deprecate use of qemu-img amend to change backing file
  iotests: Specify explicit backing format where sensible
  block: Add support to warn on backing file change without format
  qemu-img: Deprecate use of -b without -F

 docs/system/deprecated.rst    | 32 ++++++++++++++++
 docs/tools/qemu-img.rst       |  4 ++
 include/block/block.h         |  4 +-
 block.c                       | 34 +++++++++++++++--
 block/qcow.c                  | 16 +++++++-
 block/qcow2.c                 |  7 +++-
 block/sheepdog.c              | 18 ++++++++-
 block/stream.c                |  2 +-
 block/vmdk.c                  | 14 +++++++
 blockdev.c                    |  3 +-
 qemu-img.c                    | 11 +++++-
 tests/qemu-iotests/017        |  2 +-
 tests/qemu-iotests/017.out    |  2 +-
 tests/qemu-iotests/018        |  2 +-
 tests/qemu-iotests/018.out    |  2 +-
 tests/qemu-iotests/019        |  5 ++-
 tests/qemu-iotests/019.out    |  2 +-
 tests/qemu-iotests/020        |  4 +-
 tests/qemu-iotests/020.out    |  4 +-
 tests/qemu-iotests/024        |  8 ++--
 tests/qemu-iotests/024.out    |  5 ++-
 tests/qemu-iotests/028        |  4 +-
 tests/qemu-iotests/028.out    |  2 +-
 tests/qemu-iotests/030        | 26 +++++++++----
 tests/qemu-iotests/034        |  2 +-
 tests/qemu-iotests/034.out    |  2 +-
 tests/qemu-iotests/037        |  2 +-
 tests/qemu-iotests/037.out    |  2 +-
 tests/qemu-iotests/038        |  2 +-
 tests/qemu-iotests/038.out    |  2 +-
 tests/qemu-iotests/039        |  3 +-
 tests/qemu-iotests/039.out    |  2 +-
 tests/qemu-iotests/040        | 47 ++++++++++++++++-------
 tests/qemu-iotests/041        | 37 ++++++++++++------
 tests/qemu-iotests/042        |  4 +-
 tests/qemu-iotests/043        | 18 ++++-----
 tests/qemu-iotests/043.out    | 16 +++++---
 tests/qemu-iotests/046        |  2 +-
 tests/qemu-iotests/046.out    |  2 +-
 tests/qemu-iotests/050        |  4 +-
 tests/qemu-iotests/050.out    |  2 +-
 tests/qemu-iotests/051        |  2 +-
 tests/qemu-iotests/051.out    |  2 +-
 tests/qemu-iotests/051.pc.out |  2 +-
 tests/qemu-iotests/056        |  3 +-
 tests/qemu-iotests/060        |  2 +-
 tests/qemu-iotests/060.out    |  2 +-
 tests/qemu-iotests/061        | 10 ++---
 tests/qemu-iotests/061.out    | 11 +++---
 tests/qemu-iotests/069        |  2 +-
 tests/qemu-iotests/069.out    |  2 +-
 tests/qemu-iotests/073        |  2 +-
 tests/qemu-iotests/073.out    |  2 +-
 tests/qemu-iotests/082        | 10 +++--
 tests/qemu-iotests/082.out    | 14 ++++---
 tests/qemu-iotests/085        |  4 +-
 tests/qemu-iotests/085.out    |  6 +--
 tests/qemu-iotests/089        |  2 +-
 tests/qemu-iotests/089.out    |  2 +-
 tests/qemu-iotests/095        |  4 +-
 tests/qemu-iotests/095.out    |  4 +-
 tests/qemu-iotests/097        |  4 +-
 tests/qemu-iotests/097.out    | 16 ++++----
 tests/qemu-iotests/098        |  2 +-
 tests/qemu-iotests/098.out    |  8 ++--
 tests/qemu-iotests/110        |  4 +-
 tests/qemu-iotests/110.out    |  4 +-
 tests/qemu-iotests/114        | 12 ++++++
 tests/qemu-iotests/114.out    |  9 +++++
 tests/qemu-iotests/122        | 27 +++++++------
 tests/qemu-iotests/122.out    |  8 ++--
 tests/qemu-iotests/126        |  4 +-
 tests/qemu-iotests/126.out    |  4 +-
 tests/qemu-iotests/127        |  4 +-
 tests/qemu-iotests/127.out    |  4 +-
 tests/qemu-iotests/129        |  3 +-
 tests/qemu-iotests/133        |  2 +-
 tests/qemu-iotests/133.out    |  2 +-
 tests/qemu-iotests/139        |  2 +-
 tests/qemu-iotests/141        |  4 +-
 tests/qemu-iotests/141.out    |  4 +-
 tests/qemu-iotests/142        |  2 +-
 tests/qemu-iotests/142.out    |  2 +-
 tests/qemu-iotests/153        | 14 +++----
 tests/qemu-iotests/153.out    | 35 +++++++++--------
 tests/qemu-iotests/154        | 42 ++++++++++----------
 tests/qemu-iotests/154.out    | 42 ++++++++++----------
 tests/qemu-iotests/155        | 12 ++++--
 tests/qemu-iotests/156        |  9 +++--
 tests/qemu-iotests/156.out    |  6 +--
 tests/qemu-iotests/158        |  2 +-
 tests/qemu-iotests/158.out    |  2 +-
 tests/qemu-iotests/161        |  8 ++--
 tests/qemu-iotests/161.out    |  8 ++--
 tests/qemu-iotests/176        |  4 +-
 tests/qemu-iotests/176.out    | 32 ++++++++--------
 tests/qemu-iotests/177        |  2 +-
 tests/qemu-iotests/177.out    |  2 +-
 tests/qemu-iotests/179        |  2 +-
 tests/qemu-iotests/179.out    |  2 +-
 tests/qemu-iotests/189        |  2 +-
 tests/qemu-iotests/189.out    |  2 +-
 tests/qemu-iotests/191        | 12 +++---
 tests/qemu-iotests/191.out    | 12 +++---
 tests/qemu-iotests/195        |  6 +--
 tests/qemu-iotests/195.out    |  6 +--
 tests/qemu-iotests/198        |  2 +-
 tests/qemu-iotests/198.out    |  3 +-
 tests/qemu-iotests/204        |  2 +-
 tests/qemu-iotests/204.out    |  2 +-
 tests/qemu-iotests/216        |  2 +-
 tests/qemu-iotests/224        |  4 +-
 tests/qemu-iotests/225        |  2 +-
 tests/qemu-iotests/225.out    |  2 +-
 tests/qemu-iotests/228        |  5 ++-
 tests/qemu-iotests/245        |  3 +-
 tests/qemu-iotests/249        |  4 +-
 tests/qemu-iotests/249.out    |  4 +-
 tests/qemu-iotests/252        |  2 +-
 tests/qemu-iotests/257        |  3 +-
 tests/qemu-iotests/267        |  4 +-
 tests/qemu-iotests/267.out    |  6 +--
 tests/qemu-iotests/270        |  2 +-
 tests/qemu-iotests/270.out    |  2 +-
 tests/qemu-iotests/273        |  4 +-
 tests/qemu-iotests/273.out    |  4 +-
 tests/qemu-iotests/279        |  4 +-
 tests/qemu-iotests/279.out    |  4 +-
 tests/qemu-iotests/290        | 72 +++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/290.out    | 45 ++++++++++++++++++++++
 tests/qemu-iotests/group      |  1 +
 131 files changed, 683 insertions(+), 350 deletions(-)
 create mode 100755 tests/qemu-iotests/290
 create mode 100644 tests/qemu-iotests/290.out

--=20
2.26.0.rc2



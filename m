Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D879F251
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Aug 2019 20:30:54 +0200 (CEST)
Received: from localhost ([::1]:55444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2gF3-000820-0S
	for lists+qemu-devel@lfdr.de; Tue, 27 Aug 2019 14:30:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53033)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1i2g7m-0002WT-2B
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 14:23:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1i2g7k-0005Hb-NG
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 14:23:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45518)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1i2g7g-0005FT-PG; Tue, 27 Aug 2019 14:23:16 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 17CD610C6353;
 Tue, 27 Aug 2019 18:23:16 +0000 (UTC)
Received: from localhost (unknown [10.40.205.2])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A1E1F60C05;
 Tue, 27 Aug 2019 18:23:15 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Tue, 27 Aug 2019 20:22:58 +0200
Message-Id: <20190827182313.25983-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.64]); Tue, 27 Aug 2019 18:23:16 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 00/15] Block patches
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 23919ddfd56135cad3cb468a8f54d5a595f024=
f4:

  Merge remote-tracking branch 'remotes/aperard/tags/pull-xen-20190827' i=
nto staging (2019-08-27 15:52:36 +0100)

are available in the Git repository at:

  https://github.com/XanClic/qemu.git tags/pull-block-2019-08-27

for you to fetch changes up to bb043c056cffcc2f3ce88bfdaf2e76e455c09e2c:

  iotests: Unify cache mode quoting (2019-08-27 19:48:44 +0200)

----------------------------------------------------------------
Block patches:
- qemu-io now accepts a file to read a write pattern from
- Ensure that raw files have their first block allocated so we can probe
  the O_DIRECT alignment if necessary
- Various fixes

----------------------------------------------------------------
Denis Plotnikov (1):
  qemu-io: add pattern file for write command

Max Reitz (7):
  iotests: Fix _filter_img_create()
  vmdk: Use bdrv_dirname() for relative extent paths
  iotests: Keep testing broken relative extent paths
  vmdk: Reject invalid compressed writes
  iotests: Disable broken streamOptimized tests
  iotests: Disable 110 for vmdk.twoGbMaxExtentSparse
  iotests: Disable 126 for flat vmdk subformats

Nir Soffer (3):
  block: posix: Always allocate the first block
  iotests: Test allocate_first_block() with O_DIRECT
  iotests: Unify cache mode quoting

Stefan Hajnoczi (1):
  file-posix: fix request_alignment typo

Thomas Huth (2):
  iotests: Check for enabled drivers before testing them
  tests/check-block: Skip iotests when sanitizers are enabled

Vladimir Sementsov-Ogievskiy (1):
  block: fix permission update in bdrv_replace_node

 block.c                                       |  5 +-
 block/file-posix.c                            | 53 +++++++++-
 block/vmdk.c                                  | 64 ++++++++----
 qemu-io-cmds.c                                | 99 +++++++++++++++++--
 tests/check-block.sh                          |  5 +
 tests/qemu-iotests/002                        |  1 +
 tests/qemu-iotests/003                        |  1 +
 tests/qemu-iotests/005                        |  3 +-
 tests/qemu-iotests/009                        |  1 +
 tests/qemu-iotests/010                        |  1 +
 tests/qemu-iotests/011                        |  1 +
 tests/qemu-iotests/017                        |  3 +-
 tests/qemu-iotests/018                        |  3 +-
 tests/qemu-iotests/019                        |  3 +-
 tests/qemu-iotests/020                        |  3 +-
 tests/qemu-iotests/026                        |  4 +-
 tests/qemu-iotests/027                        |  1 +
 tests/qemu-iotests/032                        |  1 +
 tests/qemu-iotests/033                        |  1 +
 tests/qemu-iotests/034                        |  3 +-
 tests/qemu-iotests/037                        |  3 +-
 tests/qemu-iotests/039                        |  4 +-
 tests/qemu-iotests/052                        |  2 +-
 tests/qemu-iotests/059                        | 34 ++++++-
 tests/qemu-iotests/059.out                    | 26 +++--
 tests/qemu-iotests/063                        |  3 +-
 tests/qemu-iotests/071                        |  1 +
 tests/qemu-iotests/072                        |  1 +
 tests/qemu-iotests/081                        |  4 +-
 tests/qemu-iotests/091                        |  4 +-
 tests/qemu-iotests/099                        |  1 +
 tests/qemu-iotests/105                        |  3 +-
 tests/qemu-iotests/110                        |  3 +-
 tests/qemu-iotests/120                        |  1 +
 tests/qemu-iotests/126                        |  2 +
 tests/qemu-iotests/{150.out =3D> 150.out.qcow2} |  0
 tests/qemu-iotests/150.out.raw                | 12 +++
 tests/qemu-iotests/162                        |  4 +-
 tests/qemu-iotests/175                        | 47 +++++++--
 tests/qemu-iotests/175.out                    | 16 ++-
 tests/qemu-iotests/178.out.qcow2              |  4 +-
 tests/qemu-iotests/184                        |  1 +
 tests/qemu-iotests/186                        |  1 +
 tests/qemu-iotests/197                        |  1 +
 tests/qemu-iotests/215                        |  1 +
 tests/qemu-iotests/221.out                    | 12 ++-
 tests/qemu-iotests/251                        |  1 +
 tests/qemu-iotests/253.out                    | 12 ++-
 tests/qemu-iotests/common.filter              |  4 +-
 tests/qemu-iotests/common.rc                  | 14 +++
 50 files changed, 391 insertions(+), 87 deletions(-)
 rename tests/qemu-iotests/{150.out =3D> 150.out.qcow2} (100%)
 create mode 100644 tests/qemu-iotests/150.out.raw

--=20
2.21.0



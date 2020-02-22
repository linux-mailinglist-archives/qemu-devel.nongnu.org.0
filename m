Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2D1168E69
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Feb 2020 12:25:12 +0100 (CET)
Received: from localhost ([::1]:41484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j5SuF-0005XP-Cy
	for lists+qemu-devel@lfdr.de; Sat, 22 Feb 2020 06:25:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54608)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1j5Ssx-0004Hy-JZ
 for qemu-devel@nongnu.org; Sat, 22 Feb 2020 06:23:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1j5Ssv-0005jm-HC
 for qemu-devel@nongnu.org; Sat, 22 Feb 2020 06:23:50 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:56727
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1j5Ssv-0005g3-CB
 for qemu-devel@nongnu.org; Sat, 22 Feb 2020 06:23:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582370628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=kYq7tSLEtP8ND4+O3+Ud5lL5ww0wn3vA66AzZSDN/7A=;
 b=HVkKSFoMA8/iq1E2HY3vX7Ip3btolDuq1PGgOTndn+WcmTs8TlZYoWLg9t6/VF1QB8wFxX
 ddcN6uYWxuyoLxXdHZNZrvKrVhZg4EhJ26++P+qaDfiF5HWbqcMwhguEdBib+6C8nM+MX5
 zeA+UaixDtIvc+baLip2aJQcZEUO21Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-81-Dp2XilclNheanBTR9ThQdg-1; Sat, 22 Feb 2020 06:23:46 -0500
X-MC-Unique: Dp2XilclNheanBTR9ThQdg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 48F2B801E53;
 Sat, 22 Feb 2020 11:23:45 +0000 (UTC)
Received: from blue.redhat.com (ovpn-116-90.phx2.redhat.com [10.3.116.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2385D60499;
 Sat, 22 Feb 2020 11:23:41 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] Tighten qemu-img rules on missing backing format
Date: Sat, 22 Feb 2020 05:23:38 -0600
Message-Id: <20200222112341.4170045-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: libvir-list@redhat.com, pkrempa@redhat.com, qemu-block@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In the past, we have had CVEs caused by qemu probing one image type
when an image started out as another but the guest was able to modify
content.  The solution to those CVEs was to encode backing format
information into qcow2, to ensure that once we make a decision, we
don't have to probe any further.  However, we failed to enforce this
at the time.  And now that libvirt is switching to -blockdev, it has
come back to bite us: with -block, libvirt had no easy way (other than
json:{} pseudoprotocol) to force a backing file, but with -blockdev,
libvirt HAS to use blockdev-open on the backing chain and supply a
backing format there, and thus has to probe images.  If libvirt ever
probes differently than qemu, we are back to the potential
guest-visible data corruption or potential host CVEs.

It's time to deprecate images without backing formats.  This patch
series does two things: 1. record an implicit backing format where one
is learned (although sadly, not all qemu-img commands are able to
learn a format), 2. warn to the user any time a probe had ambiguous
results or a backing format is omitted from an image.  All previous
images without a backing format are still usable, but hopefully the
warnings (along with libvirt's complaints about images without a
backing format) help us pinpoint remaining applications that are
creating images on their own without recording a backing format.

Perhaps I need to amend patch 3 and/or add a followup patch 4 that
adds further iotest coverage of all the new warnings (patch 1 touched
all the './check -qcow2' tests that were affected by the new warnings,
except for 114 which actually wanted to trigger the warning, if you
want to apply the series out of order to see the impact of the
warnings).

Eric Blake (3):
  iotests: Specify explicit backing format where sensible
  block: Add support to warn on backing file change without format
  qemu-img: Deprecate use of -b without -F

 block.c                       | 31 ++++++++++++++++++++---
 block/qcow2.c                 |  2 +-
 block/stream.c                |  2 +-
 blockdev.c                    |  3 ++-
 include/block/block.h         |  4 +--
 qemu-deprecated.texi          | 12 +++++++++
 qemu-img.c                    | 10 ++++++--
 tests/qemu-iotests/017        |  2 +-
 tests/qemu-iotests/017.out    |  2 +-
 tests/qemu-iotests/018        |  2 +-
 tests/qemu-iotests/018.out    |  2 +-
 tests/qemu-iotests/019        |  5 ++--
 tests/qemu-iotests/019.out    |  2 +-
 tests/qemu-iotests/020        |  2 +-
 tests/qemu-iotests/020.out    |  2 +-
 tests/qemu-iotests/024        |  8 +++---
 tests/qemu-iotests/024.out    |  5 ++--
 tests/qemu-iotests/028        |  4 +--
 tests/qemu-iotests/028.out    |  2 +-
 tests/qemu-iotests/030        | 26 +++++++++++++------
 tests/qemu-iotests/034        |  2 +-
 tests/qemu-iotests/034.out    |  2 +-
 tests/qemu-iotests/037        |  2 +-
 tests/qemu-iotests/037.out    |  2 +-
 tests/qemu-iotests/038        |  2 +-
 tests/qemu-iotests/038.out    |  2 +-
 tests/qemu-iotests/039        |  3 ++-
 tests/qemu-iotests/039.out    |  2 +-
 tests/qemu-iotests/040        | 47 +++++++++++++++++++++++++----------
 tests/qemu-iotests/041        | 37 ++++++++++++++++++---------
 tests/qemu-iotests/042        |  4 +--
 tests/qemu-iotests/043        | 18 +++++++-------
 tests/qemu-iotests/043.out    | 16 +++++++-----
 tests/qemu-iotests/046        |  2 +-
 tests/qemu-iotests/046.out    |  2 +-
 tests/qemu-iotests/050        |  4 +--
 tests/qemu-iotests/050.out    |  2 +-
 tests/qemu-iotests/051        |  2 +-
 tests/qemu-iotests/051.out    |  2 +-
 tests/qemu-iotests/051.pc.out |  2 +-
 tests/qemu-iotests/060        |  2 +-
 tests/qemu-iotests/060.out    |  2 +-
 tests/qemu-iotests/061        | 10 ++++----
 tests/qemu-iotests/061.out    | 10 ++++----
 tests/qemu-iotests/069        |  2 +-
 tests/qemu-iotests/069.out    |  2 +-
 tests/qemu-iotests/073        |  2 +-
 tests/qemu-iotests/073.out    |  2 +-
 tests/qemu-iotests/082        | 16 +++++++-----
 tests/qemu-iotests/082.out    | 16 ++++++------
 tests/qemu-iotests/085        |  4 +--
 tests/qemu-iotests/085.out    |  6 ++---
 tests/qemu-iotests/089        |  2 +-
 tests/qemu-iotests/089.out    |  2 +-
 tests/qemu-iotests/095        |  4 +--
 tests/qemu-iotests/095.out    |  4 +--
 tests/qemu-iotests/097        |  4 +--
 tests/qemu-iotests/097.out    | 16 ++++++------
 tests/qemu-iotests/098        |  2 +-
 tests/qemu-iotests/098.out    |  8 +++---
 tests/qemu-iotests/110        |  4 +--
 tests/qemu-iotests/110.out    |  4 +--
 tests/qemu-iotests/114        |  4 +--
 tests/qemu-iotests/114.out    |  1 +
 tests/qemu-iotests/122        | 27 ++++++++++++--------
 tests/qemu-iotests/122.out    |  8 +++---
 tests/qemu-iotests/126        |  4 +--
 tests/qemu-iotests/126.out    |  4 +--
 tests/qemu-iotests/127        |  4 +--
 tests/qemu-iotests/127.out    |  4 +--
 tests/qemu-iotests/129        |  3 ++-
 tests/qemu-iotests/133        |  2 +-
 tests/qemu-iotests/133.out    |  2 +-
 tests/qemu-iotests/139        |  2 +-
 tests/qemu-iotests/141        |  4 +--
 tests/qemu-iotests/141.out    |  4 +--
 tests/qemu-iotests/142        |  2 +-
 tests/qemu-iotests/142.out    |  2 +-
 tests/qemu-iotests/153        | 14 +++++------
 tests/qemu-iotests/153.out    | 35 ++++++++++++++------------
 tests/qemu-iotests/154        | 42 +++++++++++++++----------------
 tests/qemu-iotests/154.out    | 42 +++++++++++++++----------------
 tests/qemu-iotests/155        | 12 ++++++---
 tests/qemu-iotests/156        |  9 ++++---
 tests/qemu-iotests/156.out    |  6 ++---
 tests/qemu-iotests/158        |  2 +-
 tests/qemu-iotests/158.out    |  2 +-
 tests/qemu-iotests/161        |  8 +++---
 tests/qemu-iotests/161.out    |  8 +++---
 tests/qemu-iotests/176        |  4 +--
 tests/qemu-iotests/176.out    | 32 ++++++++++++------------
 tests/qemu-iotests/177        |  2 +-
 tests/qemu-iotests/177.out    |  2 +-
 tests/qemu-iotests/179        |  2 +-
 tests/qemu-iotests/179.out    |  2 +-
 tests/qemu-iotests/189        |  2 +-
 tests/qemu-iotests/189.out    |  2 +-
 tests/qemu-iotests/191        | 12 ++++-----
 tests/qemu-iotests/191.out    | 12 ++++-----
 tests/qemu-iotests/195        |  6 ++---
 tests/qemu-iotests/195.out    |  6 ++---
 tests/qemu-iotests/198        |  2 +-
 tests/qemu-iotests/198.out    |  3 ++-
 tests/qemu-iotests/204        |  2 +-
 tests/qemu-iotests/204.out    |  2 +-
 tests/qemu-iotests/216        |  2 +-
 tests/qemu-iotests/224        |  4 +--
 tests/qemu-iotests/228        |  5 ++--
 tests/qemu-iotests/245        |  3 ++-
 tests/qemu-iotests/249        |  4 +--
 tests/qemu-iotests/249.out    |  4 +--
 tests/qemu-iotests/252        |  2 +-
 tests/qemu-iotests/257        |  3 ++-
 tests/qemu-iotests/267        |  4 +--
 tests/qemu-iotests/267.out    |  6 ++---
 tests/qemu-iotests/270        |  2 +-
 tests/qemu-iotests/270.out    |  2 +-
 tests/qemu-iotests/273        |  4 +--
 tests/qemu-iotests/273.out    |  4 +--
 tests/qemu-iotests/279        |  4 +--
 tests/qemu-iotests/279.out    |  4 +--
 121 files changed, 466 insertions(+), 348 deletions(-)

--=20
2.24.1



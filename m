Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B86AB18A3BC
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Mar 2020 21:25:27 +0100 (CET)
Received: from localhost ([::1]:58074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jEfFm-0007N6-KF
	for lists+qemu-devel@lfdr.de; Wed, 18 Mar 2020 16:25:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56957)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jsnow@redhat.com>) id 1jEfEZ-0006Oi-Uf
 for qemu-devel@nongnu.org; Wed, 18 Mar 2020 16:24:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jsnow@redhat.com>) id 1jEfEU-0001uk-5M
 for qemu-devel@nongnu.org; Wed, 18 Mar 2020 16:24:08 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:32123)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jsnow@redhat.com>) id 1jEfEU-0001tE-1e
 for qemu-devel@nongnu.org; Wed, 18 Mar 2020 16:24:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584563045;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6aff+Oexu8GVzCGh8guZeMHgCwLBh5qD/PMA5J0MUKg=;
 b=bj/WjY2SNf5RgOhkOFM8cL30rcX/mS6Z0UvJY3X4WXJqdaPy7vfAtR6VW8R9zxssLj92OA
 pUlg2vjqYVOpci1gzf6F4lxBgLXxl7Hd+CPwNu5I0uqCIeVT7W3yG4RAwYsT8d/BCdXbYp
 B2jy4Spe7zWPe/fSjXFamAuU4bx2YL8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-449-LLekJM49PZexRwOn_RWaSw-1; Wed, 18 Mar 2020 16:24:01 -0400
X-MC-Unique: LLekJM49PZexRwOn_RWaSw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 92BFE18C35A0;
 Wed, 18 Mar 2020 20:24:00 +0000 (UTC)
Received: from probe.redhat.com (ovpn-112-191.rdu2.redhat.com [10.10.112.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3FD48619A9;
 Wed, 18 Mar 2020 20:23:42 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org, jsnow@redhat.com,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL v2 00/11] Bitmaps patches
Date: Wed, 18 Mar 2020 16:23:30 -0400
Message-Id: <20200318202341.6961-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, libvir-list@redhat.com,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit d649689a8ecb2e276cc20d3af6d416e3c299cb17=
:

  Merge remote-tracking branch 'remotes/bonzini/tags/for-upstream' into sta=
ging (2020-03-17 18:33:05 +0000)

are available in the Git repository at:

  https://github.com/jnsnow/qemu.git tags/bitmaps-pull-request

for you to fetch changes up to 2d00cbd8e222a4adc08f415c399e84590ee8ff9a:

  block/qcow2-bitmap: use bdrv_dirty_bitmap_next_dirty (2020-03-18 14:03:46=
 -0400)

----------------------------------------------------------------
Pull request

----------------------------------------------------------------

Eric Blake (1):
  build: Silence clang warning on older glib autoptr usage

Vladimir Sementsov-Ogievskiy (10):
  hbitmap: assert that we don't create bitmap larger than INT64_MAX
  hbitmap: move hbitmap_iter_next_word to hbitmap.c
  hbitmap: unpublish hbitmap_iter_skip_words
  hbitmap: drop meta bitmaps as they are unused
  block/dirty-bitmap: switch _next_dirty_area and _next_zero to int64_t
  block/dirty-bitmap: add _next_dirty API
  block/dirty-bitmap: improve _next_dirty_area API
  nbd/server: introduce NBDExtentArray
  nbd/server: use bdrv_dirty_bitmap_next_dirty_area
  block/qcow2-bitmap: use bdrv_dirty_bitmap_next_dirty

 configure                    |  20 +++
 include/block/dirty-bitmap.h |   9 +-
 include/qemu/hbitmap.h       |  95 +++--------
 block/dirty-bitmap.c         |  16 +-
 block/qcow2-bitmap.c         |  15 +-
 nbd/server.c                 | 251 ++++++++++++++--------------
 tests/test-hbitmap.c         | 316 +++++++++++++----------------------
 util/hbitmap.c               | 134 +++++++++------
 8 files changed, 395 insertions(+), 461 deletions(-)

--=20
2.21.1



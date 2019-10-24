Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F142E379B
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Oct 2019 18:14:26 +0200 (CEST)
Received: from localhost ([::1]:46354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNfkm-0003yh-NB
	for lists+qemu-devel@lfdr.de; Thu, 24 Oct 2019 12:14:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44562)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1iNee0-0000Pe-PQ
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 11:03:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1iNedv-0003aa-Bj
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 11:03:20 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:33940
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1iNedv-0003Zp-5L
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 11:03:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571929394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=sogKktAoImvZvOfpOGDKwLEEVmluwFWHJSIvzb0JR5g=;
 b=RYWhlM2NO5F/BOI8zoHUsKkygrWxnmAHIxwEmSZAw9+pHGEIrdbpHaH2oZuewRp35baq1s
 UF51r5hOyFIRKO+MdQg1Hkckr91nOGbZSldQ46zTiorSvmctljV/j5ef4Mu70M3nlb6ldI
 r3fTFm5NXHhylAhX7uOA4vtq0UyQM0Q=
Received: from mimecast-mx01.redhat.com (209.132.183.4 [209.132.183.4])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-52-y-DGZkniMp60XFwVOWdIpQ-1; Thu, 24 Oct 2019 11:02:59 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A10DB100554F;
 Thu, 24 Oct 2019 14:27:14 +0000 (UTC)
Received: from linux.fritz.box.com (unknown [10.36.118.122])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3A8E154560;
 Thu, 24 Oct 2019 14:27:12 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 0/2] qcow2: Fix image corruption bug in 4.1
Date: Thu, 24 Oct 2019 16:26:56 +0200
Message-Id: <20191024142658.22306-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: y-DGZkniMp60XFwVOWdIpQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: kwolf@redhat.com, psyhomb@gmail.com, michael@weiser.dinsnail.net,
 vsementsov@virtuozzo.com, den@virtuozzo.com, qemu-devel@nongnu.org,
 qemu-stable@nongnu.org, dgilbert@redhat.com, mreitz@redhat.com,
 lersek@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series fixes an image corruption bug that was introduced in commit
69f47505e ('block: avoid recursive block_status call if possible'),
first contained in the QEMU 4.1.0 release.

This bug was reported by Michael Weiser on Launchpad:
https://bugs.launchpad.net/qemu/+bug/1846427

v2:

- Dropped the assertion in qcow2_cache_do_get() for now. Making sure
  that it actually holds true for all callers requires more work and
  getting the corruption fix in quickly is important.

- Use atomic_read() and add comment to qemu_co_mutex_assert_locked()
  implementation [Denis]

Kevin Wolf (2):
  coroutine: Add qemu_co_mutex_assert_locked()
  qcow2: Fix corruption bug in qcow2_detect_metadata_preallocation()

 include/qemu/coroutine.h | 15 +++++++++++++++
 block/qcow2-refcount.c   |  2 ++
 block/qcow2.c            |  3 ++-
 3 files changed, 19 insertions(+), 1 deletion(-)

--=20
2.20.1



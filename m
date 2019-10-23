Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8781E206F
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Oct 2019 18:22:12 +0200 (CEST)
Received: from localhost ([::1]:41028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNJOl-0004yp-EF
	for lists+qemu-devel@lfdr.de; Wed, 23 Oct 2019 12:22:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39736)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1iNIXF-0005Cz-Fj
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 11:26:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1iNIXD-0002gl-Dr
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 11:26:53 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:38728
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1iNIXC-0002fo-22
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 11:26:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571844409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=qklT1a54sDhJ5msi3rc+WUt4DkLtK2wOa1/cJBBWDH4=;
 b=I/Rs50iK6l99VzjP2Czjt2So3rsomNe551A87cCJqQ0cR2cb8As2Csh6yrwMv2pbE3HMd6
 2MGP7WVn73BD1x6SKOmNThwsY5oPAhuuURGztWKKvqrEoke+7lkty8yZOUgFkKkIjWrete
 Z1JAZx5tP3bjFTWq9abtfXwQcV/ugXo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-yuoEjBItNs6wpSQogN7eVg-1; Wed, 23 Oct 2019 11:26:45 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 35FFA1005500;
 Wed, 23 Oct 2019 15:26:44 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-117-192.ams2.redhat.com
 [10.36.117.192])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 61AC9608C1;
 Wed, 23 Oct 2019 15:26:41 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 0/3] qcow2: Fix image corruption bug in 4.1
Date: Wed, 23 Oct 2019 17:26:17 +0200
Message-Id: <20191023152620.13166-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: yuoEjBItNs6wpSQogN7eVg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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

Kevin Wolf (3):
  coroutine: Add qemu_co_mutex_assert_locked()
  qcow2: Assert that qcow2_cache_get() callers hold s->lock
  qcow2: Fix corruption bug in qcow2_detect_metadata_preallocation()

 include/qemu/coroutine.h | 7 +++++++
 block/qcow2-cache.c      | 5 +++++
 block/qcow2-refcount.c   | 2 ++
 block/qcow2.c            | 3 ++-
 4 files changed, 16 insertions(+), 1 deletion(-)

--=20
2.20.1



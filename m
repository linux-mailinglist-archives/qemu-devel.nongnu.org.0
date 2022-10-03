Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0355F27C7
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 05:18:30 +0200 (CEST)
Received: from localhost ([::1]:41236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofByP-0000up-HQ
	for lists+qemu-devel@lfdr.de; Sun, 02 Oct 2022 23:18:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ofBwD-0004i3-5c
 for qemu-devel@nongnu.org; Sun, 02 Oct 2022 23:16:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ofBwA-0007UP-5h
 for qemu-devel@nongnu.org; Sun, 02 Oct 2022 23:16:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664766969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=uNLaIgbCdiUGNU6L6dDiJjxEwtuVQMA3jmqYq/T8Y+w=;
 b=cR6HZz+s33YqTJHAdKl0APmfVzujmpQq0rWgZLTneWVbukBoTxKFvBjq6tRegFxrraQgr9
 7tujxOx5vLIsbpyvu7iTw4xSCPAQ6KklJxispqueSXqZyQy2TT3FQYIaZpH2zxNwO8b+PU
 rKbT6tfE2z6nuoFNt8F9KcPh4ZKin4k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-207-nfX_jiOgOy2xjDHvNzFvgg-1; Sun, 02 Oct 2022 23:16:06 -0400
X-MC-Unique: nfX_jiOgOy2xjDHvNzFvgg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 90CDB87B2A2;
 Mon,  3 Oct 2022 03:16:05 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BD86040C206B;
 Mon,  3 Oct 2022 03:16:01 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Eric Blake <eblake@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, qemu-s390x@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Laurent Vivier <lvivier@redhat.com>, John Snow <jsnow@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Juan Quintela <quintela@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 Eric Farman <farman@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Subject: [RFC 0/7] migration patches for VFIO
Date: Mon,  3 Oct 2022 05:15:53 +0200
Message-Id: <20221003031600.20084-1-quintela@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

Hi

VFIO migration has several requirements:
- the size of the state is only known when the guest is stopped
- they need to send possible lots of data.

this series only address the 1st set of problems.

What they do:
- res_compatible parameter was not used anywhere, just add that information to res_postcopy.
- Remove QEMUFILE parameter from save_live_pending
- Split save_live_pending into
  * save_pending_estimate(): the pending state size without trying too hard
  * save_pending_exact(): the real pending state size, it is called with the guest stopped.
- Now save_pending_* don't need the threshold parameter
- HACK a way to stop the guest before moving there.

ToDo:
- autoconverge test is broken, no real clue why, but it is possible that the test is wrong.

- Make an artifact to be able to send massive amount of data in the save state stage (probably more multifd channels).

- Be able to not having to start the guest between cheking the state pending size and migration_completion().

Please review.

Thanks, Juan.

Juan Quintela (7):
  migration: Remove res_compatible parameter
  migration: No save_live_pending() method uses the QEMUFile parameter
  migration: Block migration comment or code is wrong
  migration: Split save_live_pending() into state_pending_*
  migration: Remove unused threshold_size parameter
  migration: simplify migration_iteration_run()
  migration: call qemu_savevm_state_pending_exact() with the guest
    stopped

 docs/devel/migration.rst       | 18 ++++++------
 docs/devel/vfio-migration.rst  |  4 +--
 include/migration/register.h   | 29 ++++++++++---------
 migration/savevm.h             |  8 +++---
 hw/s390x/s390-stattrib.c       | 11 ++++---
 hw/vfio/migration.c            | 17 +++++------
 migration/block-dirty-bitmap.c | 14 ++++-----
 migration/block.c              | 17 ++++++-----
 migration/migration.c          | 52 ++++++++++++++++++++++------------
 migration/ram.c                | 35 ++++++++++++++++-------
 migration/savevm.c             | 37 +++++++++++++++++-------
 tests/qtest/migration-test.c   |  3 +-
 hw/vfio/trace-events           |  2 +-
 migration/trace-events         |  7 +++--
 14 files changed, 148 insertions(+), 106 deletions(-)

-- 
2.37.2



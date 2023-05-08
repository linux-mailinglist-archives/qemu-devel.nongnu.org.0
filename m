Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2E36FB0F2
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 15:11:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw0cH-0003C7-Ue; Mon, 08 May 2023 09:09:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pw0cF-0003Aa-9V
 for qemu-devel@nongnu.org; Mon, 08 May 2023 09:09:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pw0cC-0000ep-AZ
 for qemu-devel@nongnu.org; Mon, 08 May 2023 09:09:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683551359;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fB6Jub+KA9amSgtn0Xl1ZbTK9gfNXcFzD2DqyOicQoI=;
 b=d31Bu925NBLWSLBEkIEFuWf1q21T2ffhZ1BwawKdsLbrU02pkmOj7SDDNQAvNfOWYhteL3
 l5iOKxCppf8wFCms4T8gSCBfhk7SDj826HUyefz7kW2eDcielNyo1a1oHI08j6EgVmMZm2
 U+LpDn3No6wCnexaV+yijge/DmKdPIE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-246-eRj_XM4pNI-LawS1uDSseA-1; Mon, 08 May 2023 09:09:16 -0400
X-MC-Unique: eRj_XM4pNI-LawS1uDSseA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 169BF38601B5;
 Mon,  8 May 2023 13:09:15 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 18DC22166B40;
 Mon,  8 May 2023 13:09:09 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 Eric Blake <eblake@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 John Snow <jsnow@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>, Peter Xu <peterx@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Leonardo Bras <leobras@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH 00/21] Migration: More migration atomic counters
Date: Mon,  8 May 2023 15:08:48 +0200
Message-Id: <20230508130909.65420-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi

In this series:
- play with rate limit
  * document that a value of 0 means no rate-limit
  * change all users of INT64_MAX to use 0
  * Make sure that transferred value is right
    This gets transferred == multifd_bytes + qemu_file_transferred()
    until the completation stage.  Changing all devices is overkill and not useful.
  * Move all rate_limit calculations to use atomics instead of qemu_file_transferred().
    Use atomics for rate_limit.
  * RDMA
    Adjust counters here and there
    Change the "imaginary" 1 byte transfer to say if it has sent a page or not.
    More cleanups due to this changes
  * multifd: Adjust the number of transferred bytes in the right place and right amount
    right place: just after write, now with atomic counters we can
    right ammount: Now that we are in the right place, we can do it right also for compressing

Please review.

ToDo: Best described as ToSend:
- qemu_file_transfered() is based on atomics on my branch
- transferred atomic is not needed anymore

ToDo before my next send:

- downtime_bytes, precopy_bytes and postcopy_bytes should be based on
  migration_transfered_bytes and not need a counter of their own.

With that my cleanup would have finishing, moving from:
- total_transferred in QEMUFile (not atomic)
- rate_limit_used in QEMUFile (not atomic)
- multifd_bytes in mig_stats
- transferred in mig_stats (not updated everywhere needed, the
  following ones are based on this one)
- downtime_bytes in mig_stats
- precopy_bytes in mig_stats
- postcopy_bytes in mig_stats

To just:
- qemu_file_transferred in mig_stats
- multifd_bytes in mig_stats
- rdma_bytes in mig_stats

And for each transfer, we only update one of the three, everything
else is derived from this three values.

Later, Juan.

Juan Quintela (21):
  migration: A rate limit value of 0 is valid
  migration: Don't use INT64_MAX for unlimited rate
  migration: We set the rate_limit by a second
  qemu-file: make qemu_file_[sg]et_rate_limit() use an uint64_t
  qemu-file: Make rate_limit_used an uint64_t
  qemu-file: Remove total from qemu_file_total_transferred_*()
  migration: Correct transferred bytes value
  migration: Move setup_time to mig_stats
  qemu-file: Account for rate_limit usage on qemu_fflush()
  migration: Move rate_limit_max and rate_limit_used to migration_stats
  migration: Move migration_total_bytes() to migration-stats.c
  migration: Add a trace for migration_transferred_bytes
  migration: Use migration_transferred_bytes() to calculate rate_limit
  migration: We don't need the field rate_limit_used anymore
  migration: Don't abuse qemu_file transferred for RDMA
  migration/RDMA: It is accounting for zero/normal pages in two places
  migration/rdma: Remove QEMUFile parameter when not used
  migration/rdma: Don't use imaginary transfers
  migration: Remove unused qemu_file_credit_transfer()
  migration/rdma: Simplify the function that saves a page
  migration/multifd: Compute transferred bytes correctly

 hw/ppc/spapr.c                      |  5 +-
 hw/s390x/s390-stattrib.c            |  2 +-
 include/migration/qemu-file-types.h |  2 +-
 migration/block-dirty-bitmap.c      |  2 +-
 migration/block.c                   |  9 ++--
 migration/meson.build               |  2 +-
 migration/migration-stats.c         | 56 ++++++++++++++++++++
 migration/migration-stats.h         | 59 +++++++++++++++++++++
 migration/migration.c               | 46 ++++++-----------
 migration/migration.h               |  1 -
 migration/multifd.c                 | 14 ++---
 migration/options.c                 |  7 ++-
 migration/qemu-file.c               | 79 +++++------------------------
 migration/qemu-file.h               | 43 ++++------------
 migration/ram.c                     | 34 +++++++------
 migration/rdma.c                    | 64 ++++++++++++-----------
 migration/savevm.c                  | 27 +++++++---
 migration/trace-events              |  3 ++
 migration/vmstate.c                 |  8 +--
 19 files changed, 259 insertions(+), 204 deletions(-)

-- 
2.40.0



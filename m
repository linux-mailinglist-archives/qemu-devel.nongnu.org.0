Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 473F06AF271
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:53:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZcQF-0002MU-8U; Tue, 07 Mar 2023 13:52:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pZcQD-0002ML-JD
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:52:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pZcQB-0002M9-CZ
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:52:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678215141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=MqQ0rdolTfFHyt9Qd+G8wcy/1/4uuRW9L1BjW0J6kV4=;
 b=TbQvn634jJepws4HX0rL4fgd8maGpxM1UGFGFEJjhbzYIbs05KLt9KlTN5tQVBZAqlVS59
 CnZJe/QrnOqSC9RWUaGVZorcka15GyvK1UfaCzy3/WRHWp03+HK7Hr9TSfsDON5UCzvBQ0
 6jzBnXOPzW8ydymMDtlthIxasZPBUO0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-513-rkadwFxQPl25okDGidnRTA-1; Tue, 07 Mar 2023 13:52:18 -0500
X-MC-Unique: rkadwFxQPl25okDGidnRTA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0360D1815CF2;
 Tue,  7 Mar 2023 18:52:18 +0000 (UTC)
Received: from [172.30.41.16] (unknown [10.22.16.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8DEE618EC6;
 Tue,  7 Mar 2023 18:52:17 +0000 (UTC)
Subject: [PULL 00/17] VFIO updates for 8.0
From: Alex Williamson <alex.williamson@redhat.com>
To: qemu-devel@nongnu.org
Cc: alex.williamson@redhat.com, avihaih@nvidia.com, clg@redhat.com,
 joao.m.martins@oracle.com
Date: Tue, 07 Mar 2023 11:52:17 -0700
Message-ID: <167821508699.619792.1719671327865445814.stgit@omen>
User-Agent: StGit/1.5.dev2+g9ce680a52bd9
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The following changes since commit c29a2f40cd5d1fdad4632b48343cd968db041a44:

  Merge tag 'pull-target-arm-20230306' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2023-03-07 09:58:43 +0000)

are available in the Git repository at:

  https://gitlab.com/alex.williamson/qemu.git tags/vfio-updates-20230307.1

for you to fetch changes up to 969dae5448eaa2914be5b974f9e0311b3f95ee2c:

  vfio: Fix vfio_get_dev_region() trace event (2023-03-07 11:19:07 -0700)

----------------------------------------------------------------
VFIO updates for 8.0

 * Device level dirty page tracking support for vfio migration, as well as
   various cleanups and consolidations. (Avihai Horon, Joao Martins)

 * Trivial cleanup of migration entry points. (Alex Williamson)

 * Fix trace event typo. (Cédric Le Goater)

----------------------------------------------------------------
Alex Williamson (1):
      vfio/migration: Rename entry points

Avihai Horon (6):
      vfio/common: Fix error reporting in vfio_get_dirty_bitmap()
      vfio/common: Fix wrong %m usages
      vfio/common: Abort migration if dirty log start/stop/sync fails
      vfio/common: Add VFIOBitmap and alloc function
      vfio/common: Extract code from vfio_get_dirty_bitmap() to new function
      docs/devel: Document VFIO device dirty page tracking

Cédric Le Goater (1):
      vfio: Fix vfio_get_dev_region() trace event

Joao Martins (9):
      vfio/common: Add helper to validate iova/end against hostwin
      vfio/common: Use a single tracepoint for skipped sections
      vfio/common: Consolidate skip/invalid section into helper
      vfio/common: Add helper to consolidate iova/end calculation
      vfio/common: Record DMA mapped IOVA ranges
      vfio/common: Add device dirty page tracking start/stop
      vfio/common: Add device dirty page bitmap sync
      vfio/migration: Block migration with vIOMMU
      vfio/migration: Query device dirty page tracking support

 docs/devel/vfio-migration.rst |  46 ++-
 hw/vfio/common.c              | 699 ++++++++++++++++++++++++++++++++++--------
 hw/vfio/migration.c           |  28 +-
 hw/vfio/pci.c                 |   5 +-
 hw/vfio/trace-events          |   7 +-
 include/hw/vfio/vfio-common.h |   8 +-
 6 files changed, 637 insertions(+), 156 deletions(-)



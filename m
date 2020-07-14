Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E040221F6AD
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jul 2020 18:07:53 +0200 (CEST)
Received: from localhost ([::1]:46348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jvNTE-0007Ub-VU
	for lists+qemu-devel@lfdr.de; Tue, 14 Jul 2020 12:07:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jvNNn-0000ME-E0
 for qemu-devel@nongnu.org; Tue, 14 Jul 2020 12:02:15 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:34728
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jvNNi-000816-04
 for qemu-devel@nongnu.org; Tue, 14 Jul 2020 12:02:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594742528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ib5JOSPWodsDt/WbrYk+l4Xg+/ux9nnv4IlYeOUtp9o=;
 b=TvvRY4fSRMqx3bIfEO1VH7Bvo/aKpBM5Pv7jjflSXpLmcYRkBjc7u4zHIEwRdRs6PlCADZ
 wOvg3ARk6KiH6UYQFly+vdd8n5qK9vlwAhf+tO0wwd/Ussj5IgzXoi1ilTQqi7lAYOdEy9
 3NZJMzcL8gLuBW9DZr2nddjDSJerrAs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-P0vJo4bhN3aOBPUjRjpjNg-1; Tue, 14 Jul 2020 12:02:04 -0400
X-MC-Unique: P0vJo4bhN3aOBPUjRjpjNg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C7400800685;
 Tue, 14 Jul 2020 16:02:03 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 92BB2797E3;
 Tue, 14 Jul 2020 16:02:03 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 23FF41267F16; Tue, 14 Jul 2020 18:02:02 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-5.1 0/5] qom: HMP command fixes
Date: Tue, 14 Jul 2020 18:01:57 +0200
Message-Id: <20200714160202.3121879-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/14 03:57:32
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: lvivier@redhat.com, thuth@redhat.com, berrange@redhat.com,
 ehabkost@redhat.com, pbonzini@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A leak fix (recent regression), a help fix (regression in 5.0), a bit
of performance work, and a doc fix.  The leak fix looks like a must
have for 5.1.

Markus Armbruster (5):
  qdev: Fix device_add DRIVER,help to print to monitor
  qom: Plug memory leak in "info qom-tree"
  qom: Change object_get_canonical_path_component() not to malloc
  qom: Document object_get_canonical_path() returns malloced string
  qom: Make info qom-tree sort children more efficiently

 include/qom/object.h       |  7 ++++---
 backends/hostmem.c         |  2 +-
 block/throttle-groups.c    |  2 +-
 gdbstub.c                  |  2 +-
 hw/arm/xlnx-zynqmp.c       |  6 ++----
 hw/block/nvme.c            |  5 ++---
 hw/core/machine-qmp-cmds.c |  2 +-
 hw/core/machine.c          |  5 ++---
 hw/mem/nvdimm.c            |  5 ++---
 hw/mem/pc-dimm.c           |  5 ++---
 hw/misc/ivshmem.c          |  5 ++---
 hw/ppc/spapr_drc.c         |  3 +--
 hw/virtio/virtio-crypto.c  |  5 ++---
 hw/virtio/virtio-mem.c     |  6 ++----
 hw/virtio/virtio-pmem.c    |  5 ++---
 iothread.c                 |  9 ++++-----
 net/net.c                  |  6 ++----
 qdev-monitor.c             |  2 +-
 qom/object.c               |  7 +++----
 qom/qom-hmp-cmds.c         | 30 +++++++++++++++---------------
 scsi/pr-manager-helper.c   |  3 +--
 scsi/pr-manager.c          |  2 +-
 softmmu/memory.c           |  2 +-
 hw/ppc/trace-events        |  2 +-
 24 files changed, 56 insertions(+), 72 deletions(-)

-- 
2.26.2



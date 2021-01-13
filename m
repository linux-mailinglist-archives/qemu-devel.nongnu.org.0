Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1052F54D6
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 23:12:57 +0100 (CET)
Received: from localhost ([::1]:34144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzoNs-0002yA-7c
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 17:12:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kzoLP-0001IS-Q7
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 17:10:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kzoLM-0001gH-Ma
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 17:10:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610575817;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=OLW7D5GUGTKXSw+5fC5pPjrLcJKM1+mBgePD/Yno5dw=;
 b=CIH4zwBDzUZbvMILOFTqy0+PHO6oUZR8dJ6W6wu6M7M60hVC9DEUr1rbPL6RElWWEsKa6Y
 LHr27ZFn+FjW0pLhEX1f7WIExR3OO5Xqded6wQoHqoh7I1alscbOntZtNvI7aNwqN3x7PJ
 DmOmP+SkCIU8Z5FY7VavP9tdMwbatg4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157-qTgGmzDVPsWUndLIaQVe5Q-1; Wed, 13 Jan 2021 17:10:15 -0500
X-MC-Unique: qTgGmzDVPsWUndLIaQVe5Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 36BEAC73A4;
 Wed, 13 Jan 2021 22:10:14 +0000 (UTC)
Received: from blue.redhat.com (ovpn-113-36.phx2.redhat.com [10.3.113.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AE53310016F4;
 Wed, 13 Jan 2021 22:10:13 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/5] Common macros for QAPI list growth
Date: Wed, 13 Jan 2021 16:10:08 -0600
Message-Id: <20210113221013.390592-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: vsementsov@virtuozzo.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v3 was here:
https://lists.gnu.org/archive/html/qemu-devel/2020-12/msg06009.html

Since then: rebase to the patches that were already applied [Markus],
address review comments [Markus, Vladimir]

001/5:[----] [--] 'net: Clarify early exit condition'
002/5:[down] 'qapi: A couple more QAPI_LIST_PREPEND() stragglers'
003/5:[0006] [FC] 'qapi: Introduce QAPI_LIST_APPEND'
004/5:[0024] [FC] 'qapi: Use QAPI_LIST_APPEND in trivial cases'
005/5:[0016] [FC] 'qapi: More complex uses of QAPI_LIST_APPEND'

Eric Blake (5):
  net: Clarify early exit condition
  qapi: A couple more QAPI_LIST_PREPEND() stragglers
  qapi: Introduce QAPI_LIST_APPEND
  qapi: Use QAPI_LIST_APPEND in trivial cases
  qapi: More complex uses of QAPI_LIST_APPEND

 include/qapi/util.h                 |  13 +++
 backends/hostmem.c                  |  10 +--
 block/dirty-bitmap.c                |   8 +-
 block/export/export.c               |   7 +-
 block/gluster.c                     |  13 +--
 block/qapi.c                        |  37 ++------
 block/qcow2-bitmap.c                |  15 +---
 block/vmdk.c                        |   9 +-
 blockdev.c                          |  13 ++-
 crypto/block-luks.c                 |   9 +-
 dump/dump.c                         |  22 ++---
 hw/acpi/cpu.c                       |   7 +-
 hw/acpi/memory_hotplug.c            |   8 +-
 hw/core/machine-qmp-cmds.c          | 125 ++++++++++++----------------
 hw/mem/memory-device.c              |  12 +--
 hw/pci/pci.c                        |  60 ++++---------
 iothread.c                          |  12 +--
 job-qmp.c                           |  13 ++-
 migration/migration.c               |  20 ++---
 monitor/hmp-cmds.c                  |  35 ++++----
 monitor/qmp-cmds-control.c          |   9 +-
 net/net.c                           |  15 +---
 qemu-img.c                          |   8 +-
 qga/commands-posix.c                | 125 ++++++++++------------------
 qga/commands-win32.c                |  99 ++++++++--------------
 scsi/pr-manager.c                   |  10 +--
 softmmu/tpm.c                       |  38 ++-------
 target/i386/cpu.c                   |  24 ++----
 tests/test-qobject-output-visitor.c |  84 ++++++-------------
 tests/test-string-output-visitor.c  |   6 +-
 ui/spice-core.c                     |  27 +++---
 31 files changed, 297 insertions(+), 596 deletions(-)

-- 
2.30.0



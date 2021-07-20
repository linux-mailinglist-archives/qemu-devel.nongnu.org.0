Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 525D53CFA2D
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 15:12:09 +0200 (CEST)
Received: from localhost ([::1]:33412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5pXc-0002Xo-Bo
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 09:12:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m5pGg-0005Yd-GJ
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 08:54:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m5pGe-0008M2-Qz
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 08:54:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626785675;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=34j7zH9jbS5IpKJJfMwxo661UXmPBq2PQqSIMhLqSmk=;
 b=D1wD3qzY63KDjz5nfYdFmTPSX7kAIhv7u77znAnWOOp+7LlHM4YP4mFBgdfus+Rvs/dBNG
 G6uzX2EmkuosuOyF/cyYTNKhr6UU3NmphqNxLMGX/IVTgjoZtYSdErp1ZoXv0kW2Mhnrsd
 G3X60/VwCiPjhtWUrz5Tm+QzfWmLD1Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-aBythyF1M9uky33Skw649A-1; Tue, 20 Jul 2021 08:54:34 -0400
X-MC-Unique: aBythyF1M9uky33Skw649A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7199B19251A2;
 Tue, 20 Jul 2021 12:54:32 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-187.ams2.redhat.com
 [10.36.114.187])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 79DD519C44;
 Tue, 20 Jul 2021 12:54:10 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E6B1F11326B9; Tue, 20 Jul 2021 14:54:08 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/16] Various error handling fixes and cleanups
Date: Tue, 20 Jul 2021 14:53:52 +0200
Message-Id: <20210720125408.387910-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Reinoud Zandijk <reinoud@netbsd.org>, Jagannathan Raman <jag.raman@oracle.com>,
 Juan Quintela <quintela@redhat.com>, Kamil Rytarowski <kamil@netbsd.org>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Aravinda Prasad <arawinda.p@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Cornelia Huck <cornelia.huck@de.ibm.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I doubt the fixes are 6.1 material at this late stage.  If you
disagree, let me know.

Cc: Alex Williamson <alex.williamson@redhat.com>
Cc: Aravinda Prasad <arawinda.p@gmail.com>
Cc: Cornelia Huck <cornelia.huck@de.ibm.com>
Cc: Daniel P. Berrangé <berrange@redhat.com>
Cc: David Gibson <david@gibson.dropbear.id.au>
Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Cc: Ganesh Goudar <ganeshgr@linux.ibm.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Jagannathan Raman <jag.raman@oracle.com>
Cc: John G Johnson <john.g.johnson@oracle.com>
Cc: Juan Quintela <quintela@redhat.com>
Cc: Kamil Rytarowski <kamil@netbsd.org>
Cc: Kevin Wolf <kwolf@redhat.com>
Cc: Kirti Wankhede <kwankhede@nvidia.com>
Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
Cc: Marcelo Tosatti <mtosatti@redhat.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: Reinoud Zandijk <reinoud@netbsd.org>
Cc: Sergio Lopez <slp@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Sunil Muthuswamy <sunilmut@microsoft.com>
Cc: Thomas Huth <thuth@redhat.com>

Markus Armbruster (16):
  error: Use error_fatal to simplify obvious fatal errors (again)
  spapr: Plug memory leak when we can't add a migration blocker
  spapr: Explain purpose of ->fwnmi_migration_blocker more clearly
  multi-process: Fix pci_proxy_dev_realize() error handling
  vhost-scsi: Plug memory leak on migrate_add_blocker() failure
  i386: Never free migration blocker objects instead of sometimes
  vfio: Avoid error_propagate() after migrate_add_blocker()
  whpx nvmm: Drop useless migrate_del_blocker()
  migration: Unify failure check for migrate_add_blocker()
  migration: Handle migration_incoming_setup() errors consistently
  microvm: Drop dead error handling in microvm_machine_state_init()
  vhost: Clean up how VhostOpts method vhost_get_config() fails
  vhost: Clean up how VhostOpts method vhost_backend_init() fails
  Remove superfluous ERRP_GUARD()
  vl: Clean up -smp error handling
  vl: Don't continue after -smp help.

 backends/tpm/tpm_emulator.c |  3 +--
 hw/display/qxl.c            |  8 ++++----
 hw/i386/microvm.c           |  5 -----
 hw/ppc/spapr_events.c       | 20 ++++++++++----------
 hw/remote/mpqemu-link.c     |  3 ---
 hw/remote/proxy.c           | 10 +++++++++-
 hw/s390x/ipl.c              |  6 +-----
 hw/scsi/vhost-scsi.c        |  4 ++--
 hw/vfio/migration.c         |  6 ++----
 hw/virtio/vhost-user.c      |  8 ++++++++
 hw/virtio/vhost.c           | 16 +++-------------
 migration/migration.c       | 34 ++++++++++------------------------
 qemu-img.c                  |  6 +-----
 qemu-io.c                   |  6 +-----
 qemu-nbd.c                  |  5 +----
 qga/commands-posix-ssh.c    | 17 -----------------
 qga/commands-win32.c        |  1 -
 scsi/qemu-pr-helper.c       | 11 +++--------
 softmmu/vl.c                | 19 +++++++------------
 target/i386/kvm/kvm.c       |  9 +++------
 target/i386/nvmm/nvmm-all.c |  4 +---
 target/i386/sev.c           |  8 +-------
 target/i386/whpx/whpx-all.c |  4 +---
 ui/console.c                |  7 ++-----
 ui/spice-core.c             |  7 +------
 25 files changed, 72 insertions(+), 155 deletions(-)

-- 
2.31.1



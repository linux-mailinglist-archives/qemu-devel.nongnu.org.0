Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2053F93CE
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 06:53:02 +0200 (CEST)
Received: from localhost ([::1]:57908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJTrR-0002S4-IY
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 00:53:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mJTpO-0008Lx-Ga
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 00:50:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mJTpL-0000rO-6m
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 00:50:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630039848;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Bq9OSdmvJC0Ma7hQnKYRx0NL7hndv+xEdEVRoReUya0=;
 b=cT5T/csCYmXr1hqPIMxTKXH71LoB+QO8IrC7HO0gRcCrxVAfX0OCqhEiJBqUc2Ll/oCUpK
 6SV4FX/5HPPt/tjw0R8hMR+dfqF74NBiDbQL17Z60yEmIsQT8AM3U/WEX+vUO1/qG13H8o
 FPEXOEFlzPDRIfetuIh7h8MrYlzgrTg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-599--AYDHRKPOvuSp5dL_863uQ-1; Fri, 27 Aug 2021 00:50:47 -0400
X-MC-Unique: -AYDHRKPOvuSp5dL_863uQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 24BE9185302B;
 Fri, 27 Aug 2021 04:50:46 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-4.ams2.redhat.com [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ECBAB5C1BB;
 Fri, 27 Aug 2021 04:50:45 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7CCE511380A9; Fri, 27 Aug 2021 06:50:44 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/15] Error reporting patches for 2021-08-26
Date: Fri, 27 Aug 2021 06:50:29 +0200
Message-Id: <20210827045044.388748-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit c83fcfaf8a54d0d034bd0edf7bbb3b0d16669be9:

  Merge remote-tracking branch 'remotes/armbru/tags/pull-qapi-2021-08-26' into staging (2021-08-26 13:42:34 +0100)

are available in the Git repository at:

  git://repo.or.cz/qemu/armbru.git tags/pull-error-2021-08-26

for you to fetch changes up to f9dfae9cb6b27649085f662a863f6167650402e0:

  vl: Clean up -smp error handling (2021-08-26 17:15:28 +0200)

----------------------------------------------------------------
Error reporting patches for 2021-08-26

----------------------------------------------------------------
Markus Armbruster (15):
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

 backends/tpm/tpm_emulator.c |  3 +--
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
 softmmu/vl.c                | 19 ++++++-------------
 target/i386/kvm/kvm.c       |  9 +++------
 target/i386/nvmm/nvmm-all.c |  4 +---
 target/i386/sev.c           |  8 +-------
 target/i386/whpx/whpx-all.c |  4 +---
 ui/console.c                |  7 ++-----
 ui/spice-core.c             |  7 +------
 24 files changed, 67 insertions(+), 152 deletions(-)

-- 
2.31.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C98872B0CDB
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 19:40:51 +0100 (CET)
Received: from localhost ([::1]:44964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdHWc-00046t-Ss
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 13:40:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kdHU8-0002IB-Fn
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 13:38:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kdHU6-0006NB-D4
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 13:38:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605206293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=AP2aDB7XLPlMm/BviJXDq2hOCHG1j3Xs1GoPbvS0+HY=;
 b=ayLn2gGdL6YIyKf5RoIR3mSta/9Zuj07/yiZQwfW6ukjWqB2jNdNLFh0ffyWovAwxEQ+48
 7ai49SZ70m5yNmUUPHtfVYPiVTQFrm2lcUzi2+e1e15eCJkbzSzQkBr9dF+nHSaUsDC/YS
 016Q9h2hX1XUun0CevJLxUAC29Kj1Us=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-593-tB8H_5szOSyD8JcoWImbOg-1; Thu, 12 Nov 2020 13:38:09 -0500
X-MC-Unique: tB8H_5szOSyD8JcoWImbOg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CDDF5AF064;
 Thu, 12 Nov 2020 18:38:07 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-115-60.ams2.redhat.com
 [10.36.115.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A78D85D9F7;
 Thu, 12 Nov 2020 18:38:01 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, kuhn.chenqun@huawei.com, zhengchuan@huawei.com,
 lihaotian9@huawei.com, longpeng2@huawei.com, liangpeng10@huawei.com,
 philmd@redhat.com, liuzhiqiang26@huawei.com
Subject: [PULL 00/11] migration queue
Date: Thu, 12 Nov 2020 18:37:47 +0000
Message-Id: <20201112183758.203176-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 08:00:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: stefanha@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

The following changes since commit cb5d19e8294486551c422759260883ed290226d9:

  Merge remote-tracking branch 'remotes/mcayland/tags/qemu-macppc-20201112' into staging (2020-11-12 11:33:26 +0000)

are available in the Git repository at:

  git://github.com/dagrh/qemu.git tags/pull-migration-20201112a

for you to fetch changes up to 7632b56c8f880a8f86cf049a3785069e1ffd2997:

  virtiofsd: check whether strdup lo.source return NULL in main func (2020-11-12 16:25:38 +0000)

----------------------------------------------------------------
Migration & virtiofs fixes for 5.2

A bunch of small fixes.

----------------------------------------------------------------
Chen Qun (1):
      migration: fix uninitialized variable warning in migrate_send_rp_req_pages()

Chuan Zheng (3):
      migration/multifd: fix hangup with TLS-Multifd due to blocking handshake
      migration/dirtyrate: simplify includes in dirtyrate.c
      multifd/tls: fix memoryleak of the QIOChannelSocket object when cancelling migration

Haotian Li (3):
      tools/virtiofsd/buffer.c: check whether buf is NULL in fuse_bufvec_advance func
      virtiofsd: check whether lo_map_reserve returns NULL in, main func
      virtiofsd: check whether strdup lo.source return NULL in main func

Longpeng (Mike) (1):
      migration: handle CANCELLING state in migration_completion()

Max Reitz (1):
      virtiofsd: Announce submounts even without statx()

Peng Liang (1):
      ACPI: Avoid infinite recursion when dump-vmstate

Philippe Mathieu-Daudé (1):
      migration/ram: Fix hexadecimal format string specifier

 hw/acpi/generic_event_device.c   | 12 +++++++++++-
 migration/dirtyrate.c            |  5 -----
 migration/migration.c            |  4 +++-
 migration/multifd.c              | 24 ++++++++++++++++++------
 migration/ram.c                  |  2 +-
 tools/virtiofsd/buffer.c         |  4 ++++
 tools/virtiofsd/passthrough_ll.c | 24 +++++++++++++++---------
 7 files changed, 52 insertions(+), 23 deletions(-)



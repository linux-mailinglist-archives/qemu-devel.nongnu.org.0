Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA24E3C731B
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 17:25:16 +0200 (CEST)
Received: from localhost ([::1]:54240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3KHa-0003mg-Lc
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 11:25:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m3KG5-00024Z-Rz
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 11:23:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37136)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m3KG4-0001dg-7k
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 11:23:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626189819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=h/lliOj01L6AGN+/INwVfeKgpNSkD7f7PthKAwI5Xp4=;
 b=Xd3Yu52X5iFL5Fah1/Hg5DhWIZkODtW93qolOdpoO87VkyJrbskzHqsDocsRijO0R9x9sM
 yDaLObnARvK5TCCHBhI4QQq1QJq9Ktjf4dWrWPYRGhM7reJrF0xuO+51oxzttdBQnDVzCJ
 fGEGHYRnWu9+vjdeOlo3bX7kHDOhcQQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-qklM-yb_MWad1AtrBMVOew-1; Tue, 13 Jul 2021 11:23:36 -0400
X-MC-Unique: qklM-yb_MWad1AtrBMVOew-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 83B4D9F92B;
 Tue, 13 Jul 2021 15:23:35 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-214.ams2.redhat.com
 [10.36.114.214])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 89C0F5D9CA;
 Tue, 13 Jul 2021 15:23:29 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, lizhijian@cn.fujitsu.com, lvivier@redhat.com,
 peterx@redhat.com
Subject: [PULL 0/6] migration queue
Date: Tue, 13 Jul 2021 16:23:18 +0100
Message-Id: <20210713152324.217255-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

The following changes since commit 708f50199b59476ec4b45ebcdf171550086d6292:

  Merge remote-tracking branch 'remotes/ericb/tags/pull-nbd-2021-07-09-v2' into staging (2021-07-13 14:32:20 +0100)

are available in the Git repository at:

  https://gitlab.com/dagrh/qemu.git tags/pull-migration-20210713a

for you to fetch changes up to 63268c4970a5f126cc9af75f3ccb8057abef5ec0:

  migration: Move bitmap_mutex out of migration_bitmap_clear_dirty() (2021-07-13 16:21:57 +0100)

----------------------------------------------------------------
Migration pull 2021-07-13

----------------------------------------------------------------
Laurent Vivier (1):
      migration: failover: emit a warning when the card is not fully unplugged

Li Zhijian (1):
      migration/rdma: prevent from double free the same mr

Peter Xu (4):
      migration: Release return path early for paused postcopy
      migration: Don't do migrate cleanup if during postcopy resume
      migration: Clear error at entry of migrate_fd_connect()
      migration: Move bitmap_mutex out of migration_bitmap_clear_dirty()

 migration/migration.c | 41 ++++++++++++++++++++++++++++++++++++-----
 migration/ram.c       | 13 +++++++++++--
 migration/rdma.c      |  1 +
 3 files changed, 48 insertions(+), 7 deletions(-)



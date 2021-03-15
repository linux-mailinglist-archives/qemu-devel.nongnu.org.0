Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9754A33C77A
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 21:14:12 +0100 (CET)
Received: from localhost ([::1]:39890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLtbP-0001Sm-Iv
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 16:14:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lLtZq-00009o-9p
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 16:12:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34277)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lLtZn-0006Gs-Vv
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 16:12:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615839150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=1EVJEQ143NxM7JQxqQR1/7pmfQ4htIOI360ZN/tzyiY=;
 b=deHWWpEnjr04aYU4T4c8xgOd5GerbcsIV6iO3rEmqm86oDHWLSb6lFNkuiyKkBcrBl+/dq
 oJq7zDqhQ5wuJ+kM/XwT7bkEkWSY5DH/GirwVO/0XF97EU4vBab+j+IWGa0NtKzmzVeehq
 BFr/IOc0P6olvZGUCTPMq/ou3QTWrtA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-111-G4hf09cZMZqblLeIhrlfng-1; Mon, 15 Mar 2021 16:12:28 -0400
X-MC-Unique: G4hf09cZMZqblLeIhrlfng-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F7CE87A83E;
 Mon, 15 Mar 2021 20:12:26 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-235.ams2.redhat.com
 [10.36.114.235])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5CF4962688;
 Mon, 15 Mar 2021 20:12:18 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, groug@kaod.org, vgoyal@redhat.com,
 wanghao232@huawei.com, ma.mandourr@gmail.com
Subject: [PULL 0/9] virtiofs and migration queue
Date: Mon, 15 Mar 2021 20:12:06 +0000
Message-Id: <20210315201215.222539-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
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
Cc: stefanha@redhat.com, peterx@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

The following changes since commit e7c6a8cf9f5c82aa152273e1c9e80d07b1b0c32c:

  Merge remote-tracking branch 'remotes/philmd/tags/avr-20210315' into staging (2021-03-15 16:59:55 +0000)

are available in the Git repository at:

  https://gitlab.com/dagrh/qemu.git tags/pull-virtiofs-20210315

for you to fetch changes up to 373969507a3dc7de2d291da7e1bd03acf46ec643:

  migration: Replaced qemu_mutex_lock calls with QEMU_LOCK_GUARD (2021-03-15 20:01:55 +0000)

----------------------------------------------------------------
virtiofs and migration pull 2021-03-15

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

----------------------------------------------------------------
Greg Kurz (4):
      virtiofsd: Release vu_dispatch_lock when stopping queue
      virtiofsd: Don't allow empty filenames
      virtiofsd: Don't allow empty paths in lookup_name()
      virtiofsd: Convert some functions to return bool

Hao Wang (2):
      migration/tls: fix inverted semantics in multifd_channel_connect
      migration/tls: add error handling in multifd_tls_handshake_thread

Mahmoud Mandour (2):
      monitor: Replaced qemu_mutex_lock calls with QEMU_LOCK_GUARD
      migration: Replaced qemu_mutex_lock calls with QEMU_LOCK_GUARD

Vivek Goyal (1):
      virtiofsd: Add qemu version and copyright info

 migration/migration.c            |  6 ++---
 migration/multifd.c              | 21 +++++++++++-----
 migration/ram.c                  |  6 ++---
 monitor/monitor.c                |  8 ++-----
 monitor/qmp.c                    | 51 +++++++++++++++++++--------------------
 tools/virtiofsd/fuse_virtio.c    |  6 +++++
 tools/virtiofsd/passthrough_ll.c | 52 ++++++++++++++++++++++++++++++++++++----
 7 files changed, 98 insertions(+), 52 deletions(-)



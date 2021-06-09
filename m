Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA2A3A17C0
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 16:47:00 +0200 (CEST)
Received: from localhost ([::1]:39580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqzTu-0004bf-Uz
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 10:46:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lqzSV-0002NF-90
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:45:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37331)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lqzSR-0005AJ-7M
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:45:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623249925;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Xz/kXv1OMfVDik7MvEisNujzPsUmG3ebMwVnoohQ1rk=;
 b=YhqJ/6KN0sjWaF9b6GI3HL7MXqjloCKarp1sRfh8Y92dLDYe7d7hzx2Se23TNjHJoe7mfd
 W7KeXP2aqN+qNzd0tPrw02OBi4hg6gqRJPINxKHP/n44K00CAoFlb+klJekeGZHR7uxkee
 QF3DzFfnzHxQyfQz7YLmMVE77IMtvoE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-120-JJKmE-h_NlWwyD7VC1E9Qw-1; Wed, 09 Jun 2021 10:45:22 -0400
X-MC-Unique: JJKmE-h_NlWwyD7VC1E9Qw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E6C8E8015A4;
 Wed,  9 Jun 2021 14:45:21 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-113-168.ams2.redhat.com
 [10.36.113.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 51BCD1002EF0;
 Wed,  9 Jun 2021 14:45:17 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, huangy81@chinatelecom.cn, peterx@redhat.com,
 lizhijian@cn.fujitsu.com, leobras.c@gmail.com, pabeni@redhat.com
Subject: [PULL 0/9] migration queue
Date: Wed,  9 Jun 2021 15:45:03 +0100
Message-Id: <20210609144512.211746-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

The following changes since commit a4716fd8d7c877185652f5f8e25032dc7699d51b:

  Merge remote-tracking branch 'remotes/alistair/tags/pull-riscv-to-apply-20210608-1' into staging (2021-06-08 13:54:23 +0100)

are available in the Git repository at:

  https://gitlab.com/dagrh/qemu.git tags/pull-migration-20210609a

for you to fetch changes up to a4a571d97866d056787d7a654be5792765be8a60:

  hmp: Add "calc_dirty_rate" and "info dirty_rate" cmds (2021-06-08 20:18:26 +0100)

----------------------------------------------------------------
Migration pull for 2021-06-09

Yank crash fix from Leo
RDMA fix from Li
mptcp support from me
dirty-rate changes from Hyman and Peter

(Note I've switched to the gitlab I've been using for virtiofs pulls)

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

----------------------------------------------------------------
Dr. David Alan Gilbert (5):
      channel-socket: Only set CLOEXEC if we have space for fds
      io/net-listener: Call the notifier during finalize
      migration: Add cleanup hook for inwards migration
      migration/socket: Close the listener at the end
      sockets: Support multipath TCP

Hyman Huang(黄勇) (1):
      migration/dirtyrate: make sample page count configurable

Leonardo Bras (1):
      yank: Unregister function when using TLS migration

Li Zhijian (1):
      migration/rdma: Fix cm event use after free

Peter Xu (1):
      hmp: Add "calc_dirty_rate" and "info dirty_rate" cmds

 hmp-commands-info.hx          | 13 ++++++++
 hmp-commands.hx               | 14 ++++++++
 include/monitor/hmp.h         |  2 ++
 io/channel-socket.c           |  8 ++---
 io/dns-resolver.c             |  4 +++
 io/net-listener.c             |  3 ++
 migration/channel.c           | 26 ++++++++-------
 migration/dirtyrate.c         | 78 ++++++++++++++++++++++++++++++++++++++++---
 migration/dirtyrate.h         |  8 ++++-
 migration/migration.c         |  3 ++
 migration/migration.h         |  4 +++
 migration/multifd.c           |  8 ++++-
 migration/qemu-file-channel.c |  4 ++-
 migration/rdma.c              | 11 ++++--
 migration/socket.c            | 24 +++++++++----
 qapi/migration.json           | 15 +++++++--
 qapi/sockets.json             |  5 ++-
 util/qemu-sockets.c           | 23 +++++++++++++
 18 files changed, 217 insertions(+), 36 deletions(-)



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3080E6CBF4A
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 14:37:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ph8YQ-0004CO-MH; Tue, 28 Mar 2023 08:35:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ph8YN-0004BV-0a
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 08:35:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ph8YL-0006CB-8e
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 08:35:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680006951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Vww6IH3ykF6aiGwRMZtbCl3FDojIAX7Oh2wSKev4rmw=;
 b=Nh7asoTywSZMVBURseQXinCetDirMS4lniWe5ciDmx4L3dvwrpnA9anLK0bcI5OaG4JChz
 a/I0H8rfbhW7ZLAKS/HFWtcuB1RbcW1XvLeKWWXxiXyN94fruvVgTMVZmm1gR6nADSxoVB
 l021goUScyD9sb2NhksWvqmQKcskyYY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-367-eutj6swuMQq0UDMlwCOuEw-1; Tue, 28 Mar 2023 08:35:50 -0400
X-MC-Unique: eutj6swuMQq0UDMlwCOuEw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B7C6285A588;
 Tue, 28 Mar 2023 12:35:49 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.193.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 09D5DC15BA0;
 Tue, 28 Mar 2023 12:35:48 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 0/4] Block layer patches
Date: Tue, 28 Mar 2023 14:35:38 +0200
Message-Id: <20230328123542.222022-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
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

The following changes since commit e3debd5e7d0ce031356024878a0a18b9d109354a:

  Merge tag 'pull-request-2023-03-24' of https://gitlab.com/thuth/qemu into staging (2023-03-24 16:08:46 +0000)

are available in the Git repository at:

  https://repo.or.cz/qemu/kevin.git tags/for-upstream

for you to fetch changes up to d8fbf9aa85aed64450907580a1d70583f097e9df:

  block/export: Fix graph locking in blk_get_geometry() call (2023-03-27 15:16:05 +0200)

----------------------------------------------------------------
Block layer patches

- aio-posix: Fix race during epoll upgrade
- vhost-user-blk/VDUSE export: Fix a potential deadlock and an assertion
  failure when the export runs in an iothread
- NBD server: Push pending frames after sending reply to fix performance
  especially when used with TLS

----------------------------------------------------------------
Florian Westphal (1):
      nbd/server: push pending frames after sending reply

Kevin Wolf (1):
      block/export: Fix graph locking in blk_get_geometry() call

Stefan Hajnoczi (2):
      block/export: only acquire AioContext once for vhost_user_server_stop()
      aio-posix: fix race between epoll upgrade and aio_set_fd_handler()

 include/block/block-io.h          |  4 +++-
 include/sysemu/block-backend-io.h |  5 ++++-
 block.c                           |  5 +++--
 block/block-backend.c             |  7 +++++--
 block/export/virtio-blk-handler.c |  7 ++++---
 nbd/server.c                      |  3 +++
 util/fdmon-epoll.c                | 25 ++++++++++++++++++-------
 util/vhost-user-server.c          |  5 +----
 8 files changed, 41 insertions(+), 20 deletions(-)



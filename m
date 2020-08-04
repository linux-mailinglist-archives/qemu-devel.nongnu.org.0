Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 392B823B8E6
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Aug 2020 12:39:45 +0200 (CEST)
Received: from localhost ([::1]:36958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k2uMC-0002Zc-6c
	for lists+qemu-devel@lfdr.de; Tue, 04 Aug 2020 06:39:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dimastep@yandex-team.ru>)
 id 1k2uKL-0000wZ-NA; Tue, 04 Aug 2020 06:37:49 -0400
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193]:53944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dimastep@yandex-team.ru>)
 id 1k2uKE-0002Gp-Jt; Tue, 04 Aug 2020 06:37:47 -0400
Received: from iva8-d077482f1536.qloud-c.yandex.net
 (iva8-d077482f1536.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:2f26:0:640:d077:482f])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 74CCD2E18D7;
 Tue,  4 Aug 2020 13:37:24 +0300 (MSK)
Received: from iva8-88b7aa9dc799.qloud-c.yandex.net
 (iva8-88b7aa9dc799.qloud-c.yandex.net [2a02:6b8:c0c:77a0:0:640:88b7:aa9d])
 by iva8-d077482f1536.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 bgnPEemcjw-bLtWNT1J; Tue, 04 Aug 2020 13:37:24 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1596537444; bh=jIq8yhtbri6E8JxMznBTF3+pYmfY+84qUw6885cYT3c=;
 h=Message-Id:Date:Subject:To:From:Cc;
 b=QuIP4EQ4JLVe2+o7DIlISDN/CEtqRc8Bpjls1cIxbuA9yUdNW79mHlXaeWthWl/tK
 f/mPe9r75GPrhejM9hehpCwGMsGiEzIKb2DyWOvmHaTHCYGdWK+BCINIL49biT6HGE
 YI9vIbYjDMWKQcwCUwP6XT5DxVNhJ/sPu3m5Ug1M=
Authentication-Results: iva8-d077482f1536.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b081:2::1:a])
 by iva8-88b7aa9dc799.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 ZZLKBSFEhl-bKiWXnJU; Tue, 04 Aug 2020 13:37:21 +0300
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (Client certificate not present)
From: Dima Stepanov <dimastep@yandex-team.ru>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 0/7] vhost-user-blk: fix the migration issue and enhance
 qtests
Date: Tue,  4 Aug 2020 13:36:45 +0300
Message-Id: <cover.1596536559.git.dimastep@yandex-team.ru>
X-Mailer: git-send-email 2.7.4
Received-SPF: pass client-ip=95.108.205.193;
 envelope-from=dimastep@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/04 06:37:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, lvivier@redhat.com, thuth@redhat.com,
 qemu-block@nongnu.org, mst@redhat.com, jasowang@redhat.com,
 dgilbert@redhat.com, mreitz@redhat.com, fengli@smartx.com,
 yc-core@yandex-team.ru, pbonzini@redhat.com, raphael.norwitz@nutanix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reference e-mail threads:
  - https://lists.gnu.org/archive/html/qemu-devel/2020-05/msg01509.html
  - https://lists.gnu.org/archive/html/qemu-devel/2020-05/msg05241.html

If vhost-user daemon is used as a backend for the vhost device, then we
should consider a possibility of disconnect at any moment. There was a general
question here: should we consider it as an error or okay state for the vhost-user
devices during migration process?
I think the disconnect event for the vhost-user devices should not break the
migration process, because:
  - the device will be in the stopped state, so it will not be changed
    during migration
  - if reconnect will be made the migration log will be reinitialized as
    part of reconnect/init process:
    #0  vhost_log_global_start (listener=0x563989cf7be0)
    at hw/virtio/vhost.c:920
    #1  0x000056398603d8bc in listener_add_address_space (listener=0x563989cf7be0,
        as=0x563986ea4340 <address_space_memory>)
    at softmmu/memory.c:2664
    #2  0x000056398603dd30 in memory_listener_register (listener=0x563989cf7be0,
        as=0x563986ea4340 <address_space_memory>)
    at softmmu/memory.c:2740
    #3  0x0000563985fd6956 in vhost_dev_init (hdev=0x563989cf7bd8,
        opaque=0x563989cf7e30, backend_type=VHOST_BACKEND_TYPE_USER,
        busyloop_timeout=0)
    at hw/virtio/vhost.c:1385
    #4  0x0000563985f7d0b8 in vhost_user_blk_connect (dev=0x563989cf7990)
    at hw/block/vhost-user-blk.c:315
    #5  0x0000563985f7d3f6 in vhost_user_blk_event (opaque=0x563989cf7990,
        event=CHR_EVENT_OPENED)
    at hw/block/vhost-user-blk.c:379
The first patch in the patchset fixes this issue by setting vhost device to the
stopped state in the disconnect handler and check it the vhost_migration_log()
routine before returning from the function.
qtest framework was updated to test vhost-user-blk functionality. The
vhost-user-blk/vhost-user-blk-tests/migrate_reconnect test was added to reproduce
the original issue found.

Dima Stepanov (7):
  vhost: recheck dev state in the vhost_migration_log routine
  vhost: check queue state in the vhost_dev_set_log routine
  tests/qtest/vhost-user-test: prepare the tests for adding new dev
    class
  tests/qtest/libqos/virtio-blk: add support for vhost-user-blk
  tests/qtest/vhost-user-test: add support for the vhost-user-blk device
  tests/qtest/vhost-user-test: add migrate_reconnect test
  tests/qtest/vhost-user-test: enable the reconnect tests

 hw/block/vhost-user-blk.c          |  13 +-
 hw/virtio/vhost.c                  |  39 ++++-
 include/hw/virtio/vhost-user-blk.h |   1 +
 tests/qtest/libqos/virtio-blk.c    |  14 ++
 tests/qtest/vhost-user-test.c      | 291 +++++++++++++++++++++++++++++++------
 5 files changed, 311 insertions(+), 47 deletions(-)

-- 
2.7.4



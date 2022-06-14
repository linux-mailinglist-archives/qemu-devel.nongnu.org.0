Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B6854AF50
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 13:29:56 +0200 (CEST)
Received: from localhost ([::1]:57922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o14k7-0006bh-5Q
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 07:29:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arbn@yandex-team.com>)
 id 1o14dk-0001Yp-Jk
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 07:23:20 -0400
Received: from forwardcorp1p.mail.yandex.net
 ([2a02:6b8:0:1472:2741:0:8b6:217]:50246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arbn@yandex-team.com>)
 id 1o14df-0003V5-G9
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 07:23:18 -0400
Received: from myt6-79704c0e15e4.qloud-c.yandex.net
 (myt6-79704c0e15e4.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:239b:0:640:7970:4c0e])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 2CC0A2E1259;
 Tue, 14 Jun 2022 14:18:06 +0300 (MSK)
Received: from myt5-70c90f7d6d7d.qloud-c.yandex.net
 (myt5-70c90f7d6d7d.qloud-c.yandex.net [2a02:6b8:c12:3e2c:0:640:70c9:f7d])
 by myt6-79704c0e15e4.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 4H7dnw1ZKr-I5Kivoa0; Tue, 14 Jun 2022 14:18:06 +0300
X-Yandex-Fwd: 2
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.com;
 s=default; 
 t=1655205486; bh=ejMbW6VY2PKE+QnCgsl0nsMQoQxcjaWcGWa20spMPAU=;
 h=Cc:Message-Id:Date:Subject:To:From;
 b=yijf4XZkLXHOqnm9iYsbdb98giyT3eMJUWqldfpiUy0YPfGj+q1sGtPJzj27IL1zl
 LjXuOHpCizaV9vO3/3l2nx8x8YZr3ZY7EoTtlnWJJCjRdcT154wClLt+8O7rgqfzcC
 NJGlv4oxaTed0HBcEg07BQYxJxZ3LNOBopDTspRI=
Authentication-Results: myt6-79704c0e15e4.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.com
Received: from dellarbn.yandex.net (unknown [2a02:6b8:b081:32::1:13])
 by myt5-70c90f7d6d7d.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 ctCbEGGKR4-I2MagDL5; Tue, 14 Jun 2022 14:18:03 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Andrey Ryabinin <arbn@yandex-team.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Jason Wang <jasowang@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, yc-core@yandex-team.ru,
 Andrey Ryabinin <arbn@yandex-team.com>
Subject: [PATCH 0/2] Make local migration with TAP network device possible
Date: Tue, 14 Jun 2022 14:18:41 +0300
Message-Id: <20220614111843.24960-1-arbn@yandex-team.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:0:1472:2741:0:8b6:217;
 envelope-from=arbn@yandex-team.com; helo=forwardcorp1p.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

Hi

These couple patches aims to  make possible local migration (within one host)
on the same TAP device used by source and destination QEMU

The scenario looks like this
 1. Create TAP devices and pass file descriptors to source QEMU
 2. Launch destination QEMU (-incoming defer) and pass same descriptors to it.
 3. Start migration


Regarding the first patch: It makes possible to receive file descriptor in non-blocking
state. But I probably didn't cover all FD users which might need to set blocking state after
the patch. So I'm hopping for the hints where else, besides fd_start_incoming_migration()
I need to put qemu_socket_set_block() calls.


Andrey Ryabinin (2):
  chardev: don't set O_NONBLOCK on SCM_RIGHTS file descriptors.
  tap: initialize TAPState->enabled according to the actual state of
    queue

 chardev/char-socket.c |  3 ---
 io/channel-socket.c   |  3 ---
 migration/fd.c        |  2 ++
 net/tap-bsd.c         |  5 +++++
 net/tap-linux.c       | 12 ++++++++++++
 net/tap-solaris.c     |  5 +++++
 net/tap.c             |  2 +-
 net/tap_int.h         |  1 +
 8 files changed, 26 insertions(+), 7 deletions(-)

-- 
2.35.1



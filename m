Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 838AC3AD135
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 19:34:07 +0200 (CEST)
Received: from localhost ([::1]:59262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luINa-00070v-2L
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 13:34:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1luILq-0005uh-8n
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 13:32:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24197)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1luILm-0003Mp-L1
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 13:32:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624037532;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=izDmj0VsGAJ+ThpTRmIiV5DE6ZTmUSwEiDchMVsc0nE=;
 b=hWlEp0hap24Sp6YKZXXzgi37uN4gQNEP1SRokQXJg3aYC7OL8GDowE4l0LYgyTqDlHF4/8
 +8tkOas3P/ZGoVpOKutIreNC8l0XIGK5RAJDXt3PvFlR9i3/xf/CtqjKlOLhKRcdiQu4vo
 yhdKZ084KSA+kMqVlqlW3dkX+Z/+rgc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-YnV_9AKwOoqJpAJi6I3hIg-1; Fri, 18 Jun 2021 13:32:08 -0400
X-MC-Unique: YnV_9AKwOoqJpAJi6I3hIg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CC32F1084F4B
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 17:32:07 +0000 (UTC)
Received: from blue.redhat.com (ovpn-112-75.phx2.redhat.com [10.3.112.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 98BBC2C957
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 17:32:07 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 00/34] NBD patches through 2021-06-15
Date: Fri, 18 Jun 2021 12:31:26 -0500
Message-Id: <20210618173200.596368-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.194,
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

The following changes since commit 3ccf6cd0e3e1dfd663814640b3b18b55715d7a75:

  Merge remote-tracking branch 'remotes/kraxel/tags/audio-20210617-pull-request' into staging (2021-06-18 09:54:42 +0100)

are available in the Git repository at:

  https://repo.or.cz/qemu/ericb.git tags/pull-nbd-2021-06-15-v2

for you to fetch changes up to bbfb7c2f350262f893642433dea66352fc168295:

  block/nbd: safer transition to receiving request (2021-06-18 12:21:22 -0500)

v2: silence uninit variable warning [clang, Vladimir]
only re-sending the affected patch

----------------------------------------------------------------
nbd patches for 2021-06-15

- bug fixes in coroutine aio context handling
- rework NBD client connection logic to perform more work in coroutine

----------------------------------------------------------------
Paolo Bonzini (2):
      async: the main AioContext is only "current" if under the BQL
      tests: cover aio_co_enter from a worker thread without BQL taken

Roman Kagan (2):
      block/nbd: fix channel object leak
      block/nbd: ensure ->connection_thread is always valid

Vladimir Sementsov-Ogievskiy (30):
      co-queue: drop extra coroutine_fn marks
      block/nbd: fix how state is cleared on nbd_open() failure paths
      block/nbd: connect_thread_func(): do qio_channel_set_delay(false)
      qemu-sockets: introduce socket_address_parse_named_fd()
      block/nbd: call socket_address_parse_named_fd() in advance
      block/nbd: nbd_client_handshake(): fix leak of s->ioc
      block/nbd: BDRVNBDState: drop unused connect_err and connect_status
      block/nbd: simplify waking of nbd_co_establish_connection()
      block/nbd: drop thr->state
      block/nbd: bs-independent interface for nbd_co_establish_connection()
      block/nbd: make nbd_co_establish_connection_cancel() bs-independent
      block/nbd: rename NBDConnectThread to NBDClientConnection
      block/nbd: introduce nbd_client_connection_new()
      block/nbd: introduce nbd_client_connection_release()
      nbd: move connection code from block/nbd to nbd/client-connection
      nbd/client-connection: use QEMU_LOCK_GUARD
      nbd/client-connection: add possibility of negotiation
      nbd/client-connection: implement connection retry
      nbd/client-connection: shutdown connection on release
      block/nbd: split nbd_handle_updated_info out of nbd_client_handshake()
      block/nbd: use negotiation of NBDClientConnection
      block/nbd: don't touch s->sioc in nbd_teardown_connection()
      block/nbd: drop BDRVNBDState::sioc
      nbd/client-connection: return only one io channel
      block-coroutine-wrapper: allow non bdrv_ prefix
      block/nbd: split nbd_co_do_establish_connection out of nbd_reconnect_attempt
      nbd/client-connection: add option for non-blocking connection attempt
      block/nbd: reuse nbd_co_do_establish_connection() in nbd_open()
      block/nbd: add nbd_client_connected() helper
      block/nbd: safer transition to receiving request

 scripts/block-coroutine-wrapper.py |   7 +-
 block/coroutines.h                 |   6 +
 include/block/aio.h                |   5 +-
 include/block/nbd.h                |  18 ++
 include/qemu/coroutine.h           |   6 +-
 include/qemu/sockets.h             |  11 +
 block/nbd.c                        | 585 ++++++++-----------------------------
 iothread.c                         |   9 +-
 nbd/client-connection.c            | 388 ++++++++++++++++++++++++
 stubs/iothread-lock.c              |   2 +-
 stubs/iothread.c                   |   8 -
 tests/unit/iothread.c              |   9 +-
 tests/unit/test-aio.c              |  37 +++
 util/async.c                       |  20 ++
 util/main-loop.c                   |   1 +
 util/qemu-sockets.c                |  19 ++
 nbd/meson.build                    |   1 +
 stubs/meson.build                  |   1 -
 18 files changed, 642 insertions(+), 491 deletions(-)
 create mode 100644 nbd/client-connection.c
 delete mode 100644 stubs/iothread.c


*** BLURB HERE ***

Paolo Bonzini (2):
  async: the main AioContext is only "current" if under the BQL
  tests: cover aio_co_enter from a worker thread without BQL taken

Roman Kagan (2):
  block/nbd: fix channel object leak
  block/nbd: ensure ->connection_thread is always valid

Vladimir Sementsov-Ogievskiy (30):
  co-queue: drop extra coroutine_fn marks
  block/nbd: fix how state is cleared on nbd_open() failure paths
  block/nbd: connect_thread_func(): do qio_channel_set_delay(false)
  qemu-sockets: introduce socket_address_parse_named_fd()
  block/nbd: call socket_address_parse_named_fd() in advance
  block/nbd: nbd_client_handshake(): fix leak of s->ioc
  block/nbd: BDRVNBDState: drop unused connect_err and connect_status
  block/nbd: simplify waking of nbd_co_establish_connection()
  block/nbd: drop thr->state
  block/nbd: bs-independent interface for nbd_co_establish_connection()
  block/nbd: make nbd_co_establish_connection_cancel() bs-independent
  block/nbd: rename NBDConnectThread to NBDClientConnection
  block/nbd: introduce nbd_client_connection_new()
  block/nbd: introduce nbd_client_connection_release()
  nbd: move connection code from block/nbd to nbd/client-connection
  nbd/client-connection: use QEMU_LOCK_GUARD
  nbd/client-connection: add possibility of negotiation
  nbd/client-connection: implement connection retry
  nbd/client-connection: shutdown connection on release
  block/nbd: split nbd_handle_updated_info out of nbd_client_handshake()
  block/nbd: use negotiation of NBDClientConnection
  block/nbd: don't touch s->sioc in nbd_teardown_connection()
  block/nbd: drop BDRVNBDState::sioc
  nbd/client-connection: return only one io channel
  block-coroutine-wrapper: allow non bdrv_ prefix
  block/nbd: split nbd_co_do_establish_connection out of
    nbd_reconnect_attempt
  nbd/client-connection: add option for non-blocking connection attempt
  block/nbd: reuse nbd_co_do_establish_connection() in nbd_open()
  block/nbd: add nbd_client_connected() helper
  block/nbd: safer transition to receiving request

 scripts/block-coroutine-wrapper.py |   7 +-
 block/coroutines.h                 |   6 +
 include/block/aio.h                |   5 +-
 include/block/nbd.h                |  18 +
 include/qemu/coroutine.h           |   6 +-
 include/qemu/sockets.h             |  11 +
 block/nbd.c                        | 585 +++++++----------------------
 iothread.c                         |   9 +-
 nbd/client-connection.c            | 388 +++++++++++++++++++
 stubs/iothread-lock.c              |   2 +-
 stubs/iothread.c                   |   8 -
 tests/unit/iothread.c              |   9 +-
 tests/unit/test-aio.c              |  37 ++
 util/async.c                       |  20 +
 util/main-loop.c                   |   1 +
 util/qemu-sockets.c                |  19 +
 nbd/meson.build                    |   1 +
 stubs/meson.build                  |   1 -
 18 files changed, 642 insertions(+), 491 deletions(-)
 create mode 100644 nbd/client-connection.c
 delete mode 100644 stubs/iothread.c

-- 
2.31.1



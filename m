Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D58B65F6566
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 13:50:46 +0200 (CEST)
Received: from localhost ([::1]:45434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogPOn-0004Nr-9e
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 07:50:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ogPBc-0003GX-7W
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 07:37:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ogPBY-0000tR-NM
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 07:37:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665056223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=DP9u10e3+8hRCdGHXbxONmyQNo4FDLszMN7mV8DHPRQ=;
 b=ZeKXAHts950R9DB0NU0PGEfmFweDPgDPfPwo+a0tt71DEPxx3WbkRsI7SyoIinoqk+1oSw
 qlSPjwJ633l1Fsor61UpO2NeVM8W4U0tA9gjZRpEz/y6ly/lZuWKh4Uxu/Oy7+LhWjyonU
 Em5qlWX8+BiekayfYEDiLSbY3bqrPV4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-15-Za9q1nIPNIeHDBnKIWc-KQ-1; Thu, 06 Oct 2022 07:37:02 -0400
X-MC-Unique: Za9q1nIPNIeHDBnKIWc-KQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DDF11802C17
 for <qemu-devel@nongnu.org>; Thu,  6 Oct 2022 11:37:01 +0000 (UTC)
Received: from localhost (unknown [10.39.208.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1E91D1121320;
 Thu,  6 Oct 2022 11:37:00 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: berrange@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v4 0/6] io/command: implement portable spawn
Date: Thu,  6 Oct 2022 15:36:51 +0400
Message-Id: <20221006113657.2656108-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Hi,

This enables support of command spawning in the io/ subsystem on Windows.

v4:
 - add "util: make do_send_recv work with partial send/recv" patch
 - drop usage of SOCAT environment variable for tests
 - misc style fixes

v3:
 - actually make it work :) (it seems I didn't test correctly earlier attempts)
 - add a patch for readv_writev() and partial IOs
 - add a patch to avoid some potential race in echo test
 - drop usage of PIPE_NOWAIT which was broken

Marc-André Lureau (6):
  osdep: make readv_writev() work with partial read/write
  util: make do_send_recv work with partial send/recv
  tests/channel-helper: set blocking in main thread
  io/command: use glib GSpawn, instead of open-coding fork/exec
  io/command: implement support for win32
  tests/unit: make test-io-channel-command work on win32

 include/io/channel-command.h         |   5 +-
 io/channel-command.c                 | 185 +++++++++++----------------
 tests/unit/io-channel-helpers.c      |   9 +-
 tests/unit/test-io-channel-command.c |  37 +++---
 util/iov.c                           |  10 +-
 util/osdep.c                         |  11 +-
 6 files changed, 119 insertions(+), 138 deletions(-)

-- 
2.37.3



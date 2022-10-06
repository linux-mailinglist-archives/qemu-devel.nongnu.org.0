Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9905F6278
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 10:20:17 +0200 (CEST)
Received: from localhost ([::1]:53244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogM75-0004PN-GK
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 04:20:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ogLzg-0006LW-Ph
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 04:12:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36171)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ogLzd-0002oS-K0
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 04:12:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665043951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=NldrGbIFBY+Hk/Qls9HVUDfXK5k/xbqUVC8xI78p4Ew=;
 b=GottkbskyeIuZ3HQ5+EX02MwfPdgbcQem2+HwSkFgyOmwAGTk+ONZdnD0Uud4TZx599gGc
 siiiBw3Sx6cUbAWSBVznWIcr++xlDOdMfF78ZhkPa9tAiR9WL/vPikLte+1yKZoibsJ/66
 hvga9upmiVzeFm8IolkNcSdfaSBIfNo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-412-mXQO9GqCNFyhvD5kRoAMbQ-1; Thu, 06 Oct 2022 04:12:27 -0400
X-MC-Unique: mXQO9GqCNFyhvD5kRoAMbQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 43DDF185A7A3
 for <qemu-devel@nongnu.org>; Thu,  6 Oct 2022 08:12:27 +0000 (UTC)
Received: from localhost (unknown [10.39.208.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6C2B52166B2F;
 Thu,  6 Oct 2022 08:12:26 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v3 0/5] io/command: implement portable spawn
Date: Thu,  6 Oct 2022 12:12:17 +0400
Message-Id: <20221006081222.2606746-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124;
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

v3:
 - actually make it work :) (it seems I didn't test correctly earlier attempts)
 - add a patch for readv_writev() and partial IOs
 - add a patch to avoid some potential race in echo test
 - drop usage of PIPE_NOWAIT which was broken

Marc-André Lureau (5):
  osdep: make readv_writev() work with partial read/write
  tests/channel-helper: set blocking in main thread
  io/command: use glib GSpawn, instead of open-coding fork/exec
  io/command: implement support for win32
  tests/unit: make test-io-channel-command work on win32

 include/io/channel-command.h         |   5 +-
 io/channel-command.c                 | 185 +++++++++++----------------
 tests/unit/io-channel-helpers.c      |   9 +-
 tests/unit/test-io-channel-command.c |  32 ++---
 util/osdep.c                         |  10 +-
 tests/unit/meson.build               |   2 +-
 6 files changed, 107 insertions(+), 136 deletions(-)

-- 
2.37.3



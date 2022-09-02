Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD935AB160
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 15:26:48 +0200 (CEST)
Received: from localhost ([::1]:49636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oU6h4-0000Cx-Rz
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 09:26:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oU6V6-0005yW-IQ
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 09:14:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48405)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oU6V1-0001tf-Ns
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 09:14:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662124458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=L3zxyTc06vgtopM8XlmJ8om0Ph+Q6fB/rA50wD7Ze5k=;
 b=VwUbsabyXRBIRp+jQKEJVcgZ92Whog1ePiXU4K0e7YOqJnbVZKlhbHEzlIzgRe9z6KcYVI
 Ki3Hk3754/9dCQvqVW7gdtgeQoudNAMNSQdL83/C8Dw0Egm8AM6YNMHkQAUA1gl9NfoSQC
 PUv2PpKOEtgPx0TjozNusQXy40dlmYk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-561-aX87MSZUOwCCB7cSicyJgw-1; Fri, 02 Sep 2022 09:14:17 -0400
X-MC-Unique: aX87MSZUOwCCB7cSicyJgw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1792F8037AE;
 Fri,  2 Sep 2022 13:14:17 +0000 (UTC)
Received: from localhost (unknown [10.39.208.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8D9004011A37;
 Fri,  2 Sep 2022 13:14:15 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 bin.meng@windriver.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 0/4] chardev patches & a small audio fix
Date: Fri,  2 Sep 2022 17:14:08 +0400
Message-Id: <20220902131412.3125752-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The following changes since commit 93fac696d241dccb04ebb9d23da55fc1e9d8ee36:

  Open 7.2 development tree (2022-08-30 09:40:41 -0700)

are available in the Git repository at:

  git@gitlab.com:marcandre.lureau/qemu.git tags/char-pull-request

for you to fetch changes up to 0f957c53c84d655f2e99677d407cf2bbe1832de4:

  audio: exit(1) if audio backend failed to be found or initialized (2022-09-02 15:54:47 +0400)

----------------------------------------------------------------
chardev patches & small audio fix

----------------------------------------------------------------

Bin Meng (3):
  util/qemu-sockets: Enable unix socket support on Windows
  chardev/char-socket: Update AF_UNIX for Windows
  tests/unit: Update test-io-channel-socket.c for Windows

Marc-André Lureau (1):
  audio: exit(1) if audio backend failed to be found or initialized

 meson.build                         |  3 +++
 audio/audio.h                       |  2 +-
 include/sysemu/os-win32.h           | 17 +++++++++++++
 tests/unit/socket-helpers.h         |  9 +++++++
 audio/audio.c                       | 14 ++++++++---
 chardev/char-socket.c               |  4 ++--
 softmmu/vl.c                        |  4 +++-
 tests/unit/socket-helpers.c         | 16 +++++++++++++
 tests/unit/test-io-channel-socket.c | 37 ++++++++++++++++++-----------
 util/qemu-sockets.c                 | 25 -------------------
 10 files changed, 85 insertions(+), 46 deletions(-)

-- 
2.37.2



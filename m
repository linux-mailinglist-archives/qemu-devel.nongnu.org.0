Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD264E2EC9
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 18:07:52 +0100 (CET)
Received: from localhost ([::1]:52190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWLVX-0004wM-EJ
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 13:07:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nWLRL-0001cU-7Q
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 13:03:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nWLRI-00055k-J8
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 13:03:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647882206;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=I5IH/e9OJLTLfU6cDr6judmeznQwSIBTw6dzY+7ZPZs=;
 b=DM8zwqTUj9lWNqfRpjiohQEjRh/Fmzdw8178zzvTF3gg9zToFo5d5kX8SrpZZztCFhFt7o
 QyqbjChs0Ld/kG1op/b3FXKtC0WZY8/SckNf2tTNiOsa7KgsmUofclajhcpE6DZM1VyhYC
 GeTywj5P/kMU1hshdS3K368rgbh30F8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-644-FIOh9OT2NmukQQhuYTSd1Q-1; Mon, 21 Mar 2022 13:03:25 -0400
X-MC-Unique: FIOh9OT2NmukQQhuYTSd1Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D5C6618E5357;
 Mon, 21 Mar 2022 17:03:24 +0000 (UTC)
Received: from thuth.com (unknown [10.39.195.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D9019403D188;
 Mon, 21 Mar 2022 17:03:22 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 0/8] Fix CVE-2021-3611 and heap overflow in sdhci code
Date: Mon, 21 Mar 2022 18:03:12 +0100
Message-Id: <20220321170320.282496-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-block@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alexander Bulekov <alxndr@bu.edu>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 2058fdbe81e2985c226a026851dd26b146d3395c:

  Merge tag 'fixes-20220318-pull-request' of git://git.kraxel.org/qemu into staging (2022-03-19 11:28:54 +0000)

are available in the Git repository at:

  https://gitlab.com/thuth/qemu.git tags/pull-request-2022-03-21

for you to fetch changes up to 27801168ecbb34b987d2e92a12369367bf9ac2bf:

  tests/qtest/fuzz-sdcard-test: Add reproducer for OSS-Fuzz (Issue 29225) (2022-03-21 14:05:42 +0100)

----------------------------------------------------------------
* Fix stack-overflow due to recursive DMA in intel-hda (CVE-2021-3611)
* Fix heap overflow due to recursive DMA in sdhci code

----------------------------------------------------------------

As far as I can see, these patches were ready to go, just felt
through the cracks so far since Philippe is now doing other stuff...
I think it would be nice to get these fixed for 7.0 (and if there
is ever a thorough global DMA reentrancy fix later in >= 7.1, we
can still revert the device-specific fixes here again later).

Philippe Mathieu-Daudé (8):
    softmmu/physmem: Simplify flatview_write and address_space_access_valid
    softmmu/physmem: Introduce MemTxAttrs::memory field and MEMTX_ACCESS_ERROR
    hw/audio/intel-hda: Do not ignore DMA overrun errors
    hw/audio/intel-hda: Restrict DMA engine to memories (not MMIO devices)
    tests/qtest/intel-hda-test: Add reproducer for issue #542
    hw/sd/sdhci: Honor failed DMA transactions
    hw/sd/sdhci: Prohibit DMA accesses to devices
    tests/qtest/fuzz-sdcard-test: Add reproducer for OSS-Fuzz (Issue 29225)

 include/exec/memattrs.h        |  9 +++++
 hw/audio/intel-hda.c           | 11 ++++--
 hw/sd/sdhci.c                  | 35 ++++++++++++++-----
 softmmu/physmem.c              | 55 ++++++++++++++++++++++++------
 tests/qtest/fuzz-sdcard-test.c | 76 ++++++++++++++++++++++++++++++++++++++++++
 tests/qtest/intel-hda-test.c   | 34 +++++++++++++++++++
 6 files changed, 198 insertions(+), 22 deletions(-)



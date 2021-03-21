Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF1C3433AA
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Mar 2021 18:22:03 +0100 (CET)
Received: from localhost ([::1]:43046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lO1m4-0000mu-Jt
	for lists+qemu-devel@lfdr.de; Sun, 21 Mar 2021 13:22:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lO1j4-0007OQ-Gf
 for qemu-devel@nongnu.org; Sun, 21 Mar 2021 13:18:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lO1is-0005QR-Nc
 for qemu-devel@nongnu.org; Sun, 21 Mar 2021 13:18:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616347119;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=odK5QYS31SyceJYl58XJu8l/Eb+N5PyTdKah2egaIxg=;
 b=OgROFEMXvmsgvYsWNPnA70j4E5HOUAtRwvgrqFiI+gy/o92MUKydLU1RPd5UTxEM6N2ndL
 ovOAdV7mBS+I+vYqNqspAFa36alCRRy4jpJQiO10w7ag06rFoD0hOt19DLwj1mwy2us0p/
 NZtHq+/G54wZcNhKIvnw5u3KiPE7IBQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-28-knZqVQAWOGWfZBPO19C-vA-1; Sun, 21 Mar 2021 13:18:37 -0400
X-MC-Unique: knZqVQAWOGWfZBPO19C-vA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79BCB5700C;
 Sun, 21 Mar 2021 17:18:36 +0000 (UTC)
Received: from thuth.com (ovpn-112-125.ams2.redhat.com [10.36.112.125])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9C6775D9CD;
 Sun, 21 Mar 2021 17:18:35 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 0/5] Unit test fixes + misc OS patches
Date: Sun, 21 Mar 2021 18:18:28 +0100
Message-Id: <20210321171833.20736-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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

 Hi Peter!

The following changes since commit 2e1293cbaac75e84f541f9acfa8e26749f4c3562:

  Merge remote-tracking branch 'remotes/armbru/tags/pull-qapi-2021-03-16-v4' into staging (2021-03-19 16:40:00 +0000)

are available in the Git repository at:

  https://gitlab.com/thuth/qemu.git tags/pull-request-2021-03-21

for you to fetch changes up to 262fd27392128c180afc8f968d90d530574862f7:

  FreeBSD: Upgrade to 12.2 release (2021-03-20 06:33:17 +0100)

----------------------------------------------------------------
* Small fixes for the unit tests
* Compilation fixes for Illumos et al.
* Update the FreeBSD VM to 12.2
----------------------------------------------------------------

David CARLIER (2):
  configure: fix for SunOS based systems
  contrib: ivshmem client and server build fix for SunOS.

Emanuele Giuseppe Esposito (1):
  tests/unit/test-block-iothread: fix maybe-uninitialized error on GCC
    11

Wainer dos Santos Moschetta (1):
  docs/devel/testing.rst: Fix references to unit tests

Warner Losh (1):
  FreeBSD: Upgrade to 12.2 release

 configure                               |  2 +-
 contrib/ivshmem-client/ivshmem-client.c | 12 ++++++------
 contrib/ivshmem-server/ivshmem-server.c | 12 ++++++------
 docs/devel/testing.rst                  |  6 +++---
 tests/unit/test-block-iothread.c        |  6 +++---
 tests/vm/freebsd                        | 16 +++++++++++-----
 6 files changed, 30 insertions(+), 24 deletions(-)

-- 
2.27.0



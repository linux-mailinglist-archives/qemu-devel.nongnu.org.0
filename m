Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C996B7A05
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 15:12:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbitM-0005WA-TE; Mon, 13 Mar 2023 10:11:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pbitK-0005V6-AT
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 10:11:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pbitC-0006bo-Ny
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 10:11:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678716661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=t76HHPbMNUpIJw7BGIF466ElyZC1HcxqQ4BnEmHZNgA=;
 b=gD0ehDY/rboabTO3DyisHgbR7PQ4CqBz+eu+3AGiu33szfYbZAA5X+BJZ7erxn2I5G9J3f
 apZP2zugIiYGLHCmmOEZl4HG1zvWwgUGYLMBsj+yJkl4c/s533mdfAf+uqcW1Ed2jHLxjF
 xmtnXInAMy4oOtQCFZ02pyrQ0SBQ2hE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-570-t4C8sMUQOzicQaeqR0LXYw-1; Mon, 13 Mar 2023 10:11:00 -0400
X-MC-Unique: t4C8sMUQOzicQaeqR0LXYw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C049F80280D;
 Mon, 13 Mar 2023 14:10:59 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2E1FF1121315;
 Mon, 13 Mar 2023 14:10:59 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 0/5] s390x and test fixes for 8.0-rc0
Date: Mon, 13 Mar 2023 15:10:52 +0100
Message-Id: <20230313141057.230810-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

 Hi Peter!

The following changes since commit 29c8a9e31a982874ce4e2c15f2bf82d5f8dc3517:

  Merge tag 'linux-user-for-8.0-pull-request' of https://gitlab.com/laurent_vivier/qemu into staging (2023-03-12 10:57:00 +0000)

are available in the Git repository at:

  https://gitlab.com/thuth/qemu.git tags/pull-request-2023-03-13

for you to fetch changes up to 410791228c415c0e4f76e6cafae7c82fae7cb8cb:

  tests/tcg/s390x: Add C(G)HRL test (2023-03-13 09:23:42 +0100)

----------------------------------------------------------------
* One more fix for the migration qtest
* Remove the edk2 gitlab-CI job
* Improve the build-system-alpine CI job
* Fix emulation of the CHRL/CGHRL s390x instructions

----------------------------------------------------------------
Dr. David Alan Gilbert (1):
      tests/migration: Tweek auto converge limits check

Nina Schoetterl-Glausch (2):
      target/s390x: Fix emulation of C(G)HRL
      tests/tcg/s390x: Add C(G)HRL test

Philippe Mathieu-Daudé (1):
      gitlab-ci: Remove job building EDK2 firmware binaries

Thomas Huth (1):
      gitlab-ci.d/buildtest: Rework the target list of build-system-alpine

 MAINTAINERS                      |  2 -
 target/s390x/tcg/insn-data.h.inc |  4 +-
 target/s390x/tcg/translate.c     |  7 ++++
 tests/qtest/migration-test.c     | 19 +++++----
 tests/tcg/s390x/chrl.c           | 80 +++++++++++++++++++++++++++++++++++++
 .gitlab-ci.d/buildtest.yml       |  7 ++--
 .gitlab-ci.d/edk2.yml            | 85 ----------------------------------------
 .gitlab-ci.d/edk2/Dockerfile     | 27 -------------
 .gitlab-ci.d/qemu-project.yml    |  1 -
 tests/tcg/s390x/Makefile.target  |  1 +
 10 files changed, 104 insertions(+), 129 deletions(-)
 create mode 100644 tests/tcg/s390x/chrl.c
 delete mode 100644 .gitlab-ci.d/edk2.yml
 delete mode 100644 .gitlab-ci.d/edk2/Dockerfile



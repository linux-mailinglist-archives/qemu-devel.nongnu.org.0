Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC153582307
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 11:25:11 +0200 (CEST)
Received: from localhost ([::1]:47776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGdHv-0000l5-UX
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 05:25:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oGdEt-00057a-GH
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 05:22:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24179)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oGdEf-0002Kk-Is
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 05:21:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658913704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=MZJDqfVgNpD4gCCau6VbVzaZvQCnGY5PjB/p3ujgxU0=;
 b=LAS81OeSiOnLaNkpkTFFa+dau7fV/lmHnh9LoQYsgLT1OgKcPn6hBsQIdt7Y+qCvBQAs+J
 l3Fvp9pqGh6m7cuuKSbVFT0zyUDQfnbP1ztv474EatFdZzXfLSDWOqeMhzNptZKUVtIBOI
 Ch6jYSW+8vTFjgJmGjkIFHrxN8qnj9M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-618-A9ZN0J-1Mzy7_78XGeM6Rw-1; Wed, 27 Jul 2022 05:21:41 -0400
X-MC-Unique: A9ZN0J-1Mzy7_78XGeM6Rw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B340985A584;
 Wed, 27 Jul 2022 09:21:40 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.16])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9FF2E492C3B;
 Wed, 27 Jul 2022 09:21:38 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Michael Roth <michael.roth@amd.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH for-7.2 0/3] Replace 'blacklist' and 'whitelist' in the guest
 agent
Date: Wed, 27 Jul 2022 11:21:32 +0200
Message-Id: <20220727092135.302915-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's use more appropriate words here - the feature in the guest agent
is about blocking RPCs, so we should talk about that instead of using
the term "blacklist" here.

The patches are based on earlier work by Philippe Mathieu-Daudé,
with the idea for the new option name suggested by BALATON Zoltan.

Thomas Huth (3):
  qga: Replace 'blacklist' command line and config file options by
    'block-rpcs'
  qga: Replace 'blacklist' and 'whitelist' in the guest agent sources
  tests/unit/test-qga: Replace the word 'blacklist' in the guest agent
    unit test

 docs/about/deprecated.rst  | 19 ++++++++++
 docs/interop/qemu-ga.rst   |  8 ++--
 qga/qapi-schema.json       |  4 +-
 qga/guest-agent-core.h     |  2 +-
 qga/commands-posix.c       | 16 ++++----
 qga/commands-win32.c       | 10 ++---
 qga/main.c                 | 77 +++++++++++++++++++++-----------------
 tests/unit/test-qga.c      |  8 ++--
 tests/data/test-qga-config |  2 +-
 9 files changed, 87 insertions(+), 59 deletions(-)

-- 
2.31.1



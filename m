Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E333089A0
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 15:57:09 +0100 (CET)
Received: from localhost ([::1]:48910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5VCu-0002D0-BL
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 09:57:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l5V8t-0007ha-VA
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 09:53:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21214)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l5V8o-00050b-Si
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 09:52:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611931973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=tx+sVuq9IwK/DiWwzIXdYojld/0t4HzYOHEduwD0WlY=;
 b=P62j+Ck9bPv5h/trb3ZS4k3YIwoC5O6rWWHoLSnToFD481ee88uXT1aDIVCS2rF0SB8mTw
 /hYfP7F9oVPGmff6YaLAV8HaCKRTQxImrEcV4/ZQhlycbhmy/pdJ/EeHs7ZcpIkUB94cUh
 /3smA4MY1EFjrGuuW4WT8JRPpWQGedA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-NvAprzDZONqGecLmeCPtIA-1; Fri, 29 Jan 2021 09:52:50 -0500
X-MC-Unique: NvAprzDZONqGecLmeCPtIA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D9A4D911FA;
 Fri, 29 Jan 2021 14:52:48 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-198.ams2.redhat.com [10.36.114.198])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D8F355C1B4;
 Fri, 29 Jan 2021 14:52:47 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 0/2] block: Fix iotests to respect configured Python binary
Date: Fri, 29 Jan 2021 15:52:38 +0100
Message-Id: <20210129145240.34104-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 5101d00d2f1138a73344dc4833587f76d7a5fa5c:

  Merge remote-tracking branch 'remotes/vivier2/tags/trivial-branch-for-6.0-pull-request' into staging (2021-01-29 10:10:43 +0000)

are available in the Git repository at:

  git://repo.or.cz/qemu/kevin.git tags/for-upstream

for you to fetch changes up to 4cea90be62f4f15a63e1a8f7d5d0958f79fdf290:

  tests/Makefile.include: export PYTHON for check-block.sh (2021-01-29 12:32:36 +0100)

----------------------------------------------------------------
Block layer patches:

- Fix iotests to respect configured Python binary

----------------------------------------------------------------
Vladimir Sementsov-Ogievskiy (2):
      iotests/testrunner: fix recognition of python tests
      tests/Makefile.include: export PYTHON for check-block.sh

 tests/qemu-iotests/testrunner.py | 2 +-
 tests/Makefile.include           | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78AD360FF68
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 19:36:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo6jA-0003yJ-Ld; Thu, 27 Oct 2022 13:31:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oo6j4-0003JQ-DF
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 13:31:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oo6iy-0000sW-DK
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 13:31:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666891881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=amZnM4k6VBt1DEEDG6aoB9kMSlKbhKroGwh2MtPQbdY=;
 b=WRDNHoBwIABapIBxE/JYlXbNpoG7BLhC8t88j1RZeYbw6qB8r077COGfG5QXXDTjPP1JDW
 QNsV2u9RjUY37kYkObCo3LGdGbSrThGXzkYOohML6wXg92vNqMiJkT6czEysW7ePtbDVeX
 E0R9j8a98CyrlqpYFE2cHkuY91EHdUs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-487-Pq-BWNiqMEikYgFfSct61Q-1; Thu, 27 Oct 2022 13:31:08 -0400
X-MC-Unique: Pq-BWNiqMEikYgFfSct61Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5F6F3800DB3
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 17:31:05 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 923ED414A809;
 Thu, 27 Oct 2022 17:31:04 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 00/20] Crypto and I/O patches
Date: Thu, 27 Oct 2022 18:30:43 +0100
Message-Id: <20221027173103.299479-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The following changes since commit e750a7ace492f0b450653d4ad368a77d6f660fb8:

  Merge tag 'pull-9p-20221024' of https://github.com/cschoenebeck/qemu into staging (2022-10-24 14:27:12 -0400)

are available in the Git repository at:

  https://gitlab.com/berrange/qemu tags/misc-next-pull-request

for you to fetch changes up to da0ab2c4c4d22dece12acd9ddaed901a10a5edee:

  crypto: add test cases for many malformed LUKS header scenarios (2022-10-27 13:06:12 +0100)

----------------------------------------------------------------
Pending crypto and io queue

 * Many LUKS header robustness checks
 * Fix TLS PSK error reporting
 * Enable LUKS creation on macOS
 * Report useful errnos from seccomp
 * I/O chanel Windows portability fix

----------------------------------------------------------------

Bin Meng (4):
  util/qemu-sockets: Use g_get_tmp_dir() to get the directory for
    temporary files
  io/channel-watch: Drop a superfluous '#ifdef WIN32'
  io/channel-watch: Drop the unnecessary cast
  io/channel-watch: Fix socket watch on Windows

Daniel P. Berrangé (14):
  scripts: check if .git exists before checking submodule status
  crypto: check for and report errors setting PSK credentials
  tests: avoid DOS line endings in PSK file
  crypto: sanity check that LUKS header strings are NUL-terminated
  crypto: enforce that LUKS stripes is always a fixed value
  crypto: enforce that key material doesn't overlap with LUKS header
  crypto: validate that LUKS payload doesn't overlap with header
  crypto: strengthen the check for key slots overlapping with LUKS
    header
  crypto: check that LUKS PBKDF2 iterations count is non-zero
  crypto: split LUKS header definitions off into file
  crypto: split off helpers for converting LUKS header endianess
  crypto: quote algorithm names in error messages
  crypto: ensure LUKS tests run with GNUTLS crypto provider
  crypto: add test cases for many malformed LUKS header scenarios

Jungmin Park (1):
  crypto/luks: Support creating LUKS image on Darwin

Michal Privoznik (1):
  seccomp: Get actual errno value from failed seccomp functions

 crypto/block-luks-priv.h            | 143 +++++++++++++
 crypto/block-luks.c                 | 228 +++++++++------------
 crypto/pbkdf.c                      |  23 +++
 crypto/tlscredspsk.c                |  16 +-
 io/channel-watch.c                  |  12 +-
 meson.build                         |   9 +
 scripts/git-submodule.sh            |  12 +-
 softmmu/qemu-seccomp.c              |  13 ++
 tests/unit/crypto-tls-psk-helpers.c |  11 +-
 tests/unit/test-crypto-block.c      | 302 +++++++++++++++++++++++++++-
 util/qemu-sockets.c                 |   5 +-
 11 files changed, 616 insertions(+), 158 deletions(-)
 create mode 100644 crypto/block-luks-priv.h

-- 
2.37.3



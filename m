Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8035C273E83
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Sep 2020 11:27:02 +0200 (CEST)
Received: from localhost ([::1]:53412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kKeZh-0006zb-II
	for lists+qemu-devel@lfdr.de; Tue, 22 Sep 2020 05:27:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.gruenbichler@proxmox.com>)
 id 1kKeVz-0002Av-Hz; Tue, 22 Sep 2020 05:23:11 -0400
Received: from proxmox-new.maurer-it.com ([212.186.127.180]:1900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.gruenbichler@proxmox.com>)
 id 1kKeVx-0005cc-BP; Tue, 22 Sep 2020 05:23:11 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id C72CA454A9;
 Tue, 22 Sep 2020 11:14:24 +0200 (CEST)
From: =?UTF-8?q?Fabian=20Gr=C3=BCnbichler?= <f.gruenbichler@proxmox.com>
To: qemu-devel@nongnu.org
Subject: [PATCH qemu 0/4] mirror: implement incremental and bitmap modes
Date: Tue, 22 Sep 2020 11:14:14 +0200
Message-Id: <20200922091418.53562-1-f.gruenbichler@proxmox.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=212.186.127.180;
 envelope-from=f.gruenbichler@proxmox.com; helo=proxmox-new.maurer-it.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/22 05:14:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

based on John's in-progress work from last year, this series introduces
incremental drive-/block-dev mirror support using bitmaps with three bitmap
modes.

changes since RFC:
- rebased on current master
- squashed patches 2-4
- re-ordered patches 5/6, and moved all test code to patch 6

NOTE: patch #2 is still requiring a S-O-B by John before applying!

Fabian Grünbichler (2):
  mirror: move some checks to qmp
  iotests: add test for bitmap mirror

John Snow (2):
  drive-mirror: add support for sync=bitmap mode=never
  drive-mirror: add support for conditional and always bitmap sync modes

 include/block/block_int.h   |    4 +-
 block/mirror.c              |   96 +-
 blockdev.c                  |   71 +-
 tests/test-block-iothread.c |    4 +-
 qapi/block-core.json        |   29 +-
 tests/qemu-iotests/306      |  546 +++++++
 tests/qemu-iotests/306.out  | 2846 +++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/group    |    1 +
 8 files changed, 3566 insertions(+), 31 deletions(-)
 create mode 100755 tests/qemu-iotests/306
 create mode 100644 tests/qemu-iotests/306.out

-- 
2.20.1




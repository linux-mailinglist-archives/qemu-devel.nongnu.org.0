Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DEC750B77C
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 14:37:58 +0200 (CEST)
Received: from localhost ([::1]:56766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhsXt-0001wA-Ga
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 08:37:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1nhrr1-0001fa-Re
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 07:53:39 -0400
Received: from mail.ispras.ru ([83.149.199.84]:39344)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1nhrqz-0005El-RT
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 07:53:39 -0400
Received: from [127.0.1.1] (unknown [85.142.117.226])
 by mail.ispras.ru (Postfix) with ESMTPSA id 7286040D4004;
 Fri, 22 Apr 2022 11:53:09 +0000 (UTC)
Subject: [PATCH 0/9] Record/replay refactoring and stuff
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
To: qemu-devel@nongnu.org
Date: Fri, 22 Apr 2022 14:53:09 +0300
Message-ID: <165062838915.526882.13230207960407998257.stgit@pasha-ThinkPad-X280>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: pavel.dovgalyuk@ispras.ru, philmd@redhat.com, wrampazz@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following series includes the following record/replay-related changes:
- simplified async event processing
- updated record/replay documentation, which was also converted to rst
- avocado tests for record/replay of Linux for x86_64 and Aarch64
- some bugfixes

---

Pavel Dovgalyuk (9):
      replay: fix event queue flush for qemu shutdown
      replay: notify vCPU when BH is scheduled
      replay: rewrite async event handling
      replay: simplify async event processing
      docs: convert docs/devel/replay page to rst
      docs: move replay docs to docs/system/replay.rst
      tests/avocado: update replay_linux test
      tests/avocado: add replay Linux tests for virtio machine
      tests/avocado: add replay Linux test for Aarch64 machines


 accel/tcg/tcg-accel-ops-icount.c |   5 +-
 docs/devel/index-tcg.rst         |   2 +
 docs/devel/replay.rst            | 306 +++++++++++++++++++++++
 docs/devel/replay.txt            |  46 ----
 docs/replay.txt                  | 410 -------------------------------
 docs/system/index.rst            |   1 +
 docs/system/replay.rst           | 237 ++++++++++++++++++
 include/sysemu/cpu-timers.h      |   1 +
 include/sysemu/replay.h          |   9 +-
 replay/replay-events.c           |  56 ++---
 replay/replay-internal.h         |  35 ++-
 replay/replay-snapshot.c         |   2 -
 replay/replay.c                  |  73 +++---
 softmmu/icount.c                 |  12 +-
 stubs/icount.c                   |   4 +
 tests/avocado/replay_linux.py    |  86 ++++++-
 util/async.c                     |   8 +
 17 files changed, 725 insertions(+), 568 deletions(-)
 create mode 100644 docs/devel/replay.rst
 delete mode 100644 docs/devel/replay.txt
 delete mode 100644 docs/replay.txt
 create mode 100644 docs/system/replay.rst

--
Pavel Dovgalyuk


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E92981E0CB7
	for <lists+qemu-devel@lfdr.de>; Mon, 25 May 2020 13:20:32 +0200 (CEST)
Received: from localhost ([::1]:33816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jdB9j-0001lF-U8
	for lists+qemu-devel@lfdr.de; Mon, 25 May 2020 07:20:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Pavel.Dovgaluk@gmail.com>)
 id 1jdB8M-0000U0-Qf
 for qemu-devel@nongnu.org; Mon, 25 May 2020 07:19:06 -0400
Received: from mail.ispras.ru ([83.149.199.45]:54668)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <Pavel.Dovgaluk@gmail.com>) id 1jdB8L-0008LH-Rs
 for qemu-devel@nongnu.org; Mon, 25 May 2020 07:19:06 -0400
Received: from [127.0.1.1] (unknown [62.118.151.149])
 by mail.ispras.ru (Postfix) with ESMTPSA id 23A17CD466;
 Mon, 25 May 2020 14:19:03 +0300 (MSK)
Subject: [PATCH 0/9] Record/replay acceptance tests
From: Pavel Dovgalyuk <Pavel.Dovgaluk@gmail.com>
To: qemu-devel@nongnu.org
Date: Mon, 25 May 2020 14:19:02 +0300
Message-ID: <159040554265.2615.8993443700754452381.stgit@pasha-ThinkPad-X280>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: softfail client-ip=83.149.199.45;
 envelope-from=Pavel.Dovgaluk@gmail.com; helo=mail.ispras.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/25 07:19:03
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: 7
X-Spam_score: 0.7
X-Spam_bar: /
X-Spam_report: (0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_ADSP_CUSTOM_MED=0.001,
 FORGED_GMAIL_RCVD=1, FREEMAIL_FROM=0.001, NML_ADSP_CUSTOM_MED=0.9,
 SPF_SOFTFAIL=0.665, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: philmd@redhat.com, dovgaluk@ispras.ru, pavel.dovgaluk@ispras.ru,
 crosa@redhat.com, pbonzini@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following series adds record/replay tests to the acceptance group.
Test pass successfully with the latest submitted record/replay fixes:
 - replay: notify the main loop when there are no instructions
 - replay: synchronize on every virtual timer callback

The provided tests perform kernel boot and disk image boot scenarios.
For all of them recording and replaying phases are executed.
Tests were borrowed from existing boot_linux*.py tests. But some
of the platforms and images were excluded, because icount for them
still has some issues.

---

Pavel Dovgaluk (9):
      tests/acceptance: allow console interaction with specific VMs
      tests/acceptance: add base class record/replay kernel tests
      tests/acceptance: add kernel record/replay test for x86_64
      tests/acceptance: add record/replay test for aarch64
      tests/acceptance: add record/replay test for arm
      tests/acceptance: add record/replay test for ppc64
      tests/acceptance: add record/replay test for m68k
      tests/acceptance: record/replay tests with advcal images
      tests/acceptance: Linux boot test for record/replay


 MAINTAINERS                               |    2 
 tests/acceptance/avocado_qemu/__init__.py |   12 +
 tests/acceptance/replay_kernel.py         |  273 +++++++++++++++++++++++++++++
 tests/acceptance/replay_linux.py          |  140 +++++++++++++++
 4 files changed, 422 insertions(+), 5 deletions(-)
 create mode 100644 tests/acceptance/replay_kernel.py
 create mode 100644 tests/acceptance/replay_linux.py

--
Pavel Dovgalyuk


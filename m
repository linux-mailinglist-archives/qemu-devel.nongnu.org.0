Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD1539BF61
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 20:11:43 +0200 (CEST)
Received: from localhost ([::1]:53090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpEII-00037z-Pu
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 14:11:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lpEGT-00014W-S3
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 14:09:49 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:55094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lpEGS-0000lY-91
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 14:09:49 -0400
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id AA09821A33;
 Fri,  4 Jun 2021 18:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1622830186; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=UcJ8Ss+di3pg6dYPtTz7J3aIqSaQXYBo+UFgZYb1RHI=;
 b=reg/vZNYgfuHliLmGgEpvU1IOqrT2sjJl50oi55oLg2yhOCimEf+8KNqh8ru7aeoPBwUKZ
 lqxOmfGQB8Ww9U2glvcHYGihqrpfvyXz2DhOaFN0TVSmZRr4cD6nChqXk4cbDB2TwQmbc5
 z3ILp6u4Bp4TGdVYepDavd6jUGD4UaI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1622830186;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=UcJ8Ss+di3pg6dYPtTz7J3aIqSaQXYBo+UFgZYb1RHI=;
 b=EDsAQXOYVppMwgzNs/APFDdhNmlKQ377NMXKFIR/zLPN7h5wRVwU7izb+8jIdonx4+iCCk
 s3N9NF6IaRhcXhAw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 63917118DD;
 Fri,  4 Jun 2021 18:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1622830186; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=UcJ8Ss+di3pg6dYPtTz7J3aIqSaQXYBo+UFgZYb1RHI=;
 b=reg/vZNYgfuHliLmGgEpvU1IOqrT2sjJl50oi55oLg2yhOCimEf+8KNqh8ru7aeoPBwUKZ
 lqxOmfGQB8Ww9U2glvcHYGihqrpfvyXz2DhOaFN0TVSmZRr4cD6nChqXk4cbDB2TwQmbc5
 z3ILp6u4Bp4TGdVYepDavd6jUGD4UaI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1622830186;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=UcJ8Ss+di3pg6dYPtTz7J3aIqSaQXYBo+UFgZYb1RHI=;
 b=EDsAQXOYVppMwgzNs/APFDdhNmlKQ377NMXKFIR/zLPN7h5wRVwU7izb+8jIdonx4+iCCk
 s3N9NF6IaRhcXhAw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id RVOZFmpsumC8TwAALh3uQQ
 (envelope-from <cfontana@suse.de>); Fri, 04 Jun 2021 18:09:46 +0000
From: Claudio Fontana <cfontana@suse.de>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa Junior <crosa@redhat.com>
Subject: [PATCH v1 0/2] add x86 acceptance test for the "host" cpu bug
Date: Fri,  4 Jun 2021 20:09:43 +0200
Message-Id: <20210604180945.9330-1-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=cfontana@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a new acceptance test that verifies the ability to boot the OVMF
"sec" binaries, that were previously broken by the i386 refactoring,
due to improper ordering of x86_64 cpu initialization and realization.

Claudio Fontana (2):
  tests/acceptance: move pkg extraction to avocado_qemu/
  tests/acceptance: add OVMF firmware test to cover x86_64 "host" cpu bug

 tests/acceptance/avocado_qemu/__init__.py |  38 ++++++++
 tests/acceptance/boot_linux_console.py    | 104 +++++++---------------
 tests/acceptance/boot_ovmf_fc33.py        |  75 ++++++++++++++++
 tests/acceptance/boot_xen.py              |   7 +-
 tests/acceptance/replay_kernel.py         |  23 ++---
 tests/acceptance/tcg_plugins.py           |   5 +-
 6 files changed, 166 insertions(+), 86 deletions(-)
 create mode 100644 tests/acceptance/boot_ovmf_fc33.py

-- 
2.26.2



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 395D16F5F42
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 21:40:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puIJK-00040s-KQ; Wed, 03 May 2023 15:38:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1puIJF-0003r1-Eg; Wed, 03 May 2023 15:38:42 -0400
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1puIJD-0007OD-V5; Wed, 03 May 2023 15:38:41 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 03F96206A5;
 Wed,  3 May 2023 19:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1683142718; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=UKbydkf8tEevwnM9EJLqnc1oN0PgR9mzrT/VWdFlVl4=;
 b=JJ9Lgc93L9qdotqE3u77hgnplbeUP1+OreeTelfGOx3hpdScKO8EiJWij2CAZffOmZGMR3
 ByA690EkndczurLmr6zf0stvHUN+y1we7kCL+0HTCjxvCZnTT1sz40Vp+7uzQpNH4YVADN
 lHDWyKGztQ2MufRQH2TQv7QXX6em35M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1683142718;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=UKbydkf8tEevwnM9EJLqnc1oN0PgR9mzrT/VWdFlVl4=;
 b=e/I11JctZ+EeqJj/KB/vcBv0AvBekezqQyHlvq88oXVYLOcQlvqnYdy01dE8Cr+LqeQivm
 oJtliA+Kl5GPqlCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2C0DC1331F;
 Wed,  3 May 2023 19:38:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 19gpOTu4UmTNYQAAMHmgww
 (envelope-from <farosas@suse.de>); Wed, 03 May 2023 19:38:35 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 0/3] target/arm: disable-tcg and without-default-devices fixes
Date: Wed,  3 May 2023 16:38:30 -0300
Message-Id: <20230503193833.29047-1-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1d; envelope-from=farosas@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Here's the fix for the cdrom test failure that we discussed in the
list, plus 2 fixes for the ---without-default-devices build.

When I moved the boards CONFIGs from default.mak to Kconfig, it became
possible (due to --without-default-devices) to disable the CONFIGs for
all the boards that require ARM_V7M. That breaks the build because
ARM_V7M is required to be always set.

Fabiano Rosas (3):
  target/arm: Use CONFIG_SEMIHOSTING instead of TCG for semihosting
  target/arm: Add CONFIG_ARM_V7M back to default.mak
  tests/qtest: Don't run cdrom tests if no accelerator is present

 configs/devices/arm-softmmu/default.mak | 1 +
 target/arm/helper.c                     | 4 ++--
 target/arm/tcg/m_helper.c               | 2 +-
 tests/qtest/cdrom-test.c                | 5 +++++
 4 files changed, 9 insertions(+), 3 deletions(-)

-- 
2.35.3



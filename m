Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9756F830E
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 14:36:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puuev-000372-Nb; Fri, 05 May 2023 08:35:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1puuet-00035Z-IY; Fri, 05 May 2023 08:35:35 -0400
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1puuep-00051x-Os; Fri, 05 May 2023 08:35:34 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1242B22AE6;
 Fri,  5 May 2023 12:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1683290129; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=HzjcJoll4B5xFSKfI7iPIVut4n/G+FBvDwZtC5WuS6A=;
 b=KDmY29WMLX+Ok/cRES7yRthSt5FbJpDlQGQVrR/0tE2C29D7z62WnHhpQRmH3c+xgKJ7Dw
 cAF0ltFAyL2vw1W2EpKACzlpKHSRnVFkqlRIiJVzciDQyJo6rhH1bp0opmxLVO6M7ExRMc
 30WXkDazfOuvLsXQH6aBOwOHqN/uxyE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1683290129;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=HzjcJoll4B5xFSKfI7iPIVut4n/G+FBvDwZtC5WuS6A=;
 b=1YpO36J/BCqCDv8d3GyMsdkmpFsUe3sVkVikfbnEKJUt3OYLvR0aR2RVuTGCLWUhu+erlC
 QjSVato9WxtFOFAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0205713513;
 Fri,  5 May 2023 12:35:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8TyjLg74VGTaOgAAMHmgww
 (envelope-from <farosas@suse.de>); Fri, 05 May 2023 12:35:26 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 0/3] target/arm: disable-tcg and without-default-devices
 fixes
Date: Fri,  5 May 2023 09:35:21 -0300
Message-Id: <20230505123524.23401-1-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1c; envelope-from=farosas@suse.de;
 helo=smtp-out1.suse.de
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

Since v1:

Used the 'select if TCG' pattern for both build issues.

We don't want to use imply for semihosting because we'd need to
unpoison* CONFIG_SEMIHOSTING and include CONFIG_DEVICES from helper.c
when building with '--enable-tcg --without-default-devices'.

*- I see the config at build/config-poison.h but the compiler does not
   complain about the usage. It just gets ignored. Any idea why?

CI run: https://gitlab.com/farosas/qemu/-/pipelines/857704454

v1:
https://lore.kernel.org/r/20230503193833.29047-1-farosas@suse.de

Here's the fix for the cdrom test failure that we discussed in the
list, plus 2 fixes for the ---without-default-devices build.

When I moved the boards CONFIGs from default.mak to Kconfig, it became
possible (due to --without-default-devices) to disable the CONFIGs for
all the boards that require ARM_V7M. That breaks the build because
ARM_V7M is required to be always set.

Fabiano Rosas (3):
  target/arm: Select SEMIHOSTING when using TCG
  target/arm: Select CONFIG_ARM_V7M when TCG is enabled
  tests/qtest: Don't run cdrom tests if no accelerator is present

 target/arm/Kconfig       | 9 ++-------
 tests/qtest/cdrom-test.c | 5 +++++
 2 files changed, 7 insertions(+), 7 deletions(-)

-- 
2.35.3



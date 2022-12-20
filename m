Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5354F6528B7
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 23:08:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7kl0-0006k2-HB; Tue, 20 Dec 2022 17:06:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1p7kkt-0006iy-Fv; Tue, 20 Dec 2022 17:06:35 -0500
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1p7kkr-0006bY-OI; Tue, 20 Dec 2022 17:06:35 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C220476A43;
 Tue, 20 Dec 2022 22:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1671573991; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=7OdQM/8eRsSAwXEtAVdCRrBz0+E30cH0z5yS4phLJTE=;
 b=pD0XT3FBoobifDtYiu7iu9XtyqQz40T95IsZi+hHTa5zy9eVmw1JWD6hCQFG3ZVftET4Tu
 YaXIPHi/zmAzf9MfVS3fpx8l0lAKTRuB+E63vR6EEwKVU1jhC256/9kbh4yk9eznFEHHRc
 fCYtZFmmvAbLgMy8f+XM2OF463is5Go=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1671573991;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=7OdQM/8eRsSAwXEtAVdCRrBz0+E30cH0z5yS4phLJTE=;
 b=p4F1qhb0sWkiWNr576P6IaGybZsIyzvr5fB18LqwMHHaq0Hksn8SoH5kMT8i3Eek5mzW9g
 Jjnq9VrdOMIBJ6CQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DC98C13254;
 Tue, 20 Dec 2022 22:06:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 75yLJ+QxomPwfAAAMHmgww
 (envelope-from <farosas@suse.de>); Tue, 20 Dec 2022 22:06:28 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
Subject: [PATCH v2 0/5] target/arm: Some CONFIG_TCG code movement
Date: Tue, 20 Dec 2022 19:04:21 -0300
Message-Id: <20221220220426.8827-1-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1d; envelope-from=farosas@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

since v1:
- patch 1: dropped. I will include it in the next series;

- patch 3: tcg_handle_semihosting does not need tcg_enabled, only
  CONFIG_TCG;

- patch 4 (new): moved alignment check and updated comment.

v1:
https://lore.kernel.org/r/20221216212944.28229-1-farosas@suse.de

Hi,

This is the second round of rebasing the patches from:
https://lore.kernel.org/r/20210416162824.25131-1-cfontana@suse.de

These are the simpler ones that move code under
CONFIG_TCG/tcg_enabled. No new directories or files.

Claudio Fontana (4):
  target/arm: rename handle_semihosting to tcg_handle_semihosting
  target/arm: wrap psci call with tcg_enabled
  target/arm: wrap call to aarch64_sve_change_el in tcg_enabled()
  target/arm: only perform TCG cpu and machine inits if TCG enabled

Fabiano Rosas (1):
  target/arm: Move PC alignment check

 target/arm/cpu.c     | 31 ++++++++++++++----------
 target/arm/helper.c  | 19 ++++++++-------
 target/arm/kvm.c     | 18 +++++++-------
 target/arm/kvm_arm.h |  3 +--
 target/arm/machine.c | 57 +++++++++++++++++++++++++-------------------
 5 files changed, 71 insertions(+), 57 deletions(-)

-- 
2.35.3



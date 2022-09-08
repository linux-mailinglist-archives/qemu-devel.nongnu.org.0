Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DC15B25F3
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 20:37:14 +0200 (CEST)
Received: from localhost ([::1]:43982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWMOm-0003FM-PY
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 14:37:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oWMI7-0006Zn-SW
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 14:30:30 -0400
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c]:57712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oWMI5-0003UN-AE
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 14:30:19 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 402F9225A5;
 Thu,  8 Sep 2022 18:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1662661814; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=GXI+PEH2Ul1Hz01vWclul5W9rEEXT8F52Psxr2ZExGw=;
 b=CoaJUtmo+R3a1/OjMlahwTZoipc+Nrmt1j5lBTjVMkIo/R1MJxsgqrOPIcXcrJNsR8FzQD
 wlm7n4xGfyTtT2OQQAMGEGimgIqyofpO3ycUGvIH8e8WMVLImqe92Bmz/1U0fU/RiyhVvg
 e1Pgw2Fbeg2JjyJFn4XHMz6AsA+tU0o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1662661814;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=GXI+PEH2Ul1Hz01vWclul5W9rEEXT8F52Psxr2ZExGw=;
 b=wDgNqif+sWcTcVZo/xiD4VicTho28/9aaQpMqYP0dqKFVQcDMkafHO2tGIGN+iMTVGst2C
 7bHrFRy0MHrqmEDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EA23B13A6D;
 Thu,  8 Sep 2022 18:30:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id nhThN7U0GmM4NwAAMHmgww
 (envelope-from <cfontana@suse.de>); Thu, 08 Sep 2022 18:30:13 +0000
From: Claudio Fontana <cfontana@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>
Cc: qemu-devel@nongnu.org, dinechin@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Claudio Fontana <cfontana@suse.de>
Subject: [PATCH v4 0/3] improve error handling for module load
Date: Thu,  8 Sep 2022 20:30:09 +0200
Message-Id: <20220908183012.17667-1-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1c;
 envelope-from=cfontana@suse.de; helo=smtp-out1.suse.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

CHANGELOG:

v3 -> v4: (Richard)

* module_object_class_by_name: return NULL immediately on load error.
* audio_driver_lookup: same.
* bdrv_find_format: same.

* dmg_open: handle optional compression submodules better: f.e.,
  if "dmg-bz2" is not present, continue but offer a warning.
  If "dmg-bz2" load fails with error, error out and return.

* module_load_dso: add newline to error_append_hint.

v2 -> v3:

* take the file existence check outside of module_load_file,
  rename module_load_file to module_load_dso, will be called only on
  an existing file. This will simplify the return value. (Richard)

* move exported function documentation into header files (Richard)

v1 -> v2:

* do not treat the display help text any differently and do report
  module load _errors_. If the module does not exist (ENOENT, ENOTDIR),
  no error will be produced.

DESCRIPTION:

while investigating a permission issue in accel, where accel-tcg-x86_64.so
was not accessible, I noticed that no errors were produced regarding the
module load failure.

This series attempts to improve module_load_one and module_load_qom_one
to handle the error cases better and produce some errors.

Patch 1 is already reviewed and is about removing an unused existing
argument "mayfail" from the call stack.

Patch 2 is the real meat, and that one I would say is RFC.
Will follow up with comments on the specific questions I have.

Patch 3 finally adds a simple check in accel/, aborting if a module
is not found, but relying on the existing error report from
module_load_qom_one.

Claudio Fontana (3):
  module: removed unused function argument "mayfail"
  module: add Error arguments to module_load_one and module_load_qom_one
  accel: abort if we fail to load the accelerator plugin

 accel/accel-softmmu.c |   8 ++-
 audio/audio.c         |   9 ++-
 block.c               |  15 ++++-
 block/dmg.c           |  18 +++++-
 hw/core/qdev.c        |  10 ++-
 include/qemu/module.h |  38 +++++++++--
 qom/object.c          |  18 +++++-
 softmmu/qtest.c       |   6 +-
 ui/console.c          |  18 +++++-
 util/module.c         | 142 ++++++++++++++++++++++++------------------
 10 files changed, 201 insertions(+), 81 deletions(-)

-- 
2.26.2



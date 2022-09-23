Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C68275E864A
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Sep 2022 01:23:12 +0200 (CEST)
Received: from localhost ([::1]:51068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obs0l-000579-Ca
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 19:23:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1obryx-00025u-7X
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 19:21:19 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:37312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1obryv-0007LA-CF
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 19:21:18 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 875A81F86C;
 Fri, 23 Sep 2022 23:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1663975275; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=pnN2a7gH8at79pgmUdjkYid+EpTRGVuY/07oP8GI67w=;
 b=fdxKPjYiCkpYOk3YH+w3Oy//cvW40M75UwBOl552ajbhuBYh38An2BR6RnLEjc8piiMjt0
 TKOSiQpEBPO7L/L2ncvuLBq4TWiUnHCF2kq8D8wNdzDln5cHWl9IK9tFB3J+WHvIWxghbL
 vzsxA718dUPHbpsl7RjPF3R0sKTzgYM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1663975275;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=pnN2a7gH8at79pgmUdjkYid+EpTRGVuY/07oP8GI67w=;
 b=6g1cH55vxnqeiQPtbphCBZPJwKahtCpGp5KB2KUHV5HndDfti3axZ3XefAJBwFhAcIDTjY
 E6UVQsA2UBQxndBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2DB5D13A00;
 Fri, 23 Sep 2022 23:21:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id D3qbCWs/LmPcUwAAMHmgww
 (envelope-from <cfontana@suse.de>); Fri, 23 Sep 2022 23:21:15 +0000
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
Subject: [PATCH v6 0/5] improve error handling for module load
Date: Sat, 24 Sep 2022 01:20:59 +0200
Message-Id: <20220923232104.28420-1-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=cfontana@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

CHANGELOG:

v5 -> v6:

* added a patch by Kevin to handle the dmg warning about missing
  decompression submodules. (Kevin)

* added more verbose comments about all the affected callers of module_load
  and module_load_qom (Markus)

(OPEN ISSUE): change abort() to exit() when type not present even after loading module?

(Philippe)

v4 -> v5:

* added a patch to rename module_load_one and friends to module_load

* qdev_new: just reuse module_object_class_by_name, to avoid duplicating code

* changed return value of module_load to an int:
  -1 error (Error **errp set).
   0 module or dependencies not installed,
   1 loaded
   2 already loaded (or built-in)

   Adapted all callers.

* module_load: fixed some pre-existing memory leaks, used an out: label
  to do the cleanup.

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

Claudio Fontana (4):
  module: removed unused function argument "mayfail"
  module: rename module_load_one to module_load
  module: add Error arguments to module_load and module_load_qom
  accel: abort if we fail to load the accelerator plugin

Kevin Wolf (1):
  dmg: warn when opening dmg images containing blocks of unknown type

 accel/accel-softmmu.c |   8 +-
 audio/audio.c         |  16 ++--
 block.c               |  21 ++++-
 block/dmg.c           |  31 +++++-
 hw/core/qdev.c        |   5 +-
 include/qemu/module.h |  37 +++++++-
 qom/object.c          |  18 +++-
 softmmu/qtest.c       |   8 +-
 ui/console.c          |  18 +++-
 util/module.c         | 213 +++++++++++++++++++++++-------------------
 10 files changed, 249 insertions(+), 126 deletions(-)

-- 
2.26.2



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1384E5EC76C
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 17:17:31 +0200 (CEST)
Received: from localhost ([::1]:47218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odCKp-0001vy-I4
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 11:17:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1odAnG-00019S-Ft
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 09:38:38 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:43640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1odAnE-00088R-Nt
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 09:38:38 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3D6E721E91;
 Tue, 27 Sep 2022 13:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1664285915; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=OKghykaIVzIwmeRZsNDVNAij3jG/JlSwlFOs7pkCpls=;
 b=qrdd0+43tzFH4/HgswQkN0UMTSdLL3YanRP3JEgEjZ3Ni0ETaq5EHQTAOk71gA+dnHtxvg
 qBMCC6e0iOeDGLG6bvWuRbt7JNc1shU7CEOZeMhMZQF9voMYRDFC0YeJ5xYy7RDwckVoe3
 m+goLHp9e9l1hvwjnhDs+iz51lJGWAo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1664285915;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=OKghykaIVzIwmeRZsNDVNAij3jG/JlSwlFOs7pkCpls=;
 b=SIIYhEKtysYdomoeq+CO7CFxn6n7uIJAt828mDD445A8xLclYNYRUfVIe6lmCzfowrHGnH
 8AfKvDY9DhNCOBBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CF8E6139BE;
 Tue, 27 Sep 2022 13:38:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2LATMdr8MmNsKgAAMHmgww
 (envelope-from <cfontana@suse.de>); Tue, 27 Sep 2022 13:38:34 +0000
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
Subject: [PATCH v7 0/5] improve error handling for module load
Date: Tue, 27 Sep 2022 15:38:20 +0200
Message-Id: <20220927133825.32631-1-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=cfontana@suse.de;
 helo=smtp-out1.suse.de
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

v6 -> v7:

* changed instances of abort() to exit(1), for the CONFIG_MODULES case (Philippe).

* dmg: do not use a separate local error, use the existing errp (Kevin)

* block: do not use a separate local error, use the existing errp for
  bdrv_find_protocol (Markus)

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
 block.c               |  20 +++-
 block/dmg.c           |  33 ++++++-
 hw/core/qdev.c        |  17 +++-
 include/qemu/module.h |  37 +++++++-
 qom/object.c          |  18 +++-
 softmmu/qtest.c       |   8 +-
 ui/console.c          |  18 +++-
 util/module.c         | 213 +++++++++++++++++++++++-------------------
 10 files changed, 261 insertions(+), 127 deletions(-)

-- 
2.26.2



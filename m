Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 213C65B2159
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 16:56:09 +0200 (CEST)
Received: from localhost ([::1]:54824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWIwp-0005nu-Py
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 10:56:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oWIu8-0001LG-DK
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 10:53:20 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:49454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oWIu6-0001f5-N8
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 10:53:20 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 926EA22410;
 Thu,  8 Sep 2022 14:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1662648795; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6cib0fi4bsalwDE3xL5u9lZAuYj91FooaWdMAgo7MUg=;
 b=WLa5dvwH4xAVWDOWfgm64+/FExUSeqJjYV33IA6eo0ZgUIpaBILsYF+M6Zv/O+rFWTxDyW
 +jNLrwG2ywXoImu2kZ7o4bc3YR0YB0kY/K24NNXEdFynQGckkmxVJB6hCuCfYfecP6e2ye
 M7u70vjpGJa/NeaK+1+9rvghUHsfLnU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1662648795;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6cib0fi4bsalwDE3xL5u9lZAuYj91FooaWdMAgo7MUg=;
 b=6iwnVB5d0Xv9DKLfxtQ9kzj1brT+2ZMR/Tx2lHQGGwmndugszb3IkyvUYye/EfZ99Z06/u
 vpxEPqBHopvmsSBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 47AAB1322C;
 Thu,  8 Sep 2022 14:53:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id MC4PENsBGmNnYgAAMHmgww
 (envelope-from <cfontana@suse.de>); Thu, 08 Sep 2022 14:53:15 +0000
From: Claudio Fontana <cfontana@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, dinechin@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Claudio Fontana <cfontana@suse.de>
Subject: [PATCH v3 0/3] improve error handling for module load
Date: Thu,  8 Sep 2022 16:53:05 +0200
Message-Id: <20220908145308.30282-1-cfontana@suse.de>
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

CHANGELOG:

v2 -> v3:

* take the file existence check outside of module_load_file,
  rename module_load_file to module_load_dso, will be called only on
  an existing file. This will simplify the return value. (Richard)

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
 audio/audio.c         |   6 +-
 block.c               |  12 +++-
 block/dmg.c           |  10 ++-
 hw/core/qdev.c        |  10 ++-
 include/qemu/module.h |  27 ++++++--
 qom/object.c          |  15 ++++-
 softmmu/qtest.c       |   6 +-
 ui/console.c          |  18 ++++-
 util/module.c         | 152 +++++++++++++++++++++++++-----------------
 10 files changed, 183 insertions(+), 81 deletions(-)

-- 
2.26.2



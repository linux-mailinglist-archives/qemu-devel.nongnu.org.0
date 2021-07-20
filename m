Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5670C3D04AF
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 00:32:59 +0200 (CEST)
Received: from localhost ([::1]:60994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5yIL-0004lN-UC
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 18:32:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jziviani@suse.de>) id 1m5yH1-0003Qf-Nf
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 18:31:35 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:49660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jziviani@suse.de>) id 1m5yH0-00028Z-4Q
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 18:31:35 -0400
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9F2212242E;
 Tue, 20 Jul 2021 22:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626820290; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Eiss00SgQa/y04yMObW884Oj/O2uofonJUxN4v7FT/o=;
 b=jaC8rx9twEIxLX2RIplR/3uudHUGcoiKl/971pVweHUnbcWG5iqHx7JnIhxszX5ZgA5BQX
 F4D/f0U5TLho8e1ds/jOrRqnckX10k3zPU+0VYflWU0xPB2oQEt2MOyMCmvCZUGovoq/K+
 0vOfD5Nc96qSvvEVZBisnZP81w/cdiw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626820290;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Eiss00SgQa/y04yMObW884Oj/O2uofonJUxN4v7FT/o=;
 b=1y95mYKizDH1cew5KOHb4IxCcASGpAUSRCNn67wZJQJqhGqnb7LGxOkQNMqV2isAD5p2sm
 wtaMee811fF32TBg==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 3E61113BAD;
 Tue, 20 Jul 2021 22:31:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id MR+lAMBO92BzFgAAGKfGzw
 (envelope-from <jziviani@suse.de>); Tue, 20 Jul 2021 22:31:27 +0000
From: "Jose R. Ziviani" <jziviani@suse.de>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] Improve module accelerator error message
Date: Tue, 20 Jul 2021 19:31:18 -0300
Message-Id: <20210720223120.21711-1-jziviani@suse.de>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=jziviani@suse.de;
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
Cc: berrange@redhat.com, ehabkost@redhat.com,
 "Jose R. Ziviani" <jziviani@suse.de>, richard.henderson@linaro.org,
 cfontana@suse.de, pbonzini@redhat.com, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The main objective here is to fix an user issue when trying to load TCG
that was built as module, but it's not installed or found in the library
path.

For example:

$ ./qemu-system-x86_64 -machine q35 -accel tcg -kernel /boot/vmlinuz
...
ERROR:../accel/accel-softmmu.c:82:accel_init_ops_interfaces: assertion failed: (ops != NULL)
Bail out! ERROR:../accel/accel-softmmu.c:82:accel_init_ops_interfaces: assertion failed: (ops != NULL)
[1]    31964 IOT instruction (core dumped)  ./qemu-system-x86_64 ...

The new error message becomes:

$ ./qemu-system-x86_64 -machine q35 -accel tcg -kernel /boot/vmlinuz
accel-tcg-x86_64 module is missing, install the package or config the library path correctly.

Jose R. Ziviani (2):
  modules: Implement new helper functions
  qom: Improve error message in module_object_class_by_name()

 accel/accel-softmmu.c |  5 +++-
 include/qemu/module.h |  4 +++
 qom/object.c          |  9 +++++++
 util/module.c         | 57 +++++++++++++++++++++++++++++++++++++------
 4 files changed, 67 insertions(+), 8 deletions(-)

-- 
2.32.0



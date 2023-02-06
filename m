Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A67FF68C0EC
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 16:07:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP34y-0004BN-RH; Mon, 06 Feb 2023 10:06:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pP34v-000446-8L
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 10:06:45 -0500
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pP34t-0008SS-Dh
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 10:06:44 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B48F6605EA;
 Mon,  6 Feb 2023 15:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1675696001; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NXZtz6drXmu5S9m5FeMIml4zOVj2zvdZ6JoGmNfyPl4=;
 b=hMxm3egKZI8OGcPg4wOPzKQVUvKFu94i21/lG+PXN3Dn8JZMpn3gu5/s/fWgr6zUa0/XBI
 UnR+zT3Cc4eGSVTQCUsNrKzl4msxwO5Q/AjIY8Dk/ZfzkkVOkEmvnu7+WmNWJMu5TSqPe4
 PtW6HzLW3PMWRYmc0dvN8BErZCLqNkY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1675696001;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NXZtz6drXmu5S9m5FeMIml4zOVj2zvdZ6JoGmNfyPl4=;
 b=MX5ipKjeN2j3tesA5jEfuLfPHI0RrHEVkNA4iLx3Io21GJDJvyf1TKVS4Iz5Iu76RVwtuG
 UV8MDM5Y/Lt2nPBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5FC1F138E8;
 Mon,  6 Feb 2023 15:06:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wCtzCoAX4WPSXwAAMHmgww
 (envelope-from <farosas@suse.de>); Mon, 06 Feb 2023 15:06:40 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 11/12] tests/qtest: bios-tables-test: Skip if missing configs
Date: Mon,  6 Feb 2023 12:04:15 -0300
Message-Id: <20230206150416.4604-12-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230206150416.4604-1-farosas@suse.de>
References: <20230206150416.4604-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1d; envelope-from=farosas@suse.de;
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

If we build with --without-default-devices, CONFIG_HPET and
CONFIG_PARALLEL are set to N, which makes the respective devices go
missing from acpi tables.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
I currently don't see a way of allowing the tests to pass in the
absence of these two configs. As far as I understand, we would need to
have one set of expected table files (tests/data/acpi) for each
combination of machine vs. possible CONFIG that can be toggled.

Any ideas?
---
 tests/qtest/meson.build | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index a930706a43..2829eda2c9 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -78,7 +78,9 @@ qtests_i386 = \
    config_all_devices.has_key('CONFIG_Q35') and                                             \
    config_all_devices.has_key('CONFIG_VIRTIO_PCI') and                                      \
    slirp.found() ? ['virtio-net-failover'] : []) +                                          \
-  (unpack_edk2_blobs ? ['bios-tables-test'] : []) +                                         \
+  (unpack_edk2_blobs and                                                                    \
+   config_all_devices.has_key('CONFIG_HPET') and                                            \
+   config_all_devices.has_key('CONFIG_PARALLEL') ? ['bios-tables-test'] : []) +             \
   qtests_pci +                                                                              \
   qtests_cxl +                                                                              \
   ['fdc-test',
-- 
2.35.3



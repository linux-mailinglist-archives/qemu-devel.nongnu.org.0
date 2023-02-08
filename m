Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E41F68F855
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 20:50:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPqRg-0000eG-3F; Wed, 08 Feb 2023 14:49:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pPqRP-0000VE-EI
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 14:49:16 -0500
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pPqRN-00028W-7H
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 14:49:15 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 60D9521F4C;
 Wed,  8 Feb 2023 19:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1675885751; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wk5tyFVmpl6h3EyIQrlUnuh/vSR/G3a7AQazD/WDsdg=;
 b=OpzM7ctr7Y3LxWX51bWfIhPw01P0L8VYz7W5ZaxiUj4AsgSZgOXJaQ+ba689BfevDITKvA
 Xq4XhvKPgwkCX+rr35Jb8L10mT4EdsmhRtABv2CTHqahMX1Mvt1Dbcu3b2muBEKOINc8km
 dSSd3tqTgi35NSAJrF7u3nFOqfAyotA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1675885751;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wk5tyFVmpl6h3EyIQrlUnuh/vSR/G3a7AQazD/WDsdg=;
 b=qNwlx/tuSrBWDKwSeXErNH93c5jAwJUn+ftcfNNqbc2vG07eFggHRYtirHihBtD0VCs1fK
 SL3gwGf8POXIl3Bw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9777A13425;
 Wed,  8 Feb 2023 19:49:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2NUCGLX842OZIwAAMHmgww
 (envelope-from <farosas@suse.de>); Wed, 08 Feb 2023 19:49:09 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 03/12] tests/qtest: Add dependence on PCIE_PORT for
 virtio-net-failover.c
Date: Wed,  8 Feb 2023 16:46:51 -0300
Message-Id: <20230208194700.11035-4-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230208194700.11035-1-farosas@suse.de>
References: <20230208194700.11035-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1c; envelope-from=farosas@suse.de;
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This test depends on the presence of the pcie-root-port device. Add a
build time dependency.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 tests/qtest/meson.build | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index e97616d327..5c8b031ce0 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -73,7 +73,8 @@ qtests_i386 = \
   (config_all_devices.has_key('CONFIG_ESP_PCI') ? ['am53c974-test'] : []) +                 \
   (config_host.has_key('CONFIG_POSIX') and                                                  \
    config_all_devices.has_key('CONFIG_ACPI_ERST') ? ['erst-test'] : []) +                   \
-  (config_all_devices.has_key('CONFIG_VIRTIO_NET') and                                      \
+  (config_all_devices.has_key('CONFIG_PCIE_PORT') and                                       \
+   config_all_devices.has_key('CONFIG_VIRTIO_NET') and                                      \
    config_all_devices.has_key('CONFIG_Q35') and                                             \
    config_all_devices.has_key('CONFIG_VIRTIO_PCI') and                                      \
    slirp.found() ? ['virtio-net-failover'] : []) +                                          \
-- 
2.35.3



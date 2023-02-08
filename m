Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F13DE68F853
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 20:50:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPqRc-0000Ws-OJ; Wed, 08 Feb 2023 14:49:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pPqRQ-0000VM-62
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 14:49:16 -0500
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pPqRO-00028p-ML
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 14:49:15 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2AF37222AC;
 Wed,  8 Feb 2023 19:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1675885753; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hXeLkHUow7UwrfWEOu1KcF69qHO/LKshH+BxasVyWII=;
 b=UELZmKcmHP/1iB0fMTiYssHkSqrfokQhSoenyGNG3oXPL8VMiRpAcReloXjUW0FO93Iul1
 lvz9J6fR9F9uvYneSFHYRuULbT6yAhZajVvNEtfRYcz1nWZ3TNOB8Vm3eKzNcaiNZHKfBx
 q0RVT+AlF6lau/bpqrDhM/1KXvclCcg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1675885753;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hXeLkHUow7UwrfWEOu1KcF69qHO/LKshH+BxasVyWII=;
 b=S3S4E7/xoDd+0AJm1n74cWfiRg6hU96tC0Lb3TP1LJ0gmQ32h94dG+6t9IpVcN4ge9vHpR
 nD+u+JR7BLI/11DQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CED2013425;
 Wed,  8 Feb 2023 19:49:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wNxvJbf842OZIwAAMHmgww
 (envelope-from <farosas@suse.de>); Wed, 08 Feb 2023 19:49:11 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 04/12] tests/qtest: Don't build virtio-serial-test.c if
 device not present
Date: Wed,  8 Feb 2023 16:46:52 -0300
Message-Id: <20230208194700.11035-5-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230208194700.11035-1-farosas@suse.de>
References: <20230208194700.11035-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=farosas@suse.de;
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

The virtconsole device might not be present in the QEMU build that is
being tested.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 tests/qtest/meson.build | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 5c8b031ce0..eccdfca235 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -255,10 +255,14 @@ qos_test_ss.add(
   'virtio-net-test.c',
   'virtio-rng-test.c',
   'virtio-scsi-test.c',
-  'virtio-serial-test.c',
   'virtio-iommu-test.c',
   'vmxnet3-test.c',
 )
+
+qos_test_ss.add(
+  (config_all_devices.has_key('CONFIG_VIRTIO_SERIAL') ? ['virtio-serial-test.c'] : [])
+)
+
 if config_host.has_key('CONFIG_POSIX')
   qos_test_ss.add(files('e1000e-test.c'))
 endif
-- 
2.35.3



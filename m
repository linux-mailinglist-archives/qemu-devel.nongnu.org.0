Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5CF676009
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 23:18:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIzhE-0005Zl-53; Fri, 20 Jan 2023 17:17:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pIzhA-0005ZL-GY
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 17:17:12 -0500
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pIzh8-000797-4H
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 17:17:11 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DFB195CA28;
 Fri, 20 Jan 2023 22:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1674253026; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZoaSAQghUA4A5BJwi7VckEZenr6FJ88giTsaofH5gIw=;
 b=aUqZSu9+kgx3sr2e0rDNB3u16jfpLt43GqrjkZGKb2BgQw2Ezr/asaY/3FpoGB8MupmzFJ
 8TmH9h0WlUQTvPiY4ktfq5KAq6wnn8P26CDurBOdCsyU50EzCVeu7HmFm//a4A814S5TCQ
 JlAXcHab2BmpEK1FOzUcaYxFUipSPCs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1674253026;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZoaSAQghUA4A5BJwi7VckEZenr6FJ88giTsaofH5gIw=;
 b=KM0ifDVR6otteA64w8lysyB/SkxsHNg/qZBsBXHBFBRTpi69jNki3HzsavCKnJnyrDd8uP
 pUCkJerdKIyYJDCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0743513251;
 Fri, 20 Jan 2023 22:17:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 6PB0L+ASy2P6RwAAMHmgww
 (envelope-from <farosas@suse.de>); Fri, 20 Jan 2023 22:17:04 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/2] tests/avocado: Invert parameter vs. tag precedence during
 setUp
Date: Fri, 20 Jan 2023 19:14:59 -0300
Message-Id: <20230120221500.4194-2-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230120221500.4194-1-farosas@suse.de>
References: <20230120221500.4194-1-farosas@suse.de>
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

We currently never pass parameters to the avocado process via
Makefile. To start doing so we need to invert the precedence between
command line parameters and tags, otherwise a command line parameter
would override values for all the tests, which is unlikely to be a
common use-case.

A more likely use-case is to force certain values for the tests that
have no tags. For instance, if a test has no 'arch' tags and therefore
can run for all targets, one could possibly force it to run on a
certain target with an arch=foo parameter.

This applies to the variables set during setUp(): arch, machine, cpu,
distro_name, distro_version. Parameters used directly in tests or read
via self.params.get are left unchanged.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 tests/avocado/avocado_qemu/__init__.py | 32 +++++++++++++++-----------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/tests/avocado/avocado_qemu/__init__.py b/tests/avocado/avocado_qemu/__init__.py
index 910f3ba1ea..a181cac383 100644
--- a/tests/avocado/avocado_qemu/__init__.py
+++ b/tests/avocado/avocado_qemu/__init__.py
@@ -240,12 +240,23 @@ def _get_unique_tag_val(self, tag_name):
             return vals.pop()
         return None
 
+    def _get_prop(self, name):
+        """
+        Infer test properties based on tags. If no tag is present,
+        look for a command line parameter of the same name.
+        """
+        val = self._get_unique_tag_val(name)
+        if not val:
+            # If there's no tag, look for a command line
+            # parameter. This allows the user to override any defaults
+            # the caller of this function would choose if we were to
+            # return None.
+            val = self.params.get(name)
+        return val
+
     def setUp(self, bin_prefix):
-        self.arch = self.params.get('arch',
-                                    default=self._get_unique_tag_val('arch'))
-
-        self.cpu = self.params.get('cpu',
-                                   default=self._get_unique_tag_val('cpu'))
+        self.arch = self._get_prop('arch')
+        self.cpu = self._get_prop('cpu')
 
         default_qemu_bin = pick_default_qemu_bin(bin_prefix, arch=self.arch)
         self.qemu_bin = self.params.get('qemu_bin',
@@ -274,8 +285,7 @@ def setUp(self):
 
         super().setUp('qemu-system-')
 
-        self.machine = self.params.get('machine',
-                                       default=self._get_unique_tag_val('machine'))
+        self.machine = self._get_prop('machine')
 
     def require_accelerator(self, accelerator):
         """
@@ -529,15 +539,11 @@ class LinuxTest(LinuxSSHMixIn, QemuSystemTest):
     memory = '1024'
 
     def _set_distro(self):
-        distro_name = self.params.get(
-            'distro',
-            default=self._get_unique_tag_val('distro'))
+        distro_name = self._get_prop('distro')
         if not distro_name:
             distro_name = 'fedora'
 
-        distro_version = self.params.get(
-            'distro_version',
-            default=self._get_unique_tag_val('distro_version'))
+        distro_version = self._get_prop('distro_version')
         if not distro_version:
             distro_version = '31'
 
-- 
2.35.3



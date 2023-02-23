Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BDF96A0A01
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 14:12:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVBNU-0007mj-Pi; Thu, 23 Feb 2023 08:11:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pVBNE-0007kH-Iv; Thu, 23 Feb 2023 08:11:00 -0500
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pVBNC-0005Z3-Ch; Thu, 23 Feb 2023 08:11:00 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E3680204AC;
 Thu, 23 Feb 2023 13:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1677157856; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e5Xd4tf5YBnZShIKw4UiP31AE1vo0m7MzI+1souSkJ4=;
 b=fGDXibjPI759wn1Gtg79XiakA6rzNfM5Di77FMfiCAKCur14Hs0qs54vh2Tvz0eRjy6EfG
 oZ79IGoZJVqEBY3OnOPoXpJn2osVsdn0FemCv7IOqC+xzKZFUIJFObz7Xk39PMekfnwKc/
 uyWoQ5jihN/vLUaDV10wl+aFfT1t958=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1677157856;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e5Xd4tf5YBnZShIKw4UiP31AE1vo0m7MzI+1souSkJ4=;
 b=EnhU7SHnB1XvOsFn+DZ2LwLKNTP3z7EaTpt4scNkEiVYDSnbint/GCzdvg9Pu74st3XEmz
 zTI2FO+n0eJc4hDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0AA1A139B5;
 Thu, 23 Feb 2023 13:10:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4PovMd1l92MLawAAMHmgww
 (envelope-from <farosas@suse.de>); Thu, 23 Feb 2023 13:10:53 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v7 03/20] target/arm: move translate modules to tcg/
Date: Thu, 23 Feb 2023 10:08:24 -0300
Message-Id: <20230223130841.25916-4-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230223130841.25916-1-farosas@suse.de>
References: <20230223130841.25916-1-farosas@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Introduce the target/arm/tcg directory. Its purpose is to hold the TCG
code that is selected by CONFIG_TCG.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 MAINTAINERS                             |  1 +
 target/arm/meson.build                  | 30 ++++-------------------
 target/arm/{ => tcg}/a32-uncond.decode  |  0
 target/arm/{ => tcg}/a32.decode         |  0
 target/arm/{ => tcg}/m-nocp.decode      |  0
 target/arm/tcg/meson.build              | 32 +++++++++++++++++++++++++
 target/arm/{ => tcg}/mve.decode         |  0
 target/arm/{ => tcg}/neon-dp.decode     |  0
 target/arm/{ => tcg}/neon-ls.decode     |  0
 target/arm/{ => tcg}/neon-shared.decode |  0
 target/arm/{ => tcg}/sme-fa64.decode    |  0
 target/arm/{ => tcg}/sme.decode         |  0
 target/arm/{ => tcg}/sve.decode         |  0
 target/arm/{ => tcg}/t16.decode         |  0
 target/arm/{ => tcg}/t32.decode         |  0
 target/arm/{ => tcg}/translate-a64.c    |  0
 target/arm/{ => tcg}/translate-a64.h    |  0
 target/arm/{ => tcg}/translate-m-nocp.c |  0
 target/arm/{ => tcg}/translate-mve.c    |  0
 target/arm/{ => tcg}/translate-neon.c   |  0
 target/arm/{ => tcg}/translate-sme.c    |  0
 target/arm/{ => tcg}/translate-sve.c    |  0
 target/arm/{ => tcg}/translate-vfp.c    |  0
 target/arm/{ => tcg}/translate.c        |  0
 target/arm/{ => tcg}/translate.h        |  0
 target/arm/{ => tcg}/vfp-uncond.decode  |  0
 target/arm/{ => tcg}/vfp.decode         |  0
 27 files changed, 37 insertions(+), 26 deletions(-)
 rename target/arm/{ => tcg}/a32-uncond.decode (100%)
 rename target/arm/{ => tcg}/a32.decode (100%)
 rename target/arm/{ => tcg}/m-nocp.decode (100%)
 create mode 100644 target/arm/tcg/meson.build
 rename target/arm/{ => tcg}/mve.decode (100%)
 rename target/arm/{ => tcg}/neon-dp.decode (100%)
 rename target/arm/{ => tcg}/neon-ls.decode (100%)
 rename target/arm/{ => tcg}/neon-shared.decode (100%)
 rename target/arm/{ => tcg}/sme-fa64.decode (100%)
 rename target/arm/{ => tcg}/sme.decode (100%)
 rename target/arm/{ => tcg}/sve.decode (100%)
 rename target/arm/{ => tcg}/t16.decode (100%)
 rename target/arm/{ => tcg}/t32.decode (100%)
 rename target/arm/{ => tcg}/translate-a64.c (100%)
 rename target/arm/{ => tcg}/translate-a64.h (100%)
 rename target/arm/{ => tcg}/translate-m-nocp.c (100%)
 rename target/arm/{ => tcg}/translate-mve.c (100%)
 rename target/arm/{ => tcg}/translate-neon.c (100%)
 rename target/arm/{ => tcg}/translate-sme.c (100%)
 rename target/arm/{ => tcg}/translate-sve.c (100%)
 rename target/arm/{ => tcg}/translate-vfp.c (100%)
 rename target/arm/{ => tcg}/translate.c (100%)
 rename target/arm/{ => tcg}/translate.h (100%)
 rename target/arm/{ => tcg}/vfp-uncond.decode (100%)
 rename target/arm/{ => tcg}/vfp.decode (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9adb628627..a9b654ebcc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -161,6 +161,7 @@ M: Peter Maydell <peter.maydell@linaro.org>
 L: qemu-arm@nongnu.org
 S: Maintained
 F: target/arm/
+F: target/arm/tcg/
 F: tests/tcg/arm/
 F: tests/tcg/aarch64/
 F: tests/qtest/arm-cpu-features.c
diff --git a/target/arm/meson.build b/target/arm/meson.build
index 87e911b27f..b2904b676b 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -1,22 +1,4 @@
-gen = [
-  decodetree.process('sve.decode', extra_args: '--decode=disas_sve'),
-  decodetree.process('sme.decode', extra_args: '--decode=disas_sme'),
-  decodetree.process('sme-fa64.decode', extra_args: '--static-decode=disas_sme_fa64'),
-  decodetree.process('neon-shared.decode', extra_args: '--decode=disas_neon_shared'),
-  decodetree.process('neon-dp.decode', extra_args: '--decode=disas_neon_dp'),
-  decodetree.process('neon-ls.decode', extra_args: '--decode=disas_neon_ls'),
-  decodetree.process('vfp.decode', extra_args: '--decode=disas_vfp'),
-  decodetree.process('vfp-uncond.decode', extra_args: '--decode=disas_vfp_uncond'),
-  decodetree.process('m-nocp.decode', extra_args: '--decode=disas_m_nocp'),
-  decodetree.process('mve.decode', extra_args: '--decode=disas_mve'),
-  decodetree.process('a32.decode', extra_args: '--static-decode=disas_a32'),
-  decodetree.process('a32-uncond.decode', extra_args: '--static-decode=disas_a32_uncond'),
-  decodetree.process('t32.decode', extra_args: '--static-decode=disas_t32'),
-  decodetree.process('t16.decode', extra_args: ['-w', '16', '--static-decode=disas_t16']),
-]
-
 arm_ss = ss.source_set()
-arm_ss.add(gen)
 arm_ss.add(files(
   'cpu.c',
   'crypto_helper.c',
@@ -29,11 +11,6 @@ arm_ss.add(files(
   'neon_helper.c',
   'op_helper.c',
   'tlb_helper.c',
-  'translate.c',
-  'translate-m-nocp.c',
-  'translate-mve.c',
-  'translate-neon.c',
-  'translate-vfp.c',
   'vec_helper.c',
   'vfp_helper.c',
   'cpu_tcg.c',
@@ -50,9 +27,6 @@ arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
   'pauth_helper.c',
   'sve_helper.c',
   'sme_helper.c',
-  'translate-a64.c',
-  'translate-sve.c',
-  'translate-sme.c',
 ))
 
 arm_softmmu_ss = ss.source_set()
@@ -67,5 +41,9 @@ arm_softmmu_ss.add(files(
 
 subdir('hvf')
 
+if 'CONFIG_TCG' in config_all
+   subdir('tcg')
+endif
+
 target_arch += {'arm': arm_ss}
 target_softmmu_arch += {'arm': arm_softmmu_ss}
diff --git a/target/arm/a32-uncond.decode b/target/arm/tcg/a32-uncond.decode
similarity index 100%
rename from target/arm/a32-uncond.decode
rename to target/arm/tcg/a32-uncond.decode
diff --git a/target/arm/a32.decode b/target/arm/tcg/a32.decode
similarity index 100%
rename from target/arm/a32.decode
rename to target/arm/tcg/a32.decode
diff --git a/target/arm/m-nocp.decode b/target/arm/tcg/m-nocp.decode
similarity index 100%
rename from target/arm/m-nocp.decode
rename to target/arm/tcg/m-nocp.decode
diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
new file mode 100644
index 0000000000..044561bd4d
--- /dev/null
+++ b/target/arm/tcg/meson.build
@@ -0,0 +1,32 @@
+gen = [
+  decodetree.process('sve.decode', extra_args: '--decode=disas_sve'),
+  decodetree.process('sme.decode', extra_args: '--decode=disas_sme'),
+  decodetree.process('sme-fa64.decode', extra_args: '--static-decode=disas_sme_fa64'),
+  decodetree.process('neon-shared.decode', extra_args: '--decode=disas_neon_shared'),
+  decodetree.process('neon-dp.decode', extra_args: '--decode=disas_neon_dp'),
+  decodetree.process('neon-ls.decode', extra_args: '--decode=disas_neon_ls'),
+  decodetree.process('vfp.decode', extra_args: '--decode=disas_vfp'),
+  decodetree.process('vfp-uncond.decode', extra_args: '--decode=disas_vfp_uncond'),
+  decodetree.process('m-nocp.decode', extra_args: '--decode=disas_m_nocp'),
+  decodetree.process('mve.decode', extra_args: '--decode=disas_mve'),
+  decodetree.process('a32.decode', extra_args: '--static-decode=disas_a32'),
+  decodetree.process('a32-uncond.decode', extra_args: '--static-decode=disas_a32_uncond'),
+  decodetree.process('t32.decode', extra_args: '--static-decode=disas_t32'),
+  decodetree.process('t16.decode', extra_args: ['-w', '16', '--static-decode=disas_t16']),
+]
+
+arm_ss.add(gen)
+
+arm_ss.add(files(
+  'translate.c',
+  'translate-m-nocp.c',
+  'translate-mve.c',
+  'translate-neon.c',
+  'translate-vfp.c',
+))
+
+arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
+  'translate-a64.c',
+  'translate-sve.c',
+  'translate-sme.c',
+))
diff --git a/target/arm/mve.decode b/target/arm/tcg/mve.decode
similarity index 100%
rename from target/arm/mve.decode
rename to target/arm/tcg/mve.decode
diff --git a/target/arm/neon-dp.decode b/target/arm/tcg/neon-dp.decode
similarity index 100%
rename from target/arm/neon-dp.decode
rename to target/arm/tcg/neon-dp.decode
diff --git a/target/arm/neon-ls.decode b/target/arm/tcg/neon-ls.decode
similarity index 100%
rename from target/arm/neon-ls.decode
rename to target/arm/tcg/neon-ls.decode
diff --git a/target/arm/neon-shared.decode b/target/arm/tcg/neon-shared.decode
similarity index 100%
rename from target/arm/neon-shared.decode
rename to target/arm/tcg/neon-shared.decode
diff --git a/target/arm/sme-fa64.decode b/target/arm/tcg/sme-fa64.decode
similarity index 100%
rename from target/arm/sme-fa64.decode
rename to target/arm/tcg/sme-fa64.decode
diff --git a/target/arm/sme.decode b/target/arm/tcg/sme.decode
similarity index 100%
rename from target/arm/sme.decode
rename to target/arm/tcg/sme.decode
diff --git a/target/arm/sve.decode b/target/arm/tcg/sve.decode
similarity index 100%
rename from target/arm/sve.decode
rename to target/arm/tcg/sve.decode
diff --git a/target/arm/t16.decode b/target/arm/tcg/t16.decode
similarity index 100%
rename from target/arm/t16.decode
rename to target/arm/tcg/t16.decode
diff --git a/target/arm/t32.decode b/target/arm/tcg/t32.decode
similarity index 100%
rename from target/arm/t32.decode
rename to target/arm/tcg/t32.decode
diff --git a/target/arm/translate-a64.c b/target/arm/tcg/translate-a64.c
similarity index 100%
rename from target/arm/translate-a64.c
rename to target/arm/tcg/translate-a64.c
diff --git a/target/arm/translate-a64.h b/target/arm/tcg/translate-a64.h
similarity index 100%
rename from target/arm/translate-a64.h
rename to target/arm/tcg/translate-a64.h
diff --git a/target/arm/translate-m-nocp.c b/target/arm/tcg/translate-m-nocp.c
similarity index 100%
rename from target/arm/translate-m-nocp.c
rename to target/arm/tcg/translate-m-nocp.c
diff --git a/target/arm/translate-mve.c b/target/arm/tcg/translate-mve.c
similarity index 100%
rename from target/arm/translate-mve.c
rename to target/arm/tcg/translate-mve.c
diff --git a/target/arm/translate-neon.c b/target/arm/tcg/translate-neon.c
similarity index 100%
rename from target/arm/translate-neon.c
rename to target/arm/tcg/translate-neon.c
diff --git a/target/arm/translate-sme.c b/target/arm/tcg/translate-sme.c
similarity index 100%
rename from target/arm/translate-sme.c
rename to target/arm/tcg/translate-sme.c
diff --git a/target/arm/translate-sve.c b/target/arm/tcg/translate-sve.c
similarity index 100%
rename from target/arm/translate-sve.c
rename to target/arm/tcg/translate-sve.c
diff --git a/target/arm/translate-vfp.c b/target/arm/tcg/translate-vfp.c
similarity index 100%
rename from target/arm/translate-vfp.c
rename to target/arm/tcg/translate-vfp.c
diff --git a/target/arm/translate.c b/target/arm/tcg/translate.c
similarity index 100%
rename from target/arm/translate.c
rename to target/arm/tcg/translate.c
diff --git a/target/arm/translate.h b/target/arm/tcg/translate.h
similarity index 100%
rename from target/arm/translate.h
rename to target/arm/tcg/translate.h
diff --git a/target/arm/vfp-uncond.decode b/target/arm/tcg/vfp-uncond.decode
similarity index 100%
rename from target/arm/vfp-uncond.decode
rename to target/arm/tcg/vfp-uncond.decode
diff --git a/target/arm/vfp.decode b/target/arm/tcg/vfp.decode
similarity index 100%
rename from target/arm/vfp.decode
rename to target/arm/tcg/vfp.decode
-- 
2.35.3



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C79315562
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 18:48:35 +0100 (CET)
Received: from localhost ([::1]:37580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9X7p-0003Zl-PD
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 12:48:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9X5B-00022b-2H
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 12:45:49 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:34274)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9X58-0002tb-DR
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 12:45:48 -0500
Received: by mail-wr1-x436.google.com with SMTP id g10so23076189wrx.1
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 09:45:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vEdOSFNmRb7lHrPz7x1lakew3NKKjwqDNLel+BSWJyY=;
 b=pJU+IR4/HwFYumDDqBstbv2rzyIbP5KiCLkGCRVtLqpJ/6sjzUcrP8IoMrs6CwU4Ih
 Q40apXiT2P39Sv6bU+R5G2uxfWVoD1pI8XuRj1RopZBKcjCXc0B43OqAx0FZqGZfBC1k
 57wwdmdQGCyIHPCs0EO5vCxO4aFYnhDxg77gH8QJa04/i8dx3EtbEGpUHH+NdET7LJ/R
 ihyXuWTd/0cYp/1GIIJAPn+kBrFN688wT4WOWmt4iursGbqcLKkHK3t2drQhA0m4NEFa
 cHaRHrtmjhL/2xNss/YmZWfTGurS4ElUSHN7uyziIU/9tV2YxLfIpoGeuCDSZCDBn3dJ
 5GAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=vEdOSFNmRb7lHrPz7x1lakew3NKKjwqDNLel+BSWJyY=;
 b=aA3baiMp82GrHvxE37jgxD5ALJTFTBga/d8Us590mYt/YDZyyCjVnYFXgEQO8yurLK
 tJGY9PDCFL2vT6gOYxGxp3NnPswk/nRzwCc1ccDwFeST3U1OULPCu8RKNtqHsaQ2rXP3
 1Kt/Y1+ah+qoDNaSyYYXX8eDzfKJPu6snEfZX16zuuURAa1tsWC11vWzvlA86YPrK/5f
 7kklC5F3BynDwAjihfHeDYzwQbw+JYlv1EETzB4clfl3cNTDhH1+fmiGk0KRGARRoO4H
 L1h+3e/jzgFzW9aLGY5l++pMdhHwlm89ayU5+t+x55UIuliX4/5XJj4fGDy/WfqP8Hx3
 avfw==
X-Gm-Message-State: AOAM531QisItvN610e4lIMfxLeHIlS5aZOulPJXPa21HBbkFXGrUnNOd
 1nbiv8ONZdACGHAsrD0gWij6KJkfjHYa0g==
X-Google-Smtp-Source: ABdhPJzLSD6yFNsWEIiwmpn8lq/VG63R0FdWZbt+wPfer5f8MWTuJaGrBq7sLA2lZqOsFhl/gGUTOw==
X-Received: by 2002:a05:6000:c7:: with SMTP id
 q7mr3409502wrx.364.1612892744969; 
 Tue, 09 Feb 2021 09:45:44 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id r11sm5600921wmh.9.2021.02.09.09.45.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 09:45:44 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] meson: adjust timeouts for some slower tests
Date: Tue,  9 Feb 2021 18:45:41 +0100
Message-Id: <20210209174541.150011-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: berrange@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Adjust the timeouts for the longest running tests.  These are the
times that I measured and the corresponding timeouts.  For generic
qtests, the target that reported the longest runtime is included.

unit tests:
    test-crypto-tlscredsx509        13.15s   60s
    test-crypto-tlssession          14.12s   60s

qtests:
    ide-test                        13.65s   60s
    npcm7xx_watchdog_timer-test     15.02s   60s
    qos-test                        21.26s   60s   (i386)
    ahci-test                       22.18s   60s
    pxe-test                        26.51s   90s
    boot-serial-test                28.02s   90s   (sparc)
    prom-env-test                   28.86s   90s
    bios-tables-test                50.17s   90s   (aarch64)
    test-hmp                        57.15s   90s   (aarch64)
    npcm7xx_pwm-test                71.27s   120s
    migration-test                  97.09s   150s  (aarch64)
    qom-test                        139.20s  180s  (aarch64)

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/meson.build       |  6 ++++++
 tests/qtest/meson.build | 15 +++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/tests/meson.build b/tests/meson.build
index 0c939f89f7..fde21b6c8f 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -237,6 +237,11 @@ test_env = environment()
 test_env.set('G_TEST_SRCDIR', meson.current_source_dir())
 test_env.set('G_TEST_BUILDDIR', meson.current_build_dir())
 
+slow_tests = {
+  'test-crypto-tlscredsx509': 2,
+  'test-crypto-tlssession': 2
+}
+
 foreach test_name, extra: tests
   src = [test_name + '.c']
   deps = [qemuutil]
@@ -254,6 +259,7 @@ foreach test_name, extra: tests
        env: test_env,
        args: ['--tap', '-k'],
        protocol: 'tap',
+       timeout: 30 * slow_tests.get(test_name, 1),
        suite: ['unit'])
 endforeach
 
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 7e082be6fb..b1f8790b75 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -4,6 +4,20 @@ if not config_host.has_key('CONFIG_POSIX')
   subdir_done()
 endif
 
+slow_qtests = {
+  'ahci-test' : 2,
+  'bios-tables-test' : 3,
+  'boot-serial-test' : 3,
+  'ide-test' : 2,
+  'migration-test' : 5,
+  'npcm7xx_pwm-test': 4,
+  'npcm7xx_watchdog_timer-test': 2,
+  'prom-env-test' : 3,
+  'pxe-test' : 3,
+  'qos-test : 2,
+  'qom-test' : 6,
+  'test-hmp' : 3,
+]
 qtests_generic = [
   'cdrom-test',
   'device-introspect-test',
@@ -272,6 +286,7 @@ foreach dir : target_dirs
          env: qtest_env,
          args: ['--tap', '-k'],
          protocol: 'tap',
+         timeout: 30 * slow_qtests.get(test_name, 1),
          suite: ['qtest', 'qtest-' + target_base])
   endforeach
 endforeach
-- 
2.29.2



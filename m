Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BF132F9A5
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Mar 2021 12:10:38 +0100 (CET)
Received: from localhost ([::1]:59984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIUpS-0002XV-0f
	for lists+qemu-devel@lfdr.de; Sat, 06 Mar 2021 06:10:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lIUa1-00061a-6n
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 05:54:41 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:39293)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lIUZz-0008Dh-09
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 05:54:40 -0500
Received: by mail-wr1-x431.google.com with SMTP id b18so5216366wrn.6
 for <qemu-devel@nongnu.org>; Sat, 06 Mar 2021 02:54:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XQ/WctJe2L4xl8WNjtSQPbxp/LlhPKDQHw2nHEsK5u4=;
 b=nIzTG50jN230RwVyAWuLOILr2OAsLb5JYX+Ko8pDkoqVDbXx7qUxr7dlJZNuY1OOab
 GRJlD2UyRXoOnNCZ1RXb78pV6hkEqzKnGGUuqE12hC0hHXtpXBpIdgh4s348LpZoo3SZ
 EfjrNqKZFcF5v5hrkdAdyGA+KfDP/5RY4RLEtPU8YcrIW+RhhAYnEZicwefT/+veDX9I
 YSrYeME646PE72k6jRNhyhkynj6I9WJ8StNox85idqOUFftMB8r0fBBkGI7uD2RX/2+p
 U79rb16tQEDspHaeTqaId+oUVwcMc8RRdtVAwciF7gFRQTsueVcjrkXqdm1IHfN7xHF8
 KCPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=XQ/WctJe2L4xl8WNjtSQPbxp/LlhPKDQHw2nHEsK5u4=;
 b=QSgBiIuXRgsHMj0xem3QIBq+biOiuxEEaRKLqXpPJwWC08XASPCZLTYXOp1n+1QtOb
 PKk9hmnqJSEIPZAj8qNoLB8XK6gjeQqYU+sufBjp9JVO3k+2FY55HCiXGFRar1J9VdGC
 X8nYAMv8V2TS6Q0O+L6w9BIbgXMaR6m9+JMOYP0ziB+J47UIt0YUECDmnlaenIB2Fgwf
 owh0z+3LWBbJj6uoCZA7o5EAAPrNm+HZBjsAgoGqyMJDX4MI7h+sIlLV/la4rsFKP9kv
 ic8ZYcnNv1x8Ott1XsMq+dlCGxDSWwMj+UyJ2jCsKov++bDAnLBg9Yr6g3u6x91stt7Z
 WRPA==
X-Gm-Message-State: AOAM533OJ16k8CH7FXLExDJqK4j4SSDfGuVaWv95xbhmQpcmfRIWzcyE
 e3gxlvNH/5QustkhIRPxlZ7hMA+f0S0=
X-Google-Smtp-Source: ABdhPJxGK9ann0lPEumS/tFkHwoTNVTpsxHNzBsL9qxWqehEGYRwVN8x2XQe/KOiAejMXJxQL67gsg==
X-Received: by 2002:a05:6000:1547:: with SMTP id
 7mr13661072wry.301.1615028077748; 
 Sat, 06 Mar 2021 02:54:37 -0800 (PST)
Received: from avogadro.redhat.com ([93.56.170.5])
 by smtp.gmail.com with ESMTPSA id i26sm9326472wmb.18.2021.03.06.02.54.37
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 02:54:37 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 20/23] meson: adjust timeouts for some slower tests
Date: Sat,  6 Mar 2021 11:54:16 +0100
Message-Id: <20210306105419.110503-21-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210306105419.110503-1-pbonzini@redhat.com>
References: <20210306105419.110503-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Adjust the timeouts for the benchmarks (Meson 0.57 allows 0 to mean
infinite) and for the longest running tests.  These are the
times that I measured and the corresponding timeouts.  For generic
qtests, the target that reported the longest runtime is included.

unit tests:
    test-crypto-tlscredsx509        13.15s   45s
    test-crypto-tlssession          14.12s   45s

qtests:
    qos-test                        21.26s   60s   (i386)
    ahci-test                       22.18s   60s
    pxe-test                        26.51s   60s
    boot-serial-test                28.02s   60s   (sparc)
    prom-env-test                   28.86s   60s
    bios-tables-test                50.17s   120s   (aarch64)
    test-hmp                        57.15s   120s   (aarch64)
    npcm7xx_pwm-test                71.27s   150s
    migration-test                  97.09s   150s  (aarch64)
    qom-test                        139.20s  240s  (aarch64)

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/fp/meson.build    |  2 +-
 tests/meson.build       |  8 ++++++++
 tests/qtest/meson.build | 15 +++++++++++++++
 3 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/tests/fp/meson.build b/tests/fp/meson.build
index 8d739c4d59..1c3eee9955 100644
--- a/tests/fp/meson.build
+++ b/tests/fp/meson.build
@@ -624,7 +624,7 @@ test('fp-test-mulAdd', fptest,
      # no fptest_rounding_args
      args: fptest_args +
            ['f16_mulAdd', 'f32_mulAdd', 'f64_mulAdd', 'f128_mulAdd'],
-     suite: ['softfloat-slow', 'softfloat-ops-slow'], timeout: 60)
+     suite: ['softfloat-slow', 'softfloat-ops-slow'], timeout: 90)
 
 fpbench = executable(
   'fp-bench',
diff --git a/tests/meson.build b/tests/meson.build
index 7d7da6a636..656d211e25 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -237,6 +237,11 @@ test_env = environment()
 test_env.set('G_TEST_SRCDIR', meson.current_source_dir())
 test_env.set('G_TEST_BUILDDIR', meson.current_build_dir())
 
+slow_tests = {
+  'test-crypto-tlscredsx509': 45,
+  'test-crypto-tlssession': 45
+}
+
 foreach test_name, extra: tests
   src = [test_name + '.c']
   deps = [qemuutil]
@@ -254,6 +259,8 @@ foreach test_name, extra: tests
        env: test_env,
        args: ['--tap', '-k'],
        protocol: 'tap',
+       timeout: slow_tests.get(test_name, 30),
+       priority: slow_tests.get(test_name, 30),
        suite: ['unit'])
 endforeach
 
@@ -263,6 +270,7 @@ foreach bench_name, deps: benchs
   benchmark(bench_name, exe,
             args: ['--tap', '-k'],
             protocol: 'tap',
+            timeout: 0,
             suite: ['speed'])
 endforeach
 
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index ba6ecaed32..8c79d5cc3b 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -4,6 +4,19 @@ if not config_host.has_key('CONFIG_POSIX')
   subdir_done()
 endif
 
+slow_qtests = {
+  'ahci-test' : 60,
+  'bios-tables-test' : 120,
+  'boot-serial-test' : 60,
+  'migration-test' : 150,
+  'npcm7xx_pwm-test': 150,
+  'prom-env-test' : 60,
+  'pxe-test' : 60,
+  'qos-test' : 60,
+  'qom-test' : 300,
+  'test-hmp' : 120,
+}
+
 qtests_generic = [
   'cdrom-test',
   'device-introspect-test',
@@ -273,6 +286,8 @@ foreach dir : target_dirs
          env: qtest_env,
          args: ['--tap', '-k'],
          protocol: 'tap',
+         timeout: slow_qtests.get(test, 30),
+         priority: slow_qtests.get(test, 30),
          suite: ['qtest', 'qtest-' + target_base])
   endforeach
 endforeach
-- 
2.29.2




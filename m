Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9A95EF6CB
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 15:42:05 +0200 (CEST)
Received: from localhost ([::1]:51916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odtng-0007Bg-GG
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 09:42:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ods3C-0000NA-8x
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:50:05 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:43862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ods38-0002NS-Er
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:49:56 -0400
Received: by mail-wr1-x42c.google.com with SMTP id h7so1759143wru.10
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 04:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=R5BZF8K6ZhoW9OV4ExNUqQ51TJUdrkSyv1BWAJuhkG0=;
 b=Tj6VXTWwdEgFtdNeLbHHJ7NyYRbpI2GXgw/U97jw7WBFCoHyvKB6XMA6F2FBtsHBYR
 cdzCHlAQRcelrSDbZJhLuukZTzoQ5BRxy+RBZB+O2ZVwfE5eMobE87jdFA5X41jKUWmq
 2L4EBIBWMTBs6fTCJH9GfaKkJ7zCJA2u894eiStIy5aIOCntPDogms5V1vvG5DKI138c
 gbr6eXPUev5xUUB0kqRDp7Pmvxbd8qNSP2wcjHomv9LGEvdCWDaHdJT9SkcIoFkc7tqC
 a8mhSpe0HsqvlhvP5uA1q7nWwih6JeEL1nHoqJoRtlbubfNQFpEDX6uP8FcqAA5la7KF
 0/gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=R5BZF8K6ZhoW9OV4ExNUqQ51TJUdrkSyv1BWAJuhkG0=;
 b=czybk5hg8TOI12cPO3VnsK6/03rXuTTc3dBJjzhjoQmUshxXg+hpZcVTJuFx9yvrTq
 ZmLiCg/hQMhocd9uwyzagtANT12I29l3Q1brbTsi59H1S3UffTC9E0V0AoVU5z0xnQyc
 mfHRRMRsewMBv2XpYLkly6Vqb675eTLaVpkZIjkD+nmX+ggAdqhtCstvPvvaoxK+tSiM
 W6v0vPEnrhUS3TEgbxzU5DVh0un3EjztVFwObj7flg/IGxOSHwvA6Kt4GlKQ7rbHPT/R
 5SEH0UlnnanISoSE97dtk1IIyGw3MsfYO8rJ5byk8PTJY0lIvTvm1b9HC29VKQpJb4n/
 iKIQ==
X-Gm-Message-State: ACrzQf2bpwaQdNJ79LLcXL8SOBbVWqW/OWmvijGcRbriRxlJpYPZROWy
 jnu3dze6j1VVbt0OP1l6kt04dA==
X-Google-Smtp-Source: AMsMyM5Et9B/KV6FLmgkyKpbj2HHbcFfO5JPh7MNbjhcVRbcMDEiWFcMYsLYkp7CrY8U/SfuBxSAYA==
X-Received: by 2002:adf:dd8f:0:b0:22a:84ab:4be3 with SMTP id
 x15-20020adfdd8f000000b0022a84ab4be3mr1942252wrl.40.1664452193106; 
 Thu, 29 Sep 2022 04:49:53 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 h9-20020a1c2109000000b003b4fac020c8sm3996987wmh.16.2022.09.29.04.49.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 04:49:51 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 680C11FFCF;
 Thu, 29 Sep 2022 12:42:34 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 minyihh@uci.edu, ma.mandourr@gmail.com, Luke.Craig@ll.mit.edu,
 cota@braap.org, aaron@os.amperecomputing.com, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v1 27/51] configure: cleanup creation of tests/tcg target
 config
Date: Thu, 29 Sep 2022 12:42:07 +0100
Message-Id: <20220929114231.583801-28-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220929114231.583801-1-alex.bennee@linaro.org>
References: <20220929114231.583801-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From: Paolo Bonzini <pbonzini@redhat.com>

Remove the symlink to tests/tcg/config-*.mak, which is possible now
that unused target config files are not created either.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 configure   | 12 +++++-------
 Makefile    |  2 +-
 meson.build |  2 +-
 3 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/configure b/configure
index 8b495d4453..c175650eb9 100755
--- a/configure
+++ b/configure
@@ -2540,10 +2540,6 @@ tcg_tests_targets=
 for target in $target_list; do
   arch=${target%%-*}
 
-  config_target_mak=tests/tcg/config-$target.mak
-
-  echo "# Automatically generated by configure - do not modify" > $config_target_mak
-  echo "TARGET_NAME=$arch" >> "$config_target_mak"
   case $target in
     xtensa*-linux-user)
       # the toolchain is not complete with headers, only build softmmu tests
@@ -2560,13 +2556,15 @@ for target in $target_list; do
 
   if probe_target_compiler $target || test -n "$container_image"; then
       test -n "$container_image" && build_static=y
-      write_target_makefile "build-tcg-tests-$target >> "$config_target_mak"
       mkdir -p "tests/tcg/$target"
+      config_target_mak=tests/tcg/$target/config-target.mak
       ln -sf "$source_path/tests/tcg/Makefile.target" "tests/tcg/$target/Makefile"
-      ln -sf "../config-$target.mak" "tests/tcg/$target/config-target.mak"
+      echo "# Automatically generated by configure - do not modify" > "$config_target_mak"
+      echo "TARGET_NAME=$arch" >> "$config_target_mak"
       echo "TARGET=$target" >> "$config_target_mak"
-      echo "QEMU=$PWD/$qemu" >> "$config_target_mak"
+      write_target_makefile "build-tcg-tests-$target" >> "$config_target_mak"
       echo "BUILD_STATIC=$build_static" >> "$config_target_mak"
+      echo "QEMU=$PWD/$qemu" >> "$config_target_mak"
       echo "run-tcg-tests-$target: $qemu\$(EXESUF)" >> Makefile.prereqs
       tcg_tests_targets="$tcg_tests_targets $target"
   fi
diff --git a/Makefile b/Makefile
index 357592ad39..a48103cc8a 100644
--- a/Makefile
+++ b/Makefile
@@ -221,7 +221,7 @@ qemu-%.tar.bz2:
 distclean: clean recurse-distclean
 	-$(quiet-@)test -f build.ninja && $(NINJA) $(NINJAFLAGS) -t clean -g || :
 	rm -f config-host.mak Makefile.prereqs qemu-bundle
-	rm -f tests/tcg/config-*.mak
+	rm -f tests/tcg/*/config-target.mak tests/tcg/config-host.mak
 	rm -f config.status
 	rm -f roms/seabios/config.mak
 	rm -f qemu-plugins-ld.symbols qemu-plugins-ld64.symbols
diff --git a/meson.build b/meson.build
index 8dc661363f..ac5ef05c21 100644
--- a/meson.build
+++ b/meson.build
@@ -3738,7 +3738,7 @@ summary(summary_info, bool_yn: true, section: 'Compilation')
 summary_info = {}
 have_cross = false
 foreach target: target_dirs
-  tcg_mak = meson.current_build_dir() / 'tests/tcg' / 'config-' + target + '.mak'
+  tcg_mak = meson.current_build_dir() / 'tests/tcg' / target / 'config-target.mak'
   if fs.exists(tcg_mak)
     config_cross_tcg = keyval.load(tcg_mak)
     if 'CC' in config_cross_tcg
-- 
2.34.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 003E45F454E
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 16:19:53 +0200 (CEST)
Received: from localhost ([::1]:54860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofilX-00066s-0M
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 10:19:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofi9L-0001cg-22
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:39:55 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:39785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofi9J-00023a-7e
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:39:54 -0400
Received: by mail-wr1-x42c.google.com with SMTP id f11so18727072wrm.6
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 06:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=YfuwARZoVOH5mYGRHlBCDKxwrAb3kVRqcznzJXbhhCE=;
 b=yqrRh5xQnRgFUtAUW8Y+XqonaxFK7XtmhaYUWqsO3MpO+s0BOWeKI0lIlPQD6RMD5d
 RVc+Cr3QilQwPd+iNMiic8rYAu2iVjE4dI8HNLXDOG+zlEkALbfuRA2UnQNjVxthEvay
 hvpF4ZJGBmfpoXinEDZPT84wQqU1W2uDXv3O2ArCN0CbotqPVykr1rblg+3hu65dvWVv
 FAOpf5a3CkuJJaQO/rypkQgOe92FypfTvGrMZnxoRqvvVXnVeOeZ/ARfj4Xq7CgWdFtx
 LsPkVCM2RHBgs5tGDU5rCEkFwoFPlQr4AcYQQ2mJ9nmSfFwRoC9UALy1LBB5Tu9JmTs3
 YPKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=YfuwARZoVOH5mYGRHlBCDKxwrAb3kVRqcznzJXbhhCE=;
 b=eQozTvoOX+Y5DkJomTEBIG1pVYjVFVmgj1LoREJIWRAFKIJAgnPpfD9QvhdCP0xmji
 OQd1lnoUQG1+++fNhbcRrN4hmW8rJnsLUmbifPqLhSiuRZwE4DMpdHzmECGgbHSWeVIA
 pUgwM879MViXqOG0IRnGPbLRkZ52r4PpekUZ1y/pZhQ+c5AJ+KigG+xfGGyIpLOTkCNV
 dyUwi4T0Ed3ppFaHV/xoMOX0aVqeA73nXmRJfYg/p9L9B3J5XtiVJPQZFYgrG2kuCcKy
 1iWIOCRgSfAjUMlvUORxy4IBPcuq6hnGmkGb2oWMPOrkuqJBoF02SkD1iyEns+VD+Ace
 V56w==
X-Gm-Message-State: ACrzQf0rMloLu+hdPR7/CQUtdYf2IiVhdSrmbtaTJoyYNdys1HpMxmJL
 IW67XDpJcIDbX8jL0rtu14xoFw==
X-Google-Smtp-Source: AMsMyM76VAwDzG0BVHLZTOr5t+eMVq0g16Xp1RE34J1OrKK/RPHrYMhlkYCpyHWh0oRxZwUKPyf4gA==
X-Received: by 2002:a5d:5a0d:0:b0:228:da3f:738 with SMTP id
 bq13-20020a5d5a0d000000b00228da3f0738mr16379642wrb.526.1664890791679; 
 Tue, 04 Oct 2022 06:39:51 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 l7-20020a05600c4f0700b003b4c979e6bcsm20350036wmq.10.2022.10.04.06.39.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 06:39:50 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 70DAE1FFBB;
 Tue,  4 Oct 2022 14:01:41 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 27/54] configure: cleanup creation of tests/tcg target config
Date: Tue,  4 Oct 2022 14:01:11 +0100
Message-Id: <20221004130138.2299307-28-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221004130138.2299307-1-alex.bennee@linaro.org>
References: <20221004130138.2299307-1-alex.bennee@linaro.org>
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
Message-Id: <20220929114231.583801-28-alex.bennee@linaro.org>

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



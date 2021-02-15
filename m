Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA9E31C429
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 23:56:21 +0100 (CET)
Received: from localhost ([::1]:51800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBmmx-0003ua-PO
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 17:56:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lBmm3-0003RK-G7
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 17:55:23 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:53642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lBmm1-0006tU-TQ
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 17:55:23 -0500
Received: by mail-wm1-x336.google.com with SMTP id j11so7432821wmi.3
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 14:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vCU7VBP1+9fA/8RNC19ASRuMYYyFDrV1Glj0QyKbZRs=;
 b=wLxbTCBz0hlRqT2kAdwsyAC42feRUYnCGVtGycTsH/Oz8E/jsON3N57yNFGVigsffd
 RODTz3WKtRIVExjoq45EFMp3cilLaP80ZuItLEGQTrxo796NSUQ9QofCmr2L5epANjUI
 bHgXcbNpdUHGW+gPO1blExwssYL/W6OByCyhHuqC+5Y4X31wCwrMLM/UMDHikYwRXsaj
 I68bpET6RPTs4eK4oLHzWzgpFMweWbJKd3eOi7XfZZui+lCQi3HL/UPtLR/750QJYH74
 Cf6hfFxHuslJtZb8O9neK71sCzAVLTkm9oGggME9CNTHgXYy95VocDPnoipst/P1xqHg
 g3jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vCU7VBP1+9fA/8RNC19ASRuMYYyFDrV1Glj0QyKbZRs=;
 b=azQn9piv2F61+6X9cQxVy8tJqIouiChC7d7woaKMm6cD+1e/UwNJNMxvtnce+nfR6y
 8SIIeuW+zud2ICc3CNzGfJ+FPaM/mH2CFAjqrlpvzKybe4hGxEV/jB8wgBqc35G0XR80
 eydhvlhicOnJLrkmo62QQU2pEDeZTuGApNFrMEmY8tknml7E5B2oCpY0Yt2u5YnO7ruJ
 ih6OfLk/Ua1G/FDOe0Bcg5WxqtZm6G6TFsX9xlohDmSIHJfgKKKecNvsl2Z9H0XR+wLE
 PMWFEnTtPpRIYfxiOKnppa2sA2IATWc1RZAA+S0QZV0kzsxJRFxKvJuHV/iixJ0sSnb0
 CERA==
X-Gm-Message-State: AOAM530Ia61/vrV7oOEMGblbhOsi2BN2ZINoJ7FuTkdokrkuLbOoJU8S
 10B7A1gGbOwi/NWdGp95F946bA==
X-Google-Smtp-Source: ABdhPJyilFnTRfz5CCaWreIirgGrlCgT/xsozcDw6mQkkDUifxnhuQsqAU73xrPhKe3HvsGLnhW75Q==
X-Received: by 2002:a1c:318a:: with SMTP id x132mr870376wmx.6.1613429720349;
 Mon, 15 Feb 2021 14:55:20 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v66sm828167wme.33.2021.02.15.14.55.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 14:55:19 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 775FE1FF7E;
 Mon, 15 Feb 2021 22:55:18 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] meson.build: expose TCG cross compiler information in summary
Date: Mon, 15 Feb 2021 22:55:11 +0000
Message-Id: <20210215225511.23286-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Blink and you miss the cross TCG compiler stuff so lets display it
with the rest of the compiler information.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 meson.build            | 18 ++++++++++++++++++
 tests/tcg/configure.sh |  8 --------
 2 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/meson.build b/meson.build
index a923f249d8..3c8135add2 100644
--- a/meson.build
+++ b/meson.build
@@ -2508,6 +2508,24 @@ endif
 summary_info += {'strip binaries':    get_option('strip')}
 summary_info += {'sparse':            sparse.found() ? sparse.full_path() : false}
 summary_info += {'mingw32 support':   targetos == 'windows'}
+
+# snarf the cross-compilation information for tests
+tcg_compile_config = run_command('find',
+                                 meson.current_build_dir() / 'tests/tcg',
+                                 '-iname', '*.mak').stdout().strip().split('\n')
+foreach tcg_mak: tcg_compile_config
+  config_cross_tcg = keyval.load(tcg_mak)
+  target = config_cross_tcg['TARGET_NAME']
+  compiler = ''
+  if 'DOCKER_CROSS_CC_GUEST' in config_cross_tcg
+    summary_info += {target + ' tests': config_cross_tcg['DOCKER_CROSS_CC_GUEST'] +
+                                      ' via ' + config_cross_tcg['DOCKER_IMAGE']}
+  elif 'CROSS_CC_GUEST' in config_cross_tcg
+    summary_info += {target + ' tests'
+                     : config_cross_tcg['CROSS_CC_GUEST'] }
+  endif
+endforeach
+
 summary(summary_info, bool_yn: true, section: 'Compilation')
 
 # Targets and accelerators
diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index e1b70e25f2..77a18fd289 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -257,11 +257,3 @@ for target in $target_list; do
     echo "DOCKER_CROSS_CC_GUEST=$container_cross_cc" >> $config_target_mak
   fi
 done
-
-# report container support state
-echo "cross containers  $container"
-
-if test -n "$enabled_cross_compilers"; then
-    echo
-    echo "NOTE: guest cross-compilers enabled:$enabled_cross_compilers"
-fi
-- 
2.20.1



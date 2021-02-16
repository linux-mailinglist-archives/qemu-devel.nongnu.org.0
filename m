Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1075031C8BE
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 11:26:46 +0100 (CET)
Received: from localhost ([::1]:39124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBxZ6-0003Sv-K2
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 05:26:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lBxXx-0002zD-CS
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 05:25:33 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:34857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lBxXv-0004bt-Hw
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 05:25:33 -0500
Received: by mail-wr1-x431.google.com with SMTP id l12so12309071wry.2
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 02:25:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pux4r6TgZgDo+9rV0r4Idu4yWRrFc6+zhYYmUdQg184=;
 b=pZOpF67YMXtpOKx3Q3D/SEnsYIcGMoHxX5sCXtJRzM5k30evQoRPeVL9J1L+iIBAL5
 6edPZv9BX3RXu6tdOrRkDiZaPv8zXkfDV7wBdaLMWgVLruBcogVJ6AaHHc63f4++G7yk
 06ErutjmxqvE0+ANqCRK2dHy7JPWuEiJ6Hrt0oLrEtawaX6SXA243sxFMGqZOzHH76SP
 im4yLDnTxDZvKuILxlIwsDiv1/y4avWgJsVQuuFEO8RCroJ624TIQWonokaNe1rnDtTy
 WzkVADnyahPR6JxHbZKacfP1103JMkDLiGtEnjlYhpO1VqVU5JOFntTc0ADKOcA6QfTB
 Iq5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pux4r6TgZgDo+9rV0r4Idu4yWRrFc6+zhYYmUdQg184=;
 b=b3KmmISPJpyk8rUaelhF4UeqRQhFbFkbtg/dL51xp83v/Qc1pLZeF8Hp242SH53q80
 TboNcKc2NTl4iNCMj0CmauGOoDvPLwzjh1DUOuMDt1V5LIF1xs1nOQqs5vI4G3ximoXD
 GULVhJx6x8+yL8Xd/y1JbDv2BHTo29TUpw+eLNUgaGmWr7dixbo5lc7eBkbxptvNkyLT
 KGwziVuKoi0Sfqaze35yZS3qjtSRuotp9c9ANUWVN92TIwLTs/64+MsGbyZHBYG8Da3i
 /eTVCL98du0XqoucS73imcItjO6JrLJd1yEGa5FgrwE2ZSTfh01KCEw1xTzMvwwuDo3V
 Knvw==
X-Gm-Message-State: AOAM5321+HD9fyYECh8NkfRIZd8Diyl8rCkogIWEe/6+El/NdLc97mbf
 59NoZMd6z2xSjoA1hP/5wFEBiQ==
X-Google-Smtp-Source: ABdhPJxq89+gk85RV+hFutSZ3wdr0MagRhvm8r95Cb4pp8Nr/ChK+KZEdf1HN08SRLSIVq7ngH69yg==
X-Received: by 2002:a5d:690b:: with SMTP id t11mr23248705wru.12.1613471129779; 
 Tue, 16 Feb 2021 02:25:29 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f5sm2938492wmf.15.2021.02.16.02.25.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Feb 2021 02:25:28 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 009821FF7E;
 Tue, 16 Feb 2021 10:25:27 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] meson.build: expose TCG cross compiler information in
 summary
Date: Tue, 16 Feb 2021 10:25:22 +0000
Message-Id: <20210216102522.6279-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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
v2
  - use target_dirs/fs.exists() instead of find
---
 meson.build            | 18 ++++++++++++++++++
 tests/tcg/configure.sh |  8 --------
 2 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/meson.build b/meson.build
index a923f249d8..4462e7279e 100644
--- a/meson.build
+++ b/meson.build
@@ -2508,6 +2508,24 @@ endif
 summary_info += {'strip binaries':    get_option('strip')}
 summary_info += {'sparse':            sparse.found() ? sparse.full_path() : false}
 summary_info += {'mingw32 support':   targetos == 'windows'}
+
+# snarf the cross-compilation information for tests
+foreach target: target_dirs
+  tcg_mak = meson.current_build_dir() / 'tests/tcg' / 'config-' + target + '.mak'
+  if fs.exists(tcg_mak)
+    config_cross_tcg = keyval.load(tcg_mak)
+    target = config_cross_tcg['TARGET_NAME']
+    compiler = ''
+    if 'DOCKER_CROSS_CC_GUEST' in config_cross_tcg
+      summary_info += {target + ' tests': config_cross_tcg['DOCKER_CROSS_CC_GUEST'] +
+                                          ' via ' + config_cross_tcg['DOCKER_IMAGE']}
+    elif 'CROSS_CC_GUEST' in config_cross_tcg
+      summary_info += {target + ' tests'
+                                : config_cross_tcg['CROSS_CC_GUEST'] }
+    endif
+   endif
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



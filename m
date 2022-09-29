Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3DD5EF587
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 14:36:33 +0200 (CEST)
Received: from localhost ([::1]:37126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odsmE-0004Qt-7e
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 08:36:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odrw7-0004Nl-C9
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:42:39 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:43771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odrw4-0001Cr-S2
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:42:38 -0400
Received: by mail-wr1-x431.google.com with SMTP id h7so1730540wru.10
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 04:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=Diq8ZN9f6nzxeYGGdF9jWCCGVvSqsoLnUON4PzOL4RU=;
 b=hHSrXGgaXoh/Z9nPkPbKaSxA0TDdRNbrHh6XUDKnV5Z8MXOESHRjdWdPBIon6H8LWv
 BxpKtia6metZZxukF2+HKg2VGIfUHO5xem1NUXXQcoK0usSBVyEecL7MogwNtLBy6xD2
 h8LjI3Wt1CGU8VZgj2P+FeraX+3r0+5sR8dfPUqTfELN3N53afn8Wt+WM5gJU2Mf9wZp
 JxGPymUQc8f8cNTUi7FfzpVm0w03Eel3lzcFMG4Y6hvhMqAuxqRWrYRbz8o5FGnrQFT+
 kQkrjfu8ZBKqbC5Vby5+2JTQ6mZGMVkT4x/GLFHp3+bVjdOGPKtL7tjJBf4pOSH0PY47
 I3uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Diq8ZN9f6nzxeYGGdF9jWCCGVvSqsoLnUON4PzOL4RU=;
 b=pr2Lj/Y4ftffx97pw8BkEc1Ef9EaEhxETQyK764hrZRcMjcJOnPaUOIPNpL0B4GkhT
 4eHCTWz8vxB3qVkr0iNaMmFlAkSiu2a15NkvSBCXsDH1jmaaDaiPSCHmrgkddAc2DksA
 jXdha+xUa5aBzxhJFGJMgxr3ApBO08aT/76NOhLPwTZCOCHPp8x5U+BzsLVNWD/ufN+W
 /6kTKr7G445j6mF4+0D8BAnzIv+UzBw6Mi8MDWNMkZvpHDWCT+XQ4GFsqJFMVMTg2MJc
 AGOxEct8BmAvGiw8HCpJ3pdRbVb0tBlurbgXgoOzW54SsyiEva+w67OwIqVGEPxCSlpq
 yLkQ==
X-Gm-Message-State: ACrzQf3ilCJLgBH4KK3955/SBMVdZ1frQbXbYyl2TgP7OVj1bWJnVu9/
 nosJOXOdN4BVZ+KrPcA+wEDGNw==
X-Google-Smtp-Source: AMsMyM4v/yKnDypGAffugw+eCVCEMo/ewOdnVjMM9MAdCs+I8l8BOkJGjQrdb31dB3qu+jqTdxwBaA==
X-Received: by 2002:a5d:6dad:0:b0:22c:cedf:8e56 with SMTP id
 u13-20020a5d6dad000000b0022ccedf8e56mr2060567wrs.596.1664451755531; 
 Thu, 29 Sep 2022 04:42:35 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 t14-20020a1c770e000000b003a5ffec0b91sm4092411wmi.30.2022.09.29.04.42.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 04:42:34 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B1B581FFBD;
 Thu, 29 Sep 2022 12:42:31 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 minyihh@uci.edu, ma.mandourr@gmail.com, Luke.Craig@ll.mit.edu,
 cota@braap.org, aaron@os.amperecomputing.com, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v1 05/51] configure: move detected gdb to TCG's config-host.mak
Date: Thu, 29 Sep 2022 12:41:45 +0100
Message-Id: <20220929114231.583801-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220929114231.583801-1-alex.bennee@linaro.org>
References: <20220929114231.583801-1-alex.bennee@linaro.org>
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

When tests/tcg gained it's own config-host.mak we forgot to move the
GDB detection.

Fixes: 544f4a2578 (tests/tcg: isolate from QEMU's config-host.mak)
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220922145832.1934429-6-alex.bennee@linaro.org>
---
 configure | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/configure b/configure
index dc53e4df03..52ae4adffc 100755
--- a/configure
+++ b/configure
@@ -2453,6 +2453,8 @@ if test -n "$gdb_bin"; then
     gdb_version=$($gdb_bin --version | head -n 1)
     if version_ge ${gdb_version##* } 9.1; then
         echo "HAVE_GDB_BIN=$gdb_bin" >> $config_host_mak
+    else
+        gdb_bin=""
     fi
 fi
 
@@ -2537,6 +2539,11 @@ echo "# Automatically generated by configure - do not modify" > $config_host_mak
 echo "SRC_PATH=$source_path" >> $config_host_mak
 echo "HOST_CC=$host_cc" >> $config_host_mak
 
+# versioned checked in the main config_host.mak above
+if test -n "$gdb_bin"; then
+    echo "HAVE_GDB_BIN=$gdb_bin" >> $config_host_mak
+fi
+
 tcg_tests_targets=
 for target in $target_list; do
   arch=${target%%-*}
-- 
2.34.1



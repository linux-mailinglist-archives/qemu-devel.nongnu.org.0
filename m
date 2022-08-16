Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3065F595D86
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 15:39:44 +0200 (CEST)
Received: from localhost ([::1]:47416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNwnH-0003sa-B5
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 09:39:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oNwmG-0002JN-F0
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 09:38:40 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:35682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oNwmE-0004nk-Tv
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 09:38:40 -0400
Received: by mail-wr1-x434.google.com with SMTP id bs25so12695514wrb.2
 for <qemu-devel@nongnu.org>; Tue, 16 Aug 2022 06:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=t9p09yoHXNnPd+EYQXPem0p+lQwOuDxwcMYL4Toy1T0=;
 b=c8jwsLOolYa9G3dTg/8pOT4GnmLAMT16Sqh07XF//mVwwi7z+e19LlYIyUBvPz4gM2
 rTGnZmbGhCUzLo4WIcaucKcfrUBLBSVfT/irYpP2ThQOis0raQj8o4sEpX+IdMXW15qo
 CXGAQdccA9G6q3N3pqHGvNWL+cX0b78rLeN9M8FYysmJ07XYrjcAnGidd7g16pVGZhmg
 8rhhtkEwUAnF/y+m4XXp8omDdPULODsUX3zv3XE3WTz6i0ZK9GMNFvm38ZlrhmLKljPN
 gAw5IGrQrvOAr0RX0eFFhBtzPCV9TgBLGTzFO+T8kcR8S6/Fd+1lHQ8qQ/k1SojHbWk6
 WRfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=t9p09yoHXNnPd+EYQXPem0p+lQwOuDxwcMYL4Toy1T0=;
 b=6l9vsQhNR7A0PJq89pArtxlCA++2Z5gnWAvI9QLuTKmFSl462iL8w7wOmmRNZiEOGg
 DuwX2xSntfpZdRIytMGr1qcw/mLvlLhbDER8BAYV5SkgWcWCi/jUBDHxr7dnFEHgjkOK
 E56IcDwefhybhXae+FvmvbxzsKGfZ5rlUsaHpHMu5qASXpHwNnoAhCng7EdpP6U1honZ
 kGYvUh4v4weXibPruQRMhaoLgtA0Zw5NHXY0imoM714YfwyY8XCcjfvukADlqoqkiIVX
 k7LAAlU4MDtrVrRFJkR9ysoOMwYH049iRrbKofPhZ5ieyJhGXsyxTOrd2PNroO2iocmc
 sjIg==
X-Gm-Message-State: ACgBeo0WFQv+6LrAea44LC9Ph+nJQ+QfFrTTVYPUARiZaRE+vSpuEB/x
 43K2M6/4qCnXDex2Oy6m+qivVw8X7+RONw==
X-Google-Smtp-Source: AA6agR7ekz19g/bLMlGafccAX6WSAZqUNj+j+AMGKIrneFP3Nfq99snqt8WIv0HfskEvl3ZdCmabkA==
X-Received: by 2002:a5d:6488:0:b0:225:f99:338b with SMTP id
 o8-20020a5d6488000000b002250f99338bmr3932332wri.638.1660657117420; 
 Tue, 16 Aug 2022 06:38:37 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 p7-20020a1c5447000000b003a500b612fcsm13251359wmi.12.2022.08.16.06.38.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 06:38:36 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 099F81FFB7;
 Tue, 16 Aug 2022 14:38:36 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [RFC PATCH] tests/avocado: push default timeout to QemuBaseTest
Date: Tue, 16 Aug 2022 14:38:31 +0100
Message-Id: <20220816133831.2166761-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

All of the QEMU tests eventually end up derrived from this class. Move
the default timeout from LinuxTest to ensure we catch them all.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/avocado/avocado_qemu/__init__.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/avocado/avocado_qemu/__init__.py b/tests/avocado/avocado_qemu/__init__.py
index ed4853c805..9d17a287cf 100644
--- a/tests/avocado/avocado_qemu/__init__.py
+++ b/tests/avocado/avocado_qemu/__init__.py
@@ -227,6 +227,10 @@ def exec_command_and_wait_for_pattern(test, command,
     _console_interaction(test, success_message, failure_message, command + '\r')
 
 class QemuBaseTest(avocado.Test):
+
+    # default timeout for all tests, can be overridden
+    timeout = 900
+
     def _get_unique_tag_val(self, tag_name):
         """
         Gets a tag value, if unique for a key
@@ -512,7 +516,6 @@ class LinuxTest(LinuxSSHMixIn, QemuSystemTest):
     to start with than the more vanilla `QemuSystemTest` class.
     """
 
-    timeout = 900
     distro = None
     username = 'root'
     password = 'password'
-- 
2.30.2



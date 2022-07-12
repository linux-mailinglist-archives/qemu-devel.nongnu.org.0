Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77826572936
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 00:22:49 +0200 (CEST)
Received: from localhost ([::1]:45234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBOHI-0002At-Gk
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 18:22:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBOBe-0007wu-Hq
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 18:16:58 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:56114)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBOBd-0002W1-1Q
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 18:16:58 -0400
Received: by mail-wm1-x32c.google.com with SMTP id l42so5428406wms.5
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 15:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kNSwwLUlb4TjazJWbInH85IZYRihokDtaxUvDxQfVGw=;
 b=aXaRkxGuky9dWr7wLOcLG3Qv5yAzQFzMDrDz3na2GFUg6S/xavmkjXFJqfArXrLcWH
 PueATxn3udioZjtwGM2k6fW/eld76R+oIw4h+6Ml328uwRJ4zxbLOAcaeK+JqQ6+Vl1Y
 Rqd6eLGQS8qEmpMedyT08J8857ZAkkZiK/1PvniElRgTf2on9zZqkqg72QeyHX9ju8+k
 aw33VV8DIA3VVRZMmWLnlSBK/uGDsNhvolxkrdBHOjfoO99EWr+Hw/+sMugypBzSO/z5
 GuDWJ8TAZ+d750H/tWfY2jBehltm45ZpRBbNmKH/Qm9h5e3II1OaIX99sAOuLC3mJN17
 fTig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=kNSwwLUlb4TjazJWbInH85IZYRihokDtaxUvDxQfVGw=;
 b=bNzxydxr0Ecr+JZHSSEJwwONMEsjeZCoDy14p3WEimj/QzRrKU8+K53QeANa/ll7FQ
 eyEtNwgTwJFdqX3uNvYbVD2LCjAVtuw2xMyMvc78qfPtCt6Xtbex7EIAmwqOc5ICM2IO
 xeWErtv2WILiKXnEoh0/Eq1RcYyhCmyVZOsGydeMv1rF8isGY1Rctvg7Uzf1Rp4k1cf8
 qJlGWPAKi/sZwceC/GP2WSKfRQ4DsnvAYv+mzdecdNMAdZQSBRkO6G32KfTqdr41rcKy
 xPMlaNgZpVX0peVvuTyRyAlYVCNeZaZHfzkOypto8cUTE9FR/qlhThbml1+JFS3z9dgR
 xGjA==
X-Gm-Message-State: AJIora+SeYu28ZnxlGravlzqJvu22pcPb8wEZpTZsZj2KbEXQf5fFg4h
 +WhvBndvbetbGhsetPkJV6gdbyEWyAhcpV9i
X-Google-Smtp-Source: AGRyM1vPxNW2EsSrR6U2SwExhHijQjSt0W5gLuUTO511wlEJ0aKgFU+820TIvTgWz+ob+PA60zbQww==
X-Received: by 2002:a05:600c:4fc9:b0:3a0:4d54:b315 with SMTP id
 o9-20020a05600c4fc900b003a04d54b315mr217598wmq.62.1657664215496; 
 Tue, 12 Jul 2022 15:16:55 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 x4-20020adfdd84000000b0021d7f032022sm9258680wrl.17.2022.07.12.15.16.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 12 Jul 2022 15:16:55 -0700 (PDT)
To: qemu-devel@nongnu.org
Cc: Roman Bolshakov <r.bolshakov@yadro.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Cameron Esfahani <dirty@apple.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Delevoryas <peter@pjd.dev>
Subject: [PULL 5/5] avocado: Fix BUILD_DIR if it's equal to SOURCE_DIR
Date: Wed, 13 Jul 2022 00:16:07 +0200
Message-Id: <20220712221607.9933-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220712221607.9933-1-f4bug@amsat.org>
References: <20220712221607.9933-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

From: Peter Delevoryas <peter@pjd.dev>

I like to build QEMU from the root source directory [*], rather
than cd'ing into the build directory. This code may as well include
a search path for that, so that you can run avocado tests individually
without specifying "-p qemu_bin=build/qemu-system-arm" manually.

[*] See commit dedad02720 ("configure: add support for pseudo-"in source tree" builds")

Signed-off-by: Peter Delevoryas <peter@pjd.dev>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220702185604.46643-1-peter@pjd.dev>
[PMD: Mention commit dedad02720]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/avocado/avocado_qemu/__init__.py | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/tests/avocado/avocado_qemu/__init__.py b/tests/avocado/avocado_qemu/__init__.py
index b656a70c55..ed4853c805 100644
--- a/tests/avocado/avocado_qemu/__init__.py
+++ b/tests/avocado/avocado_qemu/__init__.py
@@ -120,14 +120,15 @@ def pick_default_qemu_bin(bin_prefix='qemu-system-', arch=None):
     # qemu binary path does not match arch for powerpc, handle it
     if 'ppc64le' in arch:
         arch = 'ppc64'
-    qemu_bin_relative_path = os.path.join(".", bin_prefix + arch)
-    if is_readable_executable_file(qemu_bin_relative_path):
-        return qemu_bin_relative_path
-
-    qemu_bin_from_bld_dir_path = os.path.join(BUILD_DIR,
-                                              qemu_bin_relative_path)
-    if is_readable_executable_file(qemu_bin_from_bld_dir_path):
-        return qemu_bin_from_bld_dir_path
+    qemu_bin_name = bin_prefix + arch
+    qemu_bin_paths = [
+        os.path.join(".", qemu_bin_name),
+        os.path.join(BUILD_DIR, qemu_bin_name),
+        os.path.join(BUILD_DIR, "build", qemu_bin_name),
+    ]
+    for path in qemu_bin_paths:
+        if is_readable_executable_file(path):
+            return path
     return None
 
 
-- 
2.36.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8C65BE7C1
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 15:56:30 +0200 (CEST)
Received: from localhost ([::1]:50488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oadjh-0007AF-BA
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 09:56:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oaaZf-0001V2-0T
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 06:33:55 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:44745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oaaZd-00053Y-ET
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 06:33:54 -0400
Received: by mail-pg1-x52d.google.com with SMTP id c7so2108063pgt.11
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 03:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=woEWPjt3NdjCcAder2sEnEPZ1q9JhhvK0Jn4vXhCEIE=;
 b=aSFVetRgNBBvuOwGXI+POb0ZmW2LdxmAvdUNtzugvSg3W7bJftbHsr0rEoL+rhcMXW
 JrcnF3kxSAR1OcVyzS7Vgab7ZosfoWRTn9GCfpZfo4igas7FsbHWdlhIYQKEJCaO1ADP
 dVowYJTMJdQc3znK1CVZoypXeM1R/sUlP4vlk7O5ExpPZLQcGQizVDorH6ULlhNILAU/
 zTl3OSBM1lCY/058o2645EMDvn4W/dD6tx9k6TzMk/NscHVg95sehkJHquByAR57Jafi
 yfnCNH1539LhzWuhoKDV4TVDoY9KDiSQl+KC4yoPlQgnEfcNvyS+6Y8Xh0/8IGx+QWbU
 7r+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=woEWPjt3NdjCcAder2sEnEPZ1q9JhhvK0Jn4vXhCEIE=;
 b=rjaF2g46ztK5ZR/z+bBkOu5bPqhnBW2Q6GSBcRo5H8au3t6SPOPKo+PPuXIxpD0s90
 yICe49z4YxBmbOEkA7euVbW98ffGNn80KPQRws0RRct7dZ7V3spUAZ/tmv1ycjaDeCWW
 dqnTKG7PTKJy0/vUaIsutO3Qr42qXkdWLeb4qxp5nR94eEnuiM0U6ITmL+mIdCOlwZPv
 5iRJrX2vo6nDiGhD7z42hNCGRYYk3R/jikKdLX+yvUBH9CW/KyY9og26a5szH4YYRNMN
 8DMNNqdrXMirxQ1bs88emvckCJnCTsCiW9uLzOpdWLTOI693d5F3E7ITTLlaZ1y5bvcE
 PZBQ==
X-Gm-Message-State: ACrzQf0hD17gExdkzb/KRe0oUmpwU0dOdQTvhx8jA6XCHHCCH9fVyXUO
 fMudvAknH6y6SAftM31jMlEQQUCEAQo=
X-Google-Smtp-Source: AMsMyM4fqYjR/Xnxl8yVkmnxEbEn2f0obEYjGOoNhWmDce+zyqjzTGCI/8GyTipunovGO+ZMtpsb3A==
X-Received: by 2002:a63:8149:0:b0:439:f66e:23c0 with SMTP id
 t70-20020a638149000000b00439f66e23c0mr10969579pgd.11.1663670031891; 
 Tue, 20 Sep 2022 03:33:51 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 n2-20020aa79842000000b00551fa0e2b2dsm699573pfq.206.2022.09.20.03.33.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 03:33:51 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH v2 37/39] .gitlab-ci.d/windows.yml: Display meson test logs
Date: Tue, 20 Sep 2022 18:31:57 +0800
Message-Id: <20220920103159.1865256-38-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920103159.1865256-1-bmeng.cn@gmail.com>
References: <20220920103159.1865256-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

From: Bin Meng <bin.meng@windriver.com>

When CI fails we don't know what causes the failure. Displaying the
meson test logs can be helpful.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

Changes in v2:
- new patch: Display meson test logs in the Windows CI

 .gitlab-ci.d/windows.yml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.d/windows.yml b/.gitlab-ci.d/windows.yml
index 818676662a..dcd553a081 100644
--- a/.gitlab-ci.d/windows.yml
+++ b/.gitlab-ci.d/windows.yml
@@ -62,7 +62,7 @@ msys2-64bit:
       --enable-capstone'
   - .\msys64\usr\bin\bash -lc "sed -i '/^ROMS=/d' build/config-host.mak"
   - .\msys64\usr\bin\bash -lc 'make'
-  - .\msys64\usr\bin\bash -lc 'make check'
+  - .\msys64\usr\bin\bash -lc 'make check || { cat build/meson-logs/testlog.txt; exit 1; } ;'
 
 msys2-32bit:
   extends: .shared_msys2_builder
@@ -95,4 +95,4 @@ msys2-32bit:
   - cd output
   - ..\msys64\usr\bin\bash -lc "../configure --target-list=ppc64-softmmu"
   - ..\msys64\usr\bin\bash -lc 'make'
-  - ..\msys64\usr\bin\bash -lc 'make check'
+  - ..\msys64\usr\bin\bash -lc 'make check || { cat meson-logs/testlog.txt; exit 1; } ;'
-- 
2.34.1



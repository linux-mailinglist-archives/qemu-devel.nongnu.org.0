Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 714A55F6B83
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 18:23:13 +0200 (CEST)
Received: from localhost ([::1]:49630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogTeQ-0004TB-Rw
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 12:23:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ogSfn-0004aj-Ag
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:20:36 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:38692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ogSfj-0006Fy-H1
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:20:30 -0400
Received: by mail-pf1-x42a.google.com with SMTP id w191so2339807pfc.5
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 08:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NCD0OoweK2TuN+Pq4vH+vNDBt5GFzsQ5yHOp5dnrTlM=;
 b=QhvallwTJPbdxeFpM8wYgY0YdRkfi7EhU2bc9layvuheF2AAEzdP1xtXSoLSX1Pf4i
 bUvylpqdRpv0RhjYocIdn9KSCkFG2nsHXSuEbfXCQYTO185bmQiJhX2EVVdsuwo4wBTK
 wQSDBNeJ9xBY7QCGN2HrU/KDghDMOZ/eM0AKRR7Zo6a9QM0dJwIEUa6WL5BnbVOQtPO7
 +GgyjPJ9rwEJ5DZu2uuFSikJNUvKL4Otjoa2EvG/LVPXR3lIQ3yh53pPGrMTliud9B1w
 S95fU1hn+234XNbALYD7IlDzBansnOQ6EFoX8/wZFt3dX9RJ10fHGo5QdGHp7qyweWFE
 W8Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NCD0OoweK2TuN+Pq4vH+vNDBt5GFzsQ5yHOp5dnrTlM=;
 b=T9oDP0wj6sNb0LYiSm63vqGWRalcb+XC9Vx+oGTEKsCddvd1odHGIX65km9bEAJs3C
 sWmiwyp3R9aXxWplCx76b0+Cv1hNd5ZiqY0OzqwXEAcXGF7q/zjq5mgxVNP68VeR000+
 mfKdr+lLhLtH6eRt3FNo+wm/wZAyxvzfw3wFRAODZSjTwVu44egxOsZAuQvE19EadX8m
 PxWkosUR+Tk3pASLdfsgX7aBJcG6rbHVHxLrpKsLILtNFmzNk5bLH/YNK1lEV6dPC72D
 kyASiIdJb8CiyAaYySrwvOu7KKszHt6re0q01CkKMKyI6mvACG4tDN4qTtbIVV2t968B
 K/9Q==
X-Gm-Message-State: ACrzQf1L1IQtFRKssCO3ZF4NyCWdbkPNhoqGvNUL8DGiVqqZeJT42U6t
 FODHx9x4nNBBesWTn+ExSUmg14gFOBM=
X-Google-Smtp-Source: AMsMyM4ivDF41zgBTAGSnrcRRmksfF5o42/cSns1/6wjOzy/OYrDD7dgqtZY2zuoUf0Cmke75Uc/Bg==
X-Received: by 2002:a05:6a00:1c5d:b0:562:7125:ff10 with SMTP id
 s29-20020a056a001c5d00b005627125ff10mr426894pfw.60.1665069620856; 
 Thu, 06 Oct 2022 08:20:20 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 p13-20020a170902780d00b0017c37a5a2fdsm11426759pll.216.2022.10.06.08.20.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Oct 2022 08:20:20 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH v5 17/18] .gitlab-ci.d/windows.yml: Increase the timeout to 90
 minutes
Date: Thu,  6 Oct 2022 23:19:26 +0800
Message-Id: <20221006151927.2079583-18-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006151927.2079583-1-bmeng.cn@gmail.com>
References: <20221006151927.2079583-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x42a.google.com
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

commit 9f8e6cad65a6 ("gitlab-ci: Speed up the msys2-64bit job by using --without-default-devices"
changed to compile QEMU with the --without-default-devices switch for
the msys2-64bit job, due to the build could not complete within the
project timeout (1h), and also mentioned that a bigger timeout was
getting ignored on the shared Gitlab-CI Windows runners.

However as of today it seems the shared Gitlab-CI Windows runners does
honor the job timeout, and the runner has the timeout limit of 2h, so
let's increase the timeout to 90 minutes and drop the configure switch
"--without-default-devices" to get a larger build coverage.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

(no changes since v2)

Changes in v2:
- Change the timeout limit to 90 minutes

 .gitlab-ci.d/windows.yml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.d/windows.yml b/.gitlab-ci.d/windows.yml
index a3e7a37022..093276ddbc 100644
--- a/.gitlab-ci.d/windows.yml
+++ b/.gitlab-ci.d/windows.yml
@@ -10,7 +10,7 @@
       - ${CI_PROJECT_DIR}/msys64/var/cache
   needs: []
   stage: build
-  timeout: 70m
+  timeout: 90m
   before_script:
   - If ( !(Test-Path -Path msys64\var\cache ) ) {
       mkdir msys64\var\cache
@@ -60,7 +60,7 @@ msys2-64bit:
   - $env:MSYSTEM = 'MINGW64'     # Start a 64 bit Mingw environment
   - $env:MSYS = 'winsymlinks:native' # Enable native Windows symlink
   - .\msys64\usr\bin\bash -lc './configure --target-list=x86_64-softmmu
-      --enable-capstone --without-default-devices'
+      --enable-capstone'
   - .\msys64\usr\bin\bash -lc 'make'
   - .\msys64\usr\bin\bash -lc 'make check || { cat build/meson-logs/testlog.txt; exit 1; } ;'
 
-- 
2.34.1



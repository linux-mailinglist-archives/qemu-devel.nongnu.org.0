Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1595F6B0E
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 17:53:51 +0200 (CEST)
Received: from localhost ([::1]:47940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogTC2-0002qi-2s
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 11:53:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ogSY7-0003iv-06
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:12:35 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:52765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ogSY5-0004dc-DG
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:12:34 -0400
Received: by mail-pj1-x1034.google.com with SMTP id pq16so2014083pjb.2
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 08:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NCD0OoweK2TuN+Pq4vH+vNDBt5GFzsQ5yHOp5dnrTlM=;
 b=F5X/2N/rWtMDYx/WvEnIuaPQo+YKXUC89n58/WZ3vFWn43ebFcXAuMvjxFQbdFJF7e
 WFicPCJIMeEJwc63+ONlOjCj/dCo5V6Mcte5b0wu/KxEn4+ch+imj5N+0IMmczF3iOIk
 tlgxjDFpBo4Uh7S0LRO1iD4etLK0B0tHOwoybOzlFq/NrWNjKA4zT1ybHCuoDSXwBQkW
 jJiWWdh1jMi0ulmajBeSOHSTKOINUJBqxFJS6JitoF7Y0Ui5P9aVbsJxdOVk2pQLNYMK
 qri5+GgxVTpUa3W0pBpcNoBgi7gimEZICILyqPxzW4kRiHNiiG637DIazJQHt5KMriEp
 BTmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NCD0OoweK2TuN+Pq4vH+vNDBt5GFzsQ5yHOp5dnrTlM=;
 b=ImjxB/DJuJ24anaJhRSHaHdPpduUSnc6kFGcETaxig0PQt2htUktwob9SwSd6T11t/
 PyuGGVD83ATntVCcVVbSzsJwQr/LeY29Zd7uGv34lPf33wVV/pBVvYy5oPNLqgZnG13L
 ZkrEiwd41yidCsDJJ2EFUqKzoXfCxzKgYDup5Me87lXM8OmJ5v2yD6VOFGDa4JWXwIgx
 p4OO63kyFoXX48CUHMBPfNK/QEfZmogxE+Sa95NT7GErcQt6dbveljELKvSP/gjCIWRG
 Ej7OQWKehcIFFc/tMHYjOGyMT59eAoUE1W9kEebzo8GCpCIe1w3uHqUuDrC95J1XGoUG
 QgYg==
X-Gm-Message-State: ACrzQf1NsveFfFJKfRfbYJ7uNBtkJ2ousHTbJafnLhToYwdCBbxmR2bO
 Rh7X2luwkVLfkC8vQiD2IjiAqGWxa1U=
X-Google-Smtp-Source: AMsMyM63ycZXVFnhinYaES9biplx1D/d2pwLAMMvDjiz7NTkcFdwowBgDH8f0JtqWLpF6VW33Naa3g==
X-Received: by 2002:a17:903:18b:b0:178:1c0d:da22 with SMTP id
 z11-20020a170903018b00b001781c0dda22mr359154plg.95.1665069151742; 
 Thu, 06 Oct 2022 08:12:31 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 135-20020a62148d000000b00540c8ed61ddsm8589067pfu.150.2022.10.06.08.12.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Oct 2022 08:12:31 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH 17/18] .gitlab-ci.d/windows.yml: Increase the timeout to 90
 minutes
Date: Thu,  6 Oct 2022 23:11:34 +0800
Message-Id: <20221006151135.2078908-18-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006151135.2078908-1-bmeng.cn@gmail.com>
References: <20221006151135.2078908-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1034.google.com
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



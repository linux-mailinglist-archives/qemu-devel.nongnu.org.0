Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 208955A2DE1
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 19:55:22 +0200 (CEST)
Received: from localhost ([::1]:40222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRdY8-0006NE-Tf
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 13:55:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oRdA0-0005ly-DY
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 13:30:24 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:45895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oRd9y-0003jS-FD
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 13:30:23 -0400
Received: by mail-wr1-x431.google.com with SMTP id bq11so2561349wrb.12
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 10:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=81KWm6R8reWnolxwgShAzd/pY+X/lVp3ITe+/MIOxe8=;
 b=kO79HHOohGOgnoMfAF1BGoDQO2ftnAmnIa4qsr69+cuu4ZqGoQQEJBk25QFNv7EPLT
 yM10EQsFzge7GbTdgu46uJTAnOWiX7l+Uj1ikJQD1Kc3xfdonw/Oluxa4Tn8EMSsJyc6
 giVTifG/mpCpDo3pQETDAo2qTp9/tFa2SgzsmwcxrToiDvT0s/vuoQRIxsiKNKSALwFh
 wcxl6yD+ZdABaQGOv9q6NYcHvdOVOEV6Q7bV3lj2p1BH8mP+iQM2ejVInYnek3Cy2YSj
 WTWu+IvyT2vPyavu33qkolcjBVOrEynwIldFvVEPQiAKcRmOqP+zx4iUAH1eCtGODU7B
 odgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=81KWm6R8reWnolxwgShAzd/pY+X/lVp3ITe+/MIOxe8=;
 b=TdsrU60PUrGAUigyWzLNEmL8d9UDwlyhbd6kMhd6dUsEkyu2e7TRSXBPAfSn5HRDd4
 hJyMXz4UMqi4owFP2+qKaLv0vdrLBDGma627Bcw2BL+6p98ZDH2gY4MpE6uvSsM8Sj6+
 TvvzszVFaw+D+HOHcU9In+aa0tWtXHLvFkrF5z8eDFz6KG4pEI+xRb5clEz2/WjkHm0w
 EIYPXfA70+vkDislBhBp2gFjNpfFFrgVW3VML6C5ehvUmf7T9NZHG4EqdXKVVZeSsxnG
 ZYx/rf3U1SunAiE8Fcif+CYxtk/g3NQCVMheEWIwOMRFRXtrt8JX3S7r2fU6d/eooZ9n
 1cFQ==
X-Gm-Message-State: ACgBeo2JpFU4F60wyao8q77AUhZtKjAT/yjSqNRvShqzyemTKtrbXb/S
 JNVSElM1baLXQS8oqGx58Ligtw==
X-Google-Smtp-Source: AA6agR6lEBEWs2bKBFv6Ioa4bhypS/BS9qI3yibFk2Rx5VWuDaaQZ356VaVqR5HkyP7UIM1vErbKIQ==
X-Received: by 2002:a05:6000:1c5:b0:225:4b87:6556 with SMTP id
 t5-20020a05600001c500b002254b876556mr397465wrx.79.1661535020642; 
 Fri, 26 Aug 2022 10:30:20 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 d18-20020a05600c34d200b003a5c75bd36fsm270493wmq.10.2022.08.26.10.30.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 10:30:18 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EE8E11FFCF;
 Fri, 26 Aug 2022 18:21:30 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 Thomas Huth <thuth@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH v1 25/25] gitlab-ci: Only use one process in Windows jobs for
 compilation
Date: Fri, 26 Aug 2022 18:21:28 +0100
Message-Id: <20220826172128.353798-26-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220826172128.353798-1-alex.bennee@linaro.org>
References: <20220826172128.353798-1-alex.bennee@linaro.org>
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

From: Thomas Huth <thuth@redhat.com>

The Windows jobs are currently aborting at weird places - and
there's the suspicion that it's due to memory constraints in
the Windows containers. Let's switch to single-threaded compilation
to decrease the pressure on the memory load, and to make the
jobs more deterministic for further investigations.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-Id: <20220825193323.104768-1-thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/windows.yml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.d/windows.yml b/.gitlab-ci.d/windows.yml
index c4bde758be..da6013904a 100644
--- a/.gitlab-ci.d/windows.yml
+++ b/.gitlab-ci.d/windows.yml
@@ -61,7 +61,7 @@ msys2-64bit:
   - .\msys64\usr\bin\bash -lc './configure --target-list=x86_64-softmmu
       --enable-capstone --without-default-devices'
   - .\msys64\usr\bin\bash -lc "sed -i '/^ROMS=/d' build/config-host.mak"
-  - .\msys64\usr\bin\bash -lc 'make -j2'
+  - .\msys64\usr\bin\bash -lc 'make'
   - .\msys64\usr\bin\bash -lc 'make check'
 
 msys2-32bit:
@@ -94,5 +94,5 @@ msys2-32bit:
   - mkdir output
   - cd output
   - ..\msys64\usr\bin\bash -lc "../configure --target-list=ppc64-softmmu"
-  - ..\msys64\usr\bin\bash -lc 'make -j2'
+  - ..\msys64\usr\bin\bash -lc 'make'
   - ..\msys64\usr\bin\bash -lc 'make check'
-- 
2.30.2



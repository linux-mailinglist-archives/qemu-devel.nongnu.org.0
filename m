Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B27A5EC369
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 14:59:57 +0200 (CEST)
Received: from localhost ([::1]:40282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odABo-0004fr-2O
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 08:59:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8SV-0004Cy-Tn
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:09:03 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:41737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8ST-0005PS-71
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:09:03 -0400
Received: by mail-pl1-x635.google.com with SMTP id d11so8754122pll.8
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 04:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=c70GbRwkwSt6AlB5iSFrSG+pSWFEYKzAbLVBITPzdys=;
 b=K9TzEwlnOqhNSSnMfE+GQk6p64bBvdGp1nxGB+fx8DY6ZgmEeHVGqhx5cerosXdHwm
 kG0LM8t+FSW/xdNIHC5jV5RlfMbogIPWtZ4iowc91FVPN4kXnaAnHWi6h91++WPcElPp
 mccYdNGq8X5qeDWBDuKHF04PLwUTAdQ7vRJYVLjXGKcP3SfbiK18ZoVsnrSo756+lT32
 lKDI+4D9rBzwLrV8TCSd26yCKevY9aqgO8eO78R23BtIbX8jKHvc131to6KSuzP1vkbC
 qvJkCB/38trfLaqlYqrmM+NY5XK1NhG2E12bTvZeiMiuvgTPIFgjZIwQ6lW+KCLIy2lM
 97Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=c70GbRwkwSt6AlB5iSFrSG+pSWFEYKzAbLVBITPzdys=;
 b=xnsZOtqhtEwyNrZduj4Wu69U3dhnEQBriT9NFJ1v6t1yxkXmGZutrp13Xsp45W+lPw
 Uyxbm7acr7+Y9+V2HA34Wdau5PlURxcXuennvsQqx3VYkYO0iUeIur+Z8UIUUFzdJEwy
 ZrcJbuJZk8uGOiNHjNqWXSXKPLGaNSYIxitAgmkyKA8Q/ZVxENZwenEZhS5vCWNYdg2l
 ARgdAuoY9SLPzXuaWVL6cN4DmzDpjQeCVRYeh5UaoV3CU+GIdz22Bm1lSmBHwiOaHQN5
 16mHF16+1kNNNYGn00Tl5mNnFpqeWWcCeq5JDYmqCnp2QbPjmrrc5I3WazmXm96qW9JC
 EPAw==
X-Gm-Message-State: ACrzQf3Y3YjTY9mtNiWGt3dfDgPUXc5+fGrHLTCMcygVDAcLtq6j2wHt
 WXO7cVjZPpcdmF2Mm/JWICcmdca62QM=
X-Google-Smtp-Source: AMsMyM5rbECm4iWfp+RQudavKnz0+Du7te7XBYyjOfNhYx/8fdsMe+zLJnI2Oj1dUFCRk9eI3EJ9QA==
X-Received: by 2002:a17:902:f807:b0:178:516c:128f with SMTP id
 ix7-20020a170902f80700b00178516c128fmr26203972plb.77.1664276939854; 
 Tue, 27 Sep 2022 04:08:59 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a626d07000000b00540f2323f67sm1453601pfc.95.2022.09.27.04.08.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 04:08:59 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH v4 52/54] .gitlab-ci.d/windows.yml: Display meson test logs
Date: Tue, 27 Sep 2022 19:06:30 +0800
Message-Id: <20220927110632.1973965-53-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927110632.1973965-1-bmeng.cn@gmail.com>
References: <20220927110632.1973965-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x635.google.com
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
Reviewed-by: Thomas Huth <thuth@redhat.com>
---

(no changes since v2)

Changes in v2:
- new patch: Display meson test logs in the Windows CI

 .gitlab-ci.d/windows.yml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.d/windows.yml b/.gitlab-ci.d/windows.yml
index 9ef4667317..29a3ba04a4 100644
--- a/.gitlab-ci.d/windows.yml
+++ b/.gitlab-ci.d/windows.yml
@@ -61,7 +61,7 @@ msys2-64bit:
   - .\msys64\usr\bin\bash -lc './configure --target-list=x86_64-softmmu
       --enable-capstone'
   - .\msys64\usr\bin\bash -lc 'make'
-  - .\msys64\usr\bin\bash -lc 'make check'
+  - .\msys64\usr\bin\bash -lc 'make check || { cat build/meson-logs/testlog.txt; exit 1; } ;'
 
 msys2-32bit:
   extends: .shared_msys2_builder
@@ -94,4 +94,4 @@ msys2-32bit:
   - cd output
   - ..\msys64\usr\bin\bash -lc "../configure --target-list=ppc64-softmmu"
   - ..\msys64\usr\bin\bash -lc 'make'
-  - ..\msys64\usr\bin\bash -lc 'make check'
+  - ..\msys64\usr\bin\bash -lc 'make check || { cat meson-logs/testlog.txt; exit 1; } ;'
-- 
2.34.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3E06E4A44
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 15:45:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poP91-0000ze-QS; Mon, 17 Apr 2023 09:43:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1poP8n-0000vc-C8
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 09:43:33 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1poP8k-0006Op-Ut
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 09:43:33 -0400
Received: by mail-wm1-x32d.google.com with SMTP id he13so18813141wmb.2
 for <qemu-devel@nongnu.org>; Mon, 17 Apr 2023 06:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681739009; x=1684331009;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=otnCERiARxYXOemsNhRIhm75Bahsw6pevrZV+yYHYSs=;
 b=LzGI0enM85/50xwBBE4jBZXIEIb625jFkVeWZNJ8hhEzAP2aDGZXKWxxoFZ8SPE/Dq
 9/xwT1opGijyb9JR7JPvJzF+QHjeHw5SrlIWY701OHXBK4ZeDjna18TlVeSytaP14PBs
 tYH6LTAqJpdazA6ZLkBn42HMi2qTHaRMS5XIwyK+QychY4EQnr7jpkL5NJvy8Tg9J1Lh
 fm5rqRY1GHcxQNOOpu/SEFCfIXGIeWtFlLfdVZ/69V+I2cete3+AKl4fZL0PtiWjoxNX
 ec9da1LiSx65KMb78mNPuEUvhoaif7pSzg6J21ff+QT1c4DgYkI3UmWTgnKWLipPsEKI
 aQsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681739009; x=1684331009;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=otnCERiARxYXOemsNhRIhm75Bahsw6pevrZV+yYHYSs=;
 b=CHCFiOZLkHdU3jfjMHUBn2Wuhg/GAZAOZSDJPBsmKuzPpkSSMfKlMIHCb3//BtUBwz
 cYwKUJqfFC40+B/PwsddEUgAYNIKfNnSRRfqr+9OwnmcfKfibyicqo+Oh9YaPgeJ/367
 TqzYRMqkgIQa8CMP07tgp0GSJQJXGKq13oTljqgYWhbnah7sYJzR9JT516u2sxYsbRmg
 RdrVOcwCf8MY3FSMddXQMnq6/wbXGMrvD/8o4CqyAYLIDl3BHJeU+/wVpnIUbxmmc4QQ
 k7xYCF1L63TY3c8KfmzMYz3/H8GoJ7JazcTlmwCae8ZTBHoyH6fhXJ/91bwpKZeSI63m
 +c8Q==
X-Gm-Message-State: AAQBX9cekZzUugO14mCBSfClMtGpoCwUjbCRt13KV9Z61tnlCHiA4yuB
 EmS/IYMf1LmLjg60bEqGAa61Bw==
X-Google-Smtp-Source: AKy350b1NZ5nEDi6zODvs2MhJJy9fFM2H08Gvmf20aTTqCaN298Vh3+1cXxqSShlr/TYeMzmiiHlaQ==
X-Received: by 2002:a1c:4b04:0:b0:3ed:4b0f:5378 with SMTP id
 y4-20020a1c4b04000000b003ed4b0f5378mr10614313wma.27.1681739009314; 
 Mon, 17 Apr 2023 06:43:29 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 8-20020a05600c228800b003edef091b17sm11997056wmf.37.2023.04.17.06.43.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 06:43:26 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 421431FFBC;
 Mon, 17 Apr 2023 14:43:22 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Markus Armbruster <armbru@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Radoslaw Biernacki <rad@semihalf.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org
Subject: [PATCH v4 4/6] gitlab-ci: Avoid to re-run "configure" in the
 device-crash-test jobs
Date: Mon, 17 Apr 2023 14:43:19 +0100
Message-Id: <20230417134321.3627231-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230417134321.3627231-1-alex.bennee@linaro.org>
References: <20230417134321.3627231-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Thomas Huth <thuth@redhat.com>

After "make check-venv" had been added to these jobs, they started
to re-run "configure" each time since our logic in the makefile
thinks that some files are out of date here. Avoid it with the same
trick that we are using in buildtest-template.yml already by disabling
the up-to-date check via NINJA=":".

Fixes: 1d8cf47e5b ("tests: run 'device-crash-test' from tests/venv")
Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20230414145845.456145-2-thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/buildtest.yml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index ba6f551752..333eea9dd3 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -102,7 +102,7 @@ crash-test-debian:
     IMAGE: debian-amd64
   script:
     - cd build
-    - make check-venv
+    - make NINJA=":" check-venv
     - tests/venv/bin/python3 scripts/device-crash-test -q ./qemu-system-i386
 
 build-system-fedora:
@@ -145,7 +145,7 @@ crash-test-fedora:
     IMAGE: fedora
   script:
     - cd build
-    - make check-venv
+    - make NINJA=":" check-venv
     - tests/venv/bin/python3 scripts/device-crash-test -q ./qemu-system-ppc
     - tests/venv/bin/python3 scripts/device-crash-test -q ./qemu-system-riscv32
 
-- 
2.39.2



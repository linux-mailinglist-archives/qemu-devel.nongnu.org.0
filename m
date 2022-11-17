Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFAD62E301
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 18:28:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovieE-0006PN-45; Thu, 17 Nov 2022 12:25:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ovie2-0006KT-AW
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 12:25:47 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ovidw-0006ES-BO
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 12:25:42 -0500
Received: by mail-wr1-x433.google.com with SMTP id y16so4938807wrt.12
 for <qemu-devel@nongnu.org>; Thu, 17 Nov 2022 09:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r0gPi4afo9I5YmqQbfJD2lj3D8+SZO0B+Jf+mMaPF0M=;
 b=IK6HqqXH4W+Z+SESWgOgyKL4VJlhgoQrJwo1tlKBWpaN2FEmg0KcJdykUePY5uHv9I
 OA3TYA6zBCqHs6rBgQ4V963SQJJVG3U0reoSiz/d4AH2esKqR8Yjtn3DN1syUsdD8Rzu
 zOOTSRyBYtJV0fySCj0n3f2DlVGpHTvL2vc0sor1ChIOfmv2sAnx/izSh/ASrDaSYrOX
 j5wxLuTG9gu85yIkHuCtF1a8rb7DVdIm/7z3A6qPcGj4wqAWr5HsHHDPHd0H8qRf9y4d
 xjztEJCPj+k/2OJw/yccEawdrwXFyceDKCQVvnVB/OfPBh0lWUlrfi/rhZskms3f1S2h
 8h1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r0gPi4afo9I5YmqQbfJD2lj3D8+SZO0B+Jf+mMaPF0M=;
 b=5EWVnLNKohc0DbivcGD06rw+jcR4MU8FaFUOqshLQmYfZvK2s7G4N+2ckYEqAThoRR
 AyTZTbsWNaARBAx6yJ4dHM780FWvbH2mRr3WJ1XM8pGTZ4mp7U7L07LzZnPuM7cMu3G0
 IW8CZGPe7/GaAMfRnPKACA9drS1pd26OdDQDTHxkAnvZ1HtRUGwXw6D6Sz3rbJbZneu5
 bHTZKBThZwQpLL2OaiHowQlmIVL/66JuWLwdR3KsF8zTieNb9mOPUSxucSHLSnnnbOEy
 07dbBkLWBGej880UyZjj2PX9OYhA6VfKDJmbbSIajXfLDyWlWW59xnpRi8DHB3+F/6d+
 Q1dA==
X-Gm-Message-State: ANoB5plCC7fdRGR7ohadw2XRYeV9oFDBZiiIEjgXROoflDSGuC2W/ckH
 punovaeMGGCAD/z+Mgh/+vMJIYgojDtBxQ==
X-Google-Smtp-Source: AA0mqf6bv0wd6xECNqc/BhQ9d30g2soJqQODk5MAgSDN44MUCAbAhvEhgytpcpptIzK8EUYI82zx8g==
X-Received: by 2002:adf:f601:0:b0:236:55a7:348f with SMTP id
 t1-20020adff601000000b0023655a7348fmr2164163wrp.331.1668705938658; 
 Thu, 17 Nov 2022 09:25:38 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 c15-20020a05600c0acf00b003c21ba7d7d6sm1825646wmr.44.2022.11.17.09.25.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Nov 2022 09:25:35 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9CAF81FFC0;
 Thu, 17 Nov 2022 17:25:33 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH v3 08/13] tests/avocado: Raise timeout for
 boot_linux.py:BootLinuxPPC64.test_pseries_tcg
Date: Thu, 17 Nov 2022 17:25:27 +0000
Message-Id: <20221117172532.538149-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221117172532.538149-1-alex.bennee@linaro.org>
References: <20221117172532.538149-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Peter Maydell <peter.maydell@linaro.org>

On my machine, a debug build of QEMU takes about 260 seconds to
complete this test, so with the current timeout value of 180 seconds
it always times out.  Double the timeout value to 360 so the test
definitely has enough time to complete.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20221110142901.3832318-1-peter.maydell@linaro.org>
Message-Id: <20221111145529.4020801-11-alex.bennee@linaro.org>
---
 tests/avocado/boot_linux.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/avocado/boot_linux.py b/tests/avocado/boot_linux.py
index 571d33882a..2be4be395d 100644
--- a/tests/avocado/boot_linux.py
+++ b/tests/avocado/boot_linux.py
@@ -116,7 +116,7 @@ class BootLinuxPPC64(LinuxTest):
     :avocado: tags=arch:ppc64
     """
 
-    timeout = 180
+    timeout = 360
 
     def test_pseries_tcg(self):
         """
-- 
2.34.1



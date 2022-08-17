Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC635967CF
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 05:48:30 +0200 (CEST)
Received: from localhost ([::1]:59974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOA2e-0000hq-RB
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 23:48:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oOA0r-0007Tm-QK
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 23:46:37 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:34527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oOA0q-0004cx-Fq
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 23:46:37 -0400
Received: by mail-pl1-x62d.google.com with SMTP id jl18so3134782plb.1
 for <qemu-devel@nongnu.org>; Tue, 16 Aug 2022 20:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc;
 bh=5KH5ENR4GO9wJim3hexgohlAHU9xPAyMtlfPJbvK6G4=;
 b=KOVE4r8ntiBCWNnWfN+8xvMjrYDEgrcMIeUgZzEJ63S/rfb7fIjlcggzW87aNMP8dS
 uX9hhkGegDqDYLDpLHhbu8RP650Gb8cr0DMQ8HcJ64U/5M6r0/2AFiUDFCy9V/bZ06bp
 +JuM615gyOisjYPo5GkK6TGqP47H/jPyKfnfmfK9xiye8T3FmKV5NXr9U1+4cwk1/iy8
 TZJjOKZN9sHBRe2DpTNfgL4sB3afw7wpJKkvQwijrbHk94ircnvMLs/ng/iL53PqjUE0
 TYgK7Rf7ycxptUFREFdAG+4/tRmbYTsGGtRKYTp1YDgi48vOVLeZu1NnV/jEG2fch40W
 FQNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc;
 bh=5KH5ENR4GO9wJim3hexgohlAHU9xPAyMtlfPJbvK6G4=;
 b=V30qUgzl01sVMzBmxaT2O92fAJdf3mq6nLjO1TvG8vCzUbKYd2atH0/F1zBhBfpyui
 aeVSkLy0S4pygD1UjigrVMUEvA8IVJansuvZgMIqK4Z2gyZ6a5mZPsOfdzkYBzU1vvpx
 Mwy3WmwLaMh1trd2k9B6TpPIIWkySOQ3xRVMWZDO6y46RBZ0wbUHBPQ639WgYYBFc7Bv
 b20Htq6/7tWXpzS6x3M6cNJiv5Pg1i9LerbFb1c4rT2xY26j00h0EAZgO26XzQPfC7Vu
 FYt7MxrhKPtrAohgTNA5aAcsmVpnuzomlBqcJ+DJUO8fSILSgVujBsRSjlORXrH3DiiL
 fVlg==
X-Gm-Message-State: ACgBeo1+tRwj9ye+JNePUTmgGeuDUxdyltI7KjoRIAVkD9uFBe8DMxMl
 Tg0KvEQoWIaXVB/B4VGeZ3Q=
X-Google-Smtp-Source: AA6agR60p9duNQ4efQX7FCH02E2ZeuQnHjcIUqCt8gasVJaZaEnbKzkTqdGVEpdtWYaUtPZWacRzkQ==
X-Received: by 2002:a17:903:41c1:b0:16f:68c:28 with SMTP id
 u1-20020a17090341c100b0016f068c0028mr24544282ple.74.1660707994731; 
 Tue, 16 Aug 2022 20:46:34 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 b10-20020a170902650a00b0016e8178aa9csm170430plk.210.2022.08.16.20.46.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 20:46:34 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org
Subject: [PATCH] .gitlab-ci.d/buildtest.yml: Increase the check-gprof-gcov job
 timeout
Date: Wed, 17 Aug 2022 11:46:30 +0800
Message-Id: <20220817034630.1600434-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Current project timeout is 1 hour, but the check-gprof-gcov job never
completes within 1 hour. Increase the job timeout to 90 minutes.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 .gitlab-ci.d/buildtest.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index 1931b77b49..52d45508fb 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -495,6 +495,7 @@ check-gprof-gcov:
   variables:
     IMAGE: ubuntu2004
     MAKE_CHECK_ARGS: check
+  timeout: 90m
   after_script:
     - ${CI_PROJECT_DIR}/scripts/ci/coverage-summary.sh
 
-- 
2.34.1



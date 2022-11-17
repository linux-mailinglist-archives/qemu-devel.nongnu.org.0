Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A6162E2FF
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 18:27:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovieG-0006Qx-Eb; Thu, 17 Nov 2022 12:26:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ovie8-0006NR-G5
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 12:25:56 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ovie2-0006FG-BT
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 12:25:51 -0500
Received: by mail-wr1-x431.google.com with SMTP id a14so5004532wru.5
 for <qemu-devel@nongnu.org>; Thu, 17 Nov 2022 09:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZN0cS2zXnFlCnu9gVWFbK/ag61x7K3nHdyQ6BLwUiic=;
 b=u/Z5GGL2M0gCN1Ty+kJ7A9PiLKiQBLd7VCIuLi3xWkHW00rSLCwQ7qeLW9rOM4xgm1
 AsAsdvNRFGGEdKJoC16KyUS4zqpMRhhnSMjnFGZEmCpatDALgFL9U/9iwwvGFJNZGEeH
 xCDdWW23Cf9CbMKCQZyJy/K0LlMcs4wYh+41X57UttzpTwjwpRilqj6ofMbYAvHawXJo
 f2sp1sIxCCwPW2XfhmMiPkmzfG4sp6JBOL8XtRHWU0v9u31BvDo5Po4LCdnr8yE5mHcX
 TdOoRavG/Tg48FlrIeyuB5UwKPk4kly4Gk5obyozV/5J024xCuqSFKB/qLM9OGi5lq1K
 IWsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZN0cS2zXnFlCnu9gVWFbK/ag61x7K3nHdyQ6BLwUiic=;
 b=ZFy/Kc1W8W89mQ6l04FotgSnYyQvtT6IolDloSGKmHv5Ka952/uGpQcfjXEGLFyv1u
 G3cTgg4aWYiryVW2mW+TPJis4IxEg7p9i2HDmXp5afdY5IGftW2369H2Q2mW3XLfpyT5
 +GQk8qW53Du6UlSLRNYcjLk3ZJd0a5T8mnbJUR6qu24WoFNG9NEwH85nONuoAjvhDwaA
 3MGx+pGAE2YWejR+0qV98zenrb3AofNOMXJ0RAehL/REeiu/fr1iVuFW5v4Juwn/7mMV
 Atnyg8rPzJIioW0zff60YUDRxhTZOiwTH0a66RhSs607BXg0+WQDxEtomud7xwEftdMW
 P9sw==
X-Gm-Message-State: ANoB5pkrpgDopgHxfKE0KoO1nElxDTNANsrjoailWF0FMy6ntlrQa0Qb
 nl6DXkiAv/WT5UhwyABJ+jf+iA==
X-Google-Smtp-Source: AA0mqf5crmOkYbyf6eFslq2sHko3ooKWVGh+eB+j3ugyiYl+CcSEDp3Ms+bX7swbSwCp7ZUkOwbSHw==
X-Received: by 2002:a05:6000:1d94:b0:238:3d85:8e2c with SMTP id
 bk20-20020a0560001d9400b002383d858e2cmr2144693wrb.650.1668705941117; 
 Thu, 17 Nov 2022 09:25:41 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 c3-20020adffb43000000b00225307f43fbsm1443818wrs.44.2022.11.17.09.25.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Nov 2022 09:25:38 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 089651FFC3;
 Thu, 17 Nov 2022 17:25:34 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH v3 12/13] tests/avocado/boot_linux.py: Bump aarch64 virt test
 timeout to 720s
Date: Thu, 17 Nov 2022 17:25:31 +0000
Message-Id: <20221117172532.538149-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221117172532.538149-1-alex.bennee@linaro.org>
References: <20221117172532.538149-1-alex.bennee@linaro.org>
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

The two tests
tests/avocado/boot_linux.py:BootLinuxAarch64.test_virt_tcg_gicv2
tests/avocado/boot_linux.py:BootLinuxAarch64.test_virt_tcg_gicv3

take quite a long time to run, and the current timeout of 240s
is not enough for the tests to complete on slow machines:
we've seen these tests time out in the gitlab CI in the
'avocado-system-alpine' CI job, for instance. The timeout
is also insufficient for running the test with a debug build
of QEMU: on my machine the tests take over 10 minutes to run
in that config.

Push the timeout up to 720s so that the test definitely has
enough time to complete.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20221117111628.911686-1-peter.maydell@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/avocado/boot_linux.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/avocado/boot_linux.py b/tests/avocado/boot_linux.py
index 79810be942..b3e58fa309 100644
--- a/tests/avocado/boot_linux.py
+++ b/tests/avocado/boot_linux.py
@@ -67,7 +67,7 @@ class BootLinuxAarch64(LinuxTest):
     :avocado: tags=machine:virt
     :avocado: tags=machine:gic-version=2
     """
-    timeout = 240
+    timeout = 720
 
     def add_common_args(self):
         self.vm.add_args('-bios',
-- 
2.34.1



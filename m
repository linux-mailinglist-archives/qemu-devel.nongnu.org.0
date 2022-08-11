Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F149758FF39
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 17:22:52 +0200 (CEST)
Received: from localhost ([::1]:50384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMA1L-0008QK-SN
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 11:22:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oM9tB-0005B2-DV
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 11:14:28 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:33411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oM9t9-0005i8-UI
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 11:14:25 -0400
Received: by mail-wr1-x42d.google.com with SMTP id v3so21778262wrp.0
 for <qemu-devel@nongnu.org>; Thu, 11 Aug 2022 08:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=oFdZaY9ycRKP9o6Y/fbHM5Ey/fK+U1t+BkcB/gzZ+AY=;
 b=LIlkVosDj5vsXkuJ/jgXlSRPWGfjmISvtCKGCDF5aCCjB8YVaX8o87ltppw7MzElQ2
 jLDetEWRkOWpwAtWUwrehLRZtf2w5ckNz9NFZPV7pDnfVEKZx786nqQ73qRmbltUOsgg
 LylZW42UCwetuOKF65xgiwKr15y3A1N5+Z5qp0nMn+py1TIyTYIv4TqGKaT1nSgnv8Ex
 0pgkrLq17/vu3K8qqmDyE+1hzUo4AceyN5MkHxgxHr4E2U+O26BAk5Ofen+fv2aZOum/
 9bzPMkYvZTdKg6k64SLzO+Kf6AkMvhK833MVsZBFFNMfy/KRLNfm8dX3ed/NWineCuA3
 w4sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=oFdZaY9ycRKP9o6Y/fbHM5Ey/fK+U1t+BkcB/gzZ+AY=;
 b=Y03dL1IGautxO9RxNibTPojDNX6HCaqg4A36USOGbrSAjo3LploFblkw5iLa2HRFmA
 xaCnUgALzSDVx5SDQZ7FH/1/Qb5d7cZXirT5kKP0XVOKIS8I1AXQmDKsGTXdT5gHgXNZ
 S3kjwNm74fQyb6WCrjjDWzAQnbgjJPpecGccFBuJUlpP3NiDRHqONp305QZ11UWh7MFp
 IN/O4D63JQxNIJx3SR5Wo/Kr40Fu0SVeeIzKgmviRgOhCgC1XMu5fYiCOE8WFDa93Gmv
 axrDONe3yQyEqo5QmRiuA6/HquAgJbK+3h12dR9h8UTYPRH4s2jmF5FgOWXiYi999S4O
 gpMA==
X-Gm-Message-State: ACgBeo3PavOV8D4vTQF8eFjPtOHlazdLtRqBZZOiQfmy7Zw9+SUJZnjQ
 N9Kb3GdTC04f9qljsy0sxfFApw==
X-Google-Smtp-Source: AA6agR4R1EHYlv6ngQHt0a37oP013KVlSANanakaDh6Zmqs3ThDzge8j2nrOuRVLJiu2GPu0toZ3+w==
X-Received: by 2002:a5d:4fcc:0:b0:21f:dd9:df09 with SMTP id
 h12-20020a5d4fcc000000b0021f0dd9df09mr21259260wrw.294.1660230862535; 
 Thu, 11 Aug 2022 08:14:22 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 v20-20020a1cf714000000b003a5125049c9sm8133809wmh.9.2022.08.11.08.14.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Aug 2022 08:14:19 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BAC031FFBE;
 Thu, 11 Aug 2022 16:14:13 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH  v1 6/8] tests/avocado: add timeout to the aspeed tests
Date: Thu, 11 Aug 2022 16:14:11 +0100
Message-Id: <20220811151413.3350684-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220811151413.3350684-1-alex.bennee@linaro.org>
References: <20220811151413.3350684-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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

On some systems the test can hang. At least defining a timeout stops
it from hanging forever.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/avocado/machine_aspeed.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/avocado/machine_aspeed.py b/tests/avocado/machine_aspeed.py
index b4e35a3d07..c54da0fd8f 100644
--- a/tests/avocado/machine_aspeed.py
+++ b/tests/avocado/machine_aspeed.py
@@ -40,6 +40,8 @@ def test_ast1030_zephyros(self):
 
 class AST2x00Machine(QemuSystemTest):
 
+    timeout = 90
+
     def wait_for_console_pattern(self, success_message, vm=None):
         wait_for_console_pattern(self, success_message,
                                  failure_message='Kernel panic - not syncing',
-- 
2.30.2



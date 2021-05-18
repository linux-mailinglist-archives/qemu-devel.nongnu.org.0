Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FAE38750C
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 11:26:36 +0200 (CEST)
Received: from localhost ([::1]:51034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1livzn-0005pv-Hq
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 05:26:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1livpE-000589-1v
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:15:40 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:35547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1livp0-00013m-Pb
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:15:38 -0400
Received: by mail-wr1-x42d.google.com with SMTP id a4so9388006wrr.2
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 02:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P1AgBab+lMSlJGHVyOYf4zT34+22+JEN9xYs+u+KKMU=;
 b=AdrIBDezCwJg/1CKtDIkyxDE/KP1v0IUlQqiAqfgqR9vwLjcIa5zoMs20PPC5IfdOm
 h+MU1pBs3WTcIfa8mhp6N5Q+TRau9O/ilQT9qfODldMryTIYCL5X3u5wG4kq4ecAlFjb
 86N7UQ959eZ9mQRmNAzhWQA5AFMfLSR6tNbI+zAOxgha3MdvbOF6N6qTAX1rN8CERZVI
 PV06wKwqMSr9ML1nKYAvnO8MeY2UcchvU42l7YbPUdkgbByHV0zSpUg5vznKaII7/XP4
 f8QFVfbhT2kwAyIANAVvkwmItRU2QnQwES/6DZkcfGQisSii/AHel2o6jvRFxOhKpDj4
 OFKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P1AgBab+lMSlJGHVyOYf4zT34+22+JEN9xYs+u+KKMU=;
 b=Aj1naGP51kidXoSYHR3HfGzuN5HqJqBRzzlQI+WoPqP9hQqhQSRsl6TufWHcAlXzD9
 3F8SDy7+Az2OD7keFqVHEH1NfuL4ku8V35qrX/fgg8Ezm8YISgp5AwKjfPf0iFHfGq7Z
 qM2hiZ3meGzU4hk7VQULwNL7h9+AOpvfUV1HSzhocqV5x9MzCUcBr7oeP9jxHKDU02vp
 gCmJPK60OdgzbrtDKUk2A+md+tUUsraiCAKN2yzF4pVZ3dOqOhldbCwqfTatQm7gxthq
 Lmo1fW5iHh0mnIQWi9HHKzT3SWAoN5+qOFTep9B2InkYUrCmaiX+GnmiA6Tc/g358eM0
 pM2A==
X-Gm-Message-State: AOAM532zEdTyDhwx0KsGdyUxXpMpW9hozqTT1McgKAuAD3n30O5L6zKc
 RC9kf3Opf9wbS/CrwqcCtCwd7A==
X-Google-Smtp-Source: ABdhPJy0SGonDPhl2OOJI7+kgrRyImTut8xINzq3vYitl3PVrUS/ASO8yAtB3KXO9U+s1UF2IYJuww==
X-Received: by 2002:adf:fe8e:: with SMTP id l14mr5566893wrr.305.1621329323210; 
 Tue, 18 May 2021 02:15:23 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c7sm11551004wrs.23.2021.05.18.02.15.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 02:15:18 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CC3411FFA9;
 Tue, 18 May 2021 10:07:22 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v2 20/29] tests/tcg/tricore: Add fmul test
Date: Tue, 18 May 2021 10:07:11 +0100
Message-Id: <20210518090720.21915-21-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210518090720.21915-1-alex.bennee@linaro.org>
References: <20210518090720.21915-1-alex.bennee@linaro.org>
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

Tested-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210305170045.869437-12-kbastian@mail.uni-paderborn.de>
Message-Id: <20210512102051.12134-22-alex.bennee@linaro.org>

diff --git a/tests/tcg/tricore/Makefile.softmmu-target b/tests/tcg/tricore/Makefile.softmmu-target
index e7adb16af9..34da1f37de 100644
--- a/tests/tcg/tricore/Makefile.softmmu-target
+++ b/tests/tcg/tricore/Makefile.softmmu-target
@@ -8,6 +8,7 @@ TESTS += test_bmerge.tst
 TESTS += test_clz.tst
 TESTS += test_dvstep.tst
 TESTS += test_fadd.tst
+TESTS += test_fmul.tst
 
 QEMU_OPTS += -M tricore_testboard -nographic -kernel
 
diff --git a/tests/tcg/tricore/test_fmul.S b/tests/tcg/tricore/test_fmul.S
new file mode 100644
index 0000000000..fb1f634b2d
--- /dev/null
+++ b/tests/tcg/tricore/test_fmul.S
@@ -0,0 +1,8 @@
+#include "macros.h"
+.text
+.global _start
+_start:
+    TEST_D_DD_PSW(mul.f, 1, 0x974f4f0a, 0x84000b80, 0x1a0b1980, 0xbcbec42d)
+
+    TEST_PASSFAIL
+
-- 
2.20.1



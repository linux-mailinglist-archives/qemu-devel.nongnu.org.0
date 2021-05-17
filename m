Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 930933839C2
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 18:26:33 +0200 (CEST)
Received: from localhost ([::1]:44434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lig4d-0002SD-UK
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 12:26:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lifyY-0001bw-Le
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:20:14 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:42604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lifyU-000246-Mw
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:20:14 -0400
Received: by mail-wr1-x42a.google.com with SMTP id x8so7035217wrq.9
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 09:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AwHUKic2neBlh0Oqi4dLL3Doo9PeLOJuBwfn8ueZrao=;
 b=nQLN+uVe5MRaiv2Y8oHuR5Jc4YQ8J8mUVSlubZy68eMafs+P66i1tELFMgyR6xNho+
 GofoHpMfQFPVazH1gaMev/qmd+iMEiWcr6qCfbMGWqRhjzVEcfWHstE0cZpiCLZKQo7O
 PKkS6feyxTkr2aigizS3TYGf2geveuxQ8zPn800AqlybSHRNqBw1h1a7Yy4JJiEYrDho
 +OG06vXM9enPc2kQMFKyYL+EJaiSBJ+ZzsUdiKpmVnGIDlw7O4SQGEgs21MMvrW4FGWn
 GLhPjMO8LQGXgbqNjCni+hjlp7RMw0Dxud4uKDCu6/ZrB9DOIJkFrpJe0b06ZPaZrNOh
 ao6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AwHUKic2neBlh0Oqi4dLL3Doo9PeLOJuBwfn8ueZrao=;
 b=WGarlKt2JOa2bnGScLtbogiNr9I+vi3A1dRGQJyhemIdxWmws/QRXKT8nzWGBx75qm
 dvqcKqeDUSgFNIcPqhVd4SeKJQ26/ID1iLJKJsxZPWyae4D29qGhIpNYvtZh9WqNawsD
 WiD7FfqQeneObxkUxENr4Jxhj3ecI/3ie7dAB2hFtUiqD7n6r2T+o03SwKSNulWgAro7
 Up5SFTCspyCdgMzP6WM66JTvLoCZm1yldJ0xHbh9sTRJRuW6Im1WttTf/t56hUK8/P8z
 7ERtO07+75m6rnKNV2yxy17PAu0dav7U03IQUymz9NZMLM0CrJ2g1jYWbNfl4zOVEU7w
 hrQg==
X-Gm-Message-State: AOAM531sDcD1PerRpzXrwvNMH7ojam1pgY1vwlPy5eLZv4t+e46FAlkB
 mUs7T30IlQidlMmBctIWN7fk4A==
X-Google-Smtp-Source: ABdhPJyw6pXLNbJVUTjAqNxUF4BMwxEmr679bo60ZeCD/gwBwh3uYqEOAcO+wequPY2yfJqONnAXOQ==
X-Received: by 2002:adf:e70e:: with SMTP id c14mr600181wrm.104.1621268408246; 
 Mon, 17 May 2021 09:20:08 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z9sm14997968wmi.17.2021.05.17.09.20.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 09:20:07 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 18D241FFA9;
 Mon, 17 May 2021 17:10:25 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 20/29] tests/tcg/tricore: Add msub test
Date: Mon, 17 May 2021 17:10:13 +0100
Message-Id: <20210517161022.13984-21-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210517161022.13984-1-alex.bennee@linaro.org>
References: <20210517161022.13984-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210305170045.869437-15-kbastian@mail.uni-paderborn.de>
Message-Id: <20210512102051.12134-25-alex.bennee@linaro.org>

diff --git a/tests/tcg/tricore/Makefile.softmmu-target b/tests/tcg/tricore/Makefile.softmmu-target
index 8de005523e..0fe6a86482 100644
--- a/tests/tcg/tricore/Makefile.softmmu-target
+++ b/tests/tcg/tricore/Makefile.softmmu-target
@@ -11,6 +11,7 @@ TESTS += test_fadd.tst
 TESTS += test_fmul.tst
 TESTS += test_ftoi.tst
 TESTS += test_madd.tst
+TESTS += test_msub.tst
 
 QEMU_OPTS += -M tricore_testboard -nographic -kernel
 
diff --git a/tests/tcg/tricore/test_msub.S b/tests/tcg/tricore/test_msub.S
new file mode 100644
index 0000000000..6dee87d99c
--- /dev/null
+++ b/tests/tcg/tricore/test_msub.S
@@ -0,0 +1,9 @@
+#include "macros.h"
+.text
+.global _start
+_start:
+    TEST_D_DDI_PSW(msub, 1, 0xd2fbe5e0, 0x00000b80,0x64003300, 0xff5420d4, -216)
+    TEST_D_DDI_PSW(msub, 2, 0xfffffc10, 0x00000b80,0xfffffe68, 0xfffffffd, -200)
+    TEST_D_DDD_PSW(msubs.u, 3, 0x0, 0x60000b80, 0x1, 0xffffffff, 0xffffffdb)
+    TEST_PASSFAIL
+
-- 
2.20.1



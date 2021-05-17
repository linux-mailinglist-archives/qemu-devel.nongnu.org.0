Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F99D3839FF
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 18:33:55 +0200 (CEST)
Received: from localhost ([::1]:32808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ligBj-0005iG-Qn
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 12:33:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lifyf-0001j9-3r
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:20:23 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:42603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lifyW-000257-EO
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:20:20 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 f75-20020a1c1f4e0000b0290171001e7329so3952321wmf.1
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 09:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u2zl0v/ZGpHuJYXeEUyU1isb5BGw5bVkcJXnd3C7i50=;
 b=S2v44eDNNIGapl8zlmmB32UO5QFHcjTsCd7CAdqiV8dgepVGmOOFynzo+3FBb55Iex
 IBguUYikIi+GV19LQjF0nLFbDIGT9fUn+WjuDiXLP0SPyAoPleFufoJLRWzHBaj4dgKU
 qez7zoNR9ZzW8XKn4hktKtxxK1SKQw8GaWtSWSH9Jlz4sMxX/dlG21HPIk6X8j3pMtQ5
 jJg1ALGPiVaG/0z5O67LwwNZ8B+sLNrMONkIhLcUnzQOf5kyy8yPlROudnCs/fENkm8V
 oktjTLmpGt/afHLpLbVzmYk95tN6nzMAlSVewzdrDk4sEv+/krjaakdQAUm/nFCXsEye
 jDfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u2zl0v/ZGpHuJYXeEUyU1isb5BGw5bVkcJXnd3C7i50=;
 b=Y60O5dXXdz0O2y0Uo7a7cbiK5PRo4zlr/oyHHWnNby2oCz6zLWRXxp9h7A2kwoIqPi
 an/HgS5JtzFelCinnZb5wxMkonXBkueH5WH01hFfXDv8kp16NK7hovewjty3iVLozSfO
 c6wRETcDVE3+gIgPdYc7B4m4I9BipE5vJBE6ZPQAxEHfXFtzkeVK+15TVwpfihNu/IXV
 lGeQ1cmoJfP/VsBxJA/gDTbh1M9nm4gFoYi7FMBl6l4AVC0ex36dHuqAqSNHv06gzU/V
 Amjf+MEXfshN+2nNEYpNZfES4RAp47ITnHL69Ps5dcu1H/05kJf/BXUj4W1HbjELT0zX
 3nNg==
X-Gm-Message-State: AOAM532KmtP22IODFlE/r6P7BjVJGj4D83VmL6Sg2EWJ9pJuIuN6p2RW
 Ut13MJ/KaaAQWO3rp7FB1Y0AZA==
X-Google-Smtp-Source: ABdhPJz4DcZWXknBhhZi0VtjG56lX2/O3JNuRNvwZlRWbzL7qfN0+X6VGCvcLmfJWhDw55l5pJ8AGg==
X-Received: by 2002:a1c:988f:: with SMTP id a137mr720995wme.110.1621268411060; 
 Mon, 17 May 2021 09:20:11 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c194sm19350470wme.46.2021.05.17.09.20.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 09:20:07 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 300AF1FFAA;
 Mon, 17 May 2021 17:10:25 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 21/29] tests/tcg/tricore: Add muls test
Date: Mon, 17 May 2021 17:10:14 +0100
Message-Id: <20210517161022.13984-22-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210517161022.13984-1-alex.bennee@linaro.org>
References: <20210517161022.13984-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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
Message-Id: <20210305170045.869437-16-kbastian@mail.uni-paderborn.de>
Message-Id: <20210512102051.12134-26-alex.bennee@linaro.org>

diff --git a/tests/tcg/tricore/Makefile.softmmu-target b/tests/tcg/tricore/Makefile.softmmu-target
index 0fe6a86482..5007c60ce8 100644
--- a/tests/tcg/tricore/Makefile.softmmu-target
+++ b/tests/tcg/tricore/Makefile.softmmu-target
@@ -12,6 +12,7 @@ TESTS += test_fmul.tst
 TESTS += test_ftoi.tst
 TESTS += test_madd.tst
 TESTS += test_msub.tst
+TESTS += test_muls.tst
 
 QEMU_OPTS += -M tricore_testboard -nographic -kernel
 
diff --git a/tests/tcg/tricore/test_muls.S b/tests/tcg/tricore/test_muls.S
new file mode 100644
index 0000000000..ca517556bc
--- /dev/null
+++ b/tests/tcg/tricore/test_muls.S
@@ -0,0 +1,9 @@
+#include "macros.h"
+.text
+.global _start
+_start:
+    TEST_D_DD_PSW(muls.u, 1, 0xffffffff, 0x78000b80, 0x80000001, 0xffffffff)
+    TEST_D_DD_PSW(muls.u, 2, 0xffffffff, 0x60000b80, 0xfffffffe, 0xffffffff)
+
+    TEST_PASSFAIL
+
-- 
2.20.1



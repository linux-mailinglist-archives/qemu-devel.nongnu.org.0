Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5626F4391
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 14:19:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptov7-0003uN-Tt; Tue, 02 May 2023 08:15:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptouZ-0003lb-J4
 for qemu-devel@nongnu.org; Tue, 02 May 2023 08:15:16 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptouT-000303-Ic
 for qemu-devel@nongnu.org; Tue, 02 May 2023 08:15:15 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f3331f928cso21531255e9.2
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 05:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683029703; x=1685621703;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=e9oTff59t7Uky9AVvT+NcKEI/NgbRCE+pKCOSqncgjA=;
 b=IDuTvDDKrmPbroyfZgg3cGVwIW/DqK342lLnPTHkfWjEX+97sksAYRimIvFBLDrGqq
 /QKBt700cYaLbQHh5RDu6js0oes5DtYD/oVqQ8Qa29YAjZuoGUhasLy1RisnmscBVbu5
 5sCK1WJJ4JhOWiDomnv4gkoyv+hgdN4gDT5KRNl7ODyFdd3xyJx6Y9uB16ulht8gYSXu
 6kq2TsBaKoRbR88+/J4o1cBJbvCoVeFWwyXYU7weQiqQr1qdWBUY6LX0IwyVoL10hznl
 nZ83mgWb0YaFUzSCjOfC8ISdMntBv0WIdE0QZiPOuu3dI6WhRAbuBC8zIRNNEYckfOYB
 xJmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683029703; x=1685621703;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e9oTff59t7Uky9AVvT+NcKEI/NgbRCE+pKCOSqncgjA=;
 b=Falfftpx02iMnPWbGS69xV+VjnTt+jNcQFyUQDFW+ZoqeuJvYmLqelqZZ/s2e4g9N/
 drwLj3xqecXOdWB5q82AbJrjITPA/orBy0H3N5WQDTe8IqXTS/uCKizGFfS5534yoxVz
 4hiCzfMQWwqu8ltG9L8Gn7/1OuW3dGXVbLa7Z49FrPaj/MBR1PWEwvfbc3PStfTOptFT
 V0n36DAFoP/QZpxpRz4c6npeD2dPBvxtQMHPiz5qup/8mKfRIlIUa2pg8cKhxLGTW8Rf
 x+MjmctDY7MLI3zJQHYkfnSBvIkxW2eG/PuZYCe6KmMgjRYHsqfKPCcGav3lId0ik2m6
 iaRw==
X-Gm-Message-State: AC+VfDxrM3yfm7EIKxDLGMcpUk4uS40lqVGxaqfTWiTBa/OM01xko006
 y7XGQWqucTDJU/tS22KQmTvpR+eJfkLadwDgg28=
X-Google-Smtp-Source: ACHHUZ638foV4h++zoqtujblsLBXEzeUVFXFMPtvxMEJFigPnXeHWxCh2sBdD7teCYG8s5AdIYoz2g==
X-Received: by 2002:a7b:cc16:0:b0:3ed:f5b5:37fc with SMTP id
 f22-20020a7bcc16000000b003edf5b537fcmr12560566wmh.1.1683029702952; 
 Tue, 02 May 2023 05:15:02 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 g10-20020a7bc4ca000000b003f171234a08sm35040330wmk.20.2023.05.02.05.15.02
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 05:15:02 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/35] target/arm: Do not expose all -cpu max features to qtests
Date: Tue,  2 May 2023 13:14:28 +0100
Message-Id: <20230502121459.2422303-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230502121459.2422303-1-peter.maydell@linaro.org>
References: <20230502121459.2422303-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
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

From: Fabiano Rosas <farosas@suse.de>

We're about to move the TCG-only -cpu max configuration code under
CONFIG_TCG. To be able to do that we need to make sure the qtests
still have some cpu configured even when no other accelerator is
available.

Delineate now what is used with TCG-only and what is also used with
qtests to make the subsequent patches cleaner.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-id: 20230426180013.14814-5-farosas@suse.de
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu64.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index e9161522b8f..6a6a2ece2b2 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -25,6 +25,8 @@
 #include "qemu/module.h"
 #include "sysemu/kvm.h"
 #include "sysemu/hvf.h"
+#include "sysemu/qtest.h"
+#include "sysemu/tcg.h"
 #include "kvm_arm.h"
 #include "hvf_arm.h"
 #include "qapi/visitor.h"
@@ -1365,10 +1367,14 @@ static void aarch64_max_initfn(Object *obj)
         return;
     }
 
-    /* '-cpu max' for TCG: we currently do this as "A57 with extra things" */
+    if (tcg_enabled() || qtest_enabled()) {
+        aarch64_a57_initfn(obj);
+    }
 
-    aarch64_a57_initfn(obj);
-    aarch64_max_tcg_initfn(obj);
+    /* '-cpu max' for TCG: we currently do this as "A57 with extra things" */
+    if (tcg_enabled()) {
+        aarch64_max_tcg_initfn(obj);
+    }
 }
 
 static const ARMCPUInfo aarch64_cpus[] = {
-- 
2.34.1



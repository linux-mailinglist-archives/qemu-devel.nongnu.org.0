Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A01A464A8E2
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 21:50:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4pkW-00019y-0R; Mon, 12 Dec 2022 15:50:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p4pkU-00019a-33
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 15:50:06 -0500
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p4pkS-0008Um-Az
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 15:50:05 -0500
Received: by mail-ot1-x333.google.com with SMTP id
 x25-20020a056830115900b00670932eff32so2670885otq.3
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 12:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=FSAtrngnhPgw/ml/GiwFJEvLw8DF1Hz9wANEfzrgNlI=;
 b=x2ognOj3pWZYLnJBhdhrugwYR/xIeIPSQxtjgswbwq847QSYRnavoW0voOkQz7FPcS
 nB1fw96zFz7B7zJ1ypDxxNk5ClSkULckEwDchPqpQBMsCBgEiLCQKV32/GZWYLTVqyhH
 gU3m0MdFWBfW3kXXPiQkjN92bas3ChnuhmFm8totzqI982g36aNWBXvjW68jndBDZFzX
 863keKrQL3v3P3L4ImzSLR2iS3bfDwHHLCNvyMv50jfTI/c6LuILztcQkEIPc+5EoiIH
 rBW7r6lf+d5IkG0VgrQnoXVQjzHoBy7KMeT9JJV3iXoVJliHmarp4+CAxmxhjwFvxdrf
 5zzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FSAtrngnhPgw/ml/GiwFJEvLw8DF1Hz9wANEfzrgNlI=;
 b=Is/HnYliWQBqNUudWTop6HFkPxsR31n1tWHRBGepZrxeQdrsslIAs0ipc3btxJ8jyi
 EtIzfSK0AMUvpb73S129oQiQrktUFJdSlejlh1gcBhagoZIUBGLEMToU358sQapb/46N
 eyE3dfOTzc+VesPpzWfXFR+/BjDlpgyMSjqkSJl5PKmR0eJhHKuooBRcIJTB8K641HLe
 +KJmsvWP8B4JDODv3XlL5Dwp3UtCUmzQrFce6CqLrQCbK/YswEfvhJbt5vV2hUgf8gms
 N/+F6jDcwyWVL2XOqQvYI32q6J7b2ezL6FnKwg1Z134v7NCs6WgIxJxZ1YJ2dVYcVkxy
 X8Vw==
X-Gm-Message-State: ANoB5pnAoCvR1CLe8ExbQxbH7KOjsVLoWQ+s0e5vYX07ksNbnRnnRpJM
 BKHFLdyR9VhRI8Y1Zj6eSk8bFYINV6528PTe5R8=
X-Google-Smtp-Source: AA0mqf7Gp3wsdkZZMvC8SSmVUqqAMgwM7eRWS8V18cGDfOzpLiCGzB/y8F9UUHB9Muz3R3GAW+zCbQ==
X-Received: by 2002:a05:6830:6113:b0:661:dfeb:a95f with SMTP id
 ca19-20020a056830611300b00661dfeba95fmr12595312otb.10.1670878202631; 
 Mon, 12 Dec 2022 12:50:02 -0800 (PST)
Received: from stoup.. ([2806:102e:18:2efc:20f0:1d0e:8e1f:fff0])
 by smtp.gmail.com with ESMTPSA id
 v3-20020a0568301bc300b006705e35c4e2sm381816ota.35.2022.12.12.12.50.01
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Dec 2022 12:50:02 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/tricore: Fix gdbstub write to address registers
Date: Mon, 12 Dec 2022 14:49:59 -0600
Message-Id: <20221212204959.1353838-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x333.google.com
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

Typo had double-writes to data registers.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1363
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/tricore/gdbstub.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/tricore/gdbstub.c b/target/tricore/gdbstub.c
index ebf32defde..3a27a7e65d 100644
--- a/target/tricore/gdbstub.c
+++ b/target/tricore/gdbstub.c
@@ -130,7 +130,7 @@ int tricore_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
     if (n < 16) { /* data registers */
         env->gpr_d[n] = tmp;
     } else if (n < 32) { /* address registers */
-        env->gpr_d[n - 16] = tmp;
+        env->gpr_a[n - 16] = tmp;
     } else {
         tricore_cpu_gdb_write_csfr(env, n, tmp);
     }
-- 
2.34.1



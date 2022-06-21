Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 186DC553BFB
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 22:54:45 +0200 (CEST)
Received: from localhost ([::1]:33824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3ktY-0008Eh-6e
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 16:54:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3klz-0006c3-9W
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 16:46:57 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:38637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3klv-00015h-O8
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 16:46:55 -0400
Received: by mail-pg1-x532.google.com with SMTP id e63so12670552pgc.5
 for <qemu-devel@nongnu.org>; Tue, 21 Jun 2022 13:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1iNW8arog/kBIvl1O8Y+BsdggwiOBBLeU4FAPW4Cogk=;
 b=rZ4I7HvDKzSQTXuBodDxS9EnrTnvREZqcGD9p2DYTkhR+tdIpWTv5F2f+8PSPsFs5l
 0+2UvkXAm7/r4S0v2BpvVNzBJcvRaztVTyDed2Y4Js2rr6CDp9d8j3hX8PF5Bzei9kBf
 LzfQY9/XBN06nKDLitMvGPKKMd8QEv88FElfPHkrJJyrJyVRGf/+2Sn+1C5wIkoUo4av
 cyngexmVggEhA9h3CfXRWVEbT5EXOgdW7YUJRNC3CjYSAhMl/9q3FbkcGsldsMT1ssdd
 FHW9pK1nvRlCe07obNBF2OP/aLUkO7Y7oC57Gy1RNsnJc52egLj8ayVXq9XhbbHFSh+1
 18fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1iNW8arog/kBIvl1O8Y+BsdggwiOBBLeU4FAPW4Cogk=;
 b=6OmhzjiYxCVK1MTk77LGo+4GPy0rYdZJdrUQuWNQKDUZD4QUUSvWhVidtj2OP97LCZ
 6yQAtaiPG31OBGkwggx4z0ulAYblNJ9gX4CmyMgpg2GDzR8KZtvPQpBTsEHnUjwcQBVM
 5Uesz4jPwdGa2cxVt2O04e+E7G3dj/aQB7Lxpk9R9hOp0EslCbPrISkyrNpFxbng7RWj
 4nvhKDx/JbwSOQrRmKgVDG+rJICxbiWBHjZ86755yGRKmdxWukR8yABz395RgoUeOadc
 OK7L95pI3sQmy0HrBPoxeiCMyoWiIAbOuPUM4h6mOFG7leXhNPPnK8Jf9/IE1TLWmkxb
 AXGA==
X-Gm-Message-State: AJIora+yISNwHF8Y9d77Jx4AkUvdIw32XdLDVtx0fp2ojRybKnU1JJqe
 7KEHkv4al6GxR1oZD0+8HczmMvyTJc3vaA==
X-Google-Smtp-Source: AGRyM1toKGwf0SGDiWz567w9p+rIfkz5lE4fgmsrhs8rpXT5ITj4kt0Ln0NonNQk9srFI/wqj/P/TA==
X-Received: by 2002:a63:ae4a:0:b0:40c:2d48:5fda with SMTP id
 e10-20020a63ae4a000000b0040c2d485fdamr25398560pgp.434.1655844407993; 
 Tue, 21 Jun 2022 13:46:47 -0700 (PDT)
Received: from stoup.. ([2602:47:d49e:3c01:8adc:a144:6ec2:4d71])
 by smtp.gmail.com with ESMTPSA id
 p66-20020a625b45000000b005252defb016sm3649674pfb.122.2022.06.21.13.46.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 13:46:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 4/9] accel/tcg: Reorganize tcg_accel_ops_init()
Date: Tue, 21 Jun 2022 13:46:38 -0700
Message-Id: <20220621204643.371397-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220621204643.371397-1-richard.henderson@linaro.org>
References: <20220621204643.371397-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reorg TCG AccelOpsClass initialization to emphasis icount
mode share more code with single-threaded TCG.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220323171751.78612-7-philippe.mathieu.daude@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/tcg-accel-ops.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c
index 684dc5a137..786d90c08f 100644
--- a/accel/tcg/tcg-accel-ops.c
+++ b/accel/tcg/tcg-accel-ops.c
@@ -97,16 +97,17 @@ static void tcg_accel_ops_init(AccelOpsClass *ops)
         ops->create_vcpu_thread = mttcg_start_vcpu_thread;
         ops->kick_vcpu_thread = mttcg_kick_vcpu_thread;
         ops->handle_interrupt = tcg_handle_interrupt;
-    } else if (icount_enabled()) {
-        ops->create_vcpu_thread = rr_start_vcpu_thread;
-        ops->kick_vcpu_thread = rr_kick_vcpu_thread;
-        ops->handle_interrupt = icount_handle_interrupt;
-        ops->get_virtual_clock = icount_get;
-        ops->get_elapsed_ticks = icount_get;
     } else {
         ops->create_vcpu_thread = rr_start_vcpu_thread;
         ops->kick_vcpu_thread = rr_kick_vcpu_thread;
-        ops->handle_interrupt = tcg_handle_interrupt;
+
+        if (icount_enabled()) {
+            ops->handle_interrupt = icount_handle_interrupt;
+            ops->get_virtual_clock = icount_get;
+            ops->get_elapsed_ticks = icount_get;
+        } else {
+            ops->handle_interrupt = tcg_handle_interrupt;
+        }
     }
 }
 
-- 
2.34.1



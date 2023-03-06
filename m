Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D643A6AC596
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 16:37:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZCrR-00043p-SC; Mon, 06 Mar 2023 10:34:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZCrN-00040o-Ho
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 10:34:45 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZCrL-000295-Tq
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 10:34:45 -0500
Received: by mail-wr1-x433.google.com with SMTP id t15so9252080wrz.7
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 07:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678116882;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=2EZepXHVNHsTCEeO8kyZwd8UEJgQUx+jjexWm4MPlBw=;
 b=PQmWaTU4Qglh1zEkTq5ZBkIafrLG0TrnJ6PTRbF0JiloSQE+qc2umpV4LRz6naYcUs
 +tuzobRJh7o/biIDHR5/LHUt+UygUvWhK1ezJJMAKLCFB3tXf4KXkxVR2s+xEPLFycbn
 utoRJ3nqDRPopx27zJHo8/rWsnkwdGF3BkGIsFGWayw5MxaWYyYSw6aLCVF+HRvxGsL3
 6T+y8MhfNx8AsoI3gVQers1zSL7RwYIdUUat/V5Z+gSf/wUTfnCCz7ENjS3kszKxe+qZ
 Ty3ICaIx9fcl6ueKz7mhliP2HUNbBSyvh5KXCWBIxy9OgH3ASR++Avz+FhJuEyW5g0xu
 4DZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678116882;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2EZepXHVNHsTCEeO8kyZwd8UEJgQUx+jjexWm4MPlBw=;
 b=8DgTbAIil1V6be8ecsrcjR6tYj1XKS365Bk49T9Henf95BF5qhLRId0rxZhMtNAvxQ
 /wLpTznLsQ6KGm9uytr7mQrGjGSWZWylQXjqeP3LYUSvl5ZD5UbZHISFeebLGhCFiVXN
 xeC3nH/OYUD3VSi2/1b5fwsTdfwdlCsnS0Aj3b8k9d4/fTyylSFyNpypcb5BhZIx/RNp
 ckMNB0wvHEzGd9YTuZE4y6CVL69PnHgmqW4SJQA1oJcoXG0ox559Pmqbx/It8im9os6J
 bhbm8MMgI2u/1Icdd83AZKIpb5PzcJu5i3q+B1QdOCkgMAllV3my/ELlSacK1LO0HTHi
 a84w==
X-Gm-Message-State: AO0yUKWpJo/jzYFDa0WUGD09LSyw3fZHpNQuoW17S3M3XgeLAwgmEMZq
 bNh4fo6TtAax37ezZyVga8Rgbv5eiuvfRW5T/OI=
X-Google-Smtp-Source: AK7set838/1ppyEwQ+MnPRih1cXX4aYgXY5e1d50/9cKFJt/3tb76eF/S3DQ56NvuRQ4sb7ila//Eg==
X-Received: by 2002:adf:e30d:0:b0:2c5:3cd2:b8e with SMTP id
 b13-20020adfe30d000000b002c53cd20b8emr7316506wrj.1.1678116882284; 
 Mon, 06 Mar 2023 07:34:42 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 v7-20020a05600c444700b003eb0d6f48f3sm15287432wmn.27.2023.03.06.07.34.41
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 07:34:41 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/21] target/arm: Hoist pred_width in
 arm_gen_dynamic_svereg_xml
Date: Mon,  6 Mar 2023 15:34:20 +0000
Message-Id: <20230306153435.490894-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306153435.490894-1-peter.maydell@linaro.org>
References: <20230306153435.490894-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230227213329.793795-7-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/gdbstub64.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
index 070ba20d991..895e19f0845 100644
--- a/target/arm/gdbstub64.c
+++ b/target/arm/gdbstub64.c
@@ -283,6 +283,7 @@ int arm_gen_dynamic_svereg_xml(CPUState *cs, int orig_base_reg)
     GString *s = g_string_new(NULL);
     DynamicGDBXMLInfo *info = &cpu->dyn_svereg_xml;
     int reg_width = cpu->sve_max_vq * 128;
+    int pred_width = cpu->sve_max_vq * 16;
     int base_reg = orig_base_reg;
     int i;
 
@@ -319,13 +320,13 @@ int arm_gen_dynamic_svereg_xml(CPUState *cs, int orig_base_reg)
         g_string_append_printf(s,
                                "<reg name=\"p%d\" bitsize=\"%d\""
                                " regnum=\"%d\" type=\"svep\"/>",
-                               i, cpu->sve_max_vq * 16, base_reg++);
+                               i, pred_width, base_reg++);
     }
     g_string_append_printf(s,
                            "<reg name=\"ffr\" bitsize=\"%d\""
                            " regnum=\"%d\" group=\"vector\""
                            " type=\"svep\"/>",
-                           cpu->sve_max_vq * 16, base_reg++);
+                           pred_width, base_reg++);
 
     /* Define the vector length pseudo-register. */
     g_string_append_printf(s,
-- 
2.34.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0181256510E
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 11:40:11 +0200 (CEST)
Received: from localhost ([::1]:40518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8IYs-0000Vt-2h
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 05:40:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8ITL-0000Kg-7I
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 05:34:28 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:45570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8ITJ-0004wB-PC
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 05:34:26 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 g20-20020a17090a579400b001ed52939d72so8994666pji.4
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 02:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=21yVEfcVUBo097kH9wR354mUzWjfCDzfOMaCfmjHzQU=;
 b=l4Oe3Z+KPdbGNFsI0apAcyoE4oqXnpZhG6BF/rDMH8CFCyGt2svfkqdD39lV3FVU+m
 DryDsln4KQHIfTriu+KyYVdDzjxoliRCFnQQ1uEGlG9MkH0BEqTBojX7Zj+u8AIcusSp
 p6yd6oScHkA8jG1nlNgahLGBv1aveONx7UMTKbFydrA5roj1BvAA8tfJZR4krsG/ew+4
 kI2KBPoXDSaRdogrK7msuNFSWMzjGlxLSl0+EDvsDCxOEuBJyBBTrdThUmiJGsFZSmUm
 mul4+Vd0TZf6RC27LH2FlS30Ws4P5uuo+AAdl3WJdongWTchy+XZIf3KTiZfOO7ey63C
 cHAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=21yVEfcVUBo097kH9wR354mUzWjfCDzfOMaCfmjHzQU=;
 b=eIKhlk/AxJUBkWgn78SXBbKy5fE00s/ExsTmQV9hKSXJXCvaFIAubzzYWzhcZOtetw
 o3M0sN0MOpvPjC5Zj0wiYzbs/xuZntv2l+jAU27cGnXTAFMH8895jZ1Tc9HAgOh6GbXT
 Dzw/3+CqRr/mJy3F8iibdDJ04DNLa6zfc72gGKAH9PhYZglOK4+XoS3clEVxjmCGkCXo
 BmUrq3xAszpscG2VYQxkLWEDwqR4YffyTVwaY7qQcLe+0Bw4JKvpQoPwBziZTPdTAyrw
 pPen6LGrxpTAxxDSvn+gjtyuaTc/xpFMiEJ5R/Y8weOvd/17yUtv5U7AKSCV99UmtVK4
 CKDg==
X-Gm-Message-State: AJIora/hSVAZQaN/b7xEp3rhxLeezlWJIQNin7teLgnsIOyXmXKALgMm
 CN+RgfmX/qoY7EGS0+gP/EMo0ymhIXQKmP6F
X-Google-Smtp-Source: AGRyM1uugPyGLGsGBLUsYGPu2RHKXsXKwaJS1v+hullKrpRuj5zeF9Vpen1YXmE9HNCYEW41bPCdxQ==
X-Received: by 2002:a17:902:e541:b0:16b:89b3:5848 with SMTP id
 n1-20020a170902e54100b0016b89b35848mr33250995plf.39.1656927263983; 
 Mon, 04 Jul 2022 02:34:23 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 z5-20020aa79e45000000b00525b7f3e906sm15353355pfq.27.2022.07.04.02.34.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jul 2022 02:34:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Song Gao <gaosong@loongson.cn>,
	Xiaojuan Yang <yangxiaojuan@loongson.cn>
Subject: [PULL 07/23] target/loongarch: remove badaddr from CPULoongArch
Date: Mon,  4 Jul 2022 15:03:41 +0530
Message-Id: <20220704093357.983255-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220704093357.983255-1-richard.henderson@linaro.org>
References: <20220704093357.983255-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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

From: Song Gao <gaosong@loongson.cn>

We can use CSR_BADV to replace badaddr.

Signed-off-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220624031049.1716097-8-gaosong@loongson.cn>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/loongarch/cpu.h     | 2 --
 target/loongarch/gdbstub.c | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
index 71a5036c3c..4b4fbcdc71 100644
--- a/target/loongarch/cpu.h
+++ b/target/loongarch/cpu.h
@@ -246,8 +246,6 @@ typedef struct CPUArchState {
     uint64_t lladdr; /* LL virtual address compared against SC */
     uint64_t llval;
 
-    uint64_t badaddr;
-
     /* LoongArch CSRs */
     uint64_t CSR_CRMD;
     uint64_t CSR_PRMD;
diff --git a/target/loongarch/gdbstub.c b/target/loongarch/gdbstub.c
index 0c48834201..24e126fb2d 100644
--- a/target/loongarch/gdbstub.c
+++ b/target/loongarch/gdbstub.c
@@ -21,7 +21,7 @@ int loongarch_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
     } else if (n == 32) {
         return gdb_get_regl(mem_buf, env->pc);
     } else if (n == 33) {
-        return gdb_get_regl(mem_buf, env->badaddr);
+        return gdb_get_regl(mem_buf, env->CSR_BADV);
     }
     return 0;
 }
-- 
2.34.1



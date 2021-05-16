Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B09A8381F3F
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 16:24:22 +0200 (CEST)
Received: from localhost ([::1]:39528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liHgr-0000vY-R9
	for lists+qemu-devel@lfdr.de; Sun, 16 May 2021 10:24:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liHUo-00065A-Tg
 for qemu-devel@nongnu.org; Sun, 16 May 2021 10:11:54 -0400
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31]:42699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liHUY-0008P6-Je
 for qemu-devel@nongnu.org; Sun, 16 May 2021 10:11:54 -0400
Received: by mail-qv1-xf31.google.com with SMTP id u33so1910550qvf.9
 for <qemu-devel@nongnu.org>; Sun, 16 May 2021 07:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7LnBFW5fSh3VKASb4De0S9Ena1rdwhnkiY8x0DnPIig=;
 b=BYm6Sg4yNMxHtSNOZwsdfE+RUeUvgGu2Pa+wSHhRQggBuhiTmR6I96/xmhpwEKM1x5
 aKYSmrEOfobnvPjiSFtrLMYhQVmxyvf8l8wtJko5zVVuqt/IKDUKsObc9edRuFHGQ8sz
 yEhqs+lLqoPXFf2xucD8qsBmDbShjGOv/8Dcho8ly0sM3xuDgZnhylrU+d1hr4cLV+FR
 lUMlaYXJMDPp5BJPUG3YrBGNPFht0r/pPb4Z2ig8SxutZdf0uM7NPmQBNHHmrUyZ2x1d
 WV3Ui6rorhlu8bjVERWzmEKAuM4EaTgaLTaLfPvfRX7gJTYYFt/RE/6arewnwDUpyacJ
 BPBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7LnBFW5fSh3VKASb4De0S9Ena1rdwhnkiY8x0DnPIig=;
 b=ANQvrvjl/CkiTsOfYeyyWt6Z0OuDx4A7zin1c9ky7DR/lbhEIT23jnu32HcmgiZz7i
 FRuqy3yOtdv7Pj03UYwTxgVTLdUTvWx3bGQutgDBxqPy9J1PlidvbboxB6s3seszsrcl
 rtkwTDQCjTZ1VgydwBbybXr4nmdQWohIbl5qYMqSxj5yqFJuFwFqT+pLs2uxtHXZRYkH
 AaJdYsXYzlnWWBfGCJ47z3RfS99oMz2yfVWVi2Z3T+kzjR0gqX+YVduy//QTJEOn9hvc
 MvjQMQXNW1ccL9BDw6cs8H8Ocd+zhvvgP+Mx5uMuiFWuoU2q/RHrWGqIAx9pR5ZAWFTK
 yRgg==
X-Gm-Message-State: AOAM532ekGEITwFunXJVN1efsJpt5zYaePx6y44PWwPyTOAp++51zMD0
 bngNLasemJwI3uEvyv3tWvzSYBHKTZupB5flx0g=
X-Google-Smtp-Source: ABdhPJw5ZCeeGPHm2Tg3ZbNAgKT/Cd2PnXAln+gbjO26hoa6tsG0t/FQuuE7mr/SY3RwJg7qsOcKkA==
X-Received: by 2002:a05:6214:10e9:: with SMTP id
 q9mr4340567qvt.45.1621174297864; 
 Sun, 16 May 2021 07:11:37 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id j28sm8350102qkl.35.2021.05.16.07.11.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 May 2021 07:11:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 4/4] accel/tcg: Align data dumped at end of TB
Date: Sun, 16 May 2021 09:11:33 -0500
Message-Id: <20210516141133.739701-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210516141133.739701-1-richard.henderson@linaro.org>
References: <20210516141133.739701-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f31;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf31.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

To better visualize the data dumped at the end of a TB, left-align it
(padding it with 0).  Print ".long" instead of ".quad" on 32-bit hosts.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210515104202.241504-1-f4bug@amsat.org>
[rth: Split the qemu_log and print .long for 32-bit hosts.]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/translate-all.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index ae7e873713..fbf8fc630b 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -2042,8 +2042,15 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
             int i;
             qemu_log("  data: [size=%d]\n", data_size);
             for (i = 0; i < data_size / sizeof(tcg_target_ulong); i++) {
-                qemu_log("0x%08" PRIxPTR ":  .quad  0x%" TCG_PRIlx "\n",
-                         (uintptr_t)&rx_data_gen_ptr[i], rx_data_gen_ptr[i]);
+                if (sizeof(tcg_target_ulong) == 8) {
+                    qemu_log("0x%08" PRIxPTR ":  .quad  0x%016" TCG_PRIlx "\n",
+                             (uintptr_t)&rx_data_gen_ptr[i], rx_data_gen_ptr[i]);
+                } else if (sizeof(tcg_target_ulong) == 4) {
+                    qemu_log("0x%08" PRIxPTR ":  .long  0x%08" TCG_PRIlx "\n",
+                             (uintptr_t)&rx_data_gen_ptr[i], rx_data_gen_ptr[i]);
+                } else {
+                    qemu_build_not_reached();
+                }
             }
         }
         qemu_log("\n");
-- 
2.25.1



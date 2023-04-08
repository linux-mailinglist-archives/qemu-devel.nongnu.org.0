Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E516DB86F
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Apr 2023 05:04:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkysC-000465-BE; Fri, 07 Apr 2023 23:04:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkys2-00045A-3L
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 23:04:06 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkys0-0004VC-6r
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 23:04:05 -0400
Received: by mail-pl1-x632.google.com with SMTP id ik20so271255plb.3
 for <qemu-devel@nongnu.org>; Fri, 07 Apr 2023 20:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680923042;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bW/9qvl2SShSEu4dmNJ/Qic9SYEvM+f5ESU99Mx+Y1A=;
 b=LWXAT+4rPistnTNVuibEQuEPdepdbNeUGwua2dTNuoLLBUVZazqZMhHtqNzHwp8fF1
 6G2StfcY2nsmu9X6xtQTS0vPdEk1CKaTo/Qy3+RpsXZ6ZFZt5oZkaGuCIP3npGuhyEo2
 AW7OB1yQo445RHA4SVcdhUNQQm2FdCgaO6hj5LSoI2f/RA4i4ktMpOWhOCM334w/hazp
 nmDshBhJLB5zZ6oSQb2u/XyZ8bCSUepclXQx5cNclgM/GeDOgYfp3vPGTagLzBT8sCdy
 YYB1xRyGbwL/fLF7rnfgLw74jEIsomCb/sN7JjGqUX5F78p0JEHOeidysYMOVk1NLL9I
 GnHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680923042;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bW/9qvl2SShSEu4dmNJ/Qic9SYEvM+f5ESU99Mx+Y1A=;
 b=x5uk7tkMhymhDud9MT+9gufuTOY3gF+yMv3NcYF1yxu20J2hxVDhsy///mzatH9pub
 3dkzzkA1NUFIQGJm6EU/mwwjwkx0S5HNjckwbytlpYggf3GYOea1vlYJRrc9F+1eDbbc
 th+wbThWjOcC/fZ/+QfCIMc/jnSJcyywDa/UTTZJuLZoli+NJipXe6Xr3rXht90iz3pK
 N1AC3CWFa2yYX13I6fpYKpzvymYiqU4vBBuV5kVsjweE8E9dOaLW5C37PoapKiTT8l6W
 QIGSry6GHAnLnyRvSlsnEGLyr5S/X5jl+Cgfy3gKIYqm/xh1LBtySaPJnXeQdl+FLmRM
 Hg2w==
X-Gm-Message-State: AAQBX9dzGMI6gtDjWOBL9aKXHp4Ro17vemjlLhZ7QjYJyt76TURkztyE
 rh6ev+mpx5LGYiHdlovg+2Ki1VOEpJM/X8vC5ok=
X-Google-Smtp-Source: AKy350YpX7ld2D1W5WZkE4PQ1MWlwESbzaWz5YpiFainDMhJT3gww3V+MHQDDca/JQiUWkEjrlZAxw==
X-Received: by 2002:a05:6a20:6504:b0:d9:162d:98e8 with SMTP id
 n4-20020a056a20650400b000d9162d98e8mr4537341pzg.13.1680923042415; 
 Fri, 07 Apr 2023 20:04:02 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 c12-20020aa78e0c000000b0062b5a55835dsm3687025pfr.213.2023.04.07.20.04.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 20:04:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 02/12] tcg/mips: Move TCG_GUEST_BASE_REG to S7
Date: Fri,  7 Apr 2023 20:03:49 -0700
Message-Id: <20230408030359.3368868-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230408030359.3368868-1-richard.henderson@linaro.org>
References: <20230408030359.3368868-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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

No functional change; just moving the saved reserved regs to the end.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target.c.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index c24b780818..cc4ca2ddbe 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -86,7 +86,7 @@ static const char * const tcg_target_reg_names[TCG_TARGET_NB_REGS] = {
 #define TCG_TMP3  TCG_REG_T7
 
 #ifndef CONFIG_SOFTMMU
-#define TCG_GUEST_BASE_REG TCG_REG_S1
+#define TCG_GUEST_BASE_REG TCG_REG_S7
 #endif
 
 /* check if we really need so many registers :P */
@@ -2500,7 +2500,7 @@ static const int tcg_target_callee_save_regs[] = {
     TCG_REG_S4,
     TCG_REG_S5,
     TCG_REG_S6,
-    TCG_REG_S7,
+    TCG_REG_S7,       /* used for guest_base */
     TCG_REG_S8,       /* used for the global env (TCG_AREG0) */
     TCG_REG_RA,       /* should be last for ABI compliance */
 };
-- 
2.34.1



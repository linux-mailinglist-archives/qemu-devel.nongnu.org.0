Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 756976FEDA2
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 10:14:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px1JG-0007UP-QW; Thu, 11 May 2023 04:05:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px1Im-0006gz-Kl
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:05:29 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px1Ic-00016C-80
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:05:28 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-50b8d2eed3dso12546869a12.0
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 01:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683792316; x=1686384316;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z9dBosImySTxw+alMraFP8+RgZnXakczEY05QormSAI=;
 b=YkAmARu+C0e4WFskePgIaWMTDdtuqmyjl3Dusjf3iYYhlk9ZSTeU0WEdGFGfenWw5v
 epeAu7yn1XqAJGDLTFY5S4xo8X5ibMktpyEvPz95uBmYQwAqwUcrpNPgSblvxRkPJ/qr
 X8porZgVhkkLh3skKe4B81TTkSvPKMgw6toTK6isGbzNL/SheeX/Pg6EcmapLa1I+fRw
 lsR/Nka36L4opDgNEknrM0yepPLWSIvrt7aod7vRrsq1/WkXkPIyz0RCLZYLhhikBDBJ
 AptC4oj7s/+tgLAgCD9N6sAQ1ipCQfjTQJ4VT3OSLfFYTJ/5FlyuPaKHLdTrcp+MHyP4
 ygPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683792316; x=1686384316;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z9dBosImySTxw+alMraFP8+RgZnXakczEY05QormSAI=;
 b=dq0UuN8hF0FudexOAR7kpHPJdHYNj+/e8SBCu0BTtEm8Zi6hZzHs2H7p5WRYJzAQe4
 9R+0BANJAX+NBSBa3tDej6c+kfML+snet1qHmgcBd3IoLLg4xkUde4HfTFZg4YTKDqHP
 r/4cbMqLpQRsLAvuYNsIueJf4WWoBFRfgHmK8SzhCrI213+2lx0QZpgbiOiVx1k8r11+
 RX5YA+V1HMlWZxKvuBG8oCHasDPJ/wSWOenI3GO9fGZtRmYJ4M/hpMcx68Su1yBisjXw
 Z48jbiwSLERQJwjXaLCRWoy1k/Ni+FJ+sCwzq1MusBmC9ve+XW5tGfxi0ymcUibHvr6B
 wiLA==
X-Gm-Message-State: AC+VfDzxufmBuPBT+MyYPr53aLijBd3h7QbyH2qC2RjQIbOqGLEBsDei
 h72bXY8LPXXN7Idw6Svt3+hh+oEvW5KVOe6q8d7r5Q==
X-Google-Smtp-Source: ACHHUZ6a/a21INyVQnJgvRWUjv/gtEzGGDGMaz5v5gvsieIM4gJCo1V3K5Isx7JMfOpJVTd1lwn/EA==
X-Received: by 2002:aa7:dd11:0:b0:506:2c70:3066 with SMTP id
 i17-20020aa7dd11000000b005062c703066mr15776826edv.21.1683792316327; 
 Thu, 11 May 2023 01:05:16 -0700 (PDT)
Received: from stoup.. ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 i12-20020aa7c70c000000b0050bd7267a5csm2662095edq.58.2023.05.11.01.05.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 01:05:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 39/53] tcg/s390x: Use ALGFR in constructing softmmu host address
Date: Thu, 11 May 2023 09:04:36 +0100
Message-Id: <20230511080450.860923-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230511080450.860923-1-richard.henderson@linaro.org>
References: <20230511080450.860923-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x52b.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Rather than zero-extend the guest address into a register,
use an add instruction which zero-extends the second input.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.c.inc | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index dfcf4d9e34..dd13326670 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -149,6 +149,7 @@ typedef enum S390Opcode {
     RRE_ALGR    = 0xb90a,
     RRE_ALCR    = 0xb998,
     RRE_ALCGR   = 0xb988,
+    RRE_ALGFR   = 0xb91a,
     RRE_CGR     = 0xb920,
     RRE_CLGR    = 0xb921,
     RRE_DLGR    = 0xb987,
@@ -1853,10 +1854,11 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     tcg_out_insn(s, RXY, LG, h->index, TCG_REG_R2, TCG_REG_NONE,
                  offsetof(CPUTLBEntry, addend));
 
-    h->base = addr_reg;
     if (TARGET_LONG_BITS == 32) {
-        tcg_out_ext32u(s, TCG_REG_R3, addr_reg);
-        h->base = TCG_REG_R3;
+        tcg_out_insn(s, RRE, ALGFR, h->index, addr_reg);
+        h->base = TCG_REG_NONE;
+    } else {
+        h->base = addr_reg;
     }
     h->disp = 0;
 #else
-- 
2.34.1



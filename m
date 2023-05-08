Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2D06FB246
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 16:10:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw1Y6-00044S-GM; Mon, 08 May 2023 10:09:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pw1Y2-00043i-V3
 for qemu-devel@nongnu.org; Mon, 08 May 2023 10:09:06 -0400
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pw1Y1-00005C-8Q
 for qemu-devel@nongnu.org; Mon, 08 May 2023 10:09:06 -0400
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2ac7c59665bso52862451fa.3
 for <qemu-devel@nongnu.org>; Mon, 08 May 2023 07:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683554942; x=1686146942;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=le6MWj6oc2aqEll5u4Z5ahYCsXhkYC0uZ3oV1PbWWfg=;
 b=E+79Nb95kfN/do2sGX8/URmYKWB/agPnKT8eIrnNSoPD+xsQ4jjI/7FZvcNQPNMM0r
 TNHN5GhzqH496tYD9DgoZHh67tvxlGwuniVF3ckvA/2oV9ZF42nkRMyLjsZ7tU9wIU8b
 Mg4In9Sw2BBNBXrOqz+V7F0xGJQHaLi8rE0B54eKdqWBkZE7UKx6Y6pd8jOeo0nsntNt
 14k2OlEpOzK/3zOd30c+x9woplr8QWaA6UfoDjajSdYLrlljckxMuUbuNnNtTv9Q6nPJ
 sPTDx8fX+q+/2TcH4GNIGhZQ3Z1EY1gSGJLxc1A7llvrzqIFxBlfpAzcKyeHO6/g2TnY
 /04Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683554942; x=1686146942;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=le6MWj6oc2aqEll5u4Z5ahYCsXhkYC0uZ3oV1PbWWfg=;
 b=ETvG8btDuKbArF6ZtIkO/LCJXcFr45DNjGktoG1XHSAc/ajq6UF1w72oCFRDjiWFk7
 1HqjWcw+vbtPP16NUr2G4pGBajNe4gUbLkXINaxXr/qPiuJlkPC3yYryHcpixVFF8XmV
 g23bbSfjMfp92YBkIY7b3NGJnYwEMzmT1EnDq0dmfTIxDuUQiY8z2QiuaLKTaqx04ice
 ls0Xa+3mifVwAU+R8i0A9Ed5UP160zYly+20z5vdg+eZfToHxgyHXhOvpNmH24AGLlHB
 LvdC17IMlCbmOyM6zYY/+T+4n/6+sUGFm4Kb02kZIFc0imUa5fmmj/z8ELB+1p2NJhf4
 VMMw==
X-Gm-Message-State: AC+VfDx9nP6YEF/gqe/NTrwClC7hc5vKjXQRh+A8p/eif9BLWgg9nn4d
 6hbWR8vLdyH/1DN5gcnaP2G8GNl3CH0uMpub4NAC+w==
X-Google-Smtp-Source: ACHHUZ7N0f+YtACuipyCFFo/OECxscvuWKJBSUAprxTRsm6nDDj6ykw3EtzHwexiVqGfe/8iwGy4Ug==
X-Received: by 2002:a2e:3e14:0:b0:2a8:a916:6b1c with SMTP id
 l20-20020a2e3e14000000b002a8a9166b1cmr2648615lja.4.1683554942308; 
 Mon, 08 May 2023 07:09:02 -0700 (PDT)
Received: from stoup.. ([91.209.212.42]) by smtp.gmail.com with ESMTPSA id
 o18-20020ac24352000000b004eed8de597csm6373lfl.32.2023.05.08.07.09.01
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 May 2023 07:09:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/m68k: Fix gen_load_fp for OS_LONG
Date: Mon,  8 May 2023 15:08:57 +0100
Message-Id: <20230508140857.137405-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22f;
 envelope-from=richard.henderson@linaro.org; helo=mail-lj1-x22f.google.com
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

Case was accidentally dropped in b7a94da9550b.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/m68k/translate.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index 744eb3748b..44d852b106 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -959,6 +959,7 @@ static void gen_load_fp(DisasContext *s, int opsize, TCGv addr, TCGv_ptr fp,
     switch (opsize) {
     case OS_BYTE:
     case OS_WORD:
+    case OS_LONG:
         tcg_gen_qemu_ld_tl(tmp, addr, index, opsize | MO_SIGN | MO_TE);
         gen_helper_exts32(cpu_env, fp, tmp);
         break;
-- 
2.34.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E2B407E62
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 18:04:13 +0200 (CEST)
Received: from localhost ([::1]:51916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPRxk-0002Xq-Gs
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 12:04:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPRs5-0002QO-0Y
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 11:58:21 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:37720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPRs2-0003xu-KW
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 11:58:20 -0400
Received: by mail-pl1-x631.google.com with SMTP id f21so2021880plb.4
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 08:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Zk1Xc7v798/v3MVPLkwWlC7sy9W9XT/J+dwHkhEwhvw=;
 b=nKS8ugSATycLyeQxIyMfhf4kc+XW54il7LyNeNU4jzkDnC6Bl1XlH/nJif/Q6caolD
 PXj82aFQ1eCUYvk+5m22OkOnF6M0U6bCW+HPuBkO4psXUu8/MQyX22r/RNmBCryGWibY
 av3D6bV195o0JajS42wppNn28z9uQpXA/l8o50w8tVZtYKlJhZFsflmYq5BD4bj2tv5/
 D5UVuNs0eogkB5sotsh4m/dfjM0WZjqjKk4+G0FExCFcKfdmGi5n+YYglFMdcINkkSWf
 /k49+C60IcuKBKpqecpLefyRnmrnbut8sLW+aUKxp8DYlFhWA3htdEt5AUClTpIX1Xdh
 S89w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Zk1Xc7v798/v3MVPLkwWlC7sy9W9XT/J+dwHkhEwhvw=;
 b=YQZu7Wo7o64E1jRzzh9vBlfec2ynFl9OsZ86/G22ycogbO+p/RRQ4lz7wcFKraqGz2
 lMTpEgu6r0ZJvhKRImFTZrs+ZGuf67YITJBrGrYIZlr1LWBVtNIGitlLtXUUIlZvOPNJ
 NfnhsuafoqJ/UV5qxyHU/Axb4dN3ZSj+tdfgR5RLQUn2wchyzjzQi7HygyjVCdmasSh+
 L5T6u4FMNDsLdzLq7cnPHg+sRGe6aY7TFnkV32dFBYc81ED83fQbTKzkkoOrcUcvxqik
 l+Y1yIZyiKEpq2Ysrb+42VSexSlJiZsDgGNgQw1NQzdB/Dp+EIQx1p//CZdHTciU+Coa
 /YYA==
X-Gm-Message-State: AOAM5307U4Crlf0fHfQvggl2sGh1TTFf3X8E5SY1zGUolMnsuXoEwP4v
 Hs1VpRWBVaeG3ZF+E1b73NkRTnHlERmv9g==
X-Google-Smtp-Source: ABdhPJzvNWjuvi32Lhiv6FgSWHKvDooBAScvi5lCBsiwx7EpR9s7oRnDw09CkWS1c4k7zKN5qxXiXQ==
X-Received: by 2002:a17:902:7e89:b0:13a:6adf:176 with SMTP id
 z9-20020a1709027e8900b0013a6adf0176mr6644218pla.48.1631462297275; 
 Sun, 12 Sep 2021 08:58:17 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id v13sm4439415pfm.16.2021.09.12.08.58.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 08:58:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 9/9] tcg/arm: Fix tcg_out_vec_op function signature
Date: Sun, 12 Sep 2021 08:58:09 -0700
Message-Id: <20210912155809.196236-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210912155809.196236-1-richard.henderson@linaro.org>
References: <20210912155809.196236-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Jose R. Ziviani" <jziviani@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Jose R. Ziviani" <jziviani@suse.de>

Commit 5e8892db93 fixed several function signatures but tcg_out_vec_op
for arm is missing. It causes a build error on armv6 and armv7:

tcg-target.c.inc:2718:42: error: argument 5 of type 'const TCGArg *'
{aka 'const unsigned int *'} declared as a pointer [-Werror=array-parameter=]
   const TCGArg *args, const int *const_args)
  ~~~~~~~~~~~~~~^~~~
../tcg/tcg.c:120:41: note: previously declared as an array 'const TCGArg[16]'
{aka 'const unsigned int[16]'}
   const TCGArg args[TCG_MAX_OP_ARGS],
  ~~~~~~~~~~~~~~^~~~

Signed-off-by: Jose R. Ziviani <jziviani@suse.de>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210908185338.7927-1-jziviani@suse.de>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target.c.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 007ceee68e..e5b4f86841 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -2715,7 +2715,8 @@ static const ARMInsn vec_cmp0_insn[16] = {
 
 static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
                            unsigned vecl, unsigned vece,
-                           const TCGArg *args, const int *const_args)
+                           const TCGArg args[TCG_MAX_OP_ARGS],
+                           const int const_args[TCG_MAX_OP_ARGS])
 {
     TCGType type = vecl + TCG_TYPE_V64;
     unsigned q = vecl;
-- 
2.25.1



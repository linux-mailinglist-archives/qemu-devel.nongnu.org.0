Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B58168A673
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 00:00:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pO51s-00037Q-8i; Fri, 03 Feb 2023 17:59:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pO51q-00037H-Rc
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 17:59:35 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pO51p-0005uH-4c
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 17:59:34 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 cl23-20020a17090af69700b0022c745bfdc3so6291024pjb.3
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 14:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=39PPEuhVRVsZVvJe6r6zmHD1Uy8sB4o4fQgIEwRJuDQ=;
 b=nLpCmUCmX5eX9m3xWp7Ghjbmdj1ikBZdCPyvqlnS8RpWuAr4lI2gjUfJwX147ubHuj
 P9g2rKJ4+Fq/zGXt0lb4NY2/z62hup8+bVURlpGOApmUyxlSR/o2/NAiRKOhsx6B6SNI
 uJGLS82zZQbjG+aaV0oJ2TTvji33TuNg78uBADURgImiUFQ+E1KIbY1gHK03Jop6iUE8
 zQLcqbzcsI9D8Oi24yIO8XKaJSR+EdNuiuuJDIL88VXLS+pNLAJn7KlWFNcSDAEi0FLh
 3dX35pquOIxTge/fH2Nx+KRBysdaTsFDtRHKVWHrMnGfwIuigdQOAyFklAUUgygtUspZ
 Ogwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=39PPEuhVRVsZVvJe6r6zmHD1Uy8sB4o4fQgIEwRJuDQ=;
 b=yCbKsYp7FtjgH5YkJubuzlKvXfC62cXwaLS2xhed4sTt+MJSZ3vuIFsYoZCx2QbYI1
 jAIUAPLScDDzVevgBG+LQ7HIS0bUUJfjIGxTWB2C/JDOT+b7LOsENL/MSH/hdu3X91YB
 gpz6/y02wYsG5x8sngHBvlCFqvuNAO3sjQbQLmY28Hg2ccyu19WJAwePiJ2zX630P0nb
 TUZVKObY6OYrx7fw2Ky5HxMLf/rSuJ66d/uHJjp6xeMeB9fjh0hIxsreEg+ADGzc5g05
 PzTomS1/o8EoMHgUhL3M07NhXuSPj9sI8orSlrXssq2O7ySGvk6GpnI5cVCxqknZTg42
 +UPw==
X-Gm-Message-State: AO0yUKWhXIJYkx4PHe8DyDur138qVfER5NOMJgbjeUgLO0b1cKaZqJe2
 M7ilrUM97tIRRc32sc53nP7XZLxPAqDrUrFs
X-Google-Smtp-Source: AK7set+iIKWzc2XgUeKKOShTnLNEs/eM6A8oz1IwRNWzQj/xPZ2UAG3xcPKu/AG2UY28OtAxbyJziA==
X-Received: by 2002:a05:6a20:d2c9:b0:bf:7ae0:5faf with SMTP id
 ir9-20020a056a20d2c900b000bf7ae05fafmr8935710pzb.46.1675465171311; 
 Fri, 03 Feb 2023 14:59:31 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 c25-20020a639619000000b004f198707cdbsm1966811pge.55.2023.02.03.14.59.30
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 14:59:30 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] tcg: Init temp_subindex in liveness_pass_2
Date: Fri,  3 Feb 2023 12:59:28 -1000
Message-Id: <20230203225928.4129774-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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

Correctly handle large types while lowering.

Fixes: fac87bd2a49b ("tcg: Add temp_subindex to TCGTemp")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index fd557d55d3..bc60fd0fe8 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -3063,6 +3063,7 @@ static bool liveness_pass_2(TCGContext *s)
             TCGTemp *dts = tcg_temp_alloc(s);
             dts->type = its->type;
             dts->base_type = its->base_type;
+            dts->temp_subindex = its->temp_subindex;
             dts->kind = TEMP_EBB;
             its->state_ptr = dts;
         } else {
-- 
2.34.1



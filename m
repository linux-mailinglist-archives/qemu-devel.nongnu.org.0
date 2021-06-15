Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 519243A8574
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 17:54:01 +0200 (CEST)
Received: from localhost ([::1]:34900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltBO4-0003xL-BN
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 11:54:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltBEt-0005om-PH
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 11:44:35 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:42936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltBEa-0000v4-Go
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 11:44:30 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 l7-20020a05600c1d07b02901b0e2ebd6deso2301837wms.1
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 08:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=qhIXGkQ5B2f72hCsDiiPtZauaOm4OlOs0XmLE/HyYSI=;
 b=zM2+d5Q7C5gWWr83CsdJLYqWt3u7Cu8HYkcYkeMTmBjhX+XucYqaISIfgJCsoDS5LA
 ZhL54XywPB+Qkz4NHVf1PIfnJRKnkgolSU8+avHwsXx9axowL9fatdPlXLUyxkP3QA3n
 DNRkeUGDh+Y2lajGycZJsZkYnXDdOKEt9vZouFIKk96kcQ9IPmCnt802ZbVMXK8kb4Op
 XDGMHb1Z9DsFvffySZiDOuuiLde60kKSx6Sa4mP+57CsXFKxkxyEsPp2XUtnW0DtRGDQ
 uPIwPagXz4cFjy1HHlm4Jx2LBo0siGX4LSAcSfmS5nWut0nv7KwnJZLnjbxREVYODa8H
 asdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qhIXGkQ5B2f72hCsDiiPtZauaOm4OlOs0XmLE/HyYSI=;
 b=McT/MNES2Kv4GrD55XfpVX+xgiSV0y3ROmBsGpA02+GixsZUZMFBGJqiqNVWZy7GmL
 /NMEcLGHz4VvL066zNOyrk5bnc3QOfq1LoKa/FOESfWn0mSiKAm8Yj/cWZRLe6MbXmv1
 3mEDl868WkyIhSLFvbfFgZD37V7AckURMBZs5wD+Y0lTV84LfxBP2Z2BYFuXOCu0k6jk
 PpdLzSefDovxeyYSU/VhpOVlZYmTYxbO8VWCyH6jIPeGwg09ryFaf3O2KJZsgFKuWL2W
 eDLk2J0bBwUIA7OYJJL2aBkXaaYja3Ou4bzm06kCqzhiG51VRwAB01GODMK9y0F6gw8b
 zyyA==
X-Gm-Message-State: AOAM533CoICh78HCmtj+BahitcimSSnP8JatviNCeO0Z888orF3FRyuc
 eopFQ8ZUK84zRj23gPMD64il4o+tIGAaSw==
X-Google-Smtp-Source: ABdhPJw5L6KWrbZiFGbQzAb0jbnFJ8PoEfmqHkm04ktk0UwytxQ2OOw713Arq2AhRQ74g567JJH5aQ==
X-Received: by 2002:a1c:e91a:: with SMTP id q26mr6033687wmc.170.1623771850910; 
 Tue, 15 Jun 2021 08:44:10 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d15sm18985662wri.58.2021.06.15.08.44.10
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 08:44:10 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/28] target/arm: Remove fprintf from disas_simd_mod_imm
Date: Tue, 15 Jun 2021 16:43:40 +0100
Message-Id: <20210615154405.21399-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210615154405.21399-1-peter.maydell@linaro.org>
References: <20210615154405.21399-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

The default of this switch is truly unreachable.
The switch selector is 3 bits, and all 8 cases are present.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210604183506.916654-3-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-a64.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 2477b55c53a..9bb15ca6189 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -8291,7 +8291,6 @@ static void disas_simd_mod_imm(DisasContext *s, uint32_t insn)
         }
         break;
     default:
-        fprintf(stderr, "%s: cmode_3_1: %x\n", __func__, cmode_3_1);
         g_assert_not_reached();
     }
 
-- 
2.20.1



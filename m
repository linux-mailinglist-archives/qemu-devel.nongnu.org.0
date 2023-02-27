Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 328E96A3AEF
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 06:53:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWWJB-0006J7-JO; Mon, 27 Feb 2023 00:44:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWIm-0005Nl-0R
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:43:56 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWIh-0005Ai-Th
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:43:55 -0500
Received: by mail-pf1-x42f.google.com with SMTP id c10so2155752pfv.13
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 21:43:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RCxesrIpTbTxRzaqZYaMu9uuGA6eHqItNDhI0BRycuU=;
 b=l+cUrSbutYZtb1yNDz9VpYy+7RnrJuM779Qjay6GlDr4fZ1CmFmafG/8/twcwjxgQ5
 pPc3dgCBdBKqGj5JiD1fTt7FOdcr7S2PPEAt3AC2wxv2SCMNU1iIpe6QQ9fi44Sww/ZD
 J4l5QpO4BFCEdO5aXCbeCvIsFSvZ+uA0MT1wkSutLw9qkkBKH2eO8cgfo/Sm101iYJZ9
 CQuvC/6/+sz5GYzmgqikvLP451k9fXCbYBLoeUWJIdAW9U6Cx3AQwn99Hz/Fwr/STElX
 n3VlQmBBGlPPFl7SdnJwuCxG7Bb8oP0ePJCQL+ityr3u5T/lMD7FOZ565hKDgXp17pdu
 R1Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RCxesrIpTbTxRzaqZYaMu9uuGA6eHqItNDhI0BRycuU=;
 b=OAcac11YXEFHUFH/OkCsS+EzN6xPOkyeQn3wU1/gC8lRWRxo8FKLGRw7V+UpMatvxk
 9WqBV+etysSETny/GrWCFwWogqP5EU6/nOBc5f82+nNWYnQyy7VBdALNGKL/Ihize3ug
 /1H7dtCEZAcKFNUVo/XHZ8X7cu7tyxpBZEqqaSWks0PtSB4IxcUFV3DmGX8sUzCsQAPd
 +Km3UgDLN3X6FvUuoWV8l7OzfD0aw7xauPlZANefJnrfELkkXTc2WUtHvrrmYeI37M0g
 udNDg7VkuIu9LB0f1h598gCqJkf7thjVuW/hH8Vw92cbLz7hjmS99Qs189JS7qMQYszY
 xFUQ==
X-Gm-Message-State: AO0yUKVkT2jA9u4RM/NbsWPRdCKy5meuQwUlusVdnylevHM4/dQyaGdh
 qOFZqabgLiRJGgG3scKGSBqOSyR00pmGWtSukt4=
X-Google-Smtp-Source: AK7set81k26dX67OHA/6ferdYh6DgQNY0UAi/kprRMt507IMXYtIVxKnTMsg2IieNomEfYMuAZf56A==
X-Received: by 2002:a05:6a00:47:b0:5cd:d766:8a2b with SMTP id
 i7-20020a056a00004700b005cdd7668a2bmr18700523pfk.6.1677476630933; 
 Sun, 26 Feb 2023 21:43:50 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 d10-20020aa7868a000000b005cdc64a287dsm3317137pfo.115.2023.02.26.21.43.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:43:50 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 25/70] target/m68k: Use tcg_constant_i32 in gen_ea_mode
Date: Sun, 26 Feb 2023 19:41:48 -1000
Message-Id: <20230227054233.390271-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Return a constant for an immediate input.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/m68k/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index 7a87811427..7435e51acc 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -924,7 +924,7 @@ static TCGv gen_ea_mode(CPUM68KState *env, DisasContext *s, int mode, int reg0,
             default:
                 g_assert_not_reached();
             }
-            return tcg_const_i32(offset);
+            return tcg_constant_i32(offset);
         default:
             return NULL_QREG;
         }
-- 
2.34.1



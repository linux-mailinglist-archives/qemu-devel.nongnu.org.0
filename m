Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F7D546A4B
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 18:22:20 +0200 (CEST)
Received: from localhost ([::1]:59366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzhOt-0006Tj-20
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 12:22:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzhAp-0007Nf-HO
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 12:07:47 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:38239)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzhAn-0007Eh-Qu
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 12:07:47 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 m39-20020a05600c3b2700b0039c511ebbacso1361396wms.3
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 09:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=PP8qwSqnigVQA93j9CHZH7QMp7VDqm3tVD3v9TpVNXU=;
 b=JrQwuvnO1Ib67xKpdJAuUhACi5bypJWivOu+IT/7FhQXIVnqT65fKqAJO/dBllLeB6
 AmxfHFDP3ONTTREo2pKWgEVtSxNWdHgEnF0hL1JlJTFm9zLnEX3isA2+CpZAnohmckwb
 g3+fgnAUwqqteHzZPscrUBy8NCh16JcalNjzxwIDQSc7dbdLE9vdtEOJ6E+yztk5LWLU
 21nHt7mMR5nYihSLiLWHLmmifv9u0XvUrJq7dcx0Z4S9XNACNALILaYl/Dwan1t2Vtor
 wBVlHKMKyjIanw87js+MpDJXOaMBd60jNdjtgL/IgWirmMS6amHwZteo0w/Am63YhXUO
 QbEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PP8qwSqnigVQA93j9CHZH7QMp7VDqm3tVD3v9TpVNXU=;
 b=gjGfmCDiuIXJqsPvXZAR92Ut/tGZm3RxQQ3EpJ4J58JW8dqtxJ6JjywuuLO1SW83Km
 9I28HDpb1zN2clOvCb7jUwOIheIXChaSVs/l8iCEdY3CO0dw1ViC8o6jJr57vIslGmC0
 6/2bVKwVAGmZbNdqv0pTri3epE66NrwiKD6bK5dPgFcyUsYzegXjsv1dMOzttsGaKGa+
 RjBTwSjwPRw50dCkqZCPh9l6i2MoYLMeLhfhZdW6M7IXESChbpRc3oFrZ3n2jPfgO8m6
 bWYR76sG5tA4tkEB/XObc92uv1O5jBD4cnTQMoQ3OwTiZDKMa6T/vo9aUBmWtIgrMVUA
 c7fg==
X-Gm-Message-State: AOAM532q5R8yCZ3FkyQKuDMCLKNxsftz1hUQsDYz9mSH/s0LQP/Y1NFz
 dtU0pUlsK2hj+jmzZQefM3IRdu5tbyhHWw==
X-Google-Smtp-Source: ABdhPJweX9YNMpxvJOK6UhktPGfSjgqIWIEOTAUzs2WiLF6b2wluf3JfbR+TCHqhcBn6NcdHUPwSBw==
X-Received: by 2002:a05:600c:1c29:b0:39c:52b6:aad0 with SMTP id
 j41-20020a05600c1c2900b0039c52b6aad0mr441097wms.203.1654877262379; 
 Fri, 10 Jun 2022 09:07:42 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bp11-20020a5d5a8b000000b0020c5253d926sm14276053wrb.114.2022.06.10.09.07.41
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 09:07:42 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/28] target/arm: Mark exception helpers as noreturn
Date: Fri, 10 Jun 2022 17:07:11 +0100
Message-Id: <20220610160738.2230762-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220610160738.2230762-1-peter.maydell@linaro.org>
References: <20220610160738.2230762-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220609202901.1177572-2-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index b1334e0c42e..5161cdf73dc 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -44,9 +44,9 @@ DEF_HELPER_FLAGS_2(usad8, TCG_CALL_NO_RWG_SE, i32, i32, i32)
 
 DEF_HELPER_FLAGS_3(sel_flags, TCG_CALL_NO_RWG_SE,
                    i32, i32, i32, i32)
-DEF_HELPER_2(exception_internal, void, env, i32)
-DEF_HELPER_4(exception_with_syndrome, void, env, i32, i32, i32)
-DEF_HELPER_2(exception_bkpt_insn, void, env, i32)
+DEF_HELPER_2(exception_internal, noreturn, env, i32)
+DEF_HELPER_4(exception_with_syndrome, noreturn, env, i32, i32, i32)
+DEF_HELPER_2(exception_bkpt_insn, noreturn, env, i32)
 DEF_HELPER_2(exception_pc_alignment, noreturn, env, tl)
 DEF_HELPER_1(setend, void, env)
 DEF_HELPER_2(wfi, void, env, i32)
-- 
2.25.1



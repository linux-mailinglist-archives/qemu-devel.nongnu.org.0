Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8060C4D10DB
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 08:24:04 +0100 (CET)
Received: from localhost ([::1]:55608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRUCQ-0007t7-AL
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 02:24:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRU8m-00051D-9e
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 02:20:17 -0500
Received: from [2607:f8b0:4864:20::102a] (port=46022
 helo=mail-pj1-x102a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRU8k-00063T-EY
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 02:20:15 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 m11-20020a17090a7f8b00b001beef6143a8so1580592pjl.4
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 23:20:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NA9HskFqPeLh+02a0cXnYrdAXovGtw+F2Po8AxVhC7E=;
 b=nHYJ9QGlcMLqmIbooL8I0acm0MFAn7jtSXsIGEtOTfObF2X++jLXIKZprmdFM6VAAf
 nOGR3wl8ItjIwkd19etXXS8vFmmsJBObOOHsneWnZryQtuV90if2Wk+jE4XmYs0dP63A
 P2w4QcPobGKhdTxeK9vTGhyRXzvN9CgF/Fk3OlqhDKM7Ua7EB1a398XSerlnSxEr8/lw
 cb3J+9zYtqV9bIqEYOzYE2LDMR6xnYwiidnv7g1tVr3dKtOKwTJkLqoOZ1DagUvejtmT
 U6PMnE3+rja/EhODBrYBYj61GLKyKlTcJdgBwP6SUctuOEOrg+REPBc6wSFSg6b3N4wh
 x9YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NA9HskFqPeLh+02a0cXnYrdAXovGtw+F2Po8AxVhC7E=;
 b=dgQgQ1oSNpoFCTfdLu8rD10jBUw4joNES+m5/55wYT1pjlWGYbQa6H0zB1uKJyPKla
 /ci8BfxevgJCU/hlTL0C4UP2oUahR3DOp9DvDNcPBYUXfCZWjiFA0FjIWFRdredCcUvr
 41LSEw1rpRc5z1tsibqR8Ky3i6obhx92kRRpyeK7a3pUgM5ykaPzpDcEUSibBloqbaQj
 CBn+umxUZaw3l5hUNddXVg/zhTak7YqaWHZstdb5svNiLwLHtkpI/X9jVbfgK5lNRlOA
 113mPEuhEMbyw2H7eWXglSb8B98rHRuU+07Oi/sBeBHgW59PYqbRORsixREI2ikQHS+l
 WpCA==
X-Gm-Message-State: AOAM533Ap34ZNtydO/Ps777RLY4EBin8r60XtLp3GuTkmrPiDRIxdhsC
 SqhaUkbhOy77ctjeezRL8ZFTQl2aY0Ck7Q==
X-Google-Smtp-Source: ABdhPJzE6/Ix0ixon6Q7FJ7/JA5jEl4/2+5M8uUxnMzp00nkYSsMYrGlFUOGr21ViqGC2LRuBtrlpQ==
X-Received: by 2002:a17:903:32c4:b0:151:c6ae:e24b with SMTP id
 i4-20020a17090332c400b00151c6aee24bmr16632491plr.85.1646724010861; 
 Mon, 07 Mar 2022 23:20:10 -0800 (PST)
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 p125-20020a622983000000b004f6c5d58225sm13790899pfp.90.2022.03.07.23.20.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 23:20:10 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 01/33] target/nios2: Check supervisor on eret
Date: Mon,  7 Mar 2022 21:19:33 -1000
Message-Id: <20220308072005.307955-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220308072005.307955-1-richard.henderson@linaro.org>
References: <20220308072005.307955-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marex@denx.de, peter.maydell@linaro.org, amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Amir Gonnen <amir.gonnen@neuroblade.ai>

eret instruction is only allowed in supervisor mode.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Amir Gonnen <amir.gonnen@neuroblade.ai>
Message-Id: <20220303153906.2024748-2-amir.gonnen@neuroblade.ai>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/translate.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index f89271dbed..341f3a8273 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -384,6 +384,8 @@ static const Nios2Instruction i_type_instructions[] = {
  */
 static void eret(DisasContext *dc, uint32_t code, uint32_t flags)
 {
+    gen_check_supervisor(dc);
+
     tcg_gen_mov_tl(cpu_R[CR_STATUS], cpu_R[CR_ESTATUS]);
     tcg_gen_mov_tl(cpu_R[R_PC], cpu_R[R_EA]);
 
-- 
2.25.1



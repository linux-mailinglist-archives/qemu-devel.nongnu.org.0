Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6266861956F
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 12:36:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oquyx-0001Fh-Bw; Fri, 04 Nov 2022 07:35:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oquys-0001Bd-Im
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 07:35:26 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oquyq-00086U-Ua
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 07:35:26 -0400
Received: by mail-wm1-x335.google.com with SMTP id p16so2857896wmc.3
 for <qemu-devel@nongnu.org>; Fri, 04 Nov 2022 04:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=OaH3AJ6++HqpYB2gMwyPaC+oyNj5p0BkbapcfI5PAjg=;
 b=dNaPdlqvrfIYhdca05Z+nNHc25pxVkN2v9HdKE+VNT0Jpv+paH0gxGBZFKs01wfqKB
 PBKTDgR1Dkuzjz3kNMUm8N8uMQXyXBfwj8p5KGGRzRA1GPs29xuh/Uqzoh8Dqv0xqW0D
 pUi08KNzXD9pMcenhot5nui/SIg3xqZinCU0Vy6K3kZr6nBWLilW3p6HkUe9wMWH51VO
 VgJzQF9EHuBu3RFjIg7c1F2Z8wXmAD2nPwZDoI+3tMyI8eXUzAytk+d6RUNip21QZ5Ns
 tCM9JKat1yky6bm7mNVIrPutF/fnolPzA24diEFGjmX28qEIwftxhQAPUh72P6t4ZHN7
 VA0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OaH3AJ6++HqpYB2gMwyPaC+oyNj5p0BkbapcfI5PAjg=;
 b=aXVo6FhpbDsXt4lAvHpAF9dle5bkq0iwEE020z95rjZLcIpMdM3lOVB8hEjar+sAur
 PhsVdJawNwbsRf5rHnKx4UBn1ISV4BCnDxxwoCbB+tONjegM7JzBsI/zgyWDNkijOzJv
 NsFRAyDKrBJMdayT5Mq9/m87NKT3ZkEqNKl4Fzoyhkh2BpVpilIdr7WsKbBzyRgw2cCM
 d9rRp/cszY7U0szzWIYhkwY3y1SC27crnpRmHFmidu0oeqoBI9PbWOX/K0EYeVzytgF/
 ltF64bcBqcrTNwj2g2e0W3W3NZl0beMZFLqtcJ1/dC58u1cXi5N57VM7Xlufj9Zl6Sjf
 yt8Q==
X-Gm-Message-State: ACrzQf03LEEmC68eCmwCT6FaGi0pP9zd2lIHxFBOPb557Og3+ldQ9O/e
 j9PXUwauo0HODx3H9bXFdqd11dFkga4jSg==
X-Google-Smtp-Source: AMsMyM6qf6Ugnn344TEx5XKTSVON1pPQCaeCWTWUmKjCYGMIfihudr0wrmRD4Evbtndl6G/qf2siSQ==
X-Received: by 2002:a05:600c:2242:b0:3cf:4ccc:7418 with SMTP id
 a2-20020a05600c224200b003cf4ccc7418mr32804125wmm.191.1667561723499; 
 Fri, 04 Nov 2022 04:35:23 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 g17-20020a5d4891000000b0023655e51c33sm3255743wrq.4.2022.11.04.04.35.22
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Nov 2022 04:35:22 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 5/7] target/arm: Copy the entire vector in DO_ZIP
Date: Fri,  4 Nov 2022 11:35:13 +0000
Message-Id: <20221104113515.2278508-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221104113515.2278508-1-peter.maydell@linaro.org>
References: <20221104113515.2278508-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Richard Henderson <richard.henderson@linaro.org>

With odd_ofs set, we weren't copying enough data.

Fixes: 09eb6d7025d1 ("target/arm: Move sve zip high_ofs into simd_data")
Reported-by: Idan Horowitz <idan.horowitz@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-id: 20221031054144.3574-1-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/sve_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 3d0d2987cd0..1afeadf9c85 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -3366,10 +3366,10 @@ void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc)       \
     /* We produce output faster than we consume input.               \
        Therefore we must be mindful of possible overlap.  */         \
     if (unlikely((vn - vd) < (uintptr_t)oprsz)) {                    \
-        vn = memcpy(&tmp_n, vn, oprsz_2);                            \
+        vn = memcpy(&tmp_n, vn, oprsz);                              \
     }                                                                \
     if (unlikely((vm - vd) < (uintptr_t)oprsz)) {                    \
-        vm = memcpy(&tmp_m, vm, oprsz_2);                            \
+        vm = memcpy(&tmp_m, vm, oprsz);                              \
     }                                                                \
     for (i = 0; i < oprsz_2; i += sizeof(TYPE)) {                    \
         *(TYPE *)(vd + H(2 * i + 0)) = *(TYPE *)(vn + odd_ofs + H(i)); \
-- 
2.25.1



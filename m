Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B24647BFF
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 03:09:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3Slw-0005z8-Ef; Thu, 08 Dec 2022 21:05:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p3Slu-0005yQ-VP
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 21:05:55 -0500
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p3Sls-0001x7-E9
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 21:05:54 -0500
Received: by mail-ot1-x333.google.com with SMTP id
 m7-20020a9d6447000000b0066da0504b5eso1970371otl.13
 for <qemu-devel@nongnu.org>; Thu, 08 Dec 2022 18:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6OEoXXqHMNZJwrhmfB7qxU47ScigEd04r0yEUlWf38k=;
 b=yCYWPUOJ+s+a0Rb21laCjCP8vqGLlGtP6c7Zb6EyeB/CQ/3pOC8g1oGBFvjolTqjVG
 dQFhNkRgIbeLBnrCytlSkoWVqR8yIUV8Vphiqad6xx/It70f2AXfj6VNJn7YyOslhd/9
 ZyVI8GQLg6Yd34kZlPLO0RvuGqUfu2a/sTwc1vQrt6lKH5s+zhlSD2AlaT14eZJ7tfdI
 CukVNcxJiRtL71+1OWqSeEMRP3enmd0yAKI56k8mmKgYEp3agX2EZJBlKlNnja5oa86R
 EO7RqODXej00Xm9KNY9IWGlf51xCk3LQdb39uxe9VZtTfF84LEMyTtly0VhI+t3w3F8v
 MYPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6OEoXXqHMNZJwrhmfB7qxU47ScigEd04r0yEUlWf38k=;
 b=UKLrq5nGT0lPL4JpvTQVv/k5s3kCGAn8OGRTCZj0Itl887juFKdxiw4az9bDAZPlf9
 Vk2ZDrku5lxDG0K0600rGHFk9/zfWZLn2+MRUNK75ACSvQ3tIi54jgVbAvCH7f22EguZ
 i+E+Dy8oOin7A+UVVppcs3luPcqdOK/YnHjs2N3TqQX9hEB7LmUWqiV5p/P+6AlSZrXU
 9mmmrf+HDC40hAolmDUrf38W7wWM7QuCnNrQTLXDTvsfnbk+GQWc1mCC9jcn0VoQ38ws
 U82cOifev0hGdFeBBxM5Hrh14h9mFTIPoVvV4Q0nOU6mIrAYAR9UV6+SKRZobVJrUgFU
 UuDQ==
X-Gm-Message-State: ANoB5pnQqWCMl84PaDMx2Owyb2wrblzJ/eUXA2dKZaXxht2lMdPKgIkE
 WlI65YtWxH2MQO1oeVRPtcoLKrW3VEG2tRNsfVQ=
X-Google-Smtp-Source: AA0mqf4++8ea/fvlGjYFYU6Z3J//djA1zJ88MbkHDyzjQIWjIaAMl46zBIILIzPhBVpopQ0cjvwvCA==
X-Received: by 2002:a05:6830:6482:b0:661:dfeb:ea4b with SMTP id
 ck2-20020a056830648200b00661dfebea4bmr2069078otb.10.1670551551359; 
 Thu, 08 Dec 2022 18:05:51 -0800 (PST)
Received: from stoup.. ([2806:102e:18:2efc:d298:de6f:2ed:87a4])
 by smtp.gmail.com with ESMTPSA id
 s14-20020a05683004ce00b0066f7e1188f0sm53531otd.68.2022.12.08.18.05.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 18:05:50 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com,
	iii@linux.ibm.com
Subject: [PATCH v4 16/27] tcg/s390x: Issue XILF directly for xor_i32
Date: Thu,  8 Dec 2022 20:05:19 -0600
Message-Id: <20221209020530.396391-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221209020530.396391-1-richard.henderson@linaro.org>
References: <20221209020530.396391-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x333.google.com
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

There is only one instruction that is applicable
to a 32-bit immediate xor.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.c.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 871fcb7683..fc304327fc 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -2005,7 +2005,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         a0 = args[0], a1 = args[1], a2 = (uint32_t)args[2];
         if (const_args[2]) {
             tcg_out_mov(s, TCG_TYPE_I32, a0, a1);
-            tgen_xori(s, TCG_TYPE_I32, a0, a2);
+            tcg_out_insn(s, RIL, XILF, a0, a2);
         } else if (a0 == a1) {
             tcg_out_insn(s, RR, XR, args[0], args[2]);
         } else {
-- 
2.34.1



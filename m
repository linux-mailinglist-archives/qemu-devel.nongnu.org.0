Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B980E4572DA
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 17:26:23 +0100 (CET)
Received: from localhost ([::1]:52516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo6iU-0002x4-Sm
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 11:26:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mo6Ot-0006TG-DR
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:06:07 -0500
Received: from [2a00:1450:4864:20::32f] (port=33376
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mo6Oq-0004R8-M8
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:06:07 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 r9-20020a7bc089000000b00332f4abf43fso8029320wmh.0
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 08:06:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8f5t7qrgewUl/++VIfSGIDUA7+JrQVIlEfzgJvObjq8=;
 b=DtCYSkX4Q3RmoN4P0LdUVtnzh3aFui/jo7NOdywZzBE0ANz7XMj/c5Mab/o0WcVzKf
 mcJMT1DiHTBrEN1NyT/5rzKDtqvOmVGjNnun1ZUZSTDYPAkOXB074vRD/4QIybOMyker
 SQdzbKXlAQLqvSfys+nmSP11lhceYfhrYu75Hxh5Kb1XJK5z923cz0qREBQrgMQ/+fLP
 DESOcBcLOu2wDFxwVZHkN2+4zJ4zQHJw67t7wwD7WqaKi10RBKs4x8EPjRHrcsF5BGYw
 98xrU4+dZ29+HtBnZk1v2zgdJzJeWbVzNuSzzDUW5T71QPX03CUyBRCQV80Pv+QpIz9o
 PAsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8f5t7qrgewUl/++VIfSGIDUA7+JrQVIlEfzgJvObjq8=;
 b=caWsZzTRSN3fXtmwRMKXtleMXyTBs43cKXvfgrJZc16oQdV9YvAldMVNTgFTAafAx9
 cRbzcYP+bZJ/du9d4Ny/qIrQRRLahlalq8i1J9/oOlWYmXFRTgp4VU92g++k6FcVjK3V
 Tcrkrq9bZ610uY2/P5eamw8iyA9X2Sg4S8/CihfBUZUd29S4XWQamOE7eY5NZrhQkpbT
 OrFgzclqGlmqPeNyXpmUjaWxGtXTotbiHV+2enk9lSaCq3aLbuJjh46gGR4vNFRsGqjk
 hXdnrHwzNgmPo+d2FTbkz5Qz05uwgiW3Y3iKNvj1V5O812u9SIUOJ0mfYk0mQjvQdfez
 T+yg==
X-Gm-Message-State: AOAM532rh65dJ+J12k02EqDCcTyE7u1WiJsp+mqfJ0leSSs5DwWavjQF
 LTYeqMWDMorsDMVTxefbF1t7WbRitpimbGdEa50=
X-Google-Smtp-Source: ABdhPJwDuvKg7xuzJnXInZoEhxmSy748LGLssjJl4HsCEkj+S68sELRu/j/SdtfCffD7/r7I7lc3Bg==
X-Received: by 2002:a05:600c:3584:: with SMTP id
 p4mr831108wmq.109.1637337962906; 
 Fri, 19 Nov 2021 08:06:02 -0800 (PST)
Received: from localhost.localdomain
 (165.red-37-158-79.dynamicip.rima-tde.net. [37.158.79.165])
 by smtp.gmail.com with ESMTPSA id q84sm14044877wme.3.2021.11.19.08.06.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 08:06:02 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 23/35] target/ppc: Use helper_todouble in do_frsp
Date: Fri, 19 Nov 2021 17:04:50 +0100
Message-Id: <20211119160502.17432-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211119160502.17432-1-richard.henderson@linaro.org>
References: <20211119160502.17432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, alex.bennee@linaro.org,
 clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We only needed one ieee arithmetic operation to raise
exceptions.  To convert back to register form, we can
use our simpler non-arithmetic function.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/fpu_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index 38f20e9783..3a29a994d3 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -681,7 +681,7 @@ static uint64_t do_frsp(CPUPPCState *env, uint64_t arg, uintptr_t retaddr)
     if (unlikely(flags & float_flag_invalid_snan)) {
         float_invalid_op_vxsnan(env, retaddr);
     }
-    return float32_to_float64(f32, &env->fp_status);
+    return helper_todouble(f32);
 }
 
 uint64_t helper_frsp(CPUPPCState *env, uint64_t arg)
-- 
2.25.1



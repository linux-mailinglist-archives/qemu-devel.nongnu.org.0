Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3D95FA044
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 16:34:46 +0200 (CEST)
Received: from localhost ([::1]:46070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohtrh-0006m1-5d
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 10:34:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ohtkq-0005vv-S5
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 10:27:40 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:41864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ohtkp-0005XH-90
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 10:27:40 -0400
Received: by mail-wr1-x42f.google.com with SMTP id bu30so17295571wrb.8
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 07:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=3qV9Bd6BDRz/hfn9vSKAZJrKreSv3U0/Yi5V2ypL1h0=;
 b=IZaloUadulQgUI7/p3bCUby23IM1lPDsLiz5HSkF35uq/GGcHKXBqM8x6iOBdqaJeI
 nARRwVBHdqgO0tP7kLKcQwfjR+dgSpg4wLPUDmw5QQZyTpbB7fUhh9kTxeitJ5qBDSir
 mSvTH7spbqjCc1E7tbKQl4S8gMzLfTvl5FhuPIpzdmtK4mA7+NEbwWss+hWGezw6J2wn
 A0y3XrwQOEQ+FMpSoCoHD/rSmJgRYBJPZTHSIx1ZepoxUAeiMi5GZhxtFqsxkr+Z/5ep
 DyLfhwk4SQLe07Gu0LXWgg3tTw/Fm4DQ3+ieVBDeaikQlo6VzpSbif2HJdUXebXytcKZ
 1HPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3qV9Bd6BDRz/hfn9vSKAZJrKreSv3U0/Yi5V2ypL1h0=;
 b=Gm/lV8hOyWhCj77oXljBwl1wiV3a5wUyr4A96qfkSojxf2fEVMHFDlCMn5odco14hP
 QkENkmKB4EqYRCblX7VUTKuuVjDLh2hA0AIz2nPdcqaNyeImOv/2G4e3n+IgCHl744M2
 T165vFEPqm78ORviKGJ0H5ZP7pcW+a4S1Nsz2BsVe3ZvVFa0YtmMN+AB+a+elD91Ee59
 l4wlPBrQ2EshDpQ2NM3fYSh9FXFtHIRF93yB3ppgbHq7fOBXNhWfPd9EGmfX5hvBrwUD
 gP4lhJ9FXeQajS9oKa9L174hlRvnBLm0Upd2Lwkdjvb16UAMslqJ083/McIs1tQeCNmc
 YO8A==
X-Gm-Message-State: ACrzQf3iWZv9Ztw+HjAB5YgRpd1i1rThRNYueB30J4X67mEfLs7HEjqB
 iLrkYpGPWMu6q6swhWEPK4RFkz3zOMo21g==
X-Google-Smtp-Source: AMsMyM4nAYqaB58iGGmXhn/zbbqZn/WZbK9HZ6tsnguSBZBtxPjTS4s2Nq4kfez+pzdtpaFGmZaX5Q==
X-Received: by 2002:adf:fb10:0:b0:22a:f1d8:18d2 with SMTP id
 c16-20020adffb10000000b0022af1d818d2mr11678812wrr.483.1665412058349; 
 Mon, 10 Oct 2022 07:27:38 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 u6-20020adfed46000000b0022e04bfa661sm9037054wro.59.2022.10.10.07.27.37
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 07:27:37 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/28] target/arm: Make the final stage1+2 write to secure be
 unconditional
Date: Mon, 10 Oct 2022 15:27:07 +0100
Message-Id: <20221010142730.502083-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221010142730.502083-1-peter.maydell@linaro.org>
References: <20221010142730.502083-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

While the stage2 call to get_phys_addr_lpae should never set
attrs.secure when given a non-secure input, it's just as easy
to make the final update to attrs.secure be unconditional and
false in the case of non-secure input.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20221007152159.1414065-1-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index b8c494ad9f0..7d763a58477 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2365,17 +2365,16 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
             result->cacheattrs = combine_cacheattrs(env, cacheattrs1,
                                                     result->cacheattrs);
 
-            /* Check if IPA translates to secure or non-secure PA space. */
-            if (is_secure) {
-                if (ipa_secure) {
-                    result->attrs.secure =
-                        !(env->cp15.vstcr_el2 & (VSTCR_SA | VSTCR_SW));
-                } else {
-                    result->attrs.secure =
-                        !((env->cp15.vtcr_el2 & (VTCR_NSA | VTCR_NSW))
-                        || (env->cp15.vstcr_el2 & (VSTCR_SA | VSTCR_SW)));
-                }
-            }
+            /*
+             * Check if IPA translates to secure or non-secure PA space.
+             * Note that VSTCR overrides VTCR and {N}SW overrides {N}SA.
+             */
+            result->attrs.secure =
+                (is_secure
+                 && !(env->cp15.vstcr_el2 & (VSTCR_SA | VSTCR_SW))
+                 && (ipa_secure
+                     || !(env->cp15.vtcr_el2 & (VTCR_NSA | VTCR_NSW))));
+
             return 0;
         } else {
             /*
-- 
2.25.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2539C632308
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 14:03:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox6S6-00053K-WE; Mon, 21 Nov 2022 08:03:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ox6Rl-0004ti-Bt
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 08:02:51 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ox6Ri-0007Rw-SZ
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 08:02:48 -0500
Received: by mail-wr1-x432.google.com with SMTP id d1so7635095wrs.12
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 05:02:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=JBNmxcqLBxZag1unF7NOFteCv/IX3kebN57U4uPMAOo=;
 b=iQXSb9MMFfTFM6CRTSJWyLnL0FFXWmI1IBXm1aM31ib39XyRZOR4Qbl99ZlnjMyqyb
 Z/PpSy7kKbx6YyFa4dbVLBdM25lr0weNPtpmnhD533eR2ZfUK7rt5bwta52d9cxwSn5c
 exkV+q5a2gKug0k47/p9B50BxiMKa81c2ODPc3V/tZq+by4j9gRxKuIG0CTICZ1e58sm
 Ofhlx3heaH3J5iEzynSJDL/gXqVf+D7MGgycnLis8Js8L7h5Bba/BvyCD51N8jRC4o+e
 gmH3ChApaD9KYWuXzkh+hebMF1BorVFR1nxZS29cgI4qHjRtMHMRdpeA5o8r7DE4jGOt
 dy2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JBNmxcqLBxZag1unF7NOFteCv/IX3kebN57U4uPMAOo=;
 b=u3cdohJ9GlvCkBAwTuxL+JS6CdfsQQpiJhDFN4wvkxKXsWeICe3mGLusk+Oj+4SKDQ
 FjogvDfqbaLcz6pbcLKHADB6Rlfd+kJ0vx9fPYUJ7EPBPnlOOgznitCIkYYl26+7fNVl
 joi8PSCiSebJ62DhUswK08xMULHQFAnF6IpajD/YCLqxHuFvyKy9o9Pka/bvxpEVIFGJ
 TpVbinUsy4mb5qNsR7/aFlkp2CBGg5Cz6gnqMGo+mtv2tpjNSkDDU3B+RXVlC5CPltbD
 g+E3WFaNCGidlzzQLGImCaCdnEA/cMn99aH+Bs7AuSzuF0n+n+NTDQBOB1945n5vpIUe
 jg8g==
X-Gm-Message-State: ANoB5plvVvfpTzSDsSUKVe3Fs/pD3X31x8nyONAX1Mqm2r4KWi1PgWih
 agv1FQ5zwFWQNRXb21epZ1J2+OB7d10bCw==
X-Google-Smtp-Source: AA0mqf5JO+jq2N6t3XACrwY3sp9+t1Xi5fm3RswBNRiHSwjFn8mGaTXiHRyXCMDGD2pW7kf322i33A==
X-Received: by 2002:a05:6000:114b:b0:241:d199:1a04 with SMTP id
 d11-20020a056000114b00b00241d1991a04mr3782834wrx.227.1669035765534; 
 Mon, 21 Nov 2022 05:02:45 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 t1-20020a1c7701000000b003cf4d99fd2asm13296725wmi.6.2022.11.21.05.02.44
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Nov 2022 05:02:44 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 5/5] target/arm: Limit LPA2 effective output address when
 TCR.DS == 0
Date: Mon, 21 Nov 2022 13:02:39 +0000
Message-Id: <20221121130239.1138631-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221121130239.1138631-1-peter.maydell@linaro.org>
References: <20221121130239.1138631-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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

From: Ard Biesheuvel <ardb@kernel.org>

With LPA2, the effective output address size is at most 48 bits when
TCR.DS == 0. This case is currently unhandled in the page table walker,
where we happily assume LVA/64k granule when outputsize > 48 and
param.ds == 0, resulting in the wrong conversion to be used from a
page table descriptor to a physical address.

    if (outputsize > 48) {
        if (param.ds) {
            descaddr |= extract64(descriptor, 8, 2) << 50;
        } else {
            descaddr |= extract64(descriptor, 12, 4) << 48;
        }

So cap the outputsize to 48 when TCR.DS is cleared, as per the
architecture.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20221116170316.259695-1-ardb@kernel.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 3745ac97234..9a6277d862f 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1222,6 +1222,14 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
         ps = MIN(ps, param.ps);
         assert(ps < ARRAY_SIZE(pamax_map));
         outputsize = pamax_map[ps];
+
+        /*
+         * With LPA2, the effective output address (OA) size is at most 48 bits
+         * unless TCR.DS == 1
+         */
+        if (!param.ds && param.gran != Gran64K) {
+            outputsize = MIN(outputsize, 48);
+        }
     } else {
         param = aa32_va_parameters(env, address, mmu_idx);
         level = 1;
-- 
2.25.1



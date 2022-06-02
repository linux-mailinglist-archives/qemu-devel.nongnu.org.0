Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5640953B0EC
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 03:19:04 +0200 (CEST)
Received: from localhost ([::1]:39622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwZUM-00039t-Ak
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 21:19:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwZQW-0001ah-Rh
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 21:15:05 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:52198)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwZQU-0006bt-Jx
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 21:15:04 -0400
Received: by mail-pj1-x1030.google.com with SMTP id cx11so3572706pjb.1
 for <qemu-devel@nongnu.org>; Wed, 01 Jun 2022 18:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xVOCyk/9DqTERX7d769CfgXBIdRineh6jnjYvaEW1jc=;
 b=LPy3I0FIdNvFiOwmLUS8R/7nW37Vrztc5+fNnxlRaob7K0SqOnuR251qGY3j0aBJ76
 pdkYaZIFfCAMTcNMDmIbmOlKYupAUIc1uMpga6LZyyw+33FnxccktfItNj/nGMvQiBA/
 i0oIfxPIT0ItrkXAbBGRTuG1j+kJ7cNSNrOdFLsMooMURnoKRJU9aPBuK+Tkv7BEw3m6
 Qb/hY86V8CKiB+Ltrwg5kbY9XZn4U0Pz0V1IArCkht/gU7xtzAKKjLnl9APs0cFuGNxo
 1GISiozg5oXn3EsAS9VOtc8x/VnfHqQHcA69Rdxu/ryVBylXG+XJgGw+ddGKt9isyYvh
 gRcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xVOCyk/9DqTERX7d769CfgXBIdRineh6jnjYvaEW1jc=;
 b=y3/orKSyEiMYuNtITHi0H3uo9Qv74KDQQnUAj0308iBd/3Ne027bpk2jh7hWFTmplD
 8zx6YwkLhjYjmCI0DAy7baJzaydICxiZjsZRs15ojMgwT+hXkCf9hKey0A3C8eGKThlh
 xGS9jnYnBy0Rm2G2EG0D5hfMypc0eMzxHbcu+OL7zsQjBKLKdIZYWw1zVcs3WZ7P6oof
 SoY1cKK+P4Y2DFOS3EhrG4EgUa1HwWwFtMP33iHnUfj08/Prh0EeBXQjQkh483zTL9v+
 n4eJrryWolsXLb1P/UBVs+1w5Kj47S2qpTkgcfFQGG7OQq/oOoYMHm20z41ojfBZMIhJ
 4zoQ==
X-Gm-Message-State: AOAM5331tRLV/Y+w8cXlur+b2TfxC1w9ViDInWJdKjy2dPt+lFKTju3f
 2/4Eeld2Oq7QcybiN8mx680R0gDyymeqnQ==
X-Google-Smtp-Source: ABdhPJxOvOrKgFzCm0kWeWBj3W2+BuDB9YVTHgwuYyNOCgjc+G2OVm4pqtwJMPTW2Qn8BFL/Qgfzaw==
X-Received: by 2002:a17:902:e5cc:b0:166:3217:943a with SMTP id
 u12-20020a170902e5cc00b001663217943amr2233361plf.69.1654132500612; 
 Wed, 01 Jun 2022 18:15:00 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:1eca:8ee3:9269:e00c])
 by smtp.gmail.com with ESMTPSA id
 gf14-20020a17090ac7ce00b001e2f3607625sm4391663pjb.23.2022.06.01.18.14.59
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 18:15:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] tcg/aarch64: Fix illegal insn from out-of-range shli
Date: Wed,  1 Jun 2022 18:14:59 -0700
Message-Id: <20220602011459.294754-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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

The masking in tcg_out_shl was incorrect, producing an
illegal instruction, rather than merely unspecified results
for the out-of-range shift.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1051
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.c.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 61e284bb5c..d997f7922a 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1261,7 +1261,7 @@ static inline void tcg_out_shl(TCGContext *s, TCGType ext,
 {
     int bits = ext ? 64 : 32;
     int max = bits - 1;
-    tcg_out_ubfm(s, ext, rd, rn, bits - (m & max), max - (m & max));
+    tcg_out_ubfm(s, ext, rd, rn, (bits - m) & max, (max - m) & max);
 }
 
 static inline void tcg_out_shr(TCGContext *s, TCGType ext,
-- 
2.34.1



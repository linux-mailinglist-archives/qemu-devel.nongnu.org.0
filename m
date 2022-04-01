Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8673C4EFA77
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 21:38:18 +0200 (CEST)
Received: from localhost ([::1]:50612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naN68-0005Df-QE
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 15:38:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1naN55-00043M-A0
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 15:37:11 -0400
Received: from [2a00:1450:4864:20::62a] (port=38400
 helo=mail-ej1-x62a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1naN53-0005IT-Q5
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 15:37:10 -0400
Received: by mail-ej1-x62a.google.com with SMTP id r13so7944681ejd.5
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 12:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HH89zNDS/X/fLmLBuFxyjUMGXFM38PgAoiJxhKCSmAg=;
 b=mXskzBr4oJo1rioEY3MuJcMS5s9DS3TG+8p9xM9uUf19y1liwfjES/xIVv3Lw7VSml
 5i/FgwE9+ga2kLrdKP3FsGNZl/d3el4GGBXx3f/8b59KF51MXHujGAgP61N0nLdVPgkI
 aJzQBq4cU0JjNuEv+DU/+fUGX/mScoK4uBtKS2eu4dzEUxSmWz04pK1hJ4mEwuzaSSIi
 xc451p587kIL09Tcm1bRsaihxWe6OF2bA/N7z9lm7N4wEKpFB1ZCUPiGBXJDAG9CHP7o
 +0jtNg4/I8Y4HtEk2aYezu5GfaFOMpjDxXZPNp9dDBfxcLlNm8PEu0BacqS9vzxkWmG3
 rVsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HH89zNDS/X/fLmLBuFxyjUMGXFM38PgAoiJxhKCSmAg=;
 b=0/hWztkt2p0Hq1c7hDq/99ufRuVaHEWUFmMdUTlOyt/UZo6b92OsMrYl9+bua2R02z
 //bm3o1kR9cCfKsDA/EoKb1Y2xFC/XEhTD2ks+wzHBbQOIX7rpmH5ZRRi8mxC5DLAFNa
 Qkw1STqqC8gWksKY9on5TI8FPQ2hi+WieBomGBXUK9wWgYuzp5j9I2EXxKfH0xTMLte1
 GtlucTIIbDwJfoDSoNxCgTDY97bsoI895WGWU/+9wGlZPbAanQ3EcIrY2R/G7S8c3pHy
 Wv5NzVZgdOVcA2KFp48mdXQfEl8F42gu+2ELff26hKJewU2mzjTLAbCKsAoCatUaslGA
 2IJA==
X-Gm-Message-State: AOAM532ikL8VcBijf9qAE9jtx2YLT3hEWG1yu6L6QZ1/b865oMX78ylU
 VHZyY9JYF41ZaaFg+wvBpUwG9GP3mq9/8NanJk0=
X-Google-Smtp-Source: ABdhPJxItG+wvW4YVLm3qq0QHZWi70jstoDSeav/Cz6bNsmXzHyHXHDuhZ1ccPCO5wgYAxaGnCXRuA==
X-Received: by 2002:a17:906:9c83:b0:6df:839a:a6d0 with SMTP id
 fj3-20020a1709069c8300b006df839aa6d0mr1126944ejc.419.1648841828128; 
 Fri, 01 Apr 2022 12:37:08 -0700 (PDT)
Received: from localhost.localdomain ([185.81.138.17])
 by smtp.gmail.com with ESMTPSA id
 n25-20020aa7db59000000b00415965e9727sm1539987edt.18.2022.04.01.12.37.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 12:37:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/s390x: Fix the accumulation of ccm in op_icm
Date: Fri,  1 Apr 2022 13:36:59 -0600
Message-Id: <20220401193659.332079-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x62a.google.com
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
Cc: qemu-s390x@nongnu.org, cohuck@redhat.com, thuth@redhat.com,
 david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Coverity rightly reports that 0xff << pos can overflow.
This would affect the ICMH instruction.

Fixes: Coverity CID 1487161
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 5acfc0ff9b..ea7baf0832 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -2622,7 +2622,7 @@ static DisasJumpType op_icm(DisasContext *s, DisasOps *o)
                 tcg_gen_qemu_ld8u(tmp, o->in2, get_mem_index(s));
                 tcg_gen_addi_i64(o->in2, o->in2, 1);
                 tcg_gen_deposit_i64(o->out, o->out, tmp, pos, 8);
-                ccm |= 0xff << pos;
+                ccm |= 0xffull << pos;
             }
             m3 = (m3 << 1) & 0xf;
             pos -= 8;
-- 
2.25.1



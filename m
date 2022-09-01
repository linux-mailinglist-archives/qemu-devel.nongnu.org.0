Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 012865A9077
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 09:38:08 +0200 (CEST)
Received: from localhost ([::1]:34914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTem6-0005HK-H8
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 03:38:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oTe4K-0005wB-6p
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 02:53:02 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:35584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oTe4G-0003Hs-UV
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 02:52:51 -0400
Received: by mail-wr1-x42b.google.com with SMTP id s7so6104079wro.2
 for <qemu-devel@nongnu.org>; Wed, 31 Aug 2022 23:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=HHNtzSSJtX30aB1753TWle01U0aOKhRaC897K6yvm6M=;
 b=T1omgBQnnViYwpXE74X5m4q8MhXmVMsv1XPYim4AMFinfRgDFQrepe2VnKQhhAxaVj
 CiMzNIiRm8K7S/l9ySjYJsCROw0VA/7/xYhZ1Glamj/sSU3MkyUH7WDRH4XHd8Dq1Fbw
 HD/O2jZPgDzL0al0SWq9p9oclibYTqflj8slj+awGl4N7SF44H4yHvvTJUmbEueVE32V
 fcex/P/wIAaf8RkTcVWGYPM1RhwXBUvy/DH9BFWuCHxtovqIc6OHVkv+j8U+IxXQAo/j
 se1s0KN8ypXaSOVVIYSW/GqBzpAyGLFaVHQ8aklEDRUyLlzieCp6COv+ZDIn63pPGz5C
 L+Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=HHNtzSSJtX30aB1753TWle01U0aOKhRaC897K6yvm6M=;
 b=zyrUi9TbUxIVZ63gI0wFbAcQYPFM0KPr+gNVdcQOXhrLBe61vOTe4Brnol+cu18I0u
 RTeZOWkvQBgULQgfm753fmD2PcR9pjs72aXw02PemMuq7N/URpY5ghch3dxIDCYi2t3J
 0E2CpuoD/nfR7JutGZ+HgAn7HGRZ0jDmVIHp3vPfL7L1lRHKo5iCy1Me7CsPN3+9CgCG
 cMrWcoG2dnhlf6tP4euiG+DuXvB/2P2CVlKbNGQDetqZuI+sl65sgJJXDdjZG/z+XJcq
 7n89q5I3+1WqjsWZfeOIfaPfhd+rRxTTWRfuNnfyNXADfaZAypccOV1Pr02aIXqgoexb
 ZgYQ==
X-Gm-Message-State: ACgBeo2EHFrzsMLsSI4KknmMEsoglLfN01qPLb3nCPtAn5bjSqgs2AvG
 X7PcxTyXcHWThKNTZwq6oaB9xwRMxfUSfFpR
X-Google-Smtp-Source: AA6agR4Z7ESlKsK1/7sM5z35P542i0jLk2WqZLEsuG5EZFjJYqL5QDwgU+ZyR/6RfAmPgMANRnX9xg==
X-Received: by 2002:a5d:64e9:0:b0:220:7dd7:63eb with SMTP id
 g9-20020a5d64e9000000b002207dd763ebmr13503325wri.590.1662015164446; 
 Wed, 31 Aug 2022 23:52:44 -0700 (PDT)
Received: from stoup.. ([87.192.221.83]) by smtp.gmail.com with ESMTPSA id
 a6-20020a5d4d46000000b00226dedf1ab7sm8308153wru.76.2022.08.31.23.52.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 23:52:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PULL 06/20] tests/tcg/i386: Move smc_code2 to an executable section
Date: Thu,  1 Sep 2022 07:51:56 +0100
Message-Id: <20220901065210.117081-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220901065210.117081-1-richard.henderson@linaro.org>
References: <20220901065210.117081-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42b.google.com
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

We're about to start validating PAGE_EXEC, which means
that we've got to put this code into a section that is
both writable and executable.

Note that this test did not run on hardware beforehand either.

Acked-by: Ilya Leoshkevich <iii@linux.ibm.com>
Tested-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/i386/test-i386.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/tcg/i386/test-i386.c b/tests/tcg/i386/test-i386.c
index ac8d5a3c1f..e6b308a2c0 100644
--- a/tests/tcg/i386/test-i386.c
+++ b/tests/tcg/i386/test-i386.c
@@ -1998,7 +1998,7 @@ uint8_t code[] = {
     0xc3, /* ret */
 };
 
-asm(".section \".data\"\n"
+asm(".section \".data_x\",\"awx\"\n"
     "smc_code2:\n"
     "movl 4(%esp), %eax\n"
     "movl %eax, smc_patch_addr2 + 1\n"
-- 
2.34.1



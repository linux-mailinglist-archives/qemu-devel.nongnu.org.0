Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A28775AE3C3
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 11:04:25 +0200 (CEST)
Received: from localhost ([::1]:38362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVUVM-0003RQ-Mp
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 05:04:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVU6F-0002XZ-LR
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 04:38:27 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:35580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVU6D-0005Ut-T2
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 04:38:27 -0400
Received: by mail-wr1-x435.google.com with SMTP id bz13so10891874wrb.2
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 01:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=HHNtzSSJtX30aB1753TWle01U0aOKhRaC897K6yvm6M=;
 b=uqxklyQ3HFRS2tE0yBJiwzeRelyIrKs2PFTCzDs587hcq3iY55y/ys/Q7uPFfdmbec
 dalgO+9v6zWt7KppTNwE+NEeDuYxQ134TND2R0MaBDy8tKkhPi3CF5ftlD7OILPtx528
 HeKSGZadsBHMnEGOZYJ1EZOEuQUrVT2gt/OCuPAAXtULZMU9WioTFZpGa/U+douqMHfl
 az+7LB19avx4duWal7nP5Lws3k4mm1h9ivpitVuh+VT2+ryjsG77VacrVhjiZreXTAL6
 NAzANRVj+A6L7/YoEzCHv10o8p0XVRZLNNh+fQ4fynCX6WRcg6I4vVY7S1NAyxbQB2z+
 kL7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=HHNtzSSJtX30aB1753TWle01U0aOKhRaC897K6yvm6M=;
 b=Eere8SuwS/StqR6YVpntF081ou9M/GZ6RBQQ9dGXCsHaY1oO1myFFz5sQKVSkxkux1
 38LVEgtk6/lRPQKrlvU0NZ7qX3+5zOtorCNy0mHEI37N6Ruzky+OD5e1Ey2qCpCOg1JM
 IJXHXUN5NSbTPhjZTy1FQRgabNpJAVYu/FsG13BYdiaPyr1ToEnwSDdEo1bTFKYhXiG9
 72td482v4MrMad6EeQH/HQi4nV93BRUFmk6TyckBOTZTzFAeLc30dgBZ/YcFLlkK4z6q
 ymWNN8rYqoZytIbmb3apLuIpwRCJy2r0mj1wjzs854SzCF26iKXHq95nLQnZwnRfj2D7
 7VRw==
X-Gm-Message-State: ACgBeo0YJ4t8Z8C6mbWNkgy7172vPRfaiw6325nzjWMAvxkOy7tA1MXy
 gtWTgoWcuOWGp5sP9oaoKLKRPHPbUfhzsbQv
X-Google-Smtp-Source: AA6agR5MP1IRmITPlswdNX2AXfbIhNA8DpkM6WNjJjQeVWhWFEfIMB6KVva4sjgkGm1lZ8YTezaArA==
X-Received: by 2002:a5d:6d0b:0:b0:222:955a:8774 with SMTP id
 e11-20020a5d6d0b000000b00222955a8774mr25341767wrq.129.1662453504432; 
 Tue, 06 Sep 2022 01:38:24 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1])
 by smtp.gmail.com with ESMTPSA id
 g26-20020a7bc4da000000b003a54f49c1c8sm13421859wmk.12.2022.09.06.01.38.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 01:38:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@gmail.com,
	Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PULL v3 06/20] tests/tcg/i386: Move smc_code2 to an executable
 section
Date: Tue,  6 Sep 2022 09:38:01 +0100
Message-Id: <20220906083815.252478-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906083815.252478-1-richard.henderson@linaro.org>
References: <20220906083815.252478-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x435.google.com
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



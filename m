Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 240783C2B8E
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 01:08:29 +0200 (CEST)
Received: from localhost ([::1]:35778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1zbf-0001V5-Jm
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 19:08:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1zZm-0000PA-El
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 19:06:32 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:42977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1zZh-0004iR-86
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 19:06:30 -0400
Received: by mail-pg1-x530.google.com with SMTP id d12so11391681pgd.9
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 16:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P/cNFkCTIiADe6eqNZOM9+2HNoNfArmqqrxm5+r47oM=;
 b=UkdwHndFkv6MjeoEsUm7ZjnSuKDj3ykEZ9kjjsVwCX9yGe9X7EZHETIYPlyKwhWtgt
 eeP37Vz2HsQXa3oqnewbWUSYutxDLp0Vo+Ska8mWozwPSJKPcq20prydM41aHKtqJcam
 u+rAuFywqXtbiHT6c54bZYjTuLq6X/lros8PY7Nxg74esE8S5ApA0SXwcyrinnSIeA7W
 REbbZm32FvwzGMn7J83ITYXL4GBxHn5J8rN/tg7B7AfzWTx0VJ9Aut82Gsz554/0a2wc
 R+av/2Cnd9gNbZ9DdbqhQWttbdeOwicfrKsw4/1DqfM8GvhO4BRRpA3fPSPszZJDMVum
 0FEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P/cNFkCTIiADe6eqNZOM9+2HNoNfArmqqrxm5+r47oM=;
 b=B4kyNbKmFyRx+WeDmlj58apRM3d6RljXCSdZn+TXtpPuiHOfA822VLtPD3ybrSavQR
 GANle/sSq6TVOELtCwbFNuULMUm7QmmNWwkuwU7pwoqnPqzvyXijBBhOvtiqHpmg0JMu
 I7tvYA1eQ+k5U475zBf5oF9B0kZgBlf9JVJsEBdAf0E0Dv0wfOrtWazL9iHddB5jvXj9
 HRdkmAN1BomEDvuRo9vwluaMPwKn6Dz2yn5s92dMNlSe6YORaPMuAkXUM/Qu2axNwXig
 Mrm4HbE3IWVYWBxKVi19jFVmctaETHiRCltOZPn/sMbTM2svSLS2nIIk/L+sJ5OwDTXx
 s24w==
X-Gm-Message-State: AOAM531B4qO3q7F7Iyt+S+z0HgjR3uSkuJ3qM6u5agJ9ehrhVFaFDHRz
 HRC1Lzs/9raxMWOkYZfe3PnIMo7J3mTWSA==
X-Google-Smtp-Source: ABdhPJyghUSEI+KDlBjsM2ckBC7CU+9FZc5CXUNu5QH9WvowR0sQuqTsGYVKFejMJ9r0kbjUF3Wf+g==
X-Received: by 2002:a63:43c4:: with SMTP id
 q187mr40218505pga.172.1625871982757; 
 Fri, 09 Jul 2021 16:06:22 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id d20sm7270414pfn.219.2021.07.09.16.06.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 16:06:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/1] target/arm: Fix offsets for TTBCR (#187)
Date: Fri,  9 Jul 2021 16:06:20 -0700
Message-Id: <20210709230621.938821-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This one patch fixes boot_linux_console test_arm_virt.

It does not fix all of the failures.  The next one on the
list is test_arm_emcraft_sf2, where the cpu boots fine but
the net device doesn't work correctly.


r~


Richard Henderson (1):
  target/arm: Fix offsets for TTBCR

 target/arm/helper.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

-- 
2.25.1


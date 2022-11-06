Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C4F61E002
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Nov 2022 03:39:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orVXe-00006u-LV; Sat, 05 Nov 2022 22:37:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1orVXc-00006k-Hx
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 22:37:44 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1orVXb-0003IJ-3W
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 22:37:44 -0400
Received: by mail-pf1-x42c.google.com with SMTP id q9so7751967pfg.5
 for <qemu-devel@nongnu.org>; Sat, 05 Nov 2022 19:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=18gErPbuvHkH3yNjqNTWlEXDz9udsdfZ6cJ5FlKaU6w=;
 b=AN2uRMZER7Dhsf2T0X/HKFlgYTdZJTvzj2eJwACGmFqmiDQr76seuh+RdzS1HogreC
 3SjEYmMHz1IpLfaGVLmw1WDuspewpbC4SpRwPQgoq5x0sjjlwH28CDioevoL57sjA+1c
 CNTh6YqS1AGhEIGWMFf+FCchK7tSKoXLqBi1zP2gbWuuYX9cjs7CeQksco8RysMvLZF/
 9c2YML+Rmjx6GNxtLRC8yRog/cfyO12R/oz/8f0k36OqLud7vHO7xPIl9hm2ULclh8dw
 6QxeHQyRxsYdqpmzmAHMRadmSjBQCvbXjJrAcjyUunO6Ij2I26JGY1iYZlqSeQi0/5oH
 uEFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=18gErPbuvHkH3yNjqNTWlEXDz9udsdfZ6cJ5FlKaU6w=;
 b=rEnLSqtrzvwfvbwR/MWfcMdyKMtbKfal8qEdtCAUBI1g+2/8dfr+y7Ee+HI7GiJSpZ
 auELXLOk+ZcGUIbBNpIqBxveLrSNzHI6FvpNrbpjG3NZdCiblMrtxvRUxVvx01M0uf53
 9IO/9h+S5TLqddXPgRvq14hOYDwTDuuaGp4/cFcTiP+Nv1b8NTCfzJ5V8svdX6z0wAkv
 LMyctw5UvweZXx5+VdQnWwIhJvM1uF5t63N850SYYl0k0odZlufUCt9W352TINoE3J8q
 l0heYHYY1fC2kocZDULqaZCAtU/xbatczkQWXXpXssvt7BK0CJhyDS4KYLqDupTCCcvQ
 Y1Ow==
X-Gm-Message-State: ACrzQf35lFlGc0hc19Bs4vyMQFORfP2mo/8I5jnL7bssiGfxS8JZ3ZX+
 gLN7NtrcxfjSOcdK3HwGuuIBG9UF073bJ6wU
X-Google-Smtp-Source: AMsMyM6+heEfKqQ4j4moV2YYbdXqCWrRHPUAcBWuMxO0GogzPLW/o+PrFGaF25Ka4Tdt91ua4Z9Gxg==
X-Received: by 2002:a05:6a00:1781:b0:561:7f7f:dc38 with SMTP id
 s1-20020a056a00178100b005617f7fdc38mr44043723pfg.42.1667702261358; 
 Sat, 05 Nov 2022 19:37:41 -0700 (PDT)
Received: from localhost.localdomain ([2001:8003:d918:7a00:e617:679e:af7:63d])
 by smtp.gmail.com with ESMTPSA id
 m21-20020a170902d19500b0018862bb3976sm2259457plb.308.2022.11.05.19.37.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 19:37:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org,
	sw@weilnetz.de
Subject: [RESEND PATCH 0/6] Two -Wclobbered fixes, plus other cleanup
Date: Sun,  6 Nov 2022 13:37:29 +1100
Message-Id: <20221106023735.5277-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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

[ Resend, since apparently only one patch made it to the list. ]

Stefan reported for accel/tcg, and I reproduced on Ubuntu 22.04.


r~

Richard Henderson (6):
  disas/nanomips: Move setjmp into nanomips_dis
  disas/nanomips: Merge insn{1,2,3} into words[3]
  disas/nanomips: Split out read_u16
  disas/nanomips: Tidy read for 48-bit opcodes
  tcg: Move TCG_TARGET_HAS_direct_jump init to tb_gen_code
  accel/tcg: Split out setjmp_gen_code

 accel/tcg/translate-all.c |  68 ++++++++++++------------
 disas/nanomips.c          | 106 ++++++++++++++++----------------------
 tcg/tcg.c                 |  12 +++++
 3 files changed, 90 insertions(+), 96 deletions(-)

-- 
2.34.1



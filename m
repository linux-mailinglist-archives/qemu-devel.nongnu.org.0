Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC7F3EF71F
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 03:03:39 +0200 (CEST)
Received: from localhost ([::1]:49592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mG9zV-0007GF-Me
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 21:03:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mG9wp-00047j-7N
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 21:00:52 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:33433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mG9wk-0001KV-RJ
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 21:00:50 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 28-20020a17090a031cb0290178dcd8a4d1so4253475pje.0
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 18:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oK94JCVp49MDHMvJof12YEKJDZETbAsJG4e9KZDNxVw=;
 b=ih06Cs5hdvhFxCs4E3aTxS40EF/HFSqyyDNh/qj79ApK/9jDlvuqY7gBw7ktYesf17
 Phsg3lOpBnGO405yQgO66Q1DqXcsEerNAWEo6hq9qRYLHd161btYYuWOtsRCSuvuZS7f
 Z7kRQGP1r7jf5AgtBrDZi/zMeD5GvDjM9th6wYz9y0xJhoYlowMYfBIpJL6aXkMSwP8T
 pDj3vK7V4xCLqPYomLgalnJ3K/NBflv/Z+xL91X70HzivzWBwBT04zbeAqinbiFomYYM
 +SdC0gp4t4fvD4NIePo7pOE6ip8h5fOdT51553R8EMAyTVhMmE8TZqhWt30QqUVzr0pa
 hh7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oK94JCVp49MDHMvJof12YEKJDZETbAsJG4e9KZDNxVw=;
 b=YhBQRoxb76Wvbviy+9h0H2+MENyDKN4B0xKCZT6orXVZho7XU7rfGtbQRUOC8uxGmj
 yI2HBUA6CiSPhEYqtvKgWaseFjSWHORpkhThBMgrdj/eeHzo1IZi10Zouy4wUqX1H/hk
 TLwV7joHnLuEi7rypJ3gpTquvBn51hofgCczBF2ViKpsBZvt+srwQiGhmu7MQagrjSWd
 reTE/j+WCgjMGYOiyAN/N9T6r/5UCj0rqTFCtnoJ82GcfxcsXS/CplYc6SNKBYjw64LD
 gBikKpKkS8nqrgRCsn/t6Um/cx/mxQOHGztlLeiR7Al8wBtUCtCKQVnj4YWEQTYtNvah
 1Ymg==
X-Gm-Message-State: AOAM530Y4UZ9DP/uRB9gLj0qztkpFlmQsGTagzz3I/fDuPcdFvBBhnft
 HqBRN7KeGn9OHcvR6Cfdoe/VdpxdadX63A==
X-Google-Smtp-Source: ABdhPJyLwnjvGAtjvFiX4kXO2mmY0X6mLZ8Za8dj1T2bl654Jv+wJDeW6I20CkmOhxDR92IO+B3v4g==
X-Received: by 2002:a17:902:748c:b029:12d:3f9a:d3a with SMTP id
 h12-20020a170902748cb029012d3f9a0d3amr4937652pll.74.1629248444599; 
 Tue, 17 Aug 2021 18:00:44 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id r13sm4567422pgl.90.2021.08.17.18.00.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 18:00:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] target/arm: Fix insn exception priorities
Date: Tue, 17 Aug 2021 15:00:37 -1000
Message-Id: <20210818010041.337010-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

As discussed earlier today at
https://lists.gnu.org/archive/html/qemu-devel/2021-08/msg02686.html

Raise pc alignment faults.
Fix single-step and pc-align priority over breakpoints.
Not yet fixing insn abort priority over breakpoints.


r~


Peter Maydell (1):
  target/arm: Take an exception if PSTATE.IL is set

Richard Henderson (3):
  target/arm: Merge disas_a64_insn into aarch64_tr_translate_insn
  target/arm: Take an exception if PC is misaligned
  target/arm: Suppress bp for exceptions with more priority

 target/arm/cpu.h           |   1 +
 target/arm/syndrome.h      |  10 ++
 target/arm/translate.h     |   2 +
 target/arm/debug_helper.c  |  23 ++++
 target/arm/helper-a64.c    |   1 +
 target/arm/helper.c        |   8 ++
 target/arm/translate-a64.c | 267 ++++++++++++++++++++-----------------
 target/arm/translate.c     |  71 ++++++++--
 8 files changed, 244 insertions(+), 139 deletions(-)

-- 
2.25.1



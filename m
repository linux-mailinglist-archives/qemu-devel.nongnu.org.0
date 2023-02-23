Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B4F6A1162
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 21:45:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVIRV-0002ij-25; Thu, 23 Feb 2023 15:43:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVIRS-0002iA-VU
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 15:43:50 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVIRR-0007PS-Cn
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 15:43:50 -0500
Received: by mail-pl1-x635.google.com with SMTP id u14so10581736ple.7
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 12:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UMQxhGiSikBJGk1Ku16kdAK/QFcdPMwc//e5bEez4Ag=;
 b=T9AcEYeYPZRP6BbqRvISij1i+/3BZHZWUL4RNJntUxZn2CyzPrnmlpa/em2aobl6ms
 k9Jwf0whoexGp2PJ1Lzj8LJxTj9bL/SvoHztY3F4ndwSUwthcJMHzoSJqWwFnDH5BcLo
 rtf0S4RCmbK2aArg62velP+P/3NW4bOlCd6NNWUdLal6TqQMRAbbcX88O8quD1RTkbVG
 IkAscCsD9+2COaJVVra+ylx0Vbri+lTRPXOT4a7L/B30oCuFBZ0Pobrt5YEvX7IP07om
 heMbz49Kg/UDA8jTCQYDIxUUfkn85A/Q23TzhzjhYMYtbIKVTa0/wJ03gqNQh19B9+sB
 L6ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UMQxhGiSikBJGk1Ku16kdAK/QFcdPMwc//e5bEez4Ag=;
 b=EOm91SJRCiA7YKV6MM2K0bATU6tVGPTD66cHhQj7gA9U5xim5qMGZP1RgYkdtUZLV6
 +DSwgWSKceEWfGvny/FmFj63XsxS8Kj1ApFB3AMWuP81pVQLEOHZpdUdjVWSXwRPCliv
 3byu4vw3ogXDIV+ZFY+i9PtuOGY19ipZqVVRNQaLIcvjN4K06x3ws/Od74RFQhOhtE6+
 ZBjQY7jpcS9XAqPQZn0vXTyewCtQN0Y911bmbsR9RROEXRy8CXVCpH7mt5XQ5aUW6hU9
 hCD8bMmF0gFdB0Cj2HZqcgjA+WJYBGIYcS/kKhok4T7zfVEtr6kgKXhHgOI4QtvkMZ0n
 Qr/Q==
X-Gm-Message-State: AO0yUKV7wt1N7o3BcU3DTfD5gTXL/vSPCBjnFj1b0CGZqDuXu7SjEXRK
 l5ICTWliA6F0qg9x+643lfw6NCk82rb3ZVG8mq8=
X-Google-Smtp-Source: AK7set97E4V4MX+DGP+36jMp7SJPNANLWEDNI4BdY0+eBkvo5EweHd8trqMyEBtsjK6fElfJFuNybQ==
X-Received: by 2002:a17:90b:3b83:b0:233:f54a:c21d with SMTP id
 pc3-20020a17090b3b8300b00233f54ac21dmr13084535pjb.4.1677185027539; 
 Thu, 23 Feb 2023 12:43:47 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 e187-20020a6369c4000000b004b1fef0bf16sm5992850pgc.73.2023.02.23.12.43.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 12:43:46 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 00/13] {tcg,aarch64}: Add TLB_CHECK_ALIGNED
Date: Thu, 23 Feb 2023 10:43:29 -1000
Message-Id: <20230223204342.1093632-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Based-on: 20230216025739.1211680-1-richard.henderson@linaro.org
("[PATCH v2 00/30] tcg: Improve atomicity support")

This adds some plumbing to handle an ARM page table corner case.

But first, we need to reorg the page table bits to make room,
and in the process resolve a long-standing FIXME for AdvSIMD.


r~


Richard Henderson (13):
  target/sparc: Use tlb_set_page_full
  accel/tcg: Retain prot flags from tlb_fill
  accel/tcg: Store some tlb flags in CPUTLBEntryFull
  accel/tcg: Honor TLB_DISCARD_WRITE in atomic_mmu_lookup
  softmmu/physmem: Check watchpoints for read+write at once
  accel/tcg: Trigger watchpoints from atomic_mmu_lookup
  accel/tcg: Move TLB_WATCHPOINT to TLB_SLOW_FLAGS_MASK
  target/arm: Support 32-byte alignment in pow2_align
  exec/memattrs: Remove target_tlb_bit*
  accel/tcg: Add tlb_fill_flags to CPUTLBEntryFull
  accel/tcg: Add TLB_CHECK_ALIGNED
  target/arm: Do memory type alignment check when translation disabled
  target/arm: Do memory type alignment check when translation enabled

 include/exec/cpu-all.h    |  29 +++++--
 include/exec/cpu-defs.h   |   9 ++
 include/exec/memattrs.h   |  12 ---
 include/hw/core/cpu.h     |   7 +-
 accel/tcg/cputlb.c        | 171 ++++++++++++++++++++++++++------------
 softmmu/physmem.c         |  19 +++--
 target/arm/helper.c       |  36 +++++++-
 target/arm/ptw.c          |  28 +++++++
 target/arm/translate.c    |   8 +-
 target/sparc/mmu_helper.c | 121 ++++++++++++---------------
 10 files changed, 278 insertions(+), 162 deletions(-)

-- 
2.34.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D22E7700A83
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 16:42:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxTxT-0006sa-C5; Fri, 12 May 2023 10:41:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxTxS-0006qd-3J
 for qemu-devel@nongnu.org; Fri, 12 May 2023 10:41:22 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxTxF-0004gt-JV
 for qemu-devel@nongnu.org; Fri, 12 May 2023 10:41:21 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f475366522so23190275e9.1
 for <qemu-devel@nongnu.org>; Fri, 12 May 2023 07:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683902467; x=1686494467;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eaIC9UXC4kSNwW8Av+WYAsaqnXQaSZWXWeboMHPSfhM=;
 b=d2AppyMy1uXM1t6x+x9I9iEhVT0CL9cAPLsy4o5ggR5cMTcTNvhfgvCGGRqll/TJDU
 dkyIeH6mFNH4c2PjL/mY81Bga7kurAkhCF3h/3pe4j5SSvKa13emweLiP2MGdm3c4zdt
 23cQJJoGjKmtlaXiXbhqZl1Pffu9oHKlJoXsw8T86AgmckTYclLHo3CkB1G4zV4hqO5i
 uBNbXeNzTaNLthSWR5FhUBRglBPUD0+IEO1QRtYSEGiQFZRsH+w7Cgpym+SJbZ8BuxHu
 aOEvmX0hpa3XWbV2YLQwRFlPm+BWBYzdq2E6043zGS9yfcHvGyPjV+Uq7e1mNthpWbzP
 P4pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683902468; x=1686494468;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eaIC9UXC4kSNwW8Av+WYAsaqnXQaSZWXWeboMHPSfhM=;
 b=TYL3iuHIroWS5bFz2LGvycaK4Lv3DlZ5rbg+yg52J1ddzOLjqkIdGaY49QQn2I0l7/
 Id2uFXwWbU2TK/hiOSTvOjqIqWa4LluVPg/xbaS7Opou+1/0OQMBxSuF0GTqsg9JIH5+
 39pPYITvf91FQR/9XYbrBL5oM7IL44K2qEuWCo0kCg8vbG5S0pciBSyZpCRSWJ7hvyjL
 w+UC9Inl1KIR7kgLwP8NALf1stSNGX/+OKIOZzwkcB4Wkjf+14iagaKPpck64I3/FyuS
 aPqvQuK7dtLFzFQTzPNoGJbi/KJ+1sdZu8RDCvNKsBRVoCkstTSI0P7PbFPDR2lyQm7L
 W/zw==
X-Gm-Message-State: AC+VfDzRluEJQpB217eZEzXkXh/4xsYQ19bL/gWwOYV4SwJ6uBtaHRJH
 LX1bPC7e2Tm0r5noHmfd8IzEvw==
X-Google-Smtp-Source: ACHHUZ4o9XKfTQbf2eCeHXGcTRz+WzkKZeHMkenUVSyM83yqbRJ3SgGNKZVvJRZp8o0P52/CP+E6Bg==
X-Received: by 2002:a05:600c:2101:b0:3f4:2174:b28f with SMTP id
 u1-20020a05600c210100b003f42174b28fmr13676773wml.2.1683902467612; 
 Fri, 12 May 2023 07:41:07 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a7bcc0c000000b003f17848673fsm28916167wmh.27.2023.05.12.07.41.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 07:41:07 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 00/20] target/arm: Start conversion of A64 decoder to
 decodetree
Date: Fri, 12 May 2023 15:40:46 +0100
Message-Id: <20230512144106.3608981-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

The A64 decoder is still an old-school hand-written one.
It's not too badly structured as these things go, but it's
still been noticeably harder to both add new instructions to
and to review patches for than a decodetree decoder. (This
is particularly clear when you have to review a patch that
adds an insn both to A32 and A64 -- one half of the patch
is a lot easier to understand than the other.)

I was looking at FEAT_MOPS, which is in the A64 load/store
area of the instruction set, and I really didn't fancy trying
to fit it into the old decoder. The instruction set is not
standing still, so we're going to have to keep adding
instructions for the foreseeable future. We should make
our lives easier by biting the bullet and converting this
to decodetree.

Past experience is that a decodetree conversion works out
to a lot of patches, so this series is just the first part,
which converts data-processing-immediate and branch insns.
Most of the first half is some older work from Richard Henderson,
which I rebased and tweaked a little. I definitely want to
convert the whole of the integer decode, but I might leave
the FP/SIMD insns for later.

thanks
-- PMM

Peter Maydell (11):
  target/arm: Create decodetree skeleton for A64
  target/arm: Pull calls to disas_sve() and disas_sme() out of legacy
    decoder
  target/arm: Convert Extract instructions to decodetree
  target/arm: Convert unconditional branch immediate to decodetree
  target/arm: Convert CBZ, CBNZ to decodetree
  target/arm: Convert TBZ, TBNZ to decodetree
  target/arm: Convert conditional branch insns to decodetree
  target/arm: Convert BR, BLR, RET to decodetree
  target/arm: Convert BRA[AB]Z, BLR[AB]Z, RETA[AB] to decodetree
  target/arm: Convert BRAA, BRAB, BLRAA, BLRAB to decodetree
  target/arm: Convert ERET, ERETAA, ERETAB to decodetree

Richard Henderson (9):
  target/arm: Split out disas_a64_legacy
  target/arm: Convert PC-rel addressing to decodetree
  target/arm: Split gen_add_CC and gen_sub_CC
  target/arm: Convert Add/subtract (immediate) to decodetree
  target/arm: Convert Add/subtract (immediate with tags) to decodetree
  target/arm: Replace bitmask64 with MAKE_64BIT_MASK
  target/arm: Convert Logical (immediate) to decodetree
  target/arm: Convert Move wide (immediate) to decodetree
  target/arm: Convert Bitfield to decodetree

 target/arm/tcg/translate.h     |    5 +
 target/arm/tcg/a64.decode      |  156 ++++
 target/arm/tcg/translate-a64.c | 1318 ++++++++++++++------------------
 target/arm/tcg/meson.build     |    1 +
 4 files changed, 729 insertions(+), 751 deletions(-)
 create mode 100644 target/arm/tcg/a64.decode

-- 
2.34.1



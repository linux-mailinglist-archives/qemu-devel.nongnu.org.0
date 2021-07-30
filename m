Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2703DBBEB
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 17:17:46 +0200 (CEST)
Received: from localhost ([::1]:33550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9UGf-0006cr-2G
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 11:17:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m9UFe-0004jk-Su
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 11:16:42 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:43759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m9UFc-0008Ry-3H
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 11:16:42 -0400
Received: by mail-wr1-x42a.google.com with SMTP id h14so11719868wrx.10
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 08:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zjDrMTLlUOhiuTOt61+dB6ig0Qs43twSaUJnIxWi7s8=;
 b=fAbWJjBMjpY51xzLf71RRL23MsBGRWqYx+uR5A/OE6vhnOD8DhDuyKm8e2AA1ncnb+
 wJDqKZq5dltdu+ckLOYTwtFLzkJFt+U1DH4mWaG5VX1PkmnM6TcjNgIk9/fRyfoG102G
 A/9JS97D9Ns7jKrChUPGBlV5i5RdBO6a9iAUwitBdliulEHI1rStft90lpNCKLiVpSph
 yo9kvL4Hd5BGj8+gbwtrp1n0dm1jRLNHwURaP5jyJJOIQUNEgVO5IXrCu9E0oB8Y+cFu
 cSjapCK7quY45JIepdUpQ+dFooIzWnspYjSghBDh8BryTZ5VCk7pyMqT1AhUAgg247AK
 LZqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zjDrMTLlUOhiuTOt61+dB6ig0Qs43twSaUJnIxWi7s8=;
 b=pXK34AyLzqUXGF0V46BRYWm8Z2lAOVzuhS2/mfJn97NEl/0fMrxURF6VfoUj8Qd2i9
 /ELUft4Xj5UmWASsQI9n/T3dOFedYfE6+dBewvLkhYkRtogaXO9thvAUHoubdru6hd46
 sr6wOdSv8nEST+Ed/oGi7V83DT9PdD0U6/BpJ0a/IuIl1wTmHFxfRd1WRVz5lXARwooW
 P7PriFAQIbg6hN9lL4s9Eri5at90dXOACd3+8h6e5L+9qEbV0AfRZlzXcfhc5Ye3vLi7
 c+kAU5QkSeppsoImI0kbD0uRQ+IRS6luvD55/rqMK44PQHKD80IGkpjv5EVtUHJB92+t
 xAIw==
X-Gm-Message-State: AOAM531rk4MbhAOueP84RavcNdFALjvyP+yN4IqG4Y86fGgC/rtHXdXo
 V9hYMP0Ef+dIYqrDqekEOr+GZA==
X-Google-Smtp-Source: ABdhPJwKLBqXfzLqAo7zMZk4IJpgL/ZuDB2K2oZAaO5TWXvtbvWNzy5JSm0KBZziVlLi7i8HKLZ/pw==
X-Received: by 2002:adf:f5d1:: with SMTP id k17mr3648478wrp.123.1627658198493; 
 Fri, 30 Jul 2021 08:16:38 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id h12sm2020292wrm.62.2021.07.30.08.16.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 08:16:38 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/2] arm: Implement M-profile trapping on division by zero
Date: Fri, 30 Jul 2021 16:16:34 +0100
Message-Id: <20210730151636.17254-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Unlike A-profile, for M-profile the UDIV and SDIV insns can be
configured to raise an exception on division by zero, using the CCR
DIV_0_TRP bit.  This patchset implements that missing functionality
by having the udiv and sdiv helpers raise an exception if needed.

Some questions:

Is it worth allowing A-profile to retain the mildly better codegen it
gets from not having to pass in 'env' and marking the helper as
no-side-effects (ie having M-specific udiv/sdiv helpers) ?

Is it worth inlining either udiv or sdiv for the A-profile case?
udiv can be done with movcond/movcond/divu, something like:

    /* t1 = (t2 == 0) ? 0 : t1;    t2 = (t2 == 0) ? 1 : t2 */
    tcg_gen_movcond_i32(TCG_COND_EQ, t1, t2, tcg_constant_i32(0),
    tcg_constant_i32(0), t1);
    tcg_gen_movcond_i32(TCG_COND_EQ, t2, t2, tcg_constant_i32(0),
    tcg_constant_i32(1), t2);
    /* Either t1 / t2; or 0 / 1 to give 0 for division-by-zero */
    tcg_gen_divu_i32(t1, t1, t2);

sdiv is more painful because it needs to check for both x/0 and
INTMIN/-1 cases.  Some other targets choose to generate inline TCG
ops for it, though.

Side note, I don't understand the x86-64 codegen for the above
sketch of an inline udiv. When I try it the TCG ops are

  mov_i32 tmp3,r2
  mov_i32 tmp6,r3
  movcond_i32 tmp3,tmp6,$0x0,$0x0,tmp3,eq
  movcond_i32 tmp6,tmp6,$0x0,$0x1,tmp6,eq
  mov_i32 tmp7,$0x0
  divu2_i32 tmp3,tmp7,tmp3,tmp7,tmp6
  mov_i32 r3,tmp3

but the x86 code is
0x7f5f1807dc0c:  45 33 f6                 xorl     %r14d, %r14d
0x7f5f1807dc0f:  45 85 ed                 testl    %r13d, %r13d
0x7f5f1807dc12:  45 0f 44 e6              cmovel   %r14d, %r12d
0x7f5f1807dc16:  41 bf 01 00 00 00        movl     $1, %r15d
0x7f5f1807dc1c:  45 3b ee                 cmpl     %r14d, %r13d
0x7f5f1807dc1f:  45 0f 44 ef              cmovel   %r15d, %r13d
0x7f5f1807dc23:  41 8b c4                 movl     %r12d, %eax
0x7f5f1807dc26:  41 8b d6                 movl     %r14d, %edx
0x7f5f1807dc29:  41 f7 f5                 divl     %r13d

where the comparison for the first cmovel is 'testl %r13d, %r13d",
but the second comparison is 'cmpl %r14d, %r13d'.  That's the same
effect (given r14 is 0) but I don't understand why the backend has
chosen to generate different code for the two cases.  (Ideally of
course it would notice that it already had generated the condition
check and not repeat it.)

thanks
-- PMM

Peter Maydell (2):
  target/arm: Re-indent sdiv and udiv helpers
  target/arm: Implement M-profile trapping on division by zero

 target/arm/cpu.h       |  1 +
 target/arm/helper.h    |  4 ++--
 target/arm/helper.c    | 34 ++++++++++++++++++++++++++--------
 target/arm/m_helper.c  |  4 ++++
 target/arm/translate.c |  4 ++--
 5 files changed, 35 insertions(+), 12 deletions(-)

-- 
2.20.1



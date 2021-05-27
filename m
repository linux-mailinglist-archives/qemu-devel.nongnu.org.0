Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0559F3925F7
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 06:16:15 +0200 (CEST)
Received: from localhost ([::1]:40442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm7RN-0004Aq-FN
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 00:16:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm7PO-0001YZ-DJ
 for qemu-devel@nongnu.org; Thu, 27 May 2021 00:14:11 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:42978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm7PM-0007A1-Fg
 for qemu-devel@nongnu.org; Thu, 27 May 2021 00:14:09 -0400
Received: by mail-pf1-x433.google.com with SMTP id x18so2640482pfi.9
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 21:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hXSPrgwRYRwN6c4rBlPGTm7XyzONt3OVX4eBM71Bm9g=;
 b=HKhj8koQeXbgu771hOj7JmB5kvsK+R8BbTWx39DHD3x+mBdnWaGcHIoFCUS49fWLEJ
 ox0oATNal/nQzCiisC6+YxMUvUlRxbvf/mYxXqLLY97r1K7P50ZixsooW2r7Sed/MgAX
 GRkYpDLeCAehlqtacKScvG/vzVzwHfrzpvlG4LwZayiqSw2xw7PvIl3U6rfGRBxdB6PH
 UI1weBkdA5IChdjH5Ale9Gz0n2sP9vbnU6xyb2RS7B9bfUp/EhkSeNgOwUe+ovUqf8Yq
 c9eggVVh5tEas4ZOZ0IAECP9LGprQm+MmTmL9HU0a7HNAmGS4x4/jCeMMmvHtAz8gdRS
 9Rtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hXSPrgwRYRwN6c4rBlPGTm7XyzONt3OVX4eBM71Bm9g=;
 b=WqnVOHZktUL5HRgN909x5sAo5VxGV8cZIUA1/pKIvxfpQzCsg2KyvnatpfgWC3UlgB
 pBaY3CiBHK03h4AfhLRg3xHJSt3uWIeC3Knbu30tLOkQTjsghmkda3b6PaYfcMiSIqNg
 XfmYUIK1iwYKsuF53VipKM4Egr9tQnBY9qDs9uSl91fRHsJnEbrE8tMT1HczikLzUGhm
 mBGFGk2cAOQZ0tMj0WRve+cQu44MhAQkWA3FYv05IEjveDiOj8xS/87kBxmhh9GdwZ1S
 gURiDRE34Vp972loh8r5Kassy8MiSmTYzpHkVz6ad5WOaIDyfFQ3NO4romXy+oEAK0Cd
 BQSQ==
X-Gm-Message-State: AOAM532OhFs/O0oEhlJylfahMvfgsf4ZBZJmkxKTudmsNnvQEkNcD3Bo
 7vh2XoX7hr42Dc/P4ShbpbIwaFay01iUXA==
X-Google-Smtp-Source: ABdhPJwIf8Zl21oE7wI1oh4zLS0hEfiq1j0DbxkVreykX0Ivh2bhJzy7F44qKX9lkpZpBmHDIQCQDg==
X-Received: by 2002:a65:6844:: with SMTP id q4mr1857383pgt.224.1622088846468; 
 Wed, 26 May 2021 21:14:06 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id s1sm605959pfc.6.2021.05.26.21.14.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 21:14:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/11] softfloat: Improve denormal handling
Date: Wed, 26 May 2021 21:13:54 -0700
Message-Id: <20210527041405.391567-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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
Cc: alex.bennee@linaro.org, mmorrell@tachyum.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This attempts to fix the x86 denormal-exception flag, which is the
inverse of the existing float_flag_input_denormal flag.  I have not
created a new test case for this yet, fwiw.

While auditing all uses of float_flag_*_denormal, I found some errors
in target/rx and target/mips.

This is based on my current softfloat conversion for floatx80:
Based-on: <20210525150706.294968-1-richard.henderson@linaro.org>

The complete tree may be found at
https://gitlab.com/rth7680/qemu/-/commits/fpu-test-5


r~


Richard Henderson (11):
  softfloat: Rename float_flag_input_denormal to
    float_flag_iflush_denormal
  softfloat: Rename float_flag_output_denormal to
    float_flag_oflush_denormal
  softfloat: Introduce float_flag_inorm_denormal
  softfloat: Introduce float_flag_result_denormal
  target/i386: Use float_flag_inorm_denormal
  target/rx: Handle the FPSW.DN bit in helper_set_fpsw
  target/rx: Use FloatRoundMode in helper_set_fpsw
  target/rx: Fix setting of FPSW.CE
  target/mips: Drop inline markers from msa_helper.c
  target/mips: Do not check MSACSR_FS_MASK in update_msacsr
  target/mips: Drop denormal operand to update_msacsr

 include/fpu/softfloat-types.h |  18 +-
 fpu/softfloat.c               |  88 ++++------
 target/arm/sve_helper.c       |   6 +-
 target/arm/vfp_helper.c       |  12 +-
 target/i386/tcg/fpu_helper.c  |  18 +-
 target/mips/tcg/msa_helper.c  | 298 +++++++++++++++-------------------
 target/rx/op_helper.c         |  19 ++-
 target/tricore/fpu_helper.c   |   6 +-
 fpu/softfloat-parts.c.inc     |  13 +-
 9 files changed, 212 insertions(+), 266 deletions(-)

-- 
2.25.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B97124CDD49
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 20:20:21 +0100 (CET)
Received: from localhost ([::1]:59282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQDTQ-000817-IZ
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 14:20:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nQDJN-0000BE-St
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 14:09:58 -0500
Received: from [2607:f8b0:4864:20::1034] (port=40863
 helo=mail-pj1-x1034.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nQDJL-0002IT-4e
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 14:09:56 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 mv5-20020a17090b198500b001bf2a039831so2041794pjb.5
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 11:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/JZrc06ZM/dLbY+C3htUqa39VH370/158BCJ/7NLFDw=;
 b=N79KnIspffKHM4N8mc5ZYYx2R8qiSPXsN1qBzeQD74EG0HYbjdXldbUQoAH5feYfhH
 hW/rJbYIsl9cb5GI7n+5hPDIxQRKQxI1mJPEZzxWrfglO5P3JHg9sKpXZUbbY9a2yLd2
 u20lKxXv41EdHJTBjMHI2fJ16xbsbJLNWLNagLXH42wPyXklkdkSbV4gDYFV+3DOc9CP
 7qHA/Mk0wmhAqF02Rzn15N9GZTKUedud3+WrV6IqMpOu9dD7BSYEvqEOCk4gzWBOMS1R
 wk+V+xo8rpA3EKVQrV+OzKvLj7EXARbFOIKHo+djnAz9g/N4t/eK4YJ/eT2DcArqsbJ9
 zVRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/JZrc06ZM/dLbY+C3htUqa39VH370/158BCJ/7NLFDw=;
 b=WOhgvnRwvNgKAOjTlNbU+fGEqXUsf8eyvPE9vZs+MaogZYWttddKM+CRqZe8ciJoYb
 xahp9hBKRo+K7p+iEo2lhNEcL0iu1MJBwC0t2ALPh+IETON+8zRwOeWzTWNojHErh1wb
 W1Awtli0HpR99tI8fawWZwmW73z2P3hXAata8wRDTIjT4TUiUqKHBb5tJbFSvra0Tt9y
 9fm3I6Ohn8gcBTpqQ+2QmOKxoYiOFHdnKQih3YK3OWa7pQITA8EOkR5/GUbu1PjXR38G
 TfDrBPKNePCkXvV/NKKmOg5KvJWoMVDFWW5F08hi6G3nGSbNvESeCDoY/lX4AvE8KfHf
 WkrA==
X-Gm-Message-State: AOAM533erILqhX/06dmcfQLon9uejDBHH9D2CvNpSv0m6SE+sagVtJkB
 zodJpEWnhnHTguvKZOd9/JR9euZdv47ntA==
X-Google-Smtp-Source: ABdhPJydsRrJDISkrbcGLYiRvfL6rUqo3js12pGPdr1TLuix8jUd2HXb+nubltfVQMnY/9XnDLzHTQ==
X-Received: by 2002:a17:90b:33c8:b0:1bf:2f7d:e056 with SMTP id
 lk8-20020a17090b33c800b001bf2f7de056mr114711pjb.25.1646420993701; 
 Fri, 04 Mar 2022 11:09:53 -0800 (PST)
Received: from localhost.localdomain
 (2603-800c-1201-c600-f24b-57b2-da7c-e304.res6.spectrum.com.
 [2603:800c:1201:c600:f24b:57b2:da7c:e304])
 by smtp.gmail.com with ESMTPSA id
 w17-20020a056a0014d100b004f1063290basm6839137pfu.15.2022.03.04.11.09.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 11:09:53 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 00/21] tcg patch queue
Date: Fri,  4 Mar 2022 09:09:51 -1000
Message-Id: <20220304190951.522227-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1034
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Version 2: Drop signed 32-bit guest patches while CI failure examined.



The following changes since commit 3d1fbc59665ff8a5d74b0fd30583044fe99e1117:

  Merge remote-tracking branch 'remotes/nvme/tags/nvme-next-pull-request' into staging (2022-03-04 15:31:23 +0000)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20220304

for you to fetch changes up to cf320769476c3e2820be2a6280bfa1e15baf396f:

  tcg/i386: Implement bitsel for avx512 (2022-03-04 08:50:41 -1000)

----------------------------------------------------------------
Reorder do_constant_folding_cond test to satisfy valgrind.
Fix value of MAX_OPC_PARAM_IARGS.
Add opcodes for vector nand, nor, eqv.
Support vector nand, nor, eqv on PPC and S390X hosts.
Support AVX512VL, AVX512BW, AVX512DQ, and AVX512VBMI2.

----------------------------------------------------------------
Alex Bennée (1):
      tcg/optimize: only read val after const check

Richard Henderson (19):
      tcg: Add opcodes for vector nand, nor, eqv
      tcg/ppc: Implement vector NAND, NOR, EQV
      tcg/s390x: Implement vector NAND, NOR, EQV
      tcg/i386: Detect AVX512
      tcg/i386: Add tcg_out_evex_opc
      tcg/i386: Use tcg_can_emit_vec_op in expand_vec_cmp_noinv
      tcg/i386: Implement avx512 variable shifts
      tcg/i386: Implement avx512 scalar shift
      tcg/i386: Implement avx512 immediate sari shift
      tcg/i386: Implement avx512 immediate rotate
      tcg/i386: Implement avx512 variable rotate
      tcg/i386: Support avx512vbmi2 vector shift-double instructions
      tcg/i386: Expand vector word rotate as avx512vbmi2 shift-double
      tcg/i386: Remove rotls_vec from tcg_target_op_def
      tcg/i386: Expand scalar rotate with avx512 insns
      tcg/i386: Implement avx512 min/max/abs
      tcg/i386: Implement avx512 multiply
      tcg/i386: Implement more logical operations for avx512
      tcg/i386: Implement bitsel for avx512

Ziqiao Kong (1):
      tcg: Set MAX_OPC_PARAM_IARGS to 7

 include/qemu/cpuid.h          |  20 ++-
 include/tcg/tcg-opc.h         |   3 +
 include/tcg/tcg.h             |   5 +-
 tcg/aarch64/tcg-target.h      |   3 +
 tcg/arm/tcg-target.h          |   3 +
 tcg/i386/tcg-target-con-set.h |   1 +
 tcg/i386/tcg-target.h         |  17 +-
 tcg/i386/tcg-target.opc.h     |   3 +
 tcg/ppc/tcg-target.h          |   3 +
 tcg/s390x/tcg-target.h        |   3 +
 tcg/optimize.c                |  20 +--
 tcg/tcg-op-vec.c              |  27 ++-
 tcg/tcg.c                     |   6 +
 tcg/i386/tcg-target.c.inc     | 387 +++++++++++++++++++++++++++++++++++-------
 tcg/ppc/tcg-target.c.inc      |  15 ++
 tcg/s390x/tcg-target.c.inc    |  17 ++
 tcg/tci/tcg-target.c.inc      |   2 +-
 17 files changed, 441 insertions(+), 94 deletions(-)


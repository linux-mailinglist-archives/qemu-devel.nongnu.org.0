Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BF16876C7
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 08:54:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNUOr-0001NL-54; Thu, 02 Feb 2023 02:52:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pNUOp-0001N3-BS
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 02:52:51 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pNUOn-0007jN-PP
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 02:52:51 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 c10-20020a17090a1d0a00b0022e63a94799so4792545pjd.2
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 23:52:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zj8l3w+P8ST5npKc1RTkEuUEQzYNRa6QApxIkVXblu0=;
 b=P58eQnEXfRAYb4FcnYieTMgfeimZZ/ht1RLzaHEoHu++wWoUnh39VrsGU/QcxYaqAY
 83OI3wOrmhr3+vOV5AUmMHmovRnqm8nAc2bAxnBB25bJxM5kaLKJsIeug19o2T+KMbVp
 T8HQlkPtvR6w1C53USz2v1PRdnJnwL7jJU1NgIZkHme2jIQ6jEip7zlxSgkYK9aMpfIX
 OQs1l1WO24SUI4fOiv3es/t+dXJTibMOMT/M7AnLTPBHkybmxG4GyPA4Qy/y6l8uFqTS
 2Nb96MVXlzSS60cPss/h3yGWW1o6eTsdFNRFQf56Xqov0GF97Py4geCHq0nHcaALd7FV
 0RQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zj8l3w+P8ST5npKc1RTkEuUEQzYNRa6QApxIkVXblu0=;
 b=Ogz1wxY+UAijrFSJNPtOqK6VuM62mAapAK3czSOuIOcNZBgIYPWAfhMG1R7Z+MzrPI
 68Bp/OXTa064by1kav+TL/a+zuJKfX3djR04iUqv0rLajne1XvAR8BIaJ4eXDSVvfMsP
 wqlk+gZmx3q4rIB5TBrDJ3qnB/CmLvpR3BHsl7+08UsBBuAT8zSSU99LC5HtN4NOy5DN
 vIahCuborocd0m7tXr9A9eSsk16GFx06dKyCmmqfobECl8NMpSaDHzCGcMXNtQy8YCCp
 iaa/JhqU0orqaEtBj2/PQ0+AK8bM9OmOcrGn8IR9ye7EhQLYlD1mfDW6396FCaEHALqM
 mqLw==
X-Gm-Message-State: AO0yUKWJ7oy/XzBIdMff4TWq4AiNiixGPgxPFYLWa39RsqK8g0C9fK1i
 Ib9uEqw0recsBeqNsv6jQhsfmh7MFQ79rfRr
X-Google-Smtp-Source: AK7set+5aZIKeLPEVnPi1gSZPItt5t1/synoA3oh8aV/G7CrwFI2z+rKwTieo8BMKS63tjcRoJ2DkQ==
X-Received: by 2002:a17:90b:17c6:b0:22c:6b5b:8509 with SMTP id
 me6-20020a17090b17c600b0022c6b5b8509mr5780212pjb.16.1675324367800; 
 Wed, 01 Feb 2023 23:52:47 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 b4-20020a17090a7ac400b0022c35afad5bsm2496763pjl.16.2023.02.01.23.52.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 23:52:47 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: anders.roxell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH 0/4] target/arm: Cache ARMVAParameters
Date: Wed,  1 Feb 2023 21:52:38 -1000
Message-Id: <20230202075242.260793-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Anders,

I'm not well versed on tuxrun, and how to make that work with a qemu
binary outside of the container, so I'm not sure if I'm comparing
apples to bananas.  Can you look and see if this fixes the kselftest
slowdown you reported?

Anyway, for a boot and shutdown of your rootfs, I see:

Before:
    11.13%  [.] aa64_va_parameters
     8.38%  [.] helper_lookup_tb_ptr
     7.37%  [.] pauth_computepac
     3.79%  [.] qht_lookup_custom

After:
     9.17%  [.] helper_lookup_tb_ptr
     8.05%  [.] pauth_computepac
     4.22%  [.] qht_lookup_custom
     3.68%  [.] pauth_addpac
     ...
     1.67%  [.] aa64_va_parameters


This is all due to the heavy use pauth makes of aa64_va_parameters.
It "only" needs 2 parameters, tsz and tbi, but tsz is probably the
most expensive part of aa64_va_parameters -- do anything about that
and we might as well cache the whole thing.

The change from struct+bitfields to uint32_t+FIELD is meant to combat
some really ugly code that gcc produced.  Seems like they should have
compiled to the same thing, more or less, but alas.


r~


Richard Henderson (4):
  target/arm: Flush only required tlbs for TCR_EL[12]
  target/arm: Store tbi for both insns and data in ARMVAParameters
  target/arm: Use FIELD for ARMVAParameters
  target/arm: Cache ARMVAParameters

 target/arm/cpu.h          |  30 +++++++
 target/arm/internals.h    |  21 +----
 target/arm/helper.c       | 177 ++++++++++++++++++++++++++++----------
 target/arm/pauth_helper.c |  39 +++++----
 target/arm/ptw.c          |  57 ++++++------
 5 files changed, 217 insertions(+), 107 deletions(-)

-- 
2.34.1



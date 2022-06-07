Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1434453F40F
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 04:49:42 +0200 (CEST)
Received: from localhost ([::1]:55262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyPHo-0000wO-N4
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 22:49:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyPFr-0006UA-KZ
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 22:47:39 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:45975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyPFp-0000Gf-V2
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 22:47:39 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 w2-20020a17090ac98200b001e0519fe5a8so14193990pjt.4
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 19:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Y1ecqEXef6x1OOkP5g4sCp0l9ZohLFq9hOapJwU8Vz0=;
 b=SKJix4h9gjX9RrqgkCRm3YyOqQUJs0R6mqrG+WtD1HkURfrZzYhkyhOJlH634Sw7BY
 FccVHEX46W5GzKUq6Avfj7XlHdRFLKQTHLG8vuZLQ5FXeLhPTmMnUkb8TKnQg36dQPRO
 EdJtPPb1K+Sd9VGygKLWOGy9sqZlNHzlyq+PBmXviWRSw8IxA6UW1vr3LTvmRN94gB1A
 KV3pjQpZ86WsMtOntsi+U1icEuxbbeQfVu9lMPcNgGjZlaeTgdPTIAKIZZL31BQHKpDm
 EPEXUtmNOAfUBTYARyTNaZN3+0Sq1QU8vMXzmn7cpeRxMPWYc4y8zo+F+v/cHEgZhtLa
 afaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Y1ecqEXef6x1OOkP5g4sCp0l9ZohLFq9hOapJwU8Vz0=;
 b=BjUlMbGQ5HQITjS6v8cGwjI1dvbqhFOEfI3XHvydFMXQFBQFBem0GOr3yEOO5KkViy
 J5W41PM+a0BNj//fMF63oFpZ5bIvzRA2BZiyac6JGTYQuuMSst52gFNOGhqU0+I7qlRk
 +begV2ZvB13vq8djtQpMWtCbHaJox9fRW8PHrv79I/9Q8srtAKwiPdAGzXK1v4yM2NzF
 g1k1cWu1jSxJOhVoK5rh1du0yVITuDf7nzDwc9KOTKeyvjlFDIxqUZmJe4oemkt/YHb4
 3ekpze5GYpysAIuIJJgnp2WB8R33OKvlRIWnxl4fQm3cI2/4GtXqHhLTX9ehFsUBXQb4
 Zh4w==
X-Gm-Message-State: AOAM5300GmaLDeHuAylDj8Ed40VbCtnAPI0itlbtPzWRU/5OsbHpwIID
 SZcT3RNClwVF2ZRhOhzKkateod1EEYttxQ==
X-Google-Smtp-Source: ABdhPJyQ5+z7jY5S2+/FGhFZiFlRTgp1Vuabw5iCIwf48eFyMgoMfXi/eMmLRDH4X3v2wof4iytX4g==
X-Received: by 2002:a17:903:2287:b0:164:83cf:bb15 with SMTP id
 b7-20020a170903228700b0016483cfbb15mr26933421plh.49.1654570055980; 
 Mon, 06 Jun 2022 19:47:35 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:d3db:cca:e5c9:6531])
 by smtp.gmail.com with ESMTPSA id
 y26-20020aa7805a000000b0051876d83714sm7476904pfm.196.2022.06.06.19.47.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 19:47:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 00/25] target/arm: tidy exception routing
Date: Mon,  6 Jun 2022 19:47:09 -0700
Message-Id: <20220607024734.541321-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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

This is mostly code movement at this point, out of headers
and into op_helper.c and debug_helper.c.  I have dropped all
the bits that change where route_to_el2 is computed -- it
remains in raise_exception alone.

The last patch has the tiniest of bug fixes, which probably
isn't even visible, because we don't ask for fp_exception_el
with el != current without SVE.


r~


Richard Henderson (25):
  target/arm: Mark exception helpers as noreturn
  target/arm: Add coproc parameter to syn_fp_access_trap
  target/arm: Move fp access syndrome adjust out of raise_exception
  target/arm: Move exception_target_el out of line
  target/arm: Move arm_singlestep_active out of line
  target/arm: Move arm_generate_debug_exceptions out of line
  target/arm: Use is_a64 in arm_generate_debug_exceptions
  target/arm: Move exception_bkpt_insn to debug_helper.c
  target/arm: Move arm_debug_exception_fsr to debug_helper.c
  target/arm: Rename helper_exception_with_syndrome
  target/arm: Introduce gen_exception_insn_el_v
  target/arm: Rename gen_exception_insn to gen_exception_insn_el
  target/arm: Introduce gen_exception_insn
  target/arm: Create helper_exception_swstep
  target/arm: Remove TBFLAG_ANY.DEBUG_TARGET_EL
  target/arm: Move gen_exception to translate.c
  target/arm: Rename gen_exception to gen_exception_el
  target/arm: Introduce gen_exception
  target/arm: Introduce gen_exception_el_v
  target/arm: Introduce helper_exception_with_syndrome
  target/arm: Remove default_exception_el
  target/arm: Create raise_exception_debug
  target/arm: Move arm_debug_target_el to debug_helper.c
  target/arm: Rearrange Secure PL1 test in arm_debug_target_el
  target/arm: Fix Secure PL1 tests in fp_exception_el

 target/arm/cpu.h              | 128 +-------------------
 target/arm/helper.h           |   9 +-
 target/arm/internals.h        |  43 +------
 target/arm/syndrome.h         |   7 +-
 target/arm/translate.h        |  46 ++-----
 target/arm/debug_helper.c     | 222 ++++++++++++++++++++++++++++++++--
 target/arm/helper.c           |  35 ++----
 target/arm/op_helper.c        |  80 ++++++------
 target/arm/translate-a64.c    |  33 ++---
 target/arm/translate-m-nocp.c |  15 ++-
 target/arm/translate-mve.c    |   3 +-
 target/arm/translate-vfp.c    |  20 ++-
 target/arm/translate.c        | 106 ++++++++--------
 13 files changed, 391 insertions(+), 356 deletions(-)

-- 
2.34.1



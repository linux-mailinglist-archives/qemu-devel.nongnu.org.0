Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1815F1C9D
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 16:14:56 +0200 (CEST)
Received: from localhost ([::1]:49534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oedGa-0008SQ-10
	for lists+qemu-devel@lfdr.de; Sat, 01 Oct 2022 10:14:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oedBs-0002Zq-Pd
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 10:10:04 -0400
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731]:36819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oedBq-0003zL-Gb
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 10:10:04 -0400
Received: by mail-qk1-x731.google.com with SMTP id i3so4420910qkl.3
 for <qemu-devel@nongnu.org>; Sat, 01 Oct 2022 07:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=hOI18KfSrB7fYh3OLxU2TzPAWraEYce4bsUZ+ToR7Qo=;
 b=pUtkDEMtb6gTUWOp93D2pMcM22uICPE6BQVz/Kc0CZhiHyF0OiejrC6ab5DEhEGrum
 fu6RZQnMUo0okWvxJHFAei0CwbS6Z54g+ydAIk9YIbfzMMP1X2v3eCHhKtowG9mYZ6mE
 mJdGXM9HxBgL7sAfdFMjtsqblbA4vEHZ/QrBqR2Dm1xSJbXiTU87e2+EBlf30OV2kmPl
 20+DUab8iwmcB/9hJ1lYka+lPVEnVS29w6iKgDWS7Q74p8ejq0JIfqVIwbrv5ShTnyqs
 ZL2Tzlmv5ebiWR0t5vJsFcUvT+rCxA5KjbU246gvaBrmMo8ZTjLCGiPY0vZ7BRmr8k4M
 nrcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=hOI18KfSrB7fYh3OLxU2TzPAWraEYce4bsUZ+ToR7Qo=;
 b=KhucLlnxlJH4iDL8A2Yr+BE4U+i2U0b6TMDSFhVc3utAASfJZ6q/2e7wyprrFLC7KX
 pFxcz8Kskg2YnPQIdcqlBjVke4AAIoxlj1FoXFa9Km8ofrhDFePe8275y55VrsHSxu2B
 od2Jh19E3maoi+bVeMq6P/105NP6MNJ3uTbVdx0vRxWsCSRpR3MdkgrQiWpCSsiFHs4W
 nLnGRdULqOfvtRpdukA81tsn4ZZhOGMBLo+yQ0wGet7MOygyPUYPnvsYRbY2GufN0euD
 y+VUSHm2TQscH6VXyH6IniOu/tQnptdnQtY8o/DmnQrU2xwKwnCx7JnbAlbNP+MTl5qn
 fjRA==
X-Gm-Message-State: ACrzQf3CO09RXrRJZ0iIFXctXUTxAGNTN2SKrZR7zFtKrKKSrpLSr/OB
 9gaavufk89e9AWiQaAAiVORSBPKCbapi/OSS
X-Google-Smtp-Source: AMsMyM7XJB0rRt0efnBVkdA/1JIJBYzm0vJ+PnJQt+OiiAcBVAaxinmD41oUJJ18rzChXPkuBGnH3g==
X-Received: by 2002:a05:620a:2889:b0:6cf:5798:e126 with SMTP id
 j9-20020a05620a288900b006cf5798e126mr9492407qkp.588.1664633379953; 
 Sat, 01 Oct 2022 07:09:39 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8080:8162:afc7:8362:2616:ac15])
 by smtp.gmail.com with ESMTPSA id
 j16-20020a05620a289000b006b615cd8c13sm6075914qkp.106.2022.10.01.07.09.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 07:09:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
Subject: [PATCH v3 00/26] target/i386: pc-relative translation blocks
Date: Sat,  1 Oct 2022 07:09:09 -0700
Message-Id: <20221001140935.465607-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::731;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x731.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is the x86 specific changes required to reduce the
amount of translation for address space randomization.
For v3, quite a few changes based on Paolo's feedback.


r~

Based-on: 20220930212622.108363-1-richard.henderson@linaro.org
("[PATCH v6 00/18] tcg: CPUTLBEntryFull and TARGET_TB_PCREL")


Richard Henderson (26):
  target/i386: Remove pc_start
  target/i386: Return bool from disas_insn
  target/i386: Remove cur_eip argument to gen_exception
  target/i386: Remove cur_eip, next_eip arguments to gen_interrupt
  target/i386: Create gen_update_eip_cur
  target/i386: Create gen_update_eip_next
  target/i386: Introduce DISAS_EOB*
  target/i386: Use DISAS_EOB* in gen_movl_seg_T0
  target/i386: Use DISAS_EOB_NEXT
  target/i386: USe DISAS_EOB_ONLY
  target/i386: Create cur_insn_len, cur_insn_len_i32
  target/i386: Remove cur_eip, next_eip arguments to gen_repz*
  target/i386: Introduce DISAS_JUMP
  target/i386: Truncate values for lcall_real to i32
  target/i386: Create eip_next_*
  target/i386: Use DISAS_TOO_MANY to exit after gen_io_start
  target/i386: Create gen_jmp_rel
  target/i386: Use gen_jmp_rel for loop, repz, jecxz insns
  target/i386: Use gen_jmp_rel for gen_jcc
  target/i386: Use gen_jmp_rel for DISAS_TOO_MANY
  target/i386: Remove MemOp argument to gen_op_j*_ecx
  target/i386: Merge gen_jmp_tb and gen_goto_tb into gen_jmp_rel
  target/i386: Create eip_cur_tl
  target/i386: Add cpu_eip
  target/i386: Inline gen_jmp_im
  target/i386: Enable TARGET_TB_PCREL

 target/i386/cpu-param.h      |   4 +
 target/i386/helper.h         |   2 +-
 target/i386/tcg/seg_helper.c |   6 +-
 target/i386/tcg/tcg-cpu.c    |   8 +-
 target/i386/tcg/translate.c  | 830 ++++++++++++++++++-----------------
 5 files changed, 448 insertions(+), 402 deletions(-)

-- 
2.34.1



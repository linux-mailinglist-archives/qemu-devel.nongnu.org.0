Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 526583AE0B3
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Jun 2021 23:34:42 +0200 (CEST)
Received: from localhost ([::1]:36310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lv55U-0004fD-WD
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 17:34:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv53n-0002G5-QV
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 17:32:56 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:45976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv53k-0008Rl-GI
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 17:32:54 -0400
Received: by mail-pg1-x536.google.com with SMTP id y14so1098899pgs.12
 for <qemu-devel@nongnu.org>; Sun, 20 Jun 2021 14:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rsTABhkuMYGRCBO05y2M8suCN50VvN2WUZZ/LVcIJG0=;
 b=SNGCpYqYO26ca9B3I7PYyh+mAR1wP3TuYKKZuMHwyUhzRbusxZvikIl5Pwhxh52Y7m
 dO7n+05LFkkhVT06x4hVJ8tJMwmFTlIEpog/+OkfUd1APR7iexJKGsJhzh2quxA1KZB0
 yVVBwqkl+L6n7C5YyV3Y1tvP/KkHjutNuxKnYtPPPcVbKXNfSFgN2UCU59ki+uaJhjxl
 D6hQHhGs1fTIW7J8xuGH8GDhOIO3vT/RuiqdojsYjscqP6QLUyxcU4thH07VkllNSEqR
 bYy7UtnjQIN4deH3Da4pstpLDm+WOCdVgyjjVmND1+K8Cl321aDB9qFX5FCEn4//I1kU
 CuAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rsTABhkuMYGRCBO05y2M8suCN50VvN2WUZZ/LVcIJG0=;
 b=Cxpx1sjAqzqL7O4GSvtM44Gcxu4V6Ge0E22s0J3qB7y5CeSthLz2n6j5ZiGv81bi0K
 LqdZrUkYSSyL0e8eCPd5/kYu8Hcl9rGmwTyVi+ULZ6hx83mXk6mrPC4wCO/44+czifWz
 NS+x/VEOhmwzW0UR66MuOyTzCnKylPDQhfrrooguxlu57GtLTxaAR5DGC7A2alfKxVVS
 VoN9p+TyJOkuH1UyyG0LOEv+K4+rUcQle4eIdeITkN+I26s6XB4uzYTDX1VXuq2F2vbb
 4ySpRiMqqeBtDchlLd1B+dDL/E2SqxmF3C2MhdFlZUoy7kn/4BqY1Pp6a2h2mFutfryY
 UQjg==
X-Gm-Message-State: AOAM530jMuOkzHNRprYY48RDa4B7aIniYewIAnmJI6krMXnCsXrIb0lO
 GSOGMdM4bCkgxUoYFWGPBoNWLU/Rkz3U2A==
X-Google-Smtp-Source: ABdhPJyYJXs1xp44+TM5OPRcJTloQJWjARqi4zbHKPB4LAHfSJQWj+plPAf09NHDtKCRVLYOE2HwWQ==
X-Received: by 2002:aa7:93a9:0:b029:2e9:c839:d2d with SMTP id
 x9-20020aa793a90000b02902e9c8390d2dmr16557919pff.5.1624224770278; 
 Sun, 20 Jun 2021 14:32:50 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id w21sm13608329pfq.143.2021.06.20.14.32.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jun 2021 14:32:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/11] target/cris: Convert to TranslatorOps
Date: Sun, 20 Jun 2021 14:32:38 -0700
Message-Id: <20210620213249.1494274-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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
Cc: edgar.iglesias@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I've reached a point where *all* targets must use the translator loop.  
Do that, plus some other obvious cleanups.

Changes for v2:
  * Fix (drop) singlestep check for max_insns.
    We already do that generically.
  * Move delay branch handling to tb_stop.
  * Improve tcg_gen_lookup_and_goto_ptr patch.
  * Patch 8, Use movcond for t_gen_cc_jmp, now
    folded into single caller, for JMP_INDIRECT.

I'll note, while glancing through the emitted opcodes,
that the comment at the top of the translator still stands:
The cc handling is the thing most in need of attention.


r~


Richard Henderson (11):
  target/cris: Add DisasContextBase to DisasContext
  target/cris: Replace DISAS_TB_JUMP with DISAS_NORETURN
  target/cris: Mark exceptions as DISAS_NORETURN
  target/cris: Remove DISAS_SWI
  target/cris: Fix use_goto_tb
  target/cris: Convert to TranslatorOps
  target/cris: Mark helper_raise_exception noreturn
  target/cris: Mark static arrays const
  target/cris: Move delayed branch handling to tb_stop
  target/cris: Use tcg_gen_lookup_and_goto_ptr
  target/cris: Improve JMP_INDIRECT

 target/cris/helper.h            |   2 +-
 target/cris/translate.c         | 392 +++++++++++++++++---------------
 target/cris/translate_v10.c.inc |  11 +-
 3 files changed, 218 insertions(+), 187 deletions(-)

-- 
2.25.1



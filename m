Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C1D33A73E
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 19:03:28 +0100 (CET)
Received: from localhost ([::1]:40980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLV5L-00043C-Kj
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 14:03:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLV1H-00028Q-17
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 13:59:16 -0400
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833]:43801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLV1C-00026v-FG
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 13:59:14 -0400
Received: by mail-qt1-x833.google.com with SMTP id s2so7640126qtx.10
 for <qemu-devel@nongnu.org>; Sun, 14 Mar 2021 10:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=52KfxatCEV55z76bCNlg1bkm3mzJ+j/4L7GKbVC527U=;
 b=WgCqZ/PL29LUIlXPwlUwZj1OlGjszV2dMKWvlKwiQOzkaYsO+yZzvrkW1r2bCmYIdy
 FWTTnG3wrbK1+u4kSn9YIwlIM3yu/1TN0lEnrYMFS9lWEkMIMwzF8diKFgEu0qWdHWHH
 RTpsjd/rmXUxhxPerSX84v2MRoAp8u2AkDUa3YI0Zek+Pp70rzLvs+3J9OhATJYMexAJ
 TPVl1HwkFLFep4TCcTJ01EhGH5OBOgE9VlsVlergj6+nrZEMx5lk0fQMU5WBKPoyJANF
 Ou+vemsgWUcw2LsdqPyLjjq4MhgBuk1QON+eGx7HHlwS5grkX3i1/JfNxaXONiGH+kFV
 B23w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=52KfxatCEV55z76bCNlg1bkm3mzJ+j/4L7GKbVC527U=;
 b=i69gtKU35KF/v/1BU6mSXXFyk7mAHoC6dz95AE5WB7YpxIH0VZlDvCVCu3lsMGVx7O
 Nl/fpOb9zmzGnWf7y5fSycKvRnEBePttyW9hl+QUvocqjDnNOHtxwDjozr4Q21OtkBX4
 AkhmY3KRYQdLVU8WwztLeg4ZL88jID/BXKQOS0+7onq1aWMpC4qTEp6uPmLu/IRsM8Eh
 P4FCpxNVXsy8YKXqdM5TDt1mn9gNxC/Zkx0nTJhdFyxL75PyeKyz2UdiTWMRPNzbODhB
 MU05CJqiyaTNKIBvwDRPZQ1EFe1q4gFD3KTPDvWHIrff8n86iPgw44Lpp5dn4VNzfvM5
 fPRA==
X-Gm-Message-State: AOAM5331IrNJa7dSYd2sO/1ixiPHSN/YCYvWkRP23IdIl/YxF+T6xNqk
 YrU+BKG9YOU35TpUQX7gWWF/XwfGK+OeNtFX
X-Google-Smtp-Source: ABdhPJwZjUJnVoJhzAt9YWcKRxHMOaTVXLqF+ezCAxWEx6KIUdlM8RC2F/yWfyG3LX717OUAkx3STg==
X-Received: by 2002:ac8:59d6:: with SMTP id f22mr6281775qtf.83.1615744749385; 
 Sun, 14 Mar 2021 10:59:09 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id c127sm10216240qkd.87.2021.03.14.10.59.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 10:59:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/16] target/ppc: Fix truncation of env->hflags
Date: Sun, 14 Mar 2021 11:58:50 -0600
Message-Id: <20210314175906.1733746-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::833;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x833.google.com
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
Cc: ivan@vmfacility.fr, qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Clean up everything that touches hflags, fixing quite a few
other bugs in the process.

Changes for v3:
 * Fixes for linux-user, signal handling and startup.
   -- Oops, the directory in which I did testing for v2
      had a reduced set of targets.

Changes for v2:
 * Do not put tcg internal state into migration, except to
   retain backward compatibility.
 * Do not touch anything in env in ppc_tr_init_disas_context.
 * Do make sure that hflags contains everything that it should.
 * Do verify that hflags is properly updated.


r~


Richard Henderson (16):
  target/ppc: Move helper_regs.h functions out-of-line
  target/ppc: Move 601 hflags adjustment to hreg_compute_hflags
  target/ppc: Properly sync cpu state with new msr in cpu_load_old
  target/ppc: Do not call hreg_compute_mem_idx after ppc_store_msr
  target/ppc: Retain hflags_nmsr only for migration
  target/ppc: Fix comment for MSR_FE{0,1}
  target/ppc: Disconnect hflags from MSR
  target/ppc: Reduce env->hflags to uint32_t
  target/ppc: Put dbcr0 single-step bits into hflags
  target/ppc: Create helper_scv
  target/ppc: Put LPCR[GTSE] in hflags
  target/ppc: Remove MSR_SA and MSR_AP from hflags
  target/ppc: Remove env->immu_idx and env->dmmu_idx
  hw/ppc: Use hreg_store_msr for msr updates
  linux-user/ppc: Fix msr updates for signal handling
  target/ppc: Validate hflags with CONFIG_DEBUG_TCG

 target/ppc/cpu.h                |  50 +++++-
 target/ppc/helper.h             |   1 +
 target/ppc/helper_regs.h        | 183 +--------------------
 hw/ppc/pnv_core.c               |   3 +-
 hw/ppc/spapr_hcall.c            |   3 +-
 hw/ppc/spapr_rtas.c             |   3 +-
 linux-user/ppc/cpu_loop.c       |   5 +-
 linux-user/ppc/signal.c         |  23 ++-
 target/ppc/excp_helper.c        |   9 ++
 target/ppc/helper_regs.c        | 272 ++++++++++++++++++++++++++++++++
 target/ppc/int_helper.c         |   1 +
 target/ppc/machine.c            |  27 ++--
 target/ppc/mem_helper.c         |   2 +-
 target/ppc/misc_helper.c        |  13 +-
 target/ppc/mmu-hash64.c         |   3 +
 target/ppc/translate.c          |  98 ++++--------
 target/ppc/translate_init.c.inc |   4 +-
 target/ppc/meson.build          |   1 +
 18 files changed, 411 insertions(+), 290 deletions(-)
 create mode 100644 target/ppc/helper_regs.c

-- 
2.25.1



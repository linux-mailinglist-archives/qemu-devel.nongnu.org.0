Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE388339AAB
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 02:02:42 +0100 (CET)
Received: from localhost ([::1]:37678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKsfx-0000eb-3l
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 20:02:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKsdm-000707-Sf
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 20:00:27 -0500
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f]:42752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKsdk-0003Jy-8s
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 20:00:26 -0500
Received: by mail-qk1-x72f.google.com with SMTP id z190so26275264qka.9
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 17:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j/HUAFBEN59XLx14sydsvEZJQxrPv8+OPzHHJAGoC8g=;
 b=Yl/daJ90MDuEksiYqsITZBtCqxlpMCdlJ6FTUYKR7felXEbgSoAh6GpEUUrg709qRe
 TbXZTlr6KFYKEw79WOMRYxjWx6wmn+PSTQTEh6j/3s02r/FlxbktbPmMEflmhU5fVULD
 f8deUv9o48hW8tplzvMZGrzevfatqpLUYkRjOCadoqIGNKqzlIobvQiN3wS+TuXQUNpm
 dFUDI0quFYadOh2qy8nTuDBxQ6Ol9zPLVRQn71A6JK6+UAx34/mV0AncZnlQaC9ZNsOz
 Kmrv6AUAvpnks5KQ7YYpLY8BZPjaBM/H78eZsA9oW+dQ8Do9fLJXpoIml+f0sLunuyau
 cQVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j/HUAFBEN59XLx14sydsvEZJQxrPv8+OPzHHJAGoC8g=;
 b=Db3p5L3moM8VoXakru/4NNczzYxzStkiW1NZpjPapz0QoWpebAH3Dua15oQK4Ne8yR
 GOUVfKOW73g7/f7MZxWNk6TM6kE+cABPsUqkG50Zp02/cOEHBuZ3NMtuJe9ggoU39VNG
 sMxV8QU2PFOZqauY6z3CIJKsDQSTPY8fygb16lKhPuEUJlp6FqLV4B5Dg8MsoNbnX/Ih
 /iC9t3qlU4r9yPmRoliEfhWvLzW5rLIzpf/zTnnf6HokIhtlW2ZUgTq+ZHc7XLSSya1q
 o5uJR1GjdBt2cz53SJVSU1dZN8zQw/H2G2fGij65zOYsCXlTxr2aL24bUaJOSLTMKewY
 4jDw==
X-Gm-Message-State: AOAM533k+NlTX77worNiHWtd/vGDaJqDQJqhUK1cQv3pw86+sB4pXh3j
 B/RcmEj7xdMK0pLSXP3pZa8VgSfbHOY/uAVt
X-Google-Smtp-Source: ABdhPJw+YhSQPvZYkwWH69wKvnJnbMkG3LPTr+GmeI1kAiqWLFj925ooU70TKcDzn+opJmI/cWbZIg==
X-Received: by 2002:a37:afc7:: with SMTP id y190mr15732819qke.62.1615597221523; 
 Fri, 12 Mar 2021 17:00:21 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id l129sm5602078qkd.76.2021.03.12.17.00.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 17:00:21 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/15] target/ppc: Fix truncation of env->hflags
Date: Fri, 12 Mar 2021 19:00:03 -0600
Message-Id: <20210313010018.819153-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72f.google.com
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

Version 2 is totally new.

Clean up everything that touches hflags, fixing quite a few
other bugs in the process.

 * Do not put tcg internal state into migration, except to
   retain backward compatibility.
 * Do not touch anything in env in ppc_tr_init_disas_context.
 * Do make sure that hflags contains everything that it should.
 * Do verify that hflags is properly updated.


r~


Richard Henderson (15):
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
  target/ppc: Validate hflags with CONFIG_DEBUG_TCG

 target/ppc/cpu.h                |  50 +++++-
 target/ppc/helper.h             |   1 +
 target/ppc/helper_regs.h        | 183 +--------------------
 hw/ppc/pnv_core.c               |   3 +-
 hw/ppc/spapr_hcall.c            |   3 +-
 hw/ppc/spapr_rtas.c             |   3 +-
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
 16 files changed, 397 insertions(+), 276 deletions(-)
 create mode 100644 target/ppc/helper_regs.c

-- 
2.25.1



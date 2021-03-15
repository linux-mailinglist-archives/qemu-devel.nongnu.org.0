Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC17933C642
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 20:00:57 +0100 (CET)
Received: from localhost ([::1]:47564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLsSW-00018b-Ki
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 15:00:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLsEQ-0006xH-56
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:46:22 -0400
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c]:36023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLsEN-0001X0-3u
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:46:21 -0400
Received: by mail-ot1-x32c.google.com with SMTP id t16so7488902ott.3
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 11:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FMwWPzmXLiFfE6r8NewSj71aXFVvcRa1lk5paQ/WV4M=;
 b=Id0Ju0n7igYRGWSBRbN1D03EujrPMbW6SHZR7htjrw1EC4go2ZOoWFrOH3cvB1DXBn
 Tk6xoQQOvfgpdixkWTN5ehHHHgk55AR+DkQ5pODt1oQq97b6DoAnHftdqAxr+Db4Sdkl
 gM2BBc25BBU0TXrKMWkuZmjuwL/s7doLXzop7B+YWsXZAELfYFhZkRBecZa8UTDhYyRT
 wZV/hoxwChcakggvQeX4ApaURKrJ2o9zgjquncA7GzGDX3DI3dIlklU+nXNLlCI30JjR
 hA8Y/nOa9uZWjJDeoQhscCZtNxGR5WOQKhx6NNs+aRqRp99XChsSwem8PaVv5eVdkb7d
 8Ukw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FMwWPzmXLiFfE6r8NewSj71aXFVvcRa1lk5paQ/WV4M=;
 b=QC9+ra6MX6t8WlsPPx3MJehcPndbE9GX1JGQSH2eDiZzqIPiquapACD8U5KYWLS3kX
 wLmcnNpWdOyAGS9v51u+yJlguwm8JqPBk+lYVI53odkCSCsLxDRPBz4MxhsQXE8ZhzId
 GoraERlYgurA4dBRJWyMYP242KkkY4/ws/KN1BawudrCIgE0xrpkT7CeGW1zZ8DoEUwd
 Hozru1QtkTi374wnIhymzZDHqYm1gBAxWvLYoi7e8uNOoTraddRkES3XVu9OuowYgG9P
 gzte8LJa1Vq+xrivRyTgumP2lS2E5A/PItc3D6Kttn06s/yD7tTX0eEw+dzLJVqYbFAF
 JC/A==
X-Gm-Message-State: AOAM532pZBPP0Jc7J3W/gAJqoYEwAjpdskNivPZf5KMwSWMs7XMGl7DH
 0z6APaeQ+UKe4h2WsZc6Qn4XjKF10FfFiyzZ
X-Google-Smtp-Source: ABdhPJzTSZY5w+lgEKBlJ6qUMltkXYHXQxsu2o7znoAu9liOWxZ3kkKyPd3wMNIhEmrg/RFHOO1ncw==
X-Received: by 2002:a05:6830:1e4d:: with SMTP id
 e13mr438574otj.146.1615833977707; 
 Mon, 15 Mar 2021 11:46:17 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id o25sm7519851otk.11.2021.03.15.11.46.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 11:46:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 00/17] target/ppc: Fix truncation of env->hflags
Date: Mon, 15 Mar 2021 12:45:58 -0600
Message-Id: <20210315184615.1985590-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Changes for v4:
 * Use hregs_recompute_hflags for hw/ppc/ reset.
   -- Incorporate Cedric's feedback.

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


Richard Henderson (17):
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
  hw/ppc/pnv_core: Update hflags after setting msr
  hw/ppc/spapr_rtas: Update hflags after setting msr
  linux-user/ppc: Fix msr updates for signal handling
  target/ppc: Validate hflags with CONFIG_DEBUG_TCG

 target/ppc/cpu.h                |  50 +++++-
 target/ppc/helper.h             |   1 +
 target/ppc/helper_regs.h        | 183 +--------------------
 hw/ppc/pnv_core.c               |   3 +-
 hw/ppc/spapr_rtas.c             |   2 +
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
 17 files changed, 410 insertions(+), 287 deletions(-)
 create mode 100644 target/ppc/helper_regs.c

-- 
2.25.1



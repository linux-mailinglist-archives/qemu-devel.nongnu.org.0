Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2FE1CB420
	for <lists+qemu-devel@lfdr.de>; Fri,  8 May 2020 17:55:31 +0200 (CEST)
Received: from localhost ([::1]:56672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jX5LW-0003Do-Nl
	for lists+qemu-devel@lfdr.de; Fri, 08 May 2020 11:55:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jX5AY-0007WX-Uh
 for qemu-devel@nongnu.org; Fri, 08 May 2020 11:44:10 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:34138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jX5AX-0004yn-Po
 for qemu-devel@nongnu.org; Fri, 08 May 2020 11:44:10 -0400
Received: by mail-pf1-x441.google.com with SMTP id x15so537540pfa.1
 for <qemu-devel@nongnu.org>; Fri, 08 May 2020 08:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=83/ea6ZxGjsWJtszgeXVzCH9J7MS2Wag3p5yGJh3B6Y=;
 b=mAa+3GhSYyb2Ull8gq31zT3ml53aUY9DV9uiW9zcJKiE4mNQh5d9hdzNDPaG1dIndH
 pzSvDjkLph9KeV7NQmgdpP8DOCjXCqMb0ntJJL3VG+jyBfBAiflpHkGs8jQuUwNzs4jx
 4BSZWrbtyvdPZUbr4a6uVsYKetFRqDBWHu6KVp3U0PaFt9J5kF9fC3XOs7AiY5F2OdGs
 h8saM/NdzcN3o7QlErPbiOg3PJZtggchZ3SkGCyLLT/6zwO+UT2JJKlCOkcSFLABynay
 IB3o4U0ZkDaXjOjVej8I1iwAS2Pkmb/kdmCWCupFT25Ybr4C3eTTHSJ9byTE6kFcPu3C
 5qzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=83/ea6ZxGjsWJtszgeXVzCH9J7MS2Wag3p5yGJh3B6Y=;
 b=RvNpm3Bhh7CEWEiZ3jCgj+yZpCEK0QPgVtK46AKXXk/ZKT4oAdSuzRVGdNHguR71y3
 ic6Wmf+81J/xnheaenfibwth85km6UYDjZf7G59MIdGcTAMWHUn7/0P0FNfT5JfKnn9X
 P4LLnIdfibK3Yu+oGQp3DbHtdm7PQ/KNKkHf+B50I6NDT4Tay7HTf0BbNpt936Oq1lA6
 BpDrp1sfmYp374HJEDDjPXDo+A8nkosUIfAlFyKEGq+MSaKjQYBploz6h4vduNqoe7Fb
 1TWwxIUPXXVtwZnUAS0GY4nI3i20Cvf6+USW2j4gOXslNHV+K9YI8H/tr0BciS2N4q57
 /INA==
X-Gm-Message-State: AGi0PuaA4erSEr1QYVBwog8F0OgvnlH2dbKCz5peqAIiDOdJju+19oHA
 4GHQsUnX/LVxfSuwp5GsxEvlXrkdDS4=
X-Google-Smtp-Source: APiQypKg3aeAfzIkULXQuqgTANHu/0jwfUztX2k0D/ZFuTW42ryis912fCaAzYZnzVhwpDOOcR4t3A==
X-Received: by 2002:a62:888a:: with SMTP id l132mr3488609pfd.125.1588952647670; 
 Fri, 08 May 2020 08:44:07 -0700 (PDT)
Received: from localhost.localdomain (174-21-149-226.tukw.qwest.net.
 [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id o99sm2727662pjo.8.2020.05.08.08.43.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 May 2020 08:44:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 00/19] target/arm: sve load/store improvements
Date: Fri,  8 May 2020 08:43:40 -0700
Message-Id: <20200508154359.7494-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::441;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Version 5 splits patch 4, as requested during review.
The patches remaining unreviewed are:

0004-accel-tcg-Adjust-probe_access-call-to-page_check_.patch
0005-accel-tcg-Add-probe_access_flags.patch


r~


Original blurb:

The goal here is to support MTE, but there's some cleanup to do.

Technically, we have sufficient interfaces in cputlb.c now, but it
requires multiple tlb lookups on different interfaces to do so.

Adding probe_access_flags() allows probing the tlb and getting out
some of the flags buried in the tlb comparator, such as TLB_MMIO
and TLB_WATCHPOINT.  In addition, we get no-fault semantics,
which we don't have via probe_acccess().

Looking forward to MTE, we can examine the Tagged bit on a per-page
basis and avoid dozens of mte_check calls that must be Unchecked.
That comes later, in a new version of the MTE patch set, but I do
add comments for where the checks should be added.

Richard Henderson (19):
  exec: Add block comments for watchpoint routines
  exec: Fix cpu_watchpoint_address_matches address length
  accel/tcg: Add block comment for probe_access
  accel/tcg: Adjust probe_access call to page_check_range
  accel/tcg: Add probe_access_flags
  accel/tcg: Add endian-specific cpu_{ld,st}* operations
  target/arm: Use cpu_*_data_ra for sve_ldst_tlb_fn
  target/arm: Drop manual handling of set/clear_helper_retaddr
  target/arm: Add sve infrastructure for page lookup
  target/arm: Adjust interface of sve_ld1_host_fn
  target/arm: Use SVEContLdSt in sve_ld1_r
  target/arm: Handle watchpoints in sve_ld1_r
  target/arm: Use SVEContLdSt for multi-register contiguous loads
  target/arm: Update contiguous first-fault and no-fault loads
  target/arm: Use SVEContLdSt for contiguous stores
  target/arm: Reuse sve_probe_page for gather first-fault loads
  target/arm: Reuse sve_probe_page for scatter stores
  target/arm: Reuse sve_probe_page for gather loads
  target/arm: Remove sve_memopidx

 docs/devel/loads-stores.rst |   39 +-
 include/exec/cpu-all.h      |   13 +-
 include/exec/cpu_ldst.h     |  283 +++--
 include/exec/exec-all.h     |   39 +
 include/hw/core/cpu.h       |   23 +
 target/arm/internals.h      |    5 -
 accel/tcg/cputlb.c          |  413 ++++---
 accel/tcg/user-exec.c       |  256 +++-
 exec.c                      |    2 +-
 target/arm/sve_helper.c     | 2241 +++++++++++++++++++----------------
 target/arm/translate-sve.c  |   17 +-
 11 files changed, 1999 insertions(+), 1332 deletions(-)

-- 
2.20.1



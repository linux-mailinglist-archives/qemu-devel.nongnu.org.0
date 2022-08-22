Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9176259CD0B
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 02:14:34 +0200 (CEST)
Received: from localhost ([::1]:46954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQHYv-0005ng-Lc
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 20:14:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQHJ2-0003yg-5m
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:58:08 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:44902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQHJ0-0002hb-JD
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:58:07 -0400
Received: by mail-pg1-x536.google.com with SMTP id c24so10800574pgg.11
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 16:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=JvSp0HNM4vjSO/R6Mhl2Lwg1DUGqNpQyWASJWLKDAXg=;
 b=VybwHTXqD+rJiUIwE65CFTSce1MgdxljmZdxMYRq6HKs1cLQI/CFAP8t2p4mCvjVv+
 WQumN8H1AOZXMn2N4bqQVK4vm65ExwxNTGX58UoUpHjsv+scqS949cYDZG8Uti6GAUHQ
 9FD+FJzPAWrWfhRgqTiGL7rVame01fpiY/zOASMXdFL8OvYdS+1F5QmvpDbnEnKJM8AK
 llni8B8o6XwLiTKT3l15gd4Y1yL+w7GJFe3nnJLvFqQvUI1UIzvkIfJo49jn+55gW6MY
 DXWBWwCdqWYbz0wL3am745DJOerHBdNs8DrcfOe5YutLyv2xs8WDGE59LifgbrMt09hW
 GiAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=JvSp0HNM4vjSO/R6Mhl2Lwg1DUGqNpQyWASJWLKDAXg=;
 b=U9dxrc2TOXVbXM75YEDthY1CiJEeBuZa71wEapvGgTRiB+KlS1n95T2VAPydIFmTjB
 AZ6U6lyWqdrBBBkwZ7lXHx9R1TEBbxYaSuyoX6o4m3/I5vtyELXVnDT2akCW+hyXc4CG
 gq0+5c8ehx9zqzrM4RwDLw3Syjb/mE1YrI4gmuJwstA3p3FrLYsyt5CJtfO7+65jScun
 oujZuuE8dGPYX6VsbIHgNMKRH0jc6sGbuHuU7zBgQzI5H2UeK5U0TeH0qkOpmCWnZIWX
 hJs+BWqvZdKOf70JgMb5lasGC49z60ERCb+3brDxfYjJCPb52g2ztb7Tx3YZc771zhqn
 Sp7g==
X-Gm-Message-State: ACgBeo29PMpT3DhKGbaOoLh85LKjKYlKP15QEAygcY5agCqzl+4n96fD
 lN8bw+o99blfrcWUGSWEhP85wzxdwG3Wbg==
X-Google-Smtp-Source: AA6agR5SmeeQCtTlK5QGNrtmZqhmbhwYk3vWeCZrgSu3XHE+CRpjxcrBgn9FMEoKBa+P/lvlgB3Zzw==
X-Received: by 2002:a05:6a00:230f:b0:52f:6734:90fe with SMTP id
 h15-20020a056a00230f00b0052f673490femr23192206pfh.67.1661212685036; 
 Mon, 22 Aug 2022 16:58:05 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:c3f1:b74f:5edd:63af])
 by smtp.gmail.com with ESMTPSA id
 w190-20020a6230c7000000b0052d52de6726sm9173159pfw.124.2022.08.22.16.58.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 16:58:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com,
	eduardo@habkost.net
Subject: [PATCH 00/14] target/i386: Use atomic operations for pte updates
Date: Mon, 22 Aug 2022 16:57:49 -0700
Message-Id: <20220822235803.1729290-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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

This patch set does two things:

(1) Remove assert(!probe) from the x86 tlb_fill

    It turns out that this is a prerequisite for
    [PATCH v6 00/21] linux-user: Fix siginfo_t contents when jumping
    to non-readable pages

    because of a new use of probe_access(..., nonfault)
    when comparing TBs that cross a page boundary.

    Patches 7-10 are sufficient to fix this.

    After auditing all of the targets, Sparc has a similar assert,
    and AVR simply doesn't check probe at all.  Both will need fixing.

(2) Use atomic operations for pte updates, which is a long-standing
    bug since our conversion to MTTCG.

For simplicity, patches 1-6 are from the middle of 
("[PATCH v2 00/66] target/arm: Implement FEAT_HAFDBS")


r~


Richard Henderson (14):
  accel/tcg: Rename CPUIOTLBEntry to CPUTLBEntryFull
  accel/tcg: Drop addr member from SavedIOTLB
  accel/tcg: Suppress auto-invalidate in probe_access_internal
  accel/tcg: Introduce probe_access_full
  accel/tcg: Introduce tlb_set_page_full
  include/exec: Introduce TARGET_PAGE_ENTRY_EXTRA
  target/i386: Use MMUAccessType across excp_helper.c
  target/i386: Direct call get_hphys from mmu_translate
  target/i386: Introduce structures for mmu_translate
  target/i386: Reorg GET_HPHYS
  target/i386: Add MMU_PHYS_IDX and MMU_NESTED_IDX
  target/i386: Use MMU_NESTED_IDX for vmload/vmsave
  target/i386: Combine 5 sets of variables in mmu_translate
  target/i386: Use atomic operations for pte updates

 include/exec/cpu-defs.h              |  45 +-
 include/exec/exec-all.h              |  33 ++
 include/hw/core/cpu.h                |   1 -
 target/i386/cpu-param.h              |   2 +-
 target/i386/cpu.h                    |   5 +-
 accel/tcg/cputlb.c                   | 215 +++++----
 target/arm/mte_helper.c              |  14 +-
 target/arm/sve_helper.c              |   4 +-
 target/arm/translate-a64.c           |   2 +-
 target/i386/tcg/sysemu/excp_helper.c | 692 +++++++++++++++++----------
 target/i386/tcg/sysemu/svm_helper.c  | 234 +++++----
 target/s390x/tcg/mem_helper.c        |   4 -
 12 files changed, 772 insertions(+), 479 deletions(-)

-- 
2.34.1



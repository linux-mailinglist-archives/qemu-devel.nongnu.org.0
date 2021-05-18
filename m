Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4F3388142
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 22:19:49 +0200 (CEST)
Received: from localhost ([::1]:49454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj6Bw-0007YY-R3
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 16:19:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lj64K-000071-Ah
 for qemu-devel@nongnu.org; Tue, 18 May 2021 16:11:56 -0400
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330]:34417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lj64D-0005zW-FJ
 for qemu-devel@nongnu.org; Tue, 18 May 2021 16:11:55 -0400
Received: by mail-ot1-x330.google.com with SMTP id
 u25-20020a0568302319b02902ac3d54c25eso9795063ote.1
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 13:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qPfzJb0rUax3UJP3k25AmhFKfk/NW8Mt2W62oGkhFmE=;
 b=suOKldG+qFrVpld3tSYxxLB/sopKgsukhg/r7Gx1FdXyO4tnFWYTBktA9FxeasbOWw
 qlLWR9QCFcjjWMoq+MGGf1n8MOeXYfV/Q4qaA6DHza8s2xqgOe163KfMiLHYsHej5HOr
 8gvDSF7MsUZ2cQL2n8ArodyHOetyvhf15+4DRUNcopwEw11YKTO1nlHtQTaT9XWPVXsW
 8sRjlhlxtydUjuRG6HoCDTg+LcLFldlwvva4uneQgQ/GXLYWnyNSPZEN3Fpdg2pU/DaF
 14DnfZVWpRhXuEfbaL/eQmiWIewDyW3NTXgd1aPlKdCpTIMRq1HV1dtT9ZP21OMGpz0N
 liOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qPfzJb0rUax3UJP3k25AmhFKfk/NW8Mt2W62oGkhFmE=;
 b=RggFPRIZhymxiG/4DXB2AN8aCjaCY3aVvJMnPqzbQ3kHvLaPYCFUnq5S5afx7oy6a6
 3G54nw4CS27MjHEVD8cMY1FBssvlWnFe+SohYNAohy+CmOEkbnzf3w15aEEo1y4gcfwj
 pYsDmG8C8M4oUSn2YQnvCK1mU8qZED/o8qeai+XC9cwKfzqyyeRI7cqakD4l7HMe+W3q
 pD17U28yXMtVFFRd9XwMlvUh8F4mDy48ULRoBRDh4y3BhL84NRwnS2plT8ZNldm6OvX8
 tr2WIfgYVdlGt2Ty1NhcZaPRxiqTcynix4gcEQ1OCknJf1epW8Cpj0mTm2VrTwvbKzt+
 Kf2g==
X-Gm-Message-State: AOAM532rrjn7WWDVUhQqiHLr0if1l2i9l2JUxVdbKIKyJbF4y5USGAqI
 fNHZ3iABRZ33eUqfTHEoScZEaZ20kQB2q5kC
X-Google-Smtp-Source: ABdhPJwykFKJqEoyKNTvK21zTRFK2c2hxdxvsM+hHkorIdrWmk8q36kC5IyKmkai7p9AzBOk2u7ulQ==
X-Received: by 2002:a9d:5e8c:: with SMTP id f12mr5595386otl.18.1621368708189; 
 Tue, 18 May 2021 13:11:48 -0700 (PDT)
Received: from localhost.localdomain ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id u27sm3953204oof.38.2021.05.18.13.11.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 13:11:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/24] target/ppc: Clean up mmu translation
Date: Tue, 18 May 2021 15:11:22 -0500
Message-Id: <20210518201146.794854-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x330.google.com
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
Cc: bruno.larsen@eldorado.org.br, qemu-ppc@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This attempts the cleanup I've been talking about with Bruno.

On the way, there's a lot of MMUAccessType cleanup, to get the
code into the form I wanted the interface to share.  There's a
lot more cleanup that could be done, particularly wrt the older
mmu models.


r~


Richard Henderson (24):
  target/ppc: Introduce prot_for_access_type
  target/ppc: Use MMUAccessType in mmu-radix64.c
  target/ppc: Use MMUAccessType in mmu-hash64.c
  target/ppc: Use MMUAccessType in mmu-hash32.c
  target/ppc: Rename access_type to type in mmu_helper.c
  target/ppc: Use MMUAccessType in mmu_helper.c
  target/ppc: Remove type argument from check_prot
  target/ppc: Remove type argument from ppc6xx_tlb_pte_check
  target/ppc: Remove type argument from ppc6xx_tlb_check
  target/ppc: Remove type argument from get_bat_6xx_tlb
  target/ppc: Remove type argument from mmu40x_get_physical_address
  target/ppc: Remove type argument from mmubooke_check_tlb
  target/ppc: Remove type argument from mmubooke_get_physical_address
  target/ppc: Remove type argument from mmubooke206_check_tlb
  target/ppc: Remove type argument for mmubooke206_get_physical_address
  target/ppc: Remove PowerPCCPUClass.handle_mmu_fault
  target/ppc: Use MMUAccessType with *_handle_mmu_fault
  target/ppc: Push real-mode handling into ppc_radix64_xlate
  target/ppc: Use bool success for ppc_radix64_xlate
  target/ppc: Split out ppc_hash64_xlate
  target/ppc: Split out ppc_hash32_xlate
  target/ppc: Split out ppc_jumbo_xlate
  target/ppc: Introduce ppc_xlate
  target/ppc: Restrict ppc_cpu_tlb_fill to TCG

 target/ppc/cpu-qom.h       |   1 -
 target/ppc/internal.h      |  19 ++
 target/ppc/mmu-book3s-v3.h |   5 -
 target/ppc/mmu-hash32.h    |   6 +-
 target/ppc/mmu-hash64.h    |   6 +-
 target/ppc/mmu-radix64.h   |   6 +-
 target/ppc/cpu_init.c      |  45 ----
 target/ppc/mmu-book3s-v3.c |  19 --
 target/ppc/mmu-hash32.c    | 244 ++++++++----------
 target/ppc/mmu-hash64.c    | 187 ++++++--------
 target/ppc/mmu-radix64.c   | 235 +++++++++---------
 target/ppc/mmu_helper.c    | 496 +++++++++++++++++--------------------
 12 files changed, 553 insertions(+), 716 deletions(-)

-- 
2.25.1



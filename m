Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B51E66F4805
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 18:10:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptsZ1-0002r7-4t; Tue, 02 May 2023 12:09:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptsYe-0002kx-V7
 for qemu-devel@nongnu.org; Tue, 02 May 2023 12:08:54 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptsYb-0000XM-Ca
 for qemu-devel@nongnu.org; Tue, 02 May 2023 12:08:52 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3f1738d0d4cso24622845e9.1
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 09:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683043727; x=1685635727;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=X3WXzLiHJtDEm33a2wp7z9oTb4paZOhrhmwflz0UmDI=;
 b=gQotSBXSVfUEbteEDsLngeF0ZDp0XJdgiXWtd5qUg5vbfFN6AF8nWICvh1mNo1q/rS
 23oyJL0r0GxE7+PTkbRlmVkyfMWg/gLRZFhS+yTi+KylH6viMAR5A8hCSBFqo5cJsU/h
 8nnzYJUcHCaRxOC63767aWq3vKvCTgeLt883+5KAmyxy6D6p09Q1WjtHOt9jvCw/NMqI
 jeVARZjhDSnauCL5xBYjL6J2iS81oomwfKYoCOsCI2XPkwtb+lIPUpIK/fkEAUI8Ri3S
 Rveu441H5beBPT9khfELOnSN7lEnttDhjNRxlrLfdpPVfzHFahmQ0uDg0FI+xhEixoT/
 3DTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683043727; x=1685635727;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=X3WXzLiHJtDEm33a2wp7z9oTb4paZOhrhmwflz0UmDI=;
 b=iYnM7+kEg+rI5nGgnQnaHkX5yboYU/MdE+JlndGOsd+6N9+xquxCjD79ecPmptR5iY
 x6Rncu7iuAgPNc+/tyhEMv3LhWWmSmNrtLjLVDXzaMil3vG2y7GSi07XbAGh0getUVBo
 GlU+wy+/wGoGnoz4GtN4mb5aWc9f+La4rADQFutgmz9shFWP7sQcQzG6zsBD0sdawllB
 NYEIbEsWTPM4GeEBz1/DXAk49oVja5BisW0yMiIi+vDFo9+1QgpJ+E/ojwiaqkGDTtcd
 CYiw1U80CNAA7kAmNm3zKk8Z4mFYKXHCRFQWjdQOImk5VQqaaSLg7RPrL1s64AAXBqon
 Djug==
X-Gm-Message-State: AC+VfDxyWVGmfH2zkHCjAq7tx4rKDOcYfuYDghL8zMWWleVkIJqYo8CF
 kXRUsvMRmDHs1lhuRVF9TPxKEMiiTq0jnPkzKccsqw==
X-Google-Smtp-Source: ACHHUZ4IzrZ6dbLGpfndXlz+7s1uxWwcpZUYcks+LPDXPSwGyakFpg5ouGCqrEdg/hgC9JssNcr2qQ==
X-Received: by 2002:a05:6000:510:b0:2f1:d17f:cf95 with SMTP id
 a16-20020a056000051000b002f1d17fcf95mr12961299wrf.12.1683043727633; 
 Tue, 02 May 2023 09:08:47 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:ad29:f02c:48a2:269c])
 by smtp.gmail.com with ESMTPSA id
 v16-20020a05600c471000b003ede3f5c81fsm39918471wmo.41.2023.05.02.09.08.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 09:08:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org, jiaxun.yang@flygoat.com, crwulff@gmail.com,
 marex@denx.de, ysato@users.sourceforge.jp, mark.cave-ayland@ilande.co.uk
Subject: [PATCH 00/16] tcg: Remove TARGET_ALIGNED_ONLY
Date: Tue,  2 May 2023 17:08:30 +0100
Message-Id: <20230502160846.1289975-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x336.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Based-on: 20230502135741.1158035-1-richard.henderson@linaro.org
("[PATCH 0/9] tcg: Remove compatability helpers for qemu ld/st")

Add MO_ALIGN where required, so that we may remove TARGET_ALIGNED_ONLY.
This is required for building tcg once, because we cannot have multiple
definitions of MO_ALIGN and MO_UNALN.


r~


Richard Henderson (16):
  target/alpha: Use MO_ALIGN for system UNALIGN()
  target/alpha: Use MO_ALIGN where required
  target/alpha: Remove TARGET_ALIGNED_ONLY
  target/hppa: Use MO_ALIGN for system UNALIGN()
  target/hppa: Remove TARGET_ALIGNED_ONLY
  target/mips: Add MO_ALIGN to gen_llwp, gen_scwp
  target/mips: Add missing default_tcg_memop_mask
  target/mips: Use MO_ALIGN instead of 0
  target/mips: Remove TARGET_ALIGNED_ONLY
  target/nios2: Remove TARGET_ALIGNED_ONLY
  target/sh4: Use MO_ALIGN where required
  target/sh4: Remove TARGET_ALIGNED_ONLY
  target/sparc: Use MO_ALIGN where required
  target/sparc: Use cpu_ld*_code_mmu
  target/sparc: Remove TARGET_ALIGNED_ONLY
  tcg: Remove TARGET_ALIGNED_ONLY

 configs/targets/alpha-linux-user.mak       |   1 -
 configs/targets/alpha-softmmu.mak          |   1 -
 configs/targets/hppa-linux-user.mak        |   1 -
 configs/targets/hppa-softmmu.mak           |   1 -
 configs/targets/mips-linux-user.mak        |   1 -
 configs/targets/mips-softmmu.mak           |   1 -
 configs/targets/mips64-linux-user.mak      |   1 -
 configs/targets/mips64-softmmu.mak         |   1 -
 configs/targets/mips64el-linux-user.mak    |   1 -
 configs/targets/mips64el-softmmu.mak       |   1 -
 configs/targets/mipsel-linux-user.mak      |   1 -
 configs/targets/mipsel-softmmu.mak         |   1 -
 configs/targets/mipsn32-linux-user.mak     |   1 -
 configs/targets/mipsn32el-linux-user.mak   |   1 -
 configs/targets/nios2-softmmu.mak          |   1 -
 configs/targets/sh4-linux-user.mak         |   1 -
 configs/targets/sh4-softmmu.mak            |   1 -
 configs/targets/sh4eb-linux-user.mak       |   1 -
 configs/targets/sh4eb-softmmu.mak          |   1 -
 configs/targets/sparc-linux-user.mak       |   1 -
 configs/targets/sparc-softmmu.mak          |   1 -
 configs/targets/sparc32plus-linux-user.mak |   1 -
 configs/targets/sparc64-linux-user.mak     |   1 -
 configs/targets/sparc64-softmmu.mak        |   1 -
 include/exec/memop.h                       |  13 +--
 include/exec/poison.h                      |   1 -
 target/alpha/translate.c                   |  38 ++++----
 target/hppa/translate.c                    |   2 +-
 target/mips/tcg/mxu_translate.c            |   3 +-
 target/nios2/translate.c                   |  10 ++
 target/sh4/translate.c                     | 102 +++++++++++++--------
 target/sparc/ldst_helper.c                 |  10 +-
 target/sparc/translate.c                   |  66 ++++++-------
 tcg/tcg.c                                  |   5 -
 target/mips/tcg/micromips_translate.c.inc  |  24 +++--
 target/mips/tcg/mips16e_translate.c.inc    |  18 ++--
 target/mips/tcg/nanomips_translate.c.inc   |  32 +++----
 37 files changed, 186 insertions(+), 162 deletions(-)

-- 
2.34.1



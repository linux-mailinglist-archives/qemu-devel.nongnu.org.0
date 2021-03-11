Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 477A033688C
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 01:23:57 +0100 (CET)
Received: from localhost ([::1]:55428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK97M-0006Ls-7L
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 19:23:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lK95a-0004dC-GZ
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 19:22:06 -0500
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233]:38193)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lK95V-0001J0-DL
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 19:22:06 -0500
Received: by mail-oi1-x233.google.com with SMTP id v192so13667060oia.5
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 16:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=z8D2vwGrA+5t3tiFh7fdYFJfjbrNHHpnvQ5GMyWiaUI=;
 b=Zm1lsQbqmIrRpJgh8J5H0GeFzwdZj6DYiGnalMcAF6HPXUzE+5Rg2lRtRgYaSMuaSf
 XNwxtVJcH3EZFzKB7oVEANvVORF0+9A/Ap7OvPJbp3Dxd4/wQ7/e7piP4Rsq6RBB3RFj
 IKWshtHFVJn4NENzPZJBxyJFqxFszAxKfB3/HW9z2kvZzZk2Givb68YmUMEFBTw5O8mU
 DxICJ+WUf4uLyn8wfdoXaw4F11THncrywxGF4fwH4DZXP89AUi9cO8T23BCqPXHs+hcY
 26YaBLgSjVkORntEYTlzpS/AJNxmwCLAL5TROw95bNL8ZEC0qWyKQqt3wwO3eZP+JdGE
 /uJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=z8D2vwGrA+5t3tiFh7fdYFJfjbrNHHpnvQ5GMyWiaUI=;
 b=nd3FDpAATxoUd/evSqAZqqjhQDMh9kEPpvM8BVeBadhckWH8lsd7q0HrgbRDFgLCdp
 GFPvECnpHcjA7hzxqF+b3ILJPV52bV5j4nfzlEAYBRCxlWpTTkSGlYIpYwDT5v1eMRas
 5TcuN5Maod4TKAcciVdMCueQo7qYHQBHFAQAc8bLqRIt7PYFb8jGyJlro4OlIscZHgHF
 l48qtf3Ta1OWmyrSZ/TrVntdC953x9fxEveL+lkCc5HrcXD9k3l+g8NyFOniCwmNgDkj
 ZbTiqjDzXhkjRkF2wLdaEeC28KQE5iWKN86hW5o2Z5qK9M+qnBw6SVczVWpk5J7CAtET
 rp+A==
X-Gm-Message-State: AOAM531PGiR1tzeCpCOBFWVP5yIGYHVlIETssyzBFYttu7Sx/LQp5aFg
 KN3mLWelWYzah64SwYN2WetQcdwmXBOTOAHD
X-Google-Smtp-Source: ABdhPJwM65IPy7gRBDuOU6LC8XYg1901zNW7dyg3/zzbvksxLF/+FXvNbw2KVI2AjIVbf39hBJ0ISw==
X-Received: by 2002:aca:1302:: with SMTP id e2mr4278379oii.170.1615422120019; 
 Wed, 10 Mar 2021 16:22:00 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id a6sm300962otq.79.2021.03.10.16.21.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 16:21:58 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/26] tcg: Workaround macOS 11.2 mprotect bug
Date: Wed, 10 Mar 2021 18:21:30 -0600
Message-Id: <20210311002156.253711-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x233.google.com
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
Cc: r.bolshakov@yadro.com, j@getutm.app
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Supercedes: 20210210105527.74943-1-r.bolshakov@yadro.com
("util/osdep: Avoid mprotect() RWX->NONE on Big Sur 11.2")

It took a few more patches than imagined to unify the two
places in which we manipulate the tcg code_gen buffer, but
the result is surely cleaner.

There's a lot more that could be done to clean up this part
of tcg too.  I tried to not get too side-tracked, but didn't
wholly succeed.


r~


Richard Henderson (26):
  meson: Split out tcg/meson.build
  meson: Move disas/tci.c to disas/meson.build
  meson: Split out fpu/meson.build
  tcg: Re-order tcg_region_init vs tcg_prologue_init
  tcg: Remove error return from tcg_region_initial_alloc__locked
  tcg: Split out tcg_region_initial_alloc
  tcg: Split out tcg_region_prologue_set
  tcg: Split out region.c
  accel/tcg: Inline cpu_gen_init
  accel/tcg: Move alloc_code_gen_buffer to tcg/region.c
  accel/tcg: Rename tcg_init to tcg_init_machine
  tcg: Create tcg_init
  accel/tcg: Merge tcg_exec_init into tcg_init_machine
  accel/tcg: Pass down max_cpus to tcg_init
  tcg: Introduce tcg_max_ctxs
  tcg: Move MAX_CODE_GEN_BUFFER_SIZE to tcg-target.h
  tcg: Replace region.end with region.total_size
  tcg: Tidy tcg_n_regions
  tcg: Tidy split_cross_256mb
  tcg: Allocate code_gen_buffer into struct tcg_region_state
  tcg: Return the map protection from alloc_code_gen_buffer
  tcg: Sink qemu_madvise call to common code
  tcg: Do not set guard pages in the rx buffer
  util/osdep: Add qemu_mprotect_rw
  tcg: Merge buffer protection and guard page protection
  tcg: When allocating for !splitwx, begin with PROT_NONE

 meson.build               |  12 +-
 accel/tcg/internal.h      |   2 +
 include/qemu/osdep.h      |   1 +
 include/sysemu/tcg.h      |   2 -
 include/tcg/tcg.h         |   3 +-
 tcg/aarch64/tcg-target.h  |   1 +
 tcg/arm/tcg-target.h      |   1 +
 tcg/i386/tcg-target.h     |   2 +
 tcg/internal.h            |  39 ++
 tcg/mips/tcg-target.h     |   6 +
 tcg/ppc/tcg-target.h      |   2 +
 tcg/riscv/tcg-target.h    |   1 +
 tcg/s390/tcg-target.h     |   3 +
 tcg/sparc/tcg-target.h    |   1 +
 tcg/tci/tcg-target.h      |   1 +
 accel/tcg/tcg-all.c       |  33 +-
 accel/tcg/translate-all.c | 436 +----------------
 bsd-user/main.c           |   1 -
 linux-user/main.c         |   1 -
 tcg/region.c              | 959 ++++++++++++++++++++++++++++++++++++++
 tcg/tcg.c                 | 610 ++----------------------
 util/osdep.c              |   9 +
 disas/meson.build         |   2 +
 fpu/meson.build           |   1 +
 tcg/meson.build           |  14 +
 25 files changed, 1104 insertions(+), 1039 deletions(-)
 create mode 100644 tcg/internal.h
 create mode 100644 tcg/region.c
 create mode 100644 fpu/meson.build
 create mode 100644 tcg/meson.build

-- 
2.25.1



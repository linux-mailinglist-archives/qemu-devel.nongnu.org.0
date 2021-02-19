Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B53E931F996
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 13:55:40 +0100 (CET)
Received: from localhost ([::1]:36790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD5Jr-0001ts-O8
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 07:55:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lD5Gf-00076T-Og
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 07:52:21 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:35478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lD5Gd-0005JB-TL
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 07:52:21 -0500
Received: by mail-ej1-x633.google.com with SMTP id g5so13024150ejt.2
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 04:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=Z+ujaY5G6ANAB5vsaZONUI2TvJ3IqsElgwHR18lrlxE=;
 b=pBeFKsD/2ne+UGkb4ECb5LhfL1SoIsQPZLz45EI+lOSGGPqVp6uESK3g10Cf5aE/Av
 5DXJ8pXHrgL/hgoPrcU1n6hwMHlCqmf65BGEj1kWDYb2vZekCzkkPhPCLd8YDAPQ+roe
 afK8Hkd7eDhD4BfhDwrnctGr/xnZsUoxGDsJ3MIs6xMBPyooI0s1rlG9EiQ/HQABQHt+
 B/G0zOFrQqXE7eIlqO+Jv8K0o61AYhIzWKhSokb1lhNVAXCW8kT35+mcFlykk9NNYZ10
 CfQU3hbNnfzbwkeKvee1vaY3+oL3alqGYFshklXukRHRhwcg74cSNgue1DU6Q9QJkd/1
 mgVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Z+ujaY5G6ANAB5vsaZONUI2TvJ3IqsElgwHR18lrlxE=;
 b=jCHMJTy/SPXkwXA8x7gHKN6jwYviicWUvVUH/Y4xc0LQMwiQHAu6mvgUYATLeZ1bU2
 moIMR0JOMoiMaESBy99rdtXZU91vVOuBmfmIq4WSS8/2rvf4ofuHutiz4talcKPkGcze
 081eD+V+2CIXwn3mj3wOss6sLU6fDQ2K+alLrH5pgR62g8VnH9UHx08EJlnMqDBuEpro
 8gTdD9xXJamnYB2esQFfB236U6w6OySa0qHjrQL6vX37naLSOwCUJau5uD7o2LvjFfEI
 +OXii+RNv5LDuZLMOUPp5yXuXyDf3ACPYPktjdKL1BT63/g4z+2l4lP1pBK2nrs0CSOO
 5Flg==
X-Gm-Message-State: AOAM5326cXBvNCxZ7yfHKNLY/Pvq/qTVAtnRYgzFIChfLpqzWZm1Besg
 TUTXoA0IxU7X6jxTOUPpOm8=
X-Google-Smtp-Source: ABdhPJyh1u9ArWO9Q3nY3QuNaOL6CwJgRNq/6L5avJ3lNsvuwQYhz7Mqh7/z4oehVKYBeqbMDfku/A==
X-Received: by 2002:a17:906:a48:: with SMTP id
 x8mr8591052ejf.444.1613739138405; 
 Fri, 19 Feb 2021 04:52:18 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id b6sm4277242ejb.8.2021.02.19.04.52.15
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 19 Feb 2021 04:52:18 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org
Subject: [PATCH] Make ram_addr_t 64 bits unconditionally
Date: Fri, 19 Feb 2021 20:52:07 +0800
Message-Id: <1613739127-61825-1-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Currently machine->ram_size is a ram_addr_t, whose size is 64 bits
if either (a) the host is 64 bits or (b) CONFIG_XEN_BACKEND is
enabled, so it's effectively only 32 bits on 32-bit-not-x86.

commit 4be403c8158e ("Make target_phys_addr_t 64 bits unconditionally")
did the change for target_phys_addr_t which is now hwaddr to be 64 bits
unconditionally. Let's do the same to ram_addr_t.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 include/exec/cpu-common.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index 5a0a2d9..c36904d 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -32,15 +32,9 @@ enum device_endian {
 #endif
 
 /* address in the RAM (different from a physical address) */
-#if defined(CONFIG_XEN_BACKEND)
 typedef uint64_t ram_addr_t;
 #  define RAM_ADDR_MAX UINT64_MAX
 #  define RAM_ADDR_FMT "%" PRIx64
-#else
-typedef uintptr_t ram_addr_t;
-#  define RAM_ADDR_MAX UINTPTR_MAX
-#  define RAM_ADDR_FMT "%" PRIxPTR
-#endif
 
 /* memory API */
 
-- 
2.7.4



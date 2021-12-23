Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C28C47DDFD
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 04:03:54 +0100 (CET)
Received: from localhost ([::1]:36204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0EOU-0008BQ-R5
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 22:03:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n0EMi-0006B0-84
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 22:02:00 -0500
Received: from [2607:f8b0:4864:20::1035] (port=33563
 helo=mail-pj1-x1035.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n0EMf-00082K-8X
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 22:01:59 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 x1-20020a17090a2b0100b001b103e48cfaso5312314pjc.0
 for <qemu-devel@nongnu.org>; Wed, 22 Dec 2021 19:01:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QNySyYQjRHQtRyXOLD6CVXkt57IAIEA3kCn3GA8YA48=;
 b=whLS9D0Xfz23Hp2yOHOo5K2o/N6Bw1fUjhqBouVoriE5ecobml/8ALlPmS4BA+0eNB
 rH+4tfAARKk6wzSvVhiXgyMRwAZcgb43noR+BKBfumN5F7SREmI2k9F6vURW1h3UKzQh
 NAxBRqMdS7hk3Z3EGdz2y9sArIT6zyMjNrZT7nqfkMbYAfm8UzlQBdUN/eHlioQJU0cz
 o9MzKRmJGXgCQxApalB1SCoKl11Ou46wMZRgLPwj8nNkIdLOGkRGkKVH4fEUSMB5/rLT
 KtZgeEzJP5+9aRCpb5uWFoFA2mhanDruN67Ts0OnUO/i5w8hwGNYjer8wDrBxZQaeRzt
 ruUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QNySyYQjRHQtRyXOLD6CVXkt57IAIEA3kCn3GA8YA48=;
 b=yOkVvcdbKATw302hwVgldVveVk8C0HzgJ5sOx0pugyjkFh5rx5h07tkGGECdkHppeK
 QC5l8A0ATaiPSL4G5KGnW5fK5rrz6Gst6M307lz4UVoOqE+NZwoMNKotD1XycGW9UmMX
 MJqvXCz8j1YaPmVCiQ4R20gAeTQ+2qX+sxWUkZf1GugLVST49sl7r2NgtSdbxopOHU6l
 thsSnChQqj9SrAO1mVWBKBgJK7hJdhxQyicQHpJXAt1Qq+ZlktB/E/YoXJBIlsPLZiuU
 /HGX5FOvsixndipzu+JLvZV4RgqCugCH6NU2zeBoj7lIeGhO8PFoyhiddDTjw93lm8wI
 q98g==
X-Gm-Message-State: AOAM531VC2JcJmaZmueCM1xfGn+PL2ZEtb2Rrs34X1Kqj92RHAoqF6Lz
 JBXkR3hyYct1AFRHLsHJ7ZkwaXBW2f86ow==
X-Google-Smtp-Source: ABdhPJzF6SE+hWkjLgRTvBxl7sS9mZ//3MYKii/B0EJ/ieiSIREZCn7c895umcFaU1CMuTuFojB39w==
X-Received: by 2002:a17:902:9695:b0:149:208f:d9f9 with SMTP id
 n21-20020a170902969500b00149208fd9f9mr545582plp.139.1640228511207; 
 Wed, 22 Dec 2021 19:01:51 -0800 (PST)
Received: from localhost.localdomain ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id q19sm4248513pfk.83.2021.12.22.19.01.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 19:01:50 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] Reorg ppc64 pmu insn counting
Date: Wed, 22 Dec 2021 19:01:46 -0800
Message-Id: <20211223030149.1947418-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1035
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In contrast to Daniel's version, the code stays in power8-pmu.c,
but is better organized to not take so much overhead.

Before:

    32.97%  qemu-system-ppc  qemu-system-ppc64   [.] pmc_get_event
    20.22%  qemu-system-ppc  qemu-system-ppc64   [.] helper_insns_inc
     4.52%  qemu-system-ppc  qemu-system-ppc64   [.] hreg_compute_hflags_value
     3.30%  qemu-system-ppc  qemu-system-ppc64   [.] helper_lookup_tb_ptr
     2.68%  qemu-system-ppc  qemu-system-ppc64   [.] tcg_gen_code
     2.28%  qemu-system-ppc  qemu-system-ppc64   [.] cpu_exec
     1.84%  qemu-system-ppc  qemu-system-ppc64   [.] pmu_insn_cnt_enabled

After:

     8.42%  qemu-system-ppc  qemu-system-ppc64   [.] hreg_compute_hflags_value
     6.65%  qemu-system-ppc  qemu-system-ppc64   [.] cpu_exec
     6.63%  qemu-system-ppc  qemu-system-ppc64   [.] helper_insns_inc


r~


Richard Henderson (3):
  target/ppc: Cache per-pmc insn and cycle count settings
  target/ppc: Rewrite pmu_increment_insns
  target/ppc: Use env->pnc_cyc_cnt

 target/ppc/cpu.h         |   3 +
 target/ppc/power8-pmu.h  |  14 +--
 target/ppc/cpu_init.c    |   1 +
 target/ppc/helper_regs.c |   2 +-
 target/ppc/machine.c     |   2 +
 target/ppc/power8-pmu.c  | 230 ++++++++++++++++-----------------------
 6 files changed, 108 insertions(+), 144 deletions(-)

-- 
2.25.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58295655A72
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Dec 2022 16:19:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p96I7-00055u-Gu; Sat, 24 Dec 2022 10:18:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p96I6-00055d-3C
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 10:18:26 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p96I4-00014M-Hm
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 10:18:25 -0500
Received: by mail-pg1-x531.google.com with SMTP id h192so110513pgc.7
 for <qemu-devel@nongnu.org>; Sat, 24 Dec 2022 07:18:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nHI/A5cYWY1Lr4nYZiX4y+EBMA5EZJP8gIheGn0bzp4=;
 b=jA+iwYL5hFRkk/lllwKZ8hm3c42RNskt6dF6hgt376SBEdYpJZz1+IMJeKGF0NQyyD
 eob0Pgc9rfCzYSYrOQWDrHanvoTLpOEnpqL+EgctMhgxBYT+CELEqWz5Y3FH7pu/MDaq
 mGmOqHbfQPbxsjAUVjgHMz3GVyXSCYBzENNc20T4bKOR/hCUu0ZGwz+b5rkimxf8dQyk
 IQd7OD59WyCOujmdyDABY57DOz8KV6inpE91aOVVsB4AXPaXG1kHqj/W/DdH/vmwpGnS
 /oWK+Cv9hsTbZ++h08HFVSkaw7YH70BOkpBzCj0IUeSQGNFD1XoN5afS6YtAqOqAQzWn
 U+Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nHI/A5cYWY1Lr4nYZiX4y+EBMA5EZJP8gIheGn0bzp4=;
 b=sgCfuTJFNCOluMOZpMi5JN3UzeUX+fbzYbpSfumzQU/1uy7yOGmcaQVE5uXWsTnXr5
 es4dsuoEvIjOgsoeju9uUoAg7Wovr462wV5zHDkOut+Wup82PI6xn5wRgQQ9aSg1LM71
 UR1OJt6jwW6sKeLZxKlVq2HCiSSswS/TTOhRSx/q2mdRnle9RhmWN67PfkWsIRbglrM2
 3+PC4IGzMndyuFjJyFjRMYvIEfawZHW+el/TF5CrfqLgsIMNS9U68ZlLgJ2g3PSNu+bx
 qaWCOCoOsxpv60LxjuYUjt/W1LaD2REoOPBwXn9Gzi+Cmtt4g/cRwe3G1iUKCyRwhjMo
 lO7w==
X-Gm-Message-State: AFqh2kqLthFDroUGTI5ImrsBebYaCe8r4t8hMNGRHK1CZD0EjxCZS/sX
 3uJHDIaiPKpgaA8WSWEsntMrRjTu9Ma+9vUv
X-Google-Smtp-Source: AMrXdXvOHrc4b5gvaW7N/FR/VvJiJYvqFp01b3Q4ii33lUAMem/a1bvK+rZ3Tnop4ePxKmBEmF84RA==
X-Received: by 2002:aa7:869a:0:b0:57f:69a8:1e04 with SMTP id
 d26-20020aa7869a000000b0057f69a81e04mr15400942pfo.26.1671895102782; 
 Sat, 24 Dec 2022 07:18:22 -0800 (PST)
Received: from stoup.. (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 t64-20020a625f43000000b005774f19b41csm4231124pfb.88.2022.12.24.07.18.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Dec 2022 07:18:22 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: iii@linux.ibm.com
Subject: [PATCH 0/4] accel/tcg: Fixes for user-only page tracking
Date: Sat, 24 Dec 2022 07:18:17 -0800
Message-Id: <20221224151821.464455-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Fix all three bugs pointed out by Ilya, and for the moment at least,
adjust the testcase to set read+write for writability.


r~


Ilya Leoshkevich (1):
  tests/tcg/multiarch: add vma-pthread.c

Richard Henderson (3):
  accel/tcg: Fix tb_invalidate_phys_page_unwind
  accel/tcg: Use g_free_rcu for user-exec interval trees
  accel/tcg: Handle false negative lookup in page_check_range

 tests/tcg/multiarch/nop_func.h       |  25 ++++
 accel/tcg/tb-maint.c                 |  78 +++++-----
 accel/tcg/user-exec.c                |  57 ++++++--
 tests/tcg/multiarch/munmap-pthread.c |  16 +--
 tests/tcg/multiarch/vma-pthread.c    | 207 +++++++++++++++++++++++++++
 tests/tcg/multiarch/Makefile.target  |   3 +
 6 files changed, 321 insertions(+), 65 deletions(-)
 create mode 100644 tests/tcg/multiarch/nop_func.h
 create mode 100644 tests/tcg/multiarch/vma-pthread.c

-- 
2.34.1



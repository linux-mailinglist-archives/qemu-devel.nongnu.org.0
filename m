Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFBF33A830
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 22:29:21 +0100 (CET)
Received: from localhost ([::1]:58642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLYIZ-0007QV-TO
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 17:29:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLYGo-0005oP-0F
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 17:27:30 -0400
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b]:43547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLYGm-00086o-3w
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 17:27:29 -0400
Received: by mail-qt1-x82b.google.com with SMTP id s2so7857168qtx.10
 for <qemu-devel@nongnu.org>; Sun, 14 Mar 2021 14:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yHPv2v8RJG4ztvGhiwY8xBHXiLd4TMmVjwTpct4egtA=;
 b=fpsw0gKia6gGqGxXVawdCsY+RmVjLclfEHD35j0jJfLOWboiEUhnIymJqmg5Y0oksO
 cJu+NAGqBJRWGvutztUqK5rFCNNc8mdwvnRQyLC2v3+zybEFC3Cwsf4JDBNCCXKAPMVJ
 tFHn4fI7SKTbeF/HpWUtZuY5m9CwRJ43YES7dbZsO+GMACvsflFEoIc3Y6pxMOWLiSUA
 49Mkv6OqcbJmR93Es2Sk6fPvB8Qx6FxZ5eoYzoHZao8SxVO05xI2FqxpiFpoxgCtJmwr
 oS/ffojNs+7MVdeuj6j8lnKpkPYd/h1FcZFHyGQxRzLESUp8VzzdnygI77uk1ckXLZw+
 XImQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yHPv2v8RJG4ztvGhiwY8xBHXiLd4TMmVjwTpct4egtA=;
 b=rqreshIVpynK3xsNqmoag07sJr6ivLo8wlsgo6g2jEiMNoCz5J9KzzjvWU+nOedAI0
 FBucieiJjtroRSxIkXnWADyp2hAWfDkdGUAZXDL9rdig6jcsOExKfH1gbrSoNwteqT4S
 LrNxkyR00asZeZoFkymT1DWM8me/+ad3ALjmHiuS61cmodn8VrA89SgniiDF/O0uLDoO
 XmlhhDtvKTM/7PfbZbmt0OM8wIlBrrS9W7QHcV1kPybXKfVBuXgd+c4nNTF2bUuJk5Wa
 jX/3zUATkz1RYGZ80tinXOFbflFOd31bthTc2MQVPtLwDX9FhEWGc9+I7TCH+0SlUH2y
 IHuA==
X-Gm-Message-State: AOAM532EUecg0W7X9FcaWjrgBiZ4FYb0ToHNDWFettRTXCE8tkQAXX3w
 Vkeu1P6TBdc3TWi3dMne54EbwqsVcuAduQFX
X-Google-Smtp-Source: ABdhPJxS/guSMXVJkaYmM8Gioaqfo7Z5UboiDpJupYFJSY0bd9b7KfDbjl/jEzK+M0xYPN8Sx4XaCA==
X-Received: by 2002:ac8:4882:: with SMTP id i2mr20443189qtq.59.1615757247012; 
 Sun, 14 Mar 2021 14:27:27 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id t2sm9337749qtd.13.2021.03.14.14.27.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 14:27:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/29] tcg: Workaround macOS 11.2 mprotect bug
Date: Sun, 14 Mar 2021 15:26:55 -0600
Message-Id: <20210314212724.1917075-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82b.google.com
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

Changes for v2:
  * Move tcg_init_ctx someplace more private (patch 29)
  * Round result of tb_size based on qemu_get_host_physmem (patch 26)

Blurb for v1:
  It took a few more patches than imagined to unify the two
  places in which we manipulate the tcg code_gen buffer, but
  the result is surely cleaner.

  There's a lot more that could be done to clean up this part
  of tcg too.  I tried to not get too side-tracked, but didn't
  wholly succeed.


r~


Richard Henderson (29):
  meson: Split out tcg/meson.build
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
  tcg: Rename region.start to region.after_prologue
  tcg: Tidy tcg_n_regions
  tcg: Tidy split_cross_256mb
  tcg: Move in_code_gen_buffer and tests to region.c
  tcg: Allocate code_gen_buffer into struct tcg_region_state
  tcg: Return the map protection from alloc_code_gen_buffer
  tcg: Sink qemu_madvise call to common code
  tcg: Do not set guard pages in the rx buffer
  util/osdep: Add qemu_mprotect_rw
  tcg: Round the tb_size default from qemu_get_host_physmem
  tcg: Merge buffer protection and guard page protection
  tcg: When allocating for !splitwx, begin with PROT_NONE
  tcg: Move tcg_init_ctx and tcg_ctx from accel/tcg/

 meson.build               |  13 +-
 accel/tcg/internal.h      |   2 +
 include/qemu/osdep.h      |   1 +
 include/sysemu/tcg.h      |   2 -
 include/tcg/tcg.h         |  15 +-
 tcg/aarch64/tcg-target.h  |   1 +
 tcg/arm/tcg-target.h      |   1 +
 tcg/i386/tcg-target.h     |   2 +
 tcg/internal.h            |  40 ++
 tcg/mips/tcg-target.h     |   6 +
 tcg/ppc/tcg-target.h      |   2 +
 tcg/riscv/tcg-target.h    |   1 +
 tcg/s390/tcg-target.h     |   3 +
 tcg/sparc/tcg-target.h    |   1 +
 tcg/tci/tcg-target.h      |   1 +
 accel/tcg/tcg-all.c       |  33 +-
 accel/tcg/translate-all.c | 439 +----------------
 bsd-user/main.c           |   1 -
 linux-user/main.c         |   1 -
 tcg/region.c              | 991 ++++++++++++++++++++++++++++++++++++++
 tcg/tcg.c                 | 634 ++----------------------
 util/osdep.c              |   9 +
 fpu/meson.build           |   1 +
 tcg/meson.build           |  14 +
 24 files changed, 1139 insertions(+), 1075 deletions(-)
 create mode 100644 tcg/internal.h
 create mode 100644 tcg/region.c
 create mode 100644 fpu/meson.build
 create mode 100644 tcg/meson.build

-- 
2.25.1



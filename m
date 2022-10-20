Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 982FC606B4F
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 00:37:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oleAM-0000Jc-8k
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 18:37:30 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ole9a-0006KI-64
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 18:36:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ole9P-0006By-0a
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 18:36:32 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ole9N-0000y7-Cq
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 18:36:30 -0400
Received: by mail-pf1-x42b.google.com with SMTP id i3so846426pfk.9
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 15:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0Uj3TKeNhrdwNRMuPPy9S8hZ09c8NnmiwVQNH1E06JU=;
 b=JhLbK3WNFoRrJii59yJ6ytA0N0iZjaPu9ZhocGYtvu2HNkUU3+zutBCCY9+xW9vUTV
 oNLTj7NlOO1j9C3NWK+O3pUSs0A/TOZ0V3sGqnHs9UH4clkbHL+xAD6HFX4XUfzL5Ee5
 p/k4jjNnPh6tYVxObGyuIZCRKyNPcPH8yLzoCturR/XzdoTrOA0jGdgT2SDq+gYRuJoO
 Ile7UX21yF4Sk2lP4TcjNFFB2DaHzHlPuxhwKY9JAIPrEZoTgiZYMXk8ekHb/TOYyHWX
 a6EOOBW2HPmnnLzQpNOdGgYUJrB4Utv2a8GvcS3PDckjqEYppFnRJ8z5VUmE51V21KA1
 Obew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0Uj3TKeNhrdwNRMuPPy9S8hZ09c8NnmiwVQNH1E06JU=;
 b=IGObJXDmW1H6wZCbBuZIVMBY4TV76vRUwNldiA7cEe6InSvttFA0zHTREFAtSKUHjo
 J7mEc5v6ogo9HmKAHbgt3hwyiX4nAKuYM0gPEpPyZtpeIMw+T1XS6UqN+diO6dgvDZM+
 qYhGWR3lI+OVODktCOR9C6F8BsVM9pIlZFBwgKBxs9dFEI3G+5DYVvpotJhdcsXTsgMJ
 FV+OkNAwzOYNfPsvMjAtJpoAjfiOUzgSDhz4Yq2c35OjsxA+EJS7Q66uwoHfDjztP5Yy
 NcoeoQGpTK0LIwUri2+WBb2Cv8PcheNiCcik5PUg7HW4El+vPTPLGeE5zIej1FtrJ0cP
 /azw==
X-Gm-Message-State: ACrzQf1+LsLHn8YsBJ8YecMND6obDR1AIefeCM4y513o4i+vObiFUZhB
 JY0PeFO9jeojlsjKDhrKlzHSwkHuerREzBK3
X-Google-Smtp-Source: AMsMyM5iZh2AbN3pa64XEmhQGut8IfZldEm3cm+FX8+Zb5pcQJZh+rA58ZF0uIhBOM3hnojOro6jvA==
X-Received: by 2002:a63:1508:0:b0:438:eb90:52d1 with SMTP id
 v8-20020a631508000000b00438eb9052d1mr13911763pgl.252.1666305385538; 
 Thu, 20 Oct 2022 15:36:25 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 r10-20020aa7988a000000b0054cd16c9f6bsm13753841pfl.200.2022.10.20.15.36.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 15:36:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v5 00/14] target/arm: Implement FEAT_HAFDBS
Date: Fri, 21 Oct 2022 08:35:34 +1000
Message-Id: <20221020223548.2310496-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Changes for v5:
  * Rebase, including 12 patches.
  * Add regime_is_stage2, which I should have done ages ago.
  * Reorg attribute extraction/merging vs descriptor modifications.

Patches lacking review:
  01-target-arm-Introduce-regime_is_stage2.patch (new)
  02-target-arm-Add-ptw_idx-to-S1Translate.patch
  11-target-arm-Tidy-merging-of-attributes-from-descri.patch
  13-target-arm-Implement-FEAT_HAFDBS-dirty-bit-portio.patch


r~


Richard Henderson (14):
  target/arm: Introduce regime_is_stage2
  target/arm: Add ptw_idx to S1Translate
  target/arm: Add isar predicates for FEAT_HAFDBS
  target/arm: Extract HA and HD in aa64_va_parameters
  target/arm: Move S1_ptw_translate outside arm_ld[lq]_ptw
  target/arm: Add ARMFault_UnsuppAtomicUpdate
  target/arm: Remove loop from get_phys_addr_lpae
  target/arm: Fix fault reporting in get_phys_addr_lpae
  target/arm: Don't shift attrs in get_phys_addr_lpae
  target/arm: Consider GP an attribute in get_phys_addr_lpae
  target/arm: Tidy merging of attributes from descriptor and table
  target/arm: Implement FEAT_HAFDBS, access flag portion
  target/arm: Implement FEAT_HAFDBS, dirty bit portion
  target/arm: Use the max page size in a 2-stage ptw

 docs/system/arm/emulation.rst |   1 +
 target/arm/cpu.h              |  10 +
 target/arm/internals.h        |  11 +
 target/arm/cpu64.c            |   1 +
 target/arm/helper.c           |  22 +-
 target/arm/ptw.c              | 505 +++++++++++++++++++++++-----------
 6 files changed, 380 insertions(+), 170 deletions(-)

-- 
2.34.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1F2609A35
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 08:07:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omprb-0006QQ-99; Mon, 24 Oct 2022 01:19:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omprZ-0006NO-3H
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 01:19:01 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omprW-0002IA-Rc
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 01:19:00 -0400
Received: by mail-pl1-x634.google.com with SMTP id 4so1680891pli.0
 for <qemu-devel@nongnu.org>; Sun, 23 Oct 2022 22:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=veFaLS8xkJnb/rFSYnICf0/qnpt0KqNQhy6c4LRbcJ4=;
 b=TnBhgaoMzuLeJbZ/G+nbslk34WIXzcyT7eE4MxQKGCi305PgB84g4I9AYVZfJf0RgW
 ScZy0L9LzHkpoFGHKhqUb//AbIowqKUtC4jsTIT+DTFbiY4lv0mGRCfE0PbgbNk2Y0yA
 Yx1kGO7uqaZXpTZOPj6H7n1hf4kzEy2JwPaBc0okIZQnv1eSJqK5UEOn12cV5AyBt8yh
 62e0FfiYVv/5hHXPDFjNtHyZE6MQd486pu+0gpdhadAW/upEx2S1ACWD+gACJnUErgBt
 DpffZoD90pqvDWIYbScKEcjngXz7t86u2zjuliI+EmjJR+6fr9IeALsdX3/2c8RMGE9o
 WpTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=veFaLS8xkJnb/rFSYnICf0/qnpt0KqNQhy6c4LRbcJ4=;
 b=nmuJMiYNXqoQuJqI2JeRvg28TMTddiTpkxtKD0IE/ztudUIt3AGHaxWPsIR0x2ddSl
 W6vI8f4qQkhsTDibSK5gxYp1FcTgPDWH4Nmc32ZCtGoWi0RPIh3kyvGBZaEHeB5hy/7T
 T3ciHixWmqXwEt2J8sQGmy6l4pxJM5T8pTY9RHT6km4KVu78axlFffjjqrJDz6D5Fr/Z
 H0LXyWutlIkBFKL8TiTDRoBSLa+qnwSI3HFDWPolXOwd6xc8IWuW4EkuQP/tfKn8SAIT
 MBRSfGsO3MSC7ApvEtRWJ2lEwPOEekNjtkaVW/8TFHqq8zivJzT8L4optizqrY9J3lQ0
 KiRg==
X-Gm-Message-State: ACrzQf21l/xxKZ5LAVa6mGj93cddfSeaISbqkv4zpzBvpl6QkXdT8lhb
 zVJ0tAQvT07l9qHE4aF++LME9z1lf5L48juA
X-Google-Smtp-Source: AMsMyM73B7rHbLp7A6g+9r5zK5oa7WFghS+Nn3apR7kFr5d6ECTf8mkCZLchnv3M5TwgFjk1gY8IAg==
X-Received: by 2002:a17:902:e54b:b0:182:6c84:7fc9 with SMTP id
 n11-20020a170902e54b00b001826c847fc9mr32110158plf.91.1666588737166; 
 Sun, 23 Oct 2022 22:18:57 -0700 (PDT)
Received: from stoup.. ([103.100.225.182]) by smtp.gmail.com with ESMTPSA id
 q12-20020a170902f34c00b00172951ddb12sm1895231ple.42.2022.10.23.22.18.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Oct 2022 22:18:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v6 00/14] target/arm: Implement FEAT_HAFDBS
Date: Mon, 24 Oct 2022 15:18:37 +1000
Message-Id: <20221024051851.3074715-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Changes for v6:
  * Fix rebase error wrt xn bit extract.

Changes for v5:
  * Rebase, including 12 patches.
  * Add regime_is_stage2, which I should have done ages ago.
  * Reorg attribute extraction/merging vs descriptor modifications.

Patches lacking review:
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



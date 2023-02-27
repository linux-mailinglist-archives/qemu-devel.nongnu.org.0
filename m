Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84EDA6A4F5D
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 00:00:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWmS8-0001NQ-NW; Mon, 27 Feb 2023 17:58:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWmS7-0001Lv-3h
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 17:58:39 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWmS5-0008UU-C8
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 17:58:38 -0500
Received: by mail-pl1-x629.google.com with SMTP id p20so7269935plw.13
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 14:58:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=834qqMtvRF8BSTkmUrHBH0Z/kODgg9wpZOC9UfLA/64=;
 b=Nf1PvNAJ+2M80scXmWG9hS0qDO7xOxhzljzBE0VGU/zMcZl8DPgLNxWxNkq+lt4fmI
 fQ5Smn5RYPaUnQCCTsEfw+rmNTAHaoTYwUzBMYqyDJrDcFMFcij/uJUJFhl/jmDE5q5L
 dxFLDgCZrba/TuYt/6Jm5KAJ/FysGS/uh6ruAQXqWY11wVaSrxFWQcQVccCe5FRhmu+A
 iy/2cygCl4aIk+Sicx5OViJKb29rMYNhnrXi1503A+IE1Ud6yh318INvVQKTJcdoLOoc
 7wtIS9hFaUTHBIPzjOt6sCEsIGIej5m86H5H8+wLB+c/EtsQ40fhFcychOz5few8/MKY
 fLvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=834qqMtvRF8BSTkmUrHBH0Z/kODgg9wpZOC9UfLA/64=;
 b=j1j7NcFg2f834HWsZyqIl328/mcxX+1E71FMYVd4kVHNpNcHQsAwKYcdQFZL4NlDtQ
 m+cGihYH8x56n3zjiDcx0PXiIUceZFq4GgNz4C6UL/7OTKgOUxlihvMbCrhDq13ArJ9x
 Tzem1Pw9VRuD1Qifty6bJynJyh3vmpmyP1+gozFcQnralWsr/bv/c2zQu3gHgjWlEArb
 ToddYKDMyLYsic2BXppPd2HhLKhsWGKieVMfaSbhfKyIQy5HYpRP33gPw/eujK2arCKF
 j1IEL5UPg5Qrq84+3UjUvygazg6RdKt55R6QWiqCh/WCMyFt4oScN6bkzQzRYu+KX+s+
 2r3Q==
X-Gm-Message-State: AO0yUKUKBTMb1PYLXESl4o+6GQ/uzQ6yX426JFxJlvw5TWEf4N1Qd8A3
 vlx2X3EO6Lf8cdE1ziN1+xmwBwy2AAFLBBBX+PY=
X-Google-Smtp-Source: AK7set9a/+MN+SdlIw73fgs2UnAaPH2zV8PgUE1kEbWr+TmBWjRBxMvc5xO49g4Bd8gGtqxlVZdzJA==
X-Received: by 2002:a05:6a20:6998:b0:bc:c86a:f60f with SMTP id
 t24-20020a056a20699800b000bcc86af60fmr1089212pzk.54.1677538715664; 
 Mon, 27 Feb 2023 14:58:35 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 c2-20020a6566c2000000b00503000f0492sm4441050pgw.14.2023.02.27.14.58.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 14:58:35 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH for-8.0 v4 0/4] target/arm: pre-FEAT_RME fixes
Date: Mon, 27 Feb 2023 12:58:28 -1000
Message-Id: <20230227225832.816605-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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

These were part of the v3 RME patch set, but are bug fixes
that should not be deferred until all of RME is ready.

r~

Richard Henderson (4):
  target/arm: Handle m-profile in arm_is_secure
  target/arm: Stub arm_hcr_el2_eff for m-profile
  target/arm: Diagnose incorrect usage of arm_is_secure subroutines
  target/arm: Rewrite check_s2_mmu_setup

 target/arm/cpu.h    |   8 +-
 target/arm/helper.c |   3 +
 target/arm/ptw.c    | 173 +++++++++++++++++++++++++-------------------
 3 files changed, 107 insertions(+), 77 deletions(-)

-- 
2.34.1



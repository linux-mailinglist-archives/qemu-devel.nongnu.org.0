Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69851312980
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 04:44:52 +0100 (CET)
Received: from localhost ([::1]:45226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8xTn-0005I9-FA
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 22:44:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wZJ-0003fs-V8
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:46:29 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:32885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wZI-0008Uj-Aq
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:46:29 -0500
Received: by mail-pj1-x102e.google.com with SMTP id lw17so8654480pjb.0
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 18:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dHkdiQhE9C0TRipTFkdugonPIoELUiG+1gG+WOqbceE=;
 b=lniua59MODdKx9keTk5GcM0pT/Jo2pPzcwe1CWh9sXNeVmZTlj+cTWzZxvcN789AU7
 DShEs6A/4gKhFRi+xrpFG1utHz6M2W5tXf00YiBBPqRZuWLP5/yyMWnqsBkRT5ggTCUh
 9ai+JOMe8ziNOvAU20iK+1GT8awP5nSp2VZLQT2NztDdkMLeWJ6jJ4wk/Z6Ct+uU54sK
 3cUS6n7oWNhSAviHBTQoKIIArf/Nd5Q6tpS3HB4QFptlnCbT0q7XMdyZyQd4bS31gEDM
 BSfmUtR1DeCfCjMJwAE/YQvekH3oUuOAhF+VK4xaKH7lYv6V8cFBjukRyes2SYnoxGyi
 3yRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dHkdiQhE9C0TRipTFkdugonPIoELUiG+1gG+WOqbceE=;
 b=UEiO5XnxAyFDOwfslQGE5y155EZA7rzZbKwUmjHcvVvzx/wGfX8P8xOl/aVYWJd5b6
 Z5CEkWzuYZzoviM0xFiEplxvLkvbCH6hAQ6cNxlQjgERlOf3up1OSUTnAC6pZvA2Twya
 cWQZeejjhjzJcq8wEUnS0VIRtrdCyuUDG7bvy5HVu3NKLdMNi8GMsbRIGAzq0JDO8RYO
 oH5kNhc4SFZaLSi7iNKe7udLl/16uJMYHOcv1TBrosT00BkuDqNAp+9UHX/oCO+S14s1
 mYgu2NHjtg9FGCnjbIWFcLVPy1ImrLskM7Ayy1ZLp235OXzk2sWyicxMhVUqHlI+mh0B
 BJSw==
X-Gm-Message-State: AOAM530yMyMwQdkVKJLTfollo85+xV+xS7QABzYqKEU1s9Pos9wGIpHM
 7KVRpgPNymsYL8tup4txkQfohcz/O8JE+Q==
X-Google-Smtp-Source: ABdhPJympSIevmntPQKlp1e386oP8bjhcjZnhVY7wuOhoGR9moIj8umF9bi61Am7NuLvSZJrFQDFXg==
X-Received: by 2002:a17:90a:7e08:: with SMTP id
 i8mr14457404pjl.225.1612752386780; 
 Sun, 07 Feb 2021 18:46:26 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id h8sm8966092pfv.154.2021.02.07.18.46.25
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 18:46:26 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/15] tcg/arm: host neon support
Date: Sun,  7 Feb 2021 18:46:10 -0800
Message-Id: <20210208024625.271018-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Generate NEON instructions for tcg vector operations.

Changes for v2:
  * Rebase on master, now that all prereq are upstream.


r~


Richard Henderson (15):
  tcg: Change parameters for tcg_target_const_match
  tcg/arm: Add host vector framework
  tcg/arm: Implement tcg_out_ld/st for vector types
  tcg/arm: Implement tcg_out_mov for vector types
  tcg/arm: Implement tcg_out_dup*_vec
  tcg/arm: Implement minimal vector operations
  tcg/arm: Implement andc, orc, abs, neg, not vector operations
  tcg/arm: Implement TCG_TARGET_HAS_shi_vec
  tcg/arm: Implement TCG_TARGET_HAS_mul_vec
  tcg/arm: Implement TCG_TARGET_HAS_sat_vec
  tcg/arm: Implement TCG_TARGET_HAS_minmax_vec
  tcg/arm: Implement TCG_TARGET_HAS_bitsel_vec
  tcg/arm: Implement TCG_TARGET_HAS_shv_vec
  tcg/arm: Implement TCG_TARGET_HAS_roti_vec
  tcg/arm: Implement TCG_TARGET_HAS_rotv_vec

 tcg/arm/tcg-target-con-set.h |  10 +
 tcg/arm/tcg-target-con-str.h |   3 +
 tcg/arm/tcg-target.h         |  52 +-
 tcg/arm/tcg-target.opc.h     |  16 +
 tcg/tcg.c                    |   5 +-
 tcg/aarch64/tcg-target.c.inc |   5 +-
 tcg/arm/tcg-target.c.inc     | 963 +++++++++++++++++++++++++++++++++--
 tcg/i386/tcg-target.c.inc    |   4 +-
 tcg/mips/tcg-target.c.inc    |   5 +-
 tcg/ppc/tcg-target.c.inc     |   4 +-
 tcg/riscv/tcg-target.c.inc   |   4 +-
 tcg/s390/tcg-target.c.inc    |   5 +-
 tcg/sparc/tcg-target.c.inc   |   5 +-
 tcg/tci/tcg-target.c.inc     |   6 +-
 14 files changed, 1008 insertions(+), 79 deletions(-)
 create mode 100644 tcg/arm/tcg-target.opc.h

-- 
2.25.1



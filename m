Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7046DB870
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Apr 2023 05:04:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkys3-00045C-52; Fri, 07 Apr 2023 23:04:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkys0-00044P-4S
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 23:04:04 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyry-0004Ut-It
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 23:04:03 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-24677163754so33096a91.0
 for <qemu-devel@nongnu.org>; Fri, 07 Apr 2023 20:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680923040;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AP+ZiJftoqQQR8InAqUzOzR62ihAiYGVawsXCVqmYlM=;
 b=uMw/0W5UzNGHh8APvNxCRMpLmt7D/ANX2WJ3h8f5V1mYnVfTuQ5m7p3TwTLYJyegiM
 2x5fF+OBLsITxZSlaHWPYjf4l/CS9S/NnDt6T7gM6vPiGOdH8vMQQKT+W/gIsrulpK5a
 IFRC8K4NWWe4ZC8yZ4/gv0sRiBEzF4Jy8sQECqPY4xljEWoinGeDfpqVL/10UUpf3Tnm
 0Y25JqXpZ3JeBg1T7/uuJFS2dL4zBAWpRFllhib6+dKMo1EZrwPvxmU/B+5lmT1FMmxG
 1kblEUPV8iK7KbdOKURzfbUXRrpDP/jVcFxRL82eQCZMQGgPWc1tyJ/3obQMwQZwoIIU
 8gSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680923040;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AP+ZiJftoqQQR8InAqUzOzR62ihAiYGVawsXCVqmYlM=;
 b=w0bxRPnGpTQPzRIz939bVeiiS9Kwgr7JqeqDKpiWjAa2TOW+r0dMyd6P77x2YE7VR/
 PyUsnRJjMKpMA8FSDYWpPNPFTwCk2zrldCX07wF0gST/5m5H2QLdXoscvoZmd0yCBDzK
 RDeRhMXBmFl9sfX98fmNVVp6tOEAykEmvMSoYZCkY+3AE58JAWClV8TAUNd50rMAaFRL
 UHDljh/HMN79kh+LzLkBFhpZ99cR4xQIV/EVMKLoVYjSNcwkqx3eb2tMzHl/Xk532Snm
 F8cOp2Teg4xk7hUBXpnTvaZEsY4ogfb2+a9thyC+IaBvLOei46VveRlQI+xgyZ3BppN5
 2jQg==
X-Gm-Message-State: AAQBX9dpRNiaYM+1UuxdlfPXFs31WQH8AfCDz1U29UYryl0ZhM9GjOVP
 NVgdpjitiO0oNUkg7w/GXtNR2vskSsqLGzge7DE=
X-Google-Smtp-Source: AKy350blTHY9J7U71W2LAfsrrJfVzY5/gLRZJVC3wSIFJrbhw86rQJKOLpymvXThE1bizmD9WCxgwg==
X-Received: by 2002:a62:1790:0:b0:627:e2a5:be16 with SMTP id
 138-20020a621790000000b00627e2a5be16mr3792628pfx.6.1680923040546; 
 Fri, 07 Apr 2023 20:04:00 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 c12-20020aa78e0c000000b0062b5a55835dsm3687025pfr.213.2023.04.07.20.03.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 20:04:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org
Subject: [PATCH for-8.1 00/12] tcg/mips: Backend improvements
Date: Fri,  7 Apr 2023 20:03:47 -0700
Message-Id: <20230408030359.3368868-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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

I've posted some of these before, perhaps a year or more ago, but
then failed to follow up and get them merged.

I don't think there are any real dependencies, but it has been
rebased upon today's load/store helpers patch set, so there might
be minor conflicts, therefore:

Based-on: 20230408024314.3357414-1-richard.henderson@linaro.org
("[PATCH for-8.1 00/42] tcg: Simplify calls to load/store helpers")


Richard Henderson (12):
  tcg/mips: Move TCG_AREG0 to S8
  tcg/mips: Move TCG_GUEST_BASE_REG to S7
  tcg/mips: Unify TCG_GUEST_BASE_REG tests
  tcg/mips: Create and use TCG_REG_TB
  tcg/mips: Split out tcg_out_movi_one
  tcg/mips: Split out tcg_out_movi_two
  tcg/mips: Use the constant pool for 64-bit constants
  tcg/mips: Aggressively use the constant pool for n64 calls
  tcg/mips: Try tb-relative addresses in tcg_out_movi
  tcg/mips: Try three insns with shift and add in tcg_out_movi
  tcg/mips: Use qemu_build_not_reached for LO/HI_OFF
  tcg/mips: Replace MIPS_BE with HOST_BIG_ENDIAN

 tcg/mips/tcg-target.h     |   3 +-
 tcg/mips/tcg-target.c.inc | 350 ++++++++++++++++++++++++++++----------
 2 files changed, 260 insertions(+), 93 deletions(-)

-- 
2.34.1



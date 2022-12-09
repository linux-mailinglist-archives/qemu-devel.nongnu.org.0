Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBAC647BF4
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 03:07:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3Slf-0005t4-A8; Thu, 08 Dec 2022 21:05:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p3Slc-0005sl-IE
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 21:05:36 -0500
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p3Sla-0001sD-WF
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 21:05:36 -0500
Received: by mail-oi1-x231.google.com with SMTP id c129so3306216oia.0
 for <qemu-devel@nongnu.org>; Thu, 08 Dec 2022 18:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ylrzc2eGHY7FEMofzs3/exxzKMTwBLpMnTdAzZ6ILDA=;
 b=d4CRRmUr1hjVcps+NU0E5cX5JmTBVHS9r1hVUlEPxjWsjlNc3MTVMohjpQQ15WBphE
 mhOeRaBT3Avza01ZWxtJ89nAgc5Lc5IUFeF+7NCtDXkoK+5G/0CBj+Jsq1DbzvodwNl1
 cbCyCxpcCvy1GJg6l9/L7DrMQIlSzt0EZ92UKgSEPQjR9Ye0eVnOBF98a6ggldSQWdcK
 YT23NlByJs0rQ8JLB3rft37qd5smPt2KOCmVROVdtTYNBe1S8hqgEjFYaTET/rZZJs4u
 9dXhzApJ9+kphHBXfvcFwiVb3LDOkXbjp+xAqLalaUNN15p/5/FKmE23ADvo3bfKysrY
 u/9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ylrzc2eGHY7FEMofzs3/exxzKMTwBLpMnTdAzZ6ILDA=;
 b=SGllY9/MuSBJh/cDqjmDxqgyNlDmgSFJ3K2GAJKf+xkRhob2yUT3ZGfhTaVigWXgPr
 HeEo9DUJiyBFHxAElQNTktknKluPTVCRJdAKKe6ODSMTg0KOX5qp11HPuP+FeRuMTjRk
 b14NVUAvpPmeFTuuSi/kBX+4x7y3fS6k7wgc68W19rrNemgwznKX5CWo7+FJ2gs7V8au
 7Y/lM8GCno8viHxKihx7IoVNyOA7UU1Q7CTS+U5Iql7bC8cCBHb2HeD2aBihq2MkfRaG
 kyN3jI332a/Jw+U8XxpmmX6JpzbxZJZVeBiX+kkgv/ATLObwHjRgpjFP4l5MDSAx22uN
 gfWA==
X-Gm-Message-State: ANoB5pnPcH77anWkEepwd2gyy2+v+5Zx8qjjmNq3iQLFOw4HU1Q+/JBu
 xM6sO4MsVbur7Lmb4RO1loqurs4L2wIWVqouu9w=
X-Google-Smtp-Source: AA0mqf7F7yH1+8a++dRfVx5jf76w7a3U4C2vFf6ApkglMC7scK2RawOE6ZV+9+f9aSIL75qK4e8Riw==
X-Received: by 2002:a05:6808:118c:b0:355:1df0:9b84 with SMTP id
 j12-20020a056808118c00b003551df09b84mr2126102oil.2.1670551533334; 
 Thu, 08 Dec 2022 18:05:33 -0800 (PST)
Received: from stoup.. ([2806:102e:18:2efc:d298:de6f:2ed:87a4])
 by smtp.gmail.com with ESMTPSA id
 s14-20020a05683004ce00b0066f7e1188f0sm53531otd.68.2022.12.08.18.05.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 18:05:32 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com,
	iii@linux.ibm.com
Subject: [PATCH v4 00/27] tcg/s390x: misc patches
Date: Thu,  8 Dec 2022 20:05:03 -0600
Message-Id: <20221209020530.396391-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x231.google.com
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

Based-on: 20221202053958.223890-1-richard.henderson@linaro.org
("[PATCH for-8.0 v3 00/34] tcg misc patches")

Changes from v3:
  * Require z196 as minimum cpu -- 6 new patches removing checks.
  * Tighten constraints on AND, OR, XOR, CMP, trying get the register
    allocator to hoist things that can't be done in a single insn.
  * Avoid the constant pool for movi.

I believe that I have addressed all of the discussion in v3,
except perhaps for goto_tb concurrent modifications to jumps.
I'm still not quite sure what to do about that.


r~


Richard Henderson (27):
  tcg/s390x: Use register pair allocation for div and mulu2
  tcg/s390x: Remove TCG_REG_TB
  tcg/s390x: Always set TCG_TARGET_HAS_direct_jump
  tcg/s390x: Remove USE_LONG_BRANCHES
  tcg/s390x: Check for long-displacement facility at startup
  tcg/s390x: Check for extended-immediate facility at startup
  tcg/s390x: Check for general-instruction-extension facility at startup
  tcg/s390x: Check for load-on-condition facility at startup
  tcg/s390x: Remove FAST_BCR_SER facility check
  tcg/s390x: Remove DISTINCT_OPERANDS facility check
  tcg/s390x: Use LARL+AGHI for odd addresses
  tcg/s390x: Distinguish RRF-a and RRF-c formats
  tcg/s390x: Distinguish RIE formats
  tcg/s390x: Support MIE2 multiply single instructions
  tcg/s390x: Support MIE2 MGRK instruction
  tcg/s390x: Issue XILF directly for xor_i32
  tcg/s390x: Tighten constraints for or_i64 and xor_i64
  tcg/s390x: Tighten constraints for and_i64
  tcg/s390x: Support MIE3 logical operations
  tcg/s390x: Create tgen_cmp2 to simplify movcond
  tcg/s390x: Generalize movcond implementation
  tcg/s390x: Support SELGR instruction in movcond
  tcg/s390x: Use tgen_movcond_int in tgen_clz
  tcg/s390x: Implement ctpop operation
  tcg/s390x: Tighten constraints for 64-bit compare
  tcg/s390x: Cleanup tcg_out_movi
  tcg/s390x: Avoid the constant pool in tcg_out_movi

 tcg/s390x/tcg-target-con-set.h |   18 +-
 tcg/s390x/tcg-target-con-str.h |   11 +-
 tcg/s390x/tcg-target.h         |   54 +-
 tcg/s390x/tcg-target.c.inc     | 1251 ++++++++++++++++----------------
 4 files changed, 668 insertions(+), 666 deletions(-)

-- 
2.34.1



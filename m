Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8789E1DEAB4
	for <lists+qemu-devel@lfdr.de>; Fri, 22 May 2020 16:56:40 +0200 (CEST)
Received: from localhost ([::1]:46408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jc96F-0003bC-1F
	for lists+qemu-devel@lfdr.de; Fri, 22 May 2020 10:56:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jc953-0001qT-8s
 for qemu-devel@nongnu.org; Fri, 22 May 2020 10:55:25 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:34272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jc952-0006QN-Au
 for qemu-devel@nongnu.org; Fri, 22 May 2020 10:55:24 -0400
Received: by mail-wm1-x332.google.com with SMTP id g14so4571736wme.1
 for <qemu-devel@nongnu.org>; Fri, 22 May 2020 07:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F+XukQGVqGykAC1nJweUZyVkVXMChOdWscCcvUNho9w=;
 b=Ua/J4A4vaHrJ+Wq7rqNCUCRqIeufd5A8X1PNG4SObRbkFuViphkTpGGeLhj9w1W2rf
 0ZaZ8ivajHkFiF6mihONBs0NVSK0CAD23ZVQDm/BdA7AbvIJEu/zFAxvLL8+WuYyGZ2+
 ZjwPGzRxsD7379gw63uHsum3zEKu3F8cNilppOwwUucTKDiym95qOAdyhba41bcXFKoK
 2vUCFHBof5aj2R34nKgT1TSHViZTC9xDEE1vhh2G8YNO2/js49j5bamHIL3FivO9PG4X
 vp+mN5P/nouVxgwI4jhJnjRa+h9Gi8h+6iRdRuzkxjpv7aGcy4GS7ZjaXogOWq0b27O2
 /3QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F+XukQGVqGykAC1nJweUZyVkVXMChOdWscCcvUNho9w=;
 b=KSQi9YAJqZY9h2LsEz4fqIB7DOi7E4ZkqBBzbsZo6FIdMTmV76sxrEoF+yNC+pP3xL
 E5+jNclZGqeljvLFPLrcebm71ew44UP2kmvSSHqIASQUytKbw+fH+8SDvDTUte0CvAsJ
 XpUyWSaG4nw3hVrj+rDlsM+CGRceNrgl5FTtd6u5cGjrMxv2MGi7ikr6Geg/asaqbwjw
 2+4ygQKIo1AfiQIqycSPe+0i6ae/FCY3qF/VEdkL5mVLL/JF+lj8uKoJu2DW0kEBdXLV
 bXgiaQlkV8FlF7AOjXwmkLWau04oK8kVy1S60O+eTCSBaKn1EXliS/JsdnX/wqVf6Q5z
 5kBg==
X-Gm-Message-State: AOAM5339Gu05cs1rtNu2ocDMWSB2ET6xbrzWEFOjAL28eddutnkD9pcA
 9tMji4fWdX3q2uzHRKKxchCqEg==
X-Google-Smtp-Source: ABdhPJyvDQCYMmJgpXe6ricfNRlAWyJKXDHd4zv5UpOMkLqEC/V5merIuF7brCY88EHsRDOyvsYTIQ==
X-Received: by 2002:a7b:c932:: with SMTP id h18mr13305515wml.22.1590159322597; 
 Fri, 22 May 2020 07:55:22 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y8sm1100561wmc.37.2020.05.22.07.55.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2020 07:55:21 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 0/9] target/arm: Convert 2-reg-shift and 1-reg-imm Neon
 insns to decodetree
Date: Fri, 22 May 2020 15:55:11 +0100
Message-Id: <20200522145520.6778-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patchset converts the Neon insns in the 2-register-and-shift-amount
and 1-register-and-modified-immediate groups to decodetree.

Changes since v1:
 * old patch 1 is now in master
 * patch 1, 2, 3, 4: create and use separate formats for each size of shift
 * patch 5, 6, 7: use new @2reg_shrn_[dsh] formats and keep Q bit in the
   per-insn decode rather than folding it into the format
 * patch 8: use %neon_rshift_i5 in new @2reg_vcvt format
 * patch 9: various changes

Patches still needing review: 1, 5, 9.  (RTH: you might want to look over
2 as well: I didn't use quite the same shift formats you suggested.)

thanks
-- PMM

Peter Maydell (9):
  target/arm: Convert Neon VSHL and VSLI 2-reg-shift insn to decodetree
  target/arm: Convert Neon VSHR 2-reg-shift insns to decodetree
  target/arm: Convert Neon VSRA, VSRI, VRSHR, VRSRA 2-reg-shift insns to
    decodetree
  target/arm: Convert VQSHLU, VQSHL 2-reg-shift insns to decodetree
  target/arm: Convert Neon narrowing shifts with op==8 to decodetree
  target/arm: Convert Neon narrowing shifts with op==9 to decodetree
  target/arm: Convert Neon VSHLL, VMOVL to decodetree
  target/arm: Convert VCVT fixed-point ops to decodetree
  target/arm: Convert Neon one-register-and-immediate insns to
    decodetree

 target/arm/neon-dp.decode       | 196 ++++++++++
 target/arm/translate-neon.inc.c | 625 ++++++++++++++++++++++++++++++++
 target/arm/translate.c          | 488 +------------------------
 3 files changed, 823 insertions(+), 486 deletions(-)

-- 
2.20.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A5A574F28
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 15:30:40 +0200 (CEST)
Received: from localhost ([::1]:41762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oByvP-00005o-4I
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 09:30:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oByo9-0002Av-BD
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 09:23:09 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:33400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oByo7-0004nt-Is
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 09:23:09 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 z23-20020a7bc7d7000000b003a2e00222acso3579236wmk.0
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 06:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Hm6Vqd36HiGW6aIEn8mL/S4aOf9wNeOFchGwadxd8wQ=;
 b=UKcn9MdAi/omtIb4OCE2m/wW3mNVhIOCYB39iAqZx+/JR6XJYtuj9H5l6dsqY01/Hw
 Tv9J8BYyz+spbCb9C68HLmo6AMBNUlLvYGJUlBOdsDSbo3YRBzoaWsCa6/tDK8pqzWQy
 xrhZHhvYg/w0eJFQtamZHRqiq6Vcz/ibJgkvhr7YMdftM5eb8Gv11yMGbuU/DQcHkWoZ
 mka9Tt0GB4aAOF2Krem6V8JGTsqB+IY2q6HXdogZ/x9kUXhCdmrNAaT9t0cVMnVaoZcH
 VQxG75pH/RA33hJLfaWgRpg8NCQimkA6iD6E05lzM1WkvmShe76D4H2auO+lOrrlafCB
 tHcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Hm6Vqd36HiGW6aIEn8mL/S4aOf9wNeOFchGwadxd8wQ=;
 b=N0R7bd0QQhsifVmKQOC5VBlGngI3pxcfFwTRjuO5CKQz97+fmnl0ZdF1NsIQUuOgzA
 UVsOwRIEibBDJpF5MgNKQ0zPlhJSS7j0fVgB6sNoeP8ZHGBOxf2+Z/R24HtYavf4ntZi
 HuP7XTYbpNdo8n0M6aDYu8gVsjPU5XzzdRQ5np+geRX2E/D4uSb9VmnkWU8SUtWEFk3z
 ttTvUOTAVpBG7bycUxUOzIrmSP5gXUJEb5NNXtDfXhkgkjwHThE4zaaJ+4YjI+/XTmfP
 cZhJMNY4PLhfQ45nhtaf9meczBBK6g2opKnLvZ8MetVutGUB/WG+Nb/hiV1nYVzTeEPQ
 t3UA==
X-Gm-Message-State: AJIora8vIWXjkKT8vER3JLseSXCo9ugfhx/zsUnFNSfOiqM2dgIAZJHR
 G8EnherhWv6xYkgbHnZWXangJg==
X-Google-Smtp-Source: AGRyM1tQJMPxRlKdZxWveSoPpe0RTxkLYkFH1dLEVtCGIVOxZ0dYhJNqGOxEK0Hk0BPSS7R+rvSI2Q==
X-Received: by 2002:a05:600c:2c4c:b0:3a2:dd0f:fa03 with SMTP id
 r12-20020a05600c2c4c00b003a2dd0ffa03mr9083600wmg.18.1657804985918; 
 Thu, 14 Jul 2022 06:23:05 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 k11-20020a7bc40b000000b0039c5cecf206sm1925079wmi.4.2022.07.14.06.23.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jul 2022 06:23:05 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Idan Horowitz <idan.horowitz@gmail.com>
Subject: [PATCH 0/7] target/arm: Handle VTCR_EL2 bits shared between S and NS
 EL2
Date: Thu, 14 Jul 2022 14:22:56 +0100
Message-Id: <20220714132303.1287193-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

In https://gitlab.com/qemu-project/qemu/-/issues/1103 Idan pointed
out that our regime_tcr() function doesn't handle the fact that some
of the config bits for the Secure stage 2 translation regime are
shared with NS EL2 and stored in VTCR_EL2 rather than VSTCR_EL2. 
Currently the only visible effect of this is that if the guest tries
to enable LPA2 via VTCR_EL2.DS QEMU will incorrectly fail to honour
this for Secure stage 2 translations.

The final patch in this series fixes this, by synthesizing a
VTCR_EL2 format value for Secure stage 2 by merging together
the shared VTCR_EL2 fields into the VSTCR_EL2 value.

The first six patches get rid of a very longstanding
micro-optimization of our TCR register handling that gets in the way
of fixing the bug.  Currently regime_tcr() returns a pointer to a TCR
struct, which contains both the 64-bit TCR value and also two
'base_mask' and 'mask' values, which are pre-calculated when the
register is written.  Those values are used only in the
get_level1_table_address() function.  That function is called once
per page table walk for 32-bit short-descriptor page tables only. 
The pre-calculation saves only a handful of logical shifting and
masking instructions, which is a tiny amount of overhead compared to
everything else we need to do on a guest page table walk. Conversely
the microoptimization adds extra complexity on TCR register writes,
and code complexity handling the TCR struct. It therefore no longer
seems to be pulling its weight, and we're better off without it,
rather than jumping through hoops to come up with a fix to the
VSTCR_EL2 issue that lets us retain it.

thanks
-- PMM

Peter Maydell (7):
  target/arm: Define and use new regime_tcr_value() function
  target/arm: Calculate mask/base_mask in get_level1_table_address()
  target/arm: Fold regime_tcr() and regime_tcr_value() together
  target/arm: Fix big-endian host handling of VTCR
  target/arm: Store VTCR_EL2, VSTCR_EL2 registers as uint64_t
  target/arm: Store TCR_EL* registers as uint64_t
  target/arm: Honour VTCR_EL2 bits in Secure EL2

 target/arm/cpu.h          | 31 ++++++++++----
 target/arm/internals.h    | 34 +++++++++++----
 target/arm/cpu.c          |  2 +-
 target/arm/debug_helper.c |  2 +-
 target/arm/helper.c       | 87 +++++++++++----------------------------
 target/arm/ptw.c          | 38 +++++++++--------
 target/arm/tlb_helper.c   |  2 +-
 7 files changed, 96 insertions(+), 100 deletions(-)

-- 
2.25.1




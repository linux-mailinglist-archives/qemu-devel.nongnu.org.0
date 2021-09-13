Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C684088A8
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 11:59:36 +0200 (CEST)
Received: from localhost ([::1]:57962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPikR-000693-Ru
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 05:59:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPifl-00071T-Qj
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 05:54:45 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:36604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPifk-0001pB-0q
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 05:54:45 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 l18-20020a05600c4f1200b002f8cf606262so6472033wmq.1
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 02:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9jap4PU7/eqioHoMoH2P+o8wmj0ULMYRqc/JtNk4Smg=;
 b=yw1D5GTdqk0bsuAFTJN3a64en+nW6MKxbVdrtJWUD5p9NWAeDjFC2FyQ2sQfhe/eFV
 qnC9bNWZaILJBJAAAp8Rxvu52ZZTPRKOjBxokKwy67m0y1o6vD7zcA+s0ElTpSAGlmbu
 PxTTtWQeAu57Po7N/Enc/ABXPofDbc0OpDkng374ssrfKPc7SOHCN4b1pq8Kf8zAA7y8
 y4zq24LpBV4PxGBsltAhPsXhuBamkFqjYEZNUFNyi6TpEjDVp8vaSFrdXEz/rZ+jpwmT
 iS5SqzDSuFyYw1unzP8qJKWefd+n67f7Z9oL2VTITCp4XfYQyb3K2BBKePtE7UsduZ4k
 JqEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9jap4PU7/eqioHoMoH2P+o8wmj0ULMYRqc/JtNk4Smg=;
 b=jBKXVlNJ6bQo4grOLmQO9r7GOzO5dLsdHgD0DNApahP+UJWO0C0D0GucIfKe2MfITI
 seFvUE8jVg3xwkxtpkrQQRnsKqXzHB22X0BqWUTqaSiFtmtiClrTMSls1y/PA4rDjYZf
 CqRpEzaCMawALA62SSzPdNpnJCToJuLD5Bz3PawdhYw5kNjhtowww9xobLlUxMZ8iO8z
 lrWrKb3EaNqmoy4mn26UwBoK6tAVgUjm3gXAoNDrbhziryPMta0XLcVKAiBNCvUweN54
 kocxgaYKaPI86H7v0mvVaA9995vIrXILQrlhSipp1o2XPFmuGEjA88LhD/HA1BT6yZfq
 556Q==
X-Gm-Message-State: AOAM533mC9uk0sPyUfAhAb8GJ+O1LCMq4Qrus33dcLyKj5egK9uHrFGz
 lDr3/cx4AYkLVtoi+dK2mJsx1g==
X-Google-Smtp-Source: ABdhPJxNMnPOau8NBBlVsaS5A1qYj+I506HmutcD/UptCSMtdy0DlNdMyMT2QNKLYi0MrjBTPpCe2Q==
X-Received: by 2002:a1c:a913:: with SMTP id s19mr10031695wme.26.1631526882641; 
 Mon, 13 Sep 2021 02:54:42 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m184sm6475338wmm.3.2021.09.13.02.54.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 02:54:42 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 00/12] target/arm: Use TCG vector ops for MVE
Date: Mon, 13 Sep 2021 10:54:28 +0100
Message-Id: <20210913095440.13462-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patchset uses the TCG vector ops for some MVE
instructions. We can only do this when we know that none
of the MVE lanes are predicated, ie when neither tail
predication nor VPT predication nor ECI partial insn
execution are happening.

Changes v1->v2:

The major change is that instead of just updating the local
s->mve_no_pred flag when we translate an insn that changes the
predication state, we end the TB with DISAS_UPDATE_NONCHAIN.
The exceptions are the code called from vfp_access_check()
(gen_preserve_fp_state() and gen_update_fp_context()). We
can definitely determine the new flag value in one of these cases,
but in the other we can't always.

So patch 1 is new, and adds support to gen_jmp_tb() for
looking at the existing value of is_jmp so it can honour
a preceding request for an UPDATE_NOCHAIN or UPDATE_EXIT.
(We already were assuming this because gen_preserve_fp_state()
can set is_jmp to DISAS_UPDATE_EXIT if icount is in use.)

Patch 2 (new) enforces that FPDSCR.LTPSIZE is 4 on inbound
migration, because we now rely on this architectural invariant.

Patch 3 is the old patch 1, updated as noted above.

Patches 4-6 have been reviewed (they have been very slightly
tweaked to use a new mve_no_predication() function that checks
both s->eci and s->mve_no_pred, rather than v1's direct check
of mve_no_pred.)

Patches 7-12 are new, and add optimized variants of VDUP, VMVN,
various shifts, the shift-and-inserts, and the 1-operand-immediate
insns.

I think this should now be the complete set of optimizations
it's worth implementing at this point.

thanks
-- PMM

Peter Maydell (12):
  target/arm: Avoid goto_tb if we're trying to exit to the main loop
  target/arm: Enforce that FPDSCR.LTPSIZE is 4 on inbound migration
  target/arm: Add TB flag for "MVE insns not predicated"
  target/arm: Optimize MVE logic ops
  target/arm: Optimize MVE arithmetic ops
  target/arm: Optimize MVE VNEG, VABS
  target/arm: Optimize MVE VDUP
  target/arm: Optimize MVE VMVN
  target/arm: Optimize MVE VSHL, VSHR immediate forms
  target/arm: Optimize MVE VSHLL and VMOVL
  target/arm: Optimize MVE VSLI and VSRI
  target/arm: Optimize MVE 1op-immediate insns

 target/arm/cpu.h              |   4 +-
 target/arm/translate.h        |   2 +
 target/arm/helper.c           |  33 ++++
 target/arm/machine.c          |  13 ++
 target/arm/translate-m-nocp.c |   8 +-
 target/arm/translate-mve.c    | 310 ++++++++++++++++++++++++++--------
 target/arm/translate-vfp.c    |  33 +++-
 target/arm/translate.c        |  42 ++++-
 8 files changed, 361 insertions(+), 84 deletions(-)

-- 
2.20.1



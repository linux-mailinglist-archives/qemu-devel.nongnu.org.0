Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0CF3D4F3E
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Jul 2021 19:45:54 +0200 (CEST)
Received: from localhost ([::1]:36582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7iCG-0005Ew-Nv
	for lists+qemu-devel@lfdr.de; Sun, 25 Jul 2021 13:45:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m7iAd-0003ua-Cp
 for qemu-devel@nongnu.org; Sun, 25 Jul 2021 13:44:11 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:52868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m7iAb-0006PC-E0
 for qemu-devel@nongnu.org; Sun, 25 Jul 2021 13:44:10 -0400
Received: by mail-wm1-x330.google.com with SMTP id n11so3890223wmd.2
 for <qemu-devel@nongnu.org>; Sun, 25 Jul 2021 10:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DP9DMYTv9aNOInLo2WQBwZnaKKn2mpapQJ3IaaZINkg=;
 b=U6iUKn6CTinShAMAp0cN/v5ExJvOj+0UgmJGlZGMUL10BbVUE8EizLOtz09LDMNgEs
 jGAuUP25qbkg3/UugqqjhTAOw/Ld2ZNs1AKqIrU+XvPPS/g03skGBlU5NXr57uJUHAV9
 9GZG/EcDrnD3yN6Lqw5i+sNbssKbDrgJ2cZAmz/MzEfAixHT5ohfAdkZSqWP9U/iKdyQ
 zkSVfor+OUI0w9dasLWaYw5QotLTHGyJJ2iPLugoXTBjINaJHwuz1BMnFeboiprmz99G
 O4a+Hdv4BZFSMLvaPdng9IPMHCTZ7Rxti7vMZNMVYJ/VemUtKCxz6JCXIkP+UfzahZrx
 tohg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DP9DMYTv9aNOInLo2WQBwZnaKKn2mpapQJ3IaaZINkg=;
 b=qb6foAXEuiv/VkvusSDMI9cFQ0Uaf0JUQ7iA6zwL0D8dYfWGFSs6N8Tm6qfaXZT6gv
 O46rxDe+gXUGGTKkdsFxrIPxw4G8vcP9weDtViSKe+f8BnxPevBxDwZKpGdPq9y1LXLO
 MxbN5GAyX58qqoPcWIrRfogy7YaaEs4eLHw+tzdzVbMP4KlwZFoNqV845kGnpmqJBxJe
 phSwbv1rItk7FtErUNUStJTuBkziunyNZceTILghY7o2WSbPcW0X7RGb49hAgJKuQua8
 kTBefQgm14aEl7Uv552Jsx93dYpBzRYnZYgzHLnCDMr0+UgxrkVuITRyZhjzI3E3bym+
 usVQ==
X-Gm-Message-State: AOAM531gX6B8ObAsJ2sq9yCsoagXCZ+N2QNPwSr5ZZKIkwZFlpJmFNrg
 EntY9NUPv9WTh5or94voZJkMGOlGhV74hQ==
X-Google-Smtp-Source: ABdhPJweBvnMhFLBfsA2NFB7c1XqbJx5mV58+7jemHDymwMIrQ5W3GQaM84h6eD5T0UoM4aUsY4Vmw==
X-Received: by 2002:a1c:9a97:: with SMTP id c145mr23404954wme.42.1627235047648; 
 Sun, 25 Jul 2021 10:44:07 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m15sm33666655wmc.20.2021.07.25.10.44.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 10:44:07 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.1 0/2] accel/tcg: Fix hang when running in icount mode
Date: Sun, 25 Jul 2021 18:44:03 +0100
Message-Id: <20210725174405.24568-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patchset fixes the intermittent hang seen when running a guest in
icount mode, as reported in
  https://gitlab.com/qemu-project/qemu/-/issues/499 .

The underlying cause of the hang is that code in cpu_loop_exec_tb()
was using CF_COUNT_MASK as the maximum possible number of instructions
it would try to execute from a TB when it set the icount_decr.u16.low
field. This is wrong, because (a) that field can validly be set to any
unsigned 16-bit integer and (b) now that CF_COUNT_MASK has been
reduced to 511 in commit 78ff82bb1b67c0d7, it might be less than the
number of insns in the TB.

Patch one fixes cpu_loop_exec_tb() to use the actual maximum valid
value for icount_decr.u16.low, which is 0xffff.  Patch two adjusts the
"should we ask for a TB with exactly this many insns in it?" condition
so that instead of testing "cpu->icount_extra == 0", which should be
always true if (insns_left > 0 && insns_left < tb->icount), we assert
it instead.  This assertion would have caught the bug fixed in patch
one.

Tested using the same iterating loop test described in the bug report;
without the fix QEMU hangs within a handful of iterations. With the
fix it managed 175 successful iterations before I got bored and hit ^C.

thanks
-- PMM

Peter Maydell (2):
  accel/tcg: Don't use CF_COUNT_MASK as the max value of
    icount_decr.u16.low
  accel/tcg: Remove unnecessary check on icount_extra in
    cpu_loop_exec_tb()

 accel/tcg/cpu-exec.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

-- 
2.20.1



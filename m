Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A409223A343
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Aug 2020 13:25:34 +0200 (CEST)
Received: from localhost ([::1]:33880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k2Yaz-00039B-N6
	for lists+qemu-devel@lfdr.de; Mon, 03 Aug 2020 07:25:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k2YUd-0003iH-HJ
 for qemu-devel@nongnu.org; Mon, 03 Aug 2020 07:18:59 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:37309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k2YUZ-0004ry-3i
 for qemu-devel@nongnu.org; Mon, 03 Aug 2020 07:18:59 -0400
Received: by mail-wm1-x336.google.com with SMTP id k8so15090588wma.2
 for <qemu-devel@nongnu.org>; Mon, 03 Aug 2020 04:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bnYxoFbHtrkjqYPO/Dt9+mPErfpnn8YVEerPhU9sF5Y=;
 b=g1AKw2BPiNsT4JkHx145evksMt2QOhfDkLi4uJBYWO3YBgsWDXsGfoUrBUv9x0nRCe
 +46eFl0WdGNQ7weyCSZDZm3JLbvnPlZOMXLNEFTIHzBSesY2M4srSXihSymga45BiHMg
 lqE3eB2AAjgAk04mEyTwx8dASYEphrArsIIIXzUN8yavQ4/peA1FPTEH22tRlUymIny0
 trWygtZ5F6E/dzJ16dBtYo8g1gxa7shiY+uGCQ4Id4CFH2vl0TikSbg6G61vXTh5UJPc
 yqo9TD7WA2xr6BxKRngdgZ1CIXF4tHWR6lHHY6IHGqRvdNrvHUzUZN9E3xwas/C271mz
 2zrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bnYxoFbHtrkjqYPO/Dt9+mPErfpnn8YVEerPhU9sF5Y=;
 b=nx9+BNaJvE4y9u8UWhNLphg/K00KCXLvmtqjFhep7XnkcubTN3/4fulzIsq4s77Pi5
 eql5gIC4t1Cs2heeEotdcEdCbgYOCeoKpHYAEuN8lriQSefbN/m5JCqDbtjpZE6mUS4Y
 x0TXU9pQdsOS6CojbVJ8RnO7Czmo93k/j+05LzMeRy2DtetPJzujDyINhZfO9VFZ9qQi
 zuD2bcsHxFOh8wTmsFMrkH6NBRyQVbPwOb/HkpXhQOhCXG/6Y8rnnrWb40lXKuFd0PHU
 pQfwxChDcBvMdkOzjzivz1E71zFlKZi3KNm5VwP3XLw8jcVc7C8T7ZMgacAsCQweYvXu
 88Fg==
X-Gm-Message-State: AOAM5320Wjxp7QMVlapHDWSWiirrzZcIVV9GzQKzsitg+Y8ibP2kjJAF
 ooKXmNg7FX36OQpyHmmI6TxKDy9hhh7IgA==
X-Google-Smtp-Source: ABdhPJyUEi34geOd3HM7rIXfo4MTZoFmGOYBtroLpC1/2JTde9ah8Ib9FWWSWmf5DM2nuLw+kPG+7Q==
X-Received: by 2002:a7b:c7c6:: with SMTP id z6mr16362509wmk.17.1596453532526; 
 Mon, 03 Aug 2020 04:18:52 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g3sm28013170wrb.59.2020.08.03.04.18.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2020 04:18:51 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/7] target/arm: copro decode cleanup
Date: Mon,  3 Aug 2020 12:18:42 +0100
Message-Id: <20200803111849.13368-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

This patchset cleans up the handling of copro instructions in
the A32/T32 decoder, converting the MRC/MCR/MRRC/MCRR insns
to decodetree.

The main motivation here was correcting how we do NOCP checks for
M-profile: the architecture specifies that the NOCP exception when a
coprocessor is not present or disabled should cover the entire wide
range of coprocessor-space encodings, and should take precedence over
UNDEF exceptions.  (This is the opposite of A-profile, where checking
for a disabled FPU has to happen last.) This is mandatory from
v8.1M and recommended for v8.0M, but we were having UNDEFs in the
VFP encodings taking precedence over NOCP. The patchset's solution
to this is to have a decodetree decoder which matches (a) the
two or three insns which are defined to not get this NOCP behaviour
and (b) the area of the encoding space which does need to be NOCP'd
if the coprocessor is not present, and invoke this before any of
the other decoding.

The rest is mostly cleanup: we split out the XScale decode handling
from disas_coproc_insn() and then convert the normal coproc
insns to decodetree patterns in a32.decode and t32.decode.
After these patches, the only remaining "legacy decoder" code
is disas_xscale_insn()/disas_iwmmxt_insn(). The conversion does
fix a minor underdecoding: we weren't checking that bits [24:21]
of MRRC/MCRR were 0b0010, so some patterns that should have been
UNDEFed as LDC/STC were instead treated as MRRC/MCRR.

It's hard to see it ever being worthwhile to convert the
xscale/iwmmxt decode to decodetree -- we don't have the same
requirement to be able to add new insn support to it. I
suppose we could replace checks like 
 if ((insn & 0x0e000f00) == 0x0c000100)
in disas_arm_insn() with a single decodetree pattern in
a32.decode that invoked disas_iwmmxt_insn(), but I dunno that
that's really any neater...

thanks
-- PMM

Peter Maydell (7):
  target/arm: Pull handling of XScale insns out of disas_coproc_insn()
  target/arm: Separate decode from handling of coproc insns
  target/arm: Convert A32 coprocessor insns to decodetree
  target/arm: Tidy up disas_arm_insn()
  target/arm: Do M-profile NOCP checks early and via decodetree
  target/arm: Convert T32 coprocessor insns to decodetree
  target/arm: Remove ARCH macro

 target/arm/a32.decode          |  19 +++
 target/arm/m-nocp.decode       |  42 ++++++
 target/arm/t32.decode          |  19 +++
 target/arm/vfp.decode          |   2 -
 target/arm/helper.c            |  29 ++++
 target/arm/translate-vfp.inc.c |  52 +++++--
 target/arm/translate.c         | 240 +++++++++++++++++----------------
 target/arm/Makefile.objs       |   6 +
 8 files changed, 284 insertions(+), 125 deletions(-)
 create mode 100644 target/arm/m-nocp.decode

-- 
2.20.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE5B5BB7FD
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Sep 2022 13:28:01 +0200 (CEST)
Received: from localhost ([::1]:38762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZVzL-000097-C9
	for lists+qemu-devel@lfdr.de; Sat, 17 Sep 2022 07:27:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oZVww-0005ke-Sx
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 07:25:30 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:47124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oZVwv-0006jV-6n
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 07:25:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=a/ICVVOnEb8ACahFrRs1bCh3N9zvNBD1WQUnoRcvJIk=; b=DcC1HydXkyYVam61KXE+Dwnke1
 G+MBLpKv0uE1SYq+4rGGnzhYfXBtn66yK04Vtu21gmHIo2EXoaJPkQRYeTKaruMRTApBOgjyKsI8y
 zK8J9pM28E/aNce2FwJqXQ9oNBiW2dZtYE3J6ymrB2mX9EkDJSNauowUJZZwm0eUTkfMnLevjyjHT
 Yao3NmQYGQXgHqGamPGCy618oASZodDRLNGGm5mj2a6GrR5auF4i/jCjUZvna4XbX5zKqzc7oZxqs
 c3yCoE3qn4lc7Cm81L8eipgEHEYdXca3GzuzHgxLeWjghxiol6mbANXfeliUdWOF0RL8mGsDLCqer
 qzf4THyru/9GxzfKTj+q07yjMVXgyAJ6fFDRBtmgQVeAYL0fGy4q7n7UPZZ6wtHiW273PCtcRnxL4
 Wz5CZHLb3ufMdsh07eIMOc/CtZ+X5qafBqI4xYmvkgvOW349Yec59h0Ce0h9CEasAo40ZRGuyZyTH
 7PvzUElZT5J/0I5yFW5Su1Mp0IdC1LGYYPyb7dYrHkSpmeio2fm6Y+ChynMt/qlem+UW5hzoMWj7b
 SiJti+JC4TsWzQgslM/UjCgCUBA5uyS9BaPQ+dkvDbYzqbMHDS14Cj5LGSuj8CPs1EEXPbJ9pLbtq
 dK3dvw5n4/SEdich55L+e+bEV9rH2zryv7eK4JCu0=;
Received: from [2a00:23c4:8ba7:8700:f0a2:2ba9:489e:6915] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oZVvA-000C7q-DP; Sat, 17 Sep 2022 12:23:44 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: laurent@vivier.eu, richard.henderson@linaro.org, lucienmp.qemu@gmail.com,
 qemu-devel@nongnu.org
Date: Sat, 17 Sep 2022 12:25:11 +0100
Message-Id: <20220917112515.83905-1-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba7:8700:f0a2:2ba9:489e:6915
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 0/4] target/m68k: MacOS supervisor/user mode switch fixes
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series fixes a couple of bugs that were discovered when trying to boot
MacOS on my github q800 branch with virtual memory enabled.

Patch 1 renames M68K_FEATURE_M68000 to M68K_FEATURE_M68K in order to clarify
that this feature indicates any Motorola 68K CPU rather than the 68000
specifically [1].

Patch 2 increases the size of the M68K features bitmap since there are already
32 features present, and we need to add one more.

Patch 3 fixes up the MOVE-from-SR instruction which is privileged from the
68010 CPU onwards to use a newly introduced M68K_FEATURE_MOVEFROMSR_PRIV
feature [2].

Patch 4 ensures that we always call gen_exit_tb() after writes to the SR
register since any change of the S bit can change the security context.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Notes:

[1] The m68k code currently contains a mix of real CPU features and pseudo
    features that represent each 680X0 CPU. In general QEMU maps features to
    CPUs which is why I've introduced the new M68K_FEATURE_MOVEFROMSR_PRIV
    feature, but there are still checks for specific 680X0 CPU models. This
    could do with a tidy-up, but without a specific set of test images across
    68K and Coldfire I don't feel I'm confident enough to do this.
    
[2] The existing code in MOVE-from-SR uses !m68k_feature(env, M68K_FEATURE_M68000)
    to suggest that the condition should match for any CPU that isn't a 68000 (i.e.
    68010 and later) but as we see from this series, this is not the case according
    to the code. Some of the Mac 68K folk have suggested there are likely other
    cases in target/m68k where the same assumption has been used and the check
    logic is incorrect, but again without specific examples it's difficult for me to
    test.


Mark Cave-Ayland (4):
  target/m68k: rename M68K_FEATURE_M68000 to M68K_FEATURE_M68K
  target/m68k: increase size of m68k CPU features from uint32_t to
    uint64_t
  target/m68k: use M68K_FEATURE_MOVEFROMSR_PRIV feature for move_from_sr
    privilege check
  target/m68k: always call gen_exit_tb() after writes to SR

 target/m68k/cpu.c       |  11 +++-
 target/m68k/cpu.h       |  13 ++--
 target/m68k/helper.c    |   2 +-
 target/m68k/op_helper.c |   2 +-
 target/m68k/translate.c | 142 +++++++++++++++++++++-------------------
 5 files changed, 91 insertions(+), 79 deletions(-)

-- 
2.30.2



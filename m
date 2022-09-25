Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF3F5E9381
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 15:53:18 +0200 (CEST)
Received: from localhost ([::1]:53134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocS4K-0006S6-Om
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 09:53:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ocRzV-0002VL-D6
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 09:48:17 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:59882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ocRzT-0001F2-BJ
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 09:48:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TXERI+Sbc9W0guODuSPeP3Sr3m4ZJaJiCTh0tutnynw=; b=vWSYuSDumtZ3mivnasMZFI5ulg
 PpjPvEquKoZcAzzur8VZ2hGzxk/dFYt1NVafeOt3WMuw/96/Z05XQ8x1JfN3126vMXF7PmVEYrYFc
 F3hBy3gD3VqvrgIBMKkzVDeNUr4iqRBb4BKZ40x2k9WOjzg66he1hsP0OA8BBVjM/6xvGU73bE7yt
 xoPvft70S2Y/iJCoKkgceGJKMsf7Cfjha3hATE1hAkYsZdMH7oC3CVTCxqj+BxiEh1AalYm3yx/Ta
 534x2tPgfn7tZukJkcMqsFSO1NxZIFtQYtc65iS4HxBeph2vCINLjb+gGCsgExxws7Pc/VMB4qzQ0
 3y+m4Wi65G0MsuBeApmTdqgGt/fSutLi5zRP5Pa9z+AFHsOJMgZitrEGUj7Mqvvi8pzG3+vkdot2l
 EUZGSIUrs2nFKG2uLGrzN2w0rV2u29EL1RljwfABlb6H+3VGved+jathQ0ztTXrzwjm1Pcv5ezlWI
 PztW4B4RF3AxuJykS31vjSS/0kDGUFrHY/ETL4KkF37QHFLlYSLL4H7q8nR2X7EwP+yv3FKPzTbYn
 p8gjzJ5m0ibtQhv8qOm9XSItacLzOzSjK5ZmFK5Yk7MSuDthcPtuQqvO0AEC0p3NNFnNDpsY6lG5u
 z/kueSHE1OjOuh/Cskeig92hU0CfaFMpfVaZzykek=;
Received: from [2a00:23c4:8ba7:8700:f0a2:2ba9:489e:6915] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ocRxi-0008Ik-E0; Sun, 25 Sep 2022 14:46:30 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: laurent@vivier.eu, richard.henderson@linaro.org, lucienmp.qemu@gmail.com,
 qemu-devel@nongnu.org
Date: Sun, 25 Sep 2022 14:48:02 +0100
Message-Id: <20220925134804.139706-1-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba7:8700:f0a2:2ba9:489e:6915
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 0/2] target/m68k: MacOS supervisor/user mode switch fixes -
 part 2
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

Here are the two outstanding patches from
https://lists.gnu.org/archive/html/qemu-devel/2022-09/msg02340.html updated and
rebased onto git master.

Patch 1 is equivalent to patch 2 in the original series but using BIT_ULL() to
set and clear the feature bits, and updating m68k_feature() to return a bool
instead of int.

Patch 2 is the same as the previous patch 3 but with Richard's R-B tag added.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


Mark Cave-Ayland (2):
  target/m68k: increase size of m68k CPU features from uint32_t to
    uint64_t
  target/m68k: use M68K_FEATURE_MOVEFROMSR_PRIV feature for move_from_sr
    privilege check

 target/m68k/cpu.c       | 9 +++++++--
 target/m68k/cpu.h       | 8 +++++---
 target/m68k/translate.c | 2 +-
 3 files changed, 13 insertions(+), 6 deletions(-)

-- 
2.30.2



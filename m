Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 988CB579AC2
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 14:18:39 +0200 (CEST)
Received: from localhost ([::1]:33048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDmBS-0005XW-Ms
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 08:18:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDm4O-0004wl-AB
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 08:11:20 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:44782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDm4J-0001lJ-3Y
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 08:11:19 -0400
Received: by mail-wr1-x42a.google.com with SMTP id bk26so21274585wrb.11
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 05:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u68i7l6LoLPzaJZNvDnI+Rk0ofCSnN4zy3MvwflhHVE=;
 b=AQcs0Im3A+qMjHje+LgeIQD7hcWX1X0VKQs6SBY2RhYGhe3sDZAAYMWU7O7egeuKCf
 0ByMddSf231axMUQqSV5y57Lzufh3vqLOzFK5V180sBquPaxurpK5po5tzofgwyNqvHC
 2Y26m3Mxqf8A7PmaQHadilkM3F0EkvojY8owccctlgGgs0nn0uidNdNsRHVRfxsyh5aH
 lkHigagKqLnwvRvx81dexGl1GvFIeqYzOiw1hZ9k4gE6Y4KM7sfz+TFAVtlIAPuOM7B0
 BXaQYgTfGr0uosYQZTG+P9U4FB6yGxLdCJtvY8gFUmWWf49KCNmeG+T2ovllB93v5ZIB
 JdAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u68i7l6LoLPzaJZNvDnI+Rk0ofCSnN4zy3MvwflhHVE=;
 b=BBiAjiwqhiRnAhYy7YbnECtIgKvb9iE+M2C1z6cFmD1/nPSkq1gCb8FIVKrxFRvOkv
 en3dbTGci0C4x/exW8UgyGz2J4FB39J8B8iPazRtuP+W7+h/8BnZcibAGYPaTCVkLIY3
 N4lQ16wLYyf0ey0/qlm+1QZXWl1lA7Ki+Hcyd6gM1CYqEB3OlQSjsluG90RKaNbh6v0y
 tUbzRlNfN78Yv8KpW44vZUUmO/rRfqxEkzT3d+aut477jcUO68YvqRow5+tB35NT1sZI
 R1mOziFP9F+F+6PgeUHv5JXKE4YiwyX3V5Nai6GAQ/P9PbeTZuUAiPzX3760lngkj8r4
 4Qow==
X-Gm-Message-State: AJIora+138JnNsFGu7xGjvlLBixwlKl8KX21DGgQN0rrOVBHhfLTnpfi
 8Fk0AUMbTUIvRcGTxZkSyxXTb4z5Dlf0GQ==
X-Google-Smtp-Source: AGRyM1vx0W1wrqpz2s6CxIcLS6AmFyllmEZET9oKEuB6y+PXkoKwM983HjOJRO5z7M/fjp2ybSCBMw==
X-Received: by 2002:a5d:44d1:0:b0:21d:7471:2094 with SMTP id
 z17-20020a5d44d1000000b0021d74712094mr26773966wrr.374.1658232673483; 
 Tue, 19 Jul 2022 05:11:13 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 m21-20020a05600c4f5500b0039c5ab7167dsm22111287wmq.48.2022.07.19.05.11.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 05:11:13 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 0/4] semihosting: fix various coverity issues
Date: Tue, 19 Jul 2022 13:11:06 +0100
Message-Id: <20220719121110.225657-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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

This patchset fixes a handful of bugs in the semihosting code
noticed by Coverity.

thanks
-- PMM

Peter Maydell (4):
  semihosting: Don't return negative values on
    qemu_semihosting_console_write() failure
  semihosting: Don't copy buffer after console_write()
  semihosting: Check for errors on SET_ARG()
  semihosting: Fix handling of buffer in TARGET_SYS_TMPNAM

 semihosting/arm-compat-semi.c | 29 ++++++++++++++++++++++++-----
 semihosting/console.c         |  3 ++-
 semihosting/syscalls.c        |  2 +-
 3 files changed, 27 insertions(+), 7 deletions(-)

-- 
2.25.1



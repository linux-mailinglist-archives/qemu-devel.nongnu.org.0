Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A09323144CE
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 01:23:52 +0100 (CET)
Received: from localhost ([::1]:55214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Gop-0003R5-N6
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 19:23:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9G7c-0004ys-FX
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 18:39:12 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:51013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9G7a-0000yU-MV
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 18:39:12 -0500
Received: by mail-pj1-x102c.google.com with SMTP id cl8so514006pjb.0
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 15:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hFhq76rRXOKKoSsjiAYWnkOC+Pvqup3Uh9lSdrYx/Zc=;
 b=qUiO81ZlR+Yj27QE2xhkx48TVhHHjQku+eB7nYKsGD3EOgaZqGu2LiuTdCSDJqDLn7
 RBggK4G2O/2yT+UhwADhNJeYsRocwQt+ox6K+yq6vNXhCVtoee4jk67BE0ENttSQtuH2
 2/DaUhXZZG98qP5cBTITmlvAHd29Y5OzEp1rbpbOWZVvIDzBqsvPlCMPMzS/NCkHbGe9
 nBkw9IF6CemozyxbFTG9ndUE8T4YbteJVvYi0Ivo4/9eYe1xKTbqGdAuUd0So4RVhymk
 3bZKu35T34p6pvPh3ayzMnUJnrozF7LMIkfSPnjmHV1/iwJAd6iYH5yzlG9zarGxVraQ
 iotg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hFhq76rRXOKKoSsjiAYWnkOC+Pvqup3Uh9lSdrYx/Zc=;
 b=f1JczsXlVgN3beSfVKeHAVzatCXue4YXNER8HjVISWULDth15mq1C8acHHHPl+bn+V
 +8eXD6/GvG/ZLKDcsRb+Ibl4u3u7SBdPxTMF4QqdqR8jDekHM9/oFZRsmvrXbis2fayw
 ponk5ZvfxAstTQg8mxY6LIZNhd0FdxUlNQbNW3oct1o6Kmf5nlPk0X3xqpkzudlNarCh
 /KESV2WyR+94T5QFrGOTyE0TzIMPUKGlv0Ux684QJS0nrALkRqpj+2QTrHaiP2U4LiN0
 raqKyvNzS+ldFPaWSz+3ZZXeSYlQmmQnr4XPam2+1uR2O4coH7kr83xNbjU+Wr54tPAV
 DQYw==
X-Gm-Message-State: AOAM531ZBYqyHaCi89lmFX3wXoWlxg4ekXts3rDfMr+M4iqcJYIgSCj8
 rPVsCSvXXrcaOaVzHLM8HhmGIwapy0FLgw==
X-Google-Smtp-Source: ABdhPJziszQH171ugsCvHaKuF9gnl11H8Zz5WPeJdUdLPTh9U4CiW6tgbGDwW/3W+bFGfI2qMi4dow==
X-Received: by 2002:a17:902:e541:b029:df:df4f:2921 with SMTP id
 n1-20020a170902e541b02900dfdf4f2921mr19235255plf.52.1612827548081; 
 Mon, 08 Feb 2021 15:39:08 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id k15sm13483489pgt.35.2021.02.08.15.39.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 15:39:07 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] accel/tcg: Create io_recompile_replay_branch hook
Date: Mon,  8 Feb 2021 15:39:02 -0800
Message-Id: <20210208233906.479571-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
Cc: alex.bennee@linaro.org, cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I noticed this today while Alex and I were discussing cpu_io_recompile.
This cleanup seems much easier now that Claudio has split out TCGCPUOps.

I see that mips has a ReplayKernel test, but sh4 does not, so this
probably has non-zero testing.


r~


Richard Henderson (4):
  exec: Move TranslationBlock typedef to qemu/typedefs.h
  accel/tcg: Create io_recompile_replay_branch hook
  target/mips: Create mips_io_recompile_replay_branch
  target/sh4: Create superh_io_recompile_replay_branch

 include/exec/tb-context.h     |  1 -
 include/hw/core/cpu.h         |  4 +---
 include/hw/core/tcg-cpu-ops.h | 13 +++++++++++--
 include/qemu/typedefs.h       |  1 +
 target/arm/internals.h        |  3 +--
 accel/tcg/translate-all.c     | 31 ++++++++++---------------------
 target/cris/translate.c       |  2 +-
 target/lm32/translate.c       |  2 +-
 target/mips/cpu.c             | 18 ++++++++++++++++++
 target/moxie/translate.c      |  2 +-
 target/sh4/cpu.c              | 18 ++++++++++++++++++
 target/unicore32/translate.c  |  2 +-
 12 files changed, 64 insertions(+), 33 deletions(-)

-- 
2.25.1



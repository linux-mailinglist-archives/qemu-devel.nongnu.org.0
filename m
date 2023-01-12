Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 950CE667A19
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 16:58:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFzws-0003ge-BX; Thu, 12 Jan 2023 10:57:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFzwg-0003ZH-AG
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 10:56:51 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFzwe-0001iB-IF
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 10:56:50 -0500
Received: by mail-wr1-x42c.google.com with SMTP id h16so18521282wrz.12
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 07:56:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3O7m+XSuS9V9zMSD2pT9ThVFkUXdqJeo6fiun1HAiFI=;
 b=b4ogsdW269g98pY44KoXokM4MhemWL2MA+Wziff/l8KFZh1WfU8ZkdKaRyFu7QhIpN
 8Qb25o2GxhPYOEoH/3gi4aaN51paxJ27Cq+gp8v2zXDh/7IhkQCPhEOP8Net8t2D0faI
 lg0OG/aZSfQ8Xx0GKsN7G57QHe1TAgBReh+9WTvRfM6vcBL3YTH9YhhjJChsD9/0XGck
 uGpDkiCvNSxhd9KtQ0IrVSMRITm3vVmXPvYpLsWt873xxkQWEzJhchyYbMN6XsOEYNDm
 Sa9Jls5lq5SKS+g0Dp/JGIzdssHcuCMHr1E5B7nmP7fQb+w62oZhrfg8uJ9EqnLYcd29
 AYjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3O7m+XSuS9V9zMSD2pT9ThVFkUXdqJeo6fiun1HAiFI=;
 b=wIYOBSC/7cfPYALr6gBEHQd+lFUZtglw+hMWd8JUs4Eob/wqe8jBI7ff3b0d56OIS7
 W/qbQIAhOfsJiO1YX6YAgC93/Hf5KSMuZFLwUGtY/lES/xCvogRwdDeTlgX6cdYl2YJm
 2yxkQp+SRaNQt/fpgWq1FGOMTNeyFkoElg0myw7VSboFV8pm8fGyUC+bcZfossnnJVnV
 60X5VvXfdBH2Pstgdl2yvtiFjh5sNRG2l1dNiXOB4DyUxm/NMerhCbV9L3RojsPts3Qu
 M8zzoYlSyGQFHvohme93JluEK0rZS/lsxPZ3IGpOibTG4krnWC74cHlupGXNK/wxj7er
 e95Q==
X-Gm-Message-State: AFqh2kqqeJy9CFKV1RcxU9+pSlWnf6INQetKfxEpzPST3ODQEXaJFYUn
 8yLLWyij9RftAcrngR9i7YeT4dzPbTodcHuF
X-Google-Smtp-Source: AMrXdXu6xkBPyHByYBfMjvjhRk2lWQxUZZgr1i1S5dMPVSjunbp4dNE48ytNiLHd479ygZQ9XuDGMA==
X-Received: by 2002:a05:6000:1185:b0:2bd:d782:c2bc with SMTP id
 g5-20020a056000118500b002bdd782c2bcmr1530514wrx.33.1673539005462; 
 Thu, 12 Jan 2023 07:56:45 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 n1-20020a5d67c1000000b002bc7f64efa3sm9488459wrw.29.2023.01.12.07.56.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 12 Jan 2023 07:56:45 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Anton Johansson <anjo@rev.ng>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH] tests/docker: Install flex in debian-tricore-cross
Date: Thu, 12 Jan 2023 16:56:43 +0100
Message-Id: <20230112155643.7408-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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

When flex is not available, binutils sources default to the
'missing' script, but the current script available is not in
the format expected by the 'configure' script:

  $ ./configure
  ...
  /usr/src/binutils/missing: Unknown `--run' option
  Try `/usr/src/binutils/missing --help' for more information
  configure: WARNING: `missing' script is too old or missing
  ...
  checking for bison... bison -y
  checking for flex... no
  checking for lex... no
  checking for flex... /usr/src/binutils/missing flex

  $ make
  ...
  updating ldgram.h
  gcc -DHAVE_CONFIG_H -I. -I. -I. -D_GNU_SOURCE -I. -I. -I../bfd -I./../bfd -I./../include -I./../intl -I../intl  -w -DLOCALEDIR="\"/usr/local/share/locale\""   -W -Wall -Wstrict-prototypes -Wmissing-prototypes -w -c `test -f 'ldgram.c' || echo './'`ldgram.c
  `test -f ldlex.l || echo './'`ldlex.l
  /bin/sh: 1: ldlex.l: not found
  make[3]: *** [Makefile:662: ldlex.c] Error 127
  make[3]: Leaving directory '/usr/src/binutils/ld'
  make[2]: *** [Makefile:799: all-recursive] Error 1

By pass the 'missing' script use by directly installing 'flex'
in the container.

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
https://gitlab.com/philmd/qemu/-/jobs/3594948730
Duration: 4 minutes 38 seconds
---
 tests/docker/dockerfiles/debian-tricore-cross.docker | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/docker/dockerfiles/debian-tricore-cross.docker b/tests/docker/dockerfiles/debian-tricore-cross.docker
index b573b9ded2..203e096ea3 100644
--- a/tests/docker/dockerfiles/debian-tricore-cross.docker
+++ b/tests/docker/dockerfiles/debian-tricore-cross.docker
@@ -20,6 +20,7 @@ RUN apt update && \
        bzip2 \
        ca-certificates \
        ccache \
+       flex \
        g++ \
        gcc \
        git \
-- 
2.38.1



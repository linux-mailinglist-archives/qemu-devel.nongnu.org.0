Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D936A28A5
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Feb 2023 10:50:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVrB2-0008H3-CJ; Sat, 25 Feb 2023 04:49:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVrB0-0008GV-3D
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:49:10 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVrAy-0000LO-KU
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:49:09 -0500
Received: by mail-wm1-x331.google.com with SMTP id az36so1311430wmb.1
 for <qemu-devel@nongnu.org>; Sat, 25 Feb 2023 01:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=b8L9OTnh3xreCtqcbWd3Ih/45ZnkCXQPEwQU8QejGfw=;
 b=rh8LhRVduURtOBwqpQmP6Gfvo9VFI+hLiSrX+1paccLF0NSFfbrOw4w/QneXUOPwBE
 60xER6sFahHAa3at8+Nl4lunDGGL++9MRG9YLCieIaED/nzNKBAcG8deIVAd7vCdgii2
 3aov8jDUlFCmu7drax28nILmbJuXt7NVi+xUcxuy/kcrlc/YmUhZqMDATgrb4ZKF+v1l
 ihZlstXgAdI4ueFIwCXNj3gs8NFf1/IRVpYUQolYZ1qd5CZtirjDxqO/e+m6oituO++Z
 ij656XDYOPzfZwkdhgkzezAK4al/KwUAjbqPylCTDR9gaXGTSjSYvijX+CvwcH2dX6xj
 KyMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=b8L9OTnh3xreCtqcbWd3Ih/45ZnkCXQPEwQU8QejGfw=;
 b=Mlt3YypAB/sAli+qCBVrPuv1EG15dgn4YZ1jwBZLNKuYkn5/FkrB3S3fJD/EubsB25
 r1uOwWq5fxVkFkqj6q7RC5MGyuHcOXIS3+o5KtsXPlt2ZPGefpqTyBZRi74g8anwH/qa
 hGefxjCZgPM8Jvj5ZOf86XnnN9X68Z2xBfsWKwFKxGZ4VnIlYSwq3RWs1eZtXr+P3iVr
 iI5sesmDsDINWKRY4t6IdmUJklGNVp2arb1mvL2Kow4ixVPiHwVyKVQedZgJbQzSLaG+
 n17yzcVqOekJiFVVr9Wdy6Zsk8UKLu6hTDSPcyninLFrlq/3+d2iNkNcl1tPYUBxy3Ab
 s8mQ==
X-Gm-Message-State: AO0yUKVHgfahSj6O6foLYX+qU8OdK9keSFIamPzRha67tQ5ITyBN72ew
 mG147UWfkL/+Jn7jFO3S0WNHVwgnoClLDMLA
X-Google-Smtp-Source: AK7set897paeq6F5ZFPgjuqNFYVrM66yEIGG7wqbEwMMr4VTxVXFX5JGhdGj/T4BBBSzxHejRC3Hng==
X-Received: by 2002:a05:600c:91d:b0:3eb:2b69:c3c4 with SMTP id
 m29-20020a05600c091d00b003eb2b69c3c4mr3115084wmp.36.1677318546816; 
 Sat, 25 Feb 2023 01:49:06 -0800 (PST)
Received: from localhost.localdomain (120.red-95-127-35.staticip.rima-tde.net.
 [95.127.35.120]) by smtp.gmail.com with ESMTPSA id
 c18-20020adfed92000000b002c54c9bd71fsm1264170wro.93.2023.02.25.01.49.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 25 Feb 2023 01:49:06 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Janosch Frank <frankja@linux.ibm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v6 0/5] dump: Make most of it target agnostic (build once)
Date: Sat, 25 Feb 2023 10:48:58 +0100
Message-Id: <20230225094903.53167-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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

All series reviewed.

Since v5:
- reword one commit description (Thomas)
- drop CONFIG_SOFTMMU, unify softmmu_ss (Richard)

Since v4:
- more unused headers removed
- KISS, use a bit of #ifdef'ry to avoid a stub file

Thanks to Richard help, we can now build dump.o once
for all targets, keeping win_dump.o for x86* targets.

Philippe Mathieu-Daudé (5):
  dump: Replace tswapN() -> cpu_to_dumpN()
  dump: Replace TARGET_PAGE_SIZE -> qemu_target_page_size()
  dump: Clean included headers
  dump: Simplify compiling win_dump.o by introducing
    win_dump_available()
  dump: Add create_win_dump() stub for non-x86 targets

 dump/dump-hmp-cmds.c |  2 +-
 dump/dump.c          | 35 +++++++++++++----------------------
 dump/meson.build     |  6 ++----
 dump/win_dump.c      | 38 ++++++++++++++++++++++++++++----------
 dump/win_dump.h      |  5 ++++-
 5 files changed, 48 insertions(+), 38 deletions(-)

-- 
2.38.1



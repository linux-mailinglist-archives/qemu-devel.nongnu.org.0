Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBF06A13A4
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 00:19:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVKqg-0008UM-Ol; Thu, 23 Feb 2023 18:18:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVKqf-0008UD-7f
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 18:18:01 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVKqd-0000Qe-Nb
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 18:18:00 -0500
Received: by mail-wr1-x42c.google.com with SMTP id l1so11957270wry.10
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 15:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bnHmSs5R8qi8IMdSDP2od753LXXC9F2nCL6gtxjYJ4s=;
 b=Al/7SJeTy31AIC8qXGKeBXhFT1WG0KDiVPNYwxD9a0tIZZPeDd7gtZEtm64Hs0tShG
 LD/vBQQpBsEIHHvvxHg3kw78LtPGsza1iFcZr4h18hMfuC1Tzmt4HuEwFfP7GPWvqzvH
 eyerFOAhpocbWWjFzC+lWHHOY9nObfqYHId5Z730Q/0GGO+ATQdAYJBW3ErxEl/SjtJM
 CV/u3MwRBGRg7Z8DOwS0OrVT8y5HScn5m7mL5eRZEbVwP/IajmYUz43TnKVVL4WNLGxs
 s1aPQguxwPiG6nB4VY83nilQ1IvzUAhmDA+ZsEM0K0X7WZp/m9/fxmKFUZttDAtyDCMK
 IfEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bnHmSs5R8qi8IMdSDP2od753LXXC9F2nCL6gtxjYJ4s=;
 b=OhqwoDiy8tfXLrWAXC0m4mXGe6uINoxyIQrYZFmMyhX4LoHFmdHYCxCK7ydxQMj3J/
 XNK0et1KgFraRBjTkQqylW45tVyeX5S4RcXB62dvx6heKrMDGz29i9dcutxIKWNkvs9O
 Dnv1R+6qQdKSc1EJ84kT9eW7G+0G9BkOls2dvMmdVqaqo0ArIBNU/9b3NiY0SvaxJkeM
 uuz2FQVn1ApSjk/vQrb1MUMWYcyOHpSWNB5jTaevna2M6u/5/tAGeea2ihboBBSsYrRU
 ndomXUXHpz/3lwEJnomFAPsHqaYsPGCS9zes83luHFjafHht9gbE2D+OLxlGjvrrshzV
 QMjw==
X-Gm-Message-State: AO0yUKXIH0TBBZAHkb0Cd29GtjDHif9ywCSyJc88BS1O9mTD+Mo1E8YS
 0qUSnq08JUFAqARFBj8FAZijTF3wuC39nlkK
X-Google-Smtp-Source: AK7set9xnpIFyomGHqiB6qbpQCy2Fqaen/gpSqvfuvLiCaDMF3TiFik2gzGop2inPEGD69pa492GTQ==
X-Received: by 2002:a5d:6112:0:b0:2c5:7c7a:78f5 with SMTP id
 v18-20020a5d6112000000b002c57c7a78f5mr11764281wrt.52.1677194277659; 
 Thu, 23 Feb 2023 15:17:57 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 u11-20020adfdb8b000000b002c54fb024b2sm15213564wri.61.2023.02.23.15.17.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Feb 2023 15:17:57 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Janosch Frank <frankja@linux.ibm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 0/7] dump: Make most of it target agnostic (build once)
Date: Fri, 24 Feb 2023 00:17:48 +0100
Message-Id: <20230223231755.81633-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

Thanks to Richard help, we can now build dump.o once
for all targets, keeping win_dump.o for x86* targets.

Philippe Mathieu-Daudé (7):
  dump: Replace tswapN() -> cpu_to_dumpN()
  dump: Replace TARGET_PAGE_SIZE -> qemu_target_page_size()
  dump: Correct headers included
  dump: Introduce win_dump_available()
  dump: Introduce create_win_dump()
  dump: Build once by adding stubs for non-x86 targets
  dump: Rename x86-specific file as win_dump_x86.c

 dump/dump.c                         | 29 +++++++++++------------------
 dump/meson.build                    |  6 ++++--
 dump/win_dump-stub.c                | 23 +++++++++++++++++++++++
 dump/{win_dump.c => win_dump-x86.c} |  8 +++++++-
 dump/win_dump.h                     |  5 ++++-
 5 files changed, 49 insertions(+), 22 deletions(-)
 create mode 100644 dump/win_dump-stub.c
 rename dump/{win_dump.c => win_dump-x86.c} (99%)

-- 
2.38.1



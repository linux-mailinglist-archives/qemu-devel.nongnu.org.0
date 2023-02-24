Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE046A1B0E
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 12:03:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVVpx-0006VQ-Rf; Fri, 24 Feb 2023 06:02:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVVpw-0006Tc-8W
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 06:02:00 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVVpu-0000mt-GV
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 06:02:00 -0500
Received: by mail-wr1-x42f.google.com with SMTP id h14so4830836wru.4
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 03:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=h6/zwyPog/cwrP7MYrakupor1MRgwzmg07kOdH/EXCk=;
 b=irSl9O4Q4nzBlganWVEJ9f4o/+wjfGPnwxjS10cz3LTsBk9dqPlzYWfi0lHgLu0aYx
 pSzao/RbWAWV7whwamkviHqsBc7zBktndQvnLQpbHZxn44QwYCB9GwHeigLsL9vYD2a8
 hPsONM1gZQBYSW3ugyCRmMjlbUgVhhWQiowW/TSg9EUKrpAaYSgUhFgF5WbcthG8o3bJ
 qXwkG0DiMSnXB8v+5G9bPRW4ZcNT+u6mJBXfjYChfYnTE7SMR2RzDqn9hiC1Fl+90Qya
 TNL8ZZ1LFmRVreNixpNBhPPhZ0lkdF50alygBJszh51BdBEog2AAkMgmKD/UtL+oDSy4
 T/Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=h6/zwyPog/cwrP7MYrakupor1MRgwzmg07kOdH/EXCk=;
 b=AYYYJxLNcDWG23PINZKNYgIza0v4c+oD7IrMrkqBNqXTMw0hKRYYCg/aERsYUEUINA
 At1uXKn+qAlrHIZk+0g8ylw2LJRWOuE+CTQaOV+z4fPEOIWZ1GtQ7opCEBGfR0bVyUsX
 pQksT7RCtydvy+J/rjzbKw71AmDc26GoCKydbstvw/0R0QOu5Q9KWOnCNKh1U9zVd77x
 pDraTvgJMAodGhQcjHHJvp5elu9e3efLyd0+lRYxruKpINQAk+SGxVG/GDpPU7mO4AIr
 W+eTUY1pCLNrwbXYw1AKdNtalfhGMxVCqJAI2gZfbroRAiAnrHi3fC/+w3Y1zDH6Flsx
 hwCA==
X-Gm-Message-State: AO0yUKUymu1I7x+q7I2ySn1jrC1ZoNhhrnFr43s9tOaowgws1BgJIJu9
 qVZpsH81jIaXIgAEqVGfRZvoM07lb1WTD43I
X-Google-Smtp-Source: AK7set/iFTsFjQx9+eiezLuaZ35zaw8wBLq/tC7QbCbQnBOMpbb3OYYBj+oe7HKhFP5AsUJHEOL/mA==
X-Received: by 2002:adf:dd86:0:b0:2c7:e60:a41d with SMTP id
 x6-20020adfdd86000000b002c70e60a41dmr6207913wrl.61.1677236515980; 
 Fri, 24 Feb 2023 03:01:55 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 x8-20020adfdd88000000b002c58ca558b6sm12352466wrl.88.2023.02.24.03.01.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 24 Feb 2023 03:01:55 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 0/2] ui/kbd-state: QAPI'fy QKbdModifier
Date: Fri, 24 Feb 2023 12:01:51 +0100
Message-Id: <20230224110153.8559-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
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

QAPI seems designed to maintain such enums,
so convert QKbdModifier to be QAPI generated.
Besides, this is how QKeyCode is maintained.

Philippe Mathieu-Daudé (2):
  ui/kbd-state: Rename QKbdModifier enum definitions
  ui/kbd-state: QAPI'fy QKbdModifier

 include/ui/kbd-state.h | 16 ----------------
 qapi/ui.json           | 10 ++++++++++
 ui/cocoa.m             |  2 +-
 ui/kbd-state.c         | 14 +++++++-------
 ui/keymaps.c           |  6 +++---
 ui/sdl2-input.c        |  2 +-
 ui/vnc.c               | 16 ++++++++--------
 7 files changed, 30 insertions(+), 36 deletions(-)

-- 
2.38.1



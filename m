Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 394286C13D6
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 14:44:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peFmP-0006VS-Gh; Mon, 20 Mar 2023 09:42:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1peFmN-0006Up-F9
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 09:42:27 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1peFmJ-0001ou-Hi
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 09:42:27 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 az3-20020a05600c600300b003ed2920d585so9198499wmb.2
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 06:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679319741;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sILs22r46Wg0crNJ/Z4XykLGZPrHT32y697ld2keEmA=;
 b=tB6a5/jheCoeECKQBBLeM/ZlgO+LRW4UR0mTDHwX5xGpRQZ3+b3f8iCKnZfJpW0YfF
 8DHS9AzxdKXiohRam78HCzfyCHi0NrOvN78Q4GD12XwrHh1fmDNUVlOQ5Xr/8S5KspND
 JGC5qDm4oEl86zZ7U9gSB1dzlhcXwcGNjaxpGd7RYK9lGOL+bFOBgys4lJJZYKFxABr7
 AoU/T5jANb+3Bz/tlUZ2vu2a/CFsSayE3WicsoRlz6R0MLcijDCLyw1tTTznx1/Xcx72
 6Wv8NGyx/MBKdI3XFumnz6H9HTNcliKXXEE4TECRAa8xwROhBmaiNBbIyojUKJdgwNwe
 Mu0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679319741;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sILs22r46Wg0crNJ/Z4XykLGZPrHT32y697ld2keEmA=;
 b=de0mOlOlwxqbBNphG0/8lDnRsyI8CbRkxzx4Z7me1umHkPTkc6VoG0NnTI/qLMJxe9
 nitbuqxTMbbNlyonNHIGMt4uuCQPdixGEPf1tnsQm7QETK8P6QAatVFTWfeMYFfFYA7x
 s6ViF2Rx86Hpq9qZxp+9iVvfkxus+gswY+i2OrsrWnlJz4JX5hJZDJ4np5JdznV91bg7
 GsEe2b3+0A2APnBK11xywU91FSZwcy6AVOdZJsRSbulop7h9mnkL7i0juelikFddcW7Q
 UZ9+6DnuCVRuSrUGD4YACjaG61OTIC6BxOvToyEp5Imn+cvYljdt/ClFjPXaw9a6A4Y1
 uYSQ==
X-Gm-Message-State: AO0yUKXAxGOArBftSVUmqw6fZhEQsDIukNX967PnhDxzzcGOhOP76CwK
 0GJ5Q2t1Lol4na83W4EJSmgwOYlh2yI2cljNCYlDQg==
X-Google-Smtp-Source: AK7set+iSH8lUmxCX4jFuDUPvP13VIOFDN/tzJgkiKf6Ksm78PEqzyd4r0ZGBb2JKn+HBl9gGbhlxA==
X-Received: by 2002:a05:600c:3492:b0:3ed:de03:7f0a with SMTP id
 a18-20020a05600c349200b003edde037f0amr3907492wmq.10.1679319741673; 
 Mon, 20 Mar 2023 06:42:21 -0700 (PDT)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 16-20020a05600c025000b003ed1ff06faasm10524249wmj.19.2023.03.20.06.42.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Mar 2023 06:42:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-8.1 0/5] bulk: Do not declare function prototypes using
 'extern' keyword
Date: Mon, 20 Mar 2023 14:42:14 +0100
Message-Id: <20230320134219.22489-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

- Remove the 'extern' keyword on function prototypes declared
  in header.
- Replace __attribute__((noreturn)) -> G_NORETURN
- Trivial cleanups to keep the previous commits generic.

TODO: Add a rule in scripts/checkpatch.pl :)

Based-on: <20230320131426.16348-1-philmd@linaro.org>

Philippe Mathieu-Daudé (5):
  qemu/osdep.h: Do not declare function prototypes using extern keyword
  block/dmg: Remove duplicated prototype declarations
  qemu/uri: Use QueryParams type definition
  bulk: Do not declare function prototypes using extern keyword
  bulk: Replace __attribute__((noreturn)) -> G_NORETURN

 block/dmg.h                    |  8 +++----
 bsd-user/bsd-file.h            |  6 ++---
 crypto/hmacpriv.h              | 13 +++++------
 hw/xen/xen_pt.h                |  8 +++----
 include/crypto/secret_common.h | 14 +++++-------
 include/exec/page-vary.h       |  4 ++--
 include/hw/misc/aspeed_scu.h   |  2 +-
 include/hw/nvram/npcm7xx_otp.h |  4 ++--
 include/hw/qdev-core.h         |  4 ++--
 include/qemu/crc-ccitt.h       |  4 ++--
 include/qemu/osdep.h           |  4 ++--
 include/qemu/rcu.h             | 14 ++++++------
 include/qemu/sys_membarrier.h  |  4 ++--
 include/qemu/uri.h             |  6 ++---
 include/sysemu/accel-blocker.h | 14 ++++++------
 include/sysemu/os-win32.h      |  4 ++--
 include/user/safe-syscall.h    |  4 ++--
 target/i386/sev.h              |  6 ++---
 target/mips/cpu.h              |  4 ++--
 tcg/tcg-internal.h             |  4 ++--
 tests/tcg/minilib/minilib.h    |  2 +-
 include/exec/memory_ldst.h.inc | 42 +++++++++++++++++-----------------
 block/dmg.c                    |  6 -----
 tests/migration/stress.c       |  2 +-
 roms/seabios                   |  2 +-
 25 files changed, 86 insertions(+), 99 deletions(-)

-- 
2.38.1



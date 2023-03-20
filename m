Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D442C6C0E57
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 11:11:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peCTf-0003oR-5I; Mon, 20 Mar 2023 06:10:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1peCTT-0003kz-AI
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 06:10:44 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1peCTP-0000CN-Hz
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 06:10:41 -0400
Received: by mail-wr1-x433.google.com with SMTP id m2so9752817wrh.6
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 03:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679307036;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=l59c9lso4K7bEwKaiD8KQ/Ithn+PwV5VTKVOr0L+32M=;
 b=Zr6lfSrHzsuVrKHM9eDmnF1LQUv28uYmvlhr/K8EQmyNt1XdRbKu2izyq1tKXGiaEA
 u1I69m39BhPHxnJAbQdm1ZMv9DMAWx4ysYPcfbS/X4okMTcF9+J0eRBOEWAuTwgjV7Ku
 rZOvKlOZ9p6T46RZWGJpEU9M0AlEkoeksqSxDZrrkyS7mP/nv1P3zx0KtN8SExH20mog
 behU9AKQkTdy9GAM0WNVQxQA06dvuNjDnp5CRwAzYTSq4esL3SRXWCx82necdJB+yI0n
 lyaxRrB643JjEsGKYY6ByMCd4dotK9DExJcio8LWnZNLpGAgWkHmx21HZeOekNup9/5z
 kbVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679307036;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l59c9lso4K7bEwKaiD8KQ/Ithn+PwV5VTKVOr0L+32M=;
 b=5beOft88by3OJFyHQHUkCVs9W92faDODkc6nAiXif7ZoQ2+bwg0PGisHqhcs52W50o
 aRQG+P26lNN0SCjfAXjbf+sVHiLrG69Nih8PdNexpa0UVNqAGwemwcON7GIWYQ9zIUyT
 sY9s9iiBMz9s21JI892LSIhBc5j7W9W/xTrFt7fU5XzezOech9uOqh1httpUWej1hFZE
 c3RFUbtUAsvz2/KgJnS46x2dfHgctWblt7ptnLBo1bZVXeZPMImpFanZ+mH6XklhtsMz
 9tCrCrb8R+j/S1OtJ9KyxdgBRh39O13FZxFi1MJRKuygeZVdozj+Uhjf3Z35AQVnBwOp
 xttA==
X-Gm-Message-State: AO0yUKV/1M6LofZvCcd32t80lcpDGxFidtUxApqtoN7pS0AT6exgMFB2
 lLDjubstopvg6Q57CEgeE63l5Q==
X-Google-Smtp-Source: AK7set8+PoNFQWM9wZslHZm1lH9fzbPgsV+mzgvR4M7QKjUcUjSGvGJVWLn5sswAS3xmX/ZRRcowXA==
X-Received: by 2002:a5d:4ecc:0:b0:2d0:c73d:ef2a with SMTP id
 s12-20020a5d4ecc000000b002d0c73def2amr12100538wrv.24.1679307036576; 
 Mon, 20 Mar 2023 03:10:36 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 h10-20020adffa8a000000b002ce3d3d17e5sm8589260wrr.79.2023.03.20.03.10.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 03:10:36 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CEB751FFB7;
 Mon, 20 Mar 2023 10:10:35 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Alessandro Di Federico <ale@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 00/10] accel/tcg: refactor the cpu-exec loop
Date: Mon, 20 Mar 2023 10:10:25 +0000
Message-Id: <20230320101035.2214196-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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

This is an RFC for something I was playing with over the weekend to
try and reduce target specific details polluting cpu-exec. In the end
it does get rid of TARGET_I386 #ifdef'ery but I couldn't go further to
just building one version of cpu-exec-user and cpu-exec-softmmu
because there are still per target differences.

Anyway what do people think?

Alex Bennée (10):
  metadata: add .git-blame-ignore-revs
  accel/tcg: move cpu_reloading_memory_map into cpu-exec-softmmu
  accel/tcg: move i386 halt handling to sysemu_ops
  accel/tcg: don't bother with ifdef for CPU_DUMP_CCOP
  accel/tcg: remove the fake_user_interrupt guards
  includes: move irq definitions out of cpu-all.h
  accel/tcg: use QEMU_IOTHREAD_LOCK_GUARD to cover the exit
  accel/tcg: push i386 specific hacks into handle_cpu_interrupt callback
  accel/tcg: re-inline the filtering of virtual IRQs but data driven
  accel/tcg: remove unused includes

 include/exec/cpu-all.h           |  52 +--------------
 include/exec/cpu-irq.h           |  83 +++++++++++++++++++++++
 include/exec/poison.h            |  13 ----
 include/hw/core/sysemu-cpu-ops.h |  16 +++++
 include/hw/core/tcg-cpu-ops.h    |   7 +-
 target/i386/cpu-internal.h       |   2 +
 accel/tcg/cpu-exec-common.c      |  30 ---------
 accel/tcg/cpu-exec-softmmu.c     |  66 +++++++++++++++++++
 accel/tcg/cpu-exec.c             | 109 ++++++++++---------------------
 target/i386/cpu-sysemu.c         |  29 ++++++++
 target/i386/cpu.c                |   2 +
 target/i386/tcg/tcg-cpu.c        |   1 +
 .git-blame-ignore-revs           |  18 +++++
 accel/tcg/meson.build            |  10 +++
 14 files changed, 267 insertions(+), 171 deletions(-)
 create mode 100644 include/exec/cpu-irq.h
 create mode 100644 accel/tcg/cpu-exec-softmmu.c
 create mode 100644 .git-blame-ignore-revs

-- 
2.39.2



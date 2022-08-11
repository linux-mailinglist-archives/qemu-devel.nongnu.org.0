Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DFEF58FF3F
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 17:24:38 +0200 (CEST)
Received: from localhost ([::1]:55914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMA33-0003kM-Js
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 11:24:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oM9tJ-0005Bf-PN
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 11:14:37 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:39660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oM9t3-0005fl-FJ
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 11:14:32 -0400
Received: by mail-wr1-x42c.google.com with SMTP id h13so21718597wrf.6
 for <qemu-devel@nongnu.org>; Thu, 11 Aug 2022 08:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=pLiGjpmcY4FUKI2LKUSnnb/ge8pYbtK6HQOeHisM1Dw=;
 b=mym+Kvn0JssYO4OwKXMv+XxwcXnTiROrrf0KOYj07TqyXoTMHTll9gSAbC0UF/fT9U
 0XqWZ/0ie7/fGTx0kpM3/TvaWc1FmtGMcjQJa9xJBgeVzllyGf8sB+XiP6yjPocJVtfS
 Fuox+FHR7blRJnzHEFgTrfyhJKWaRDwIXAknO5GF2fKxaXU6Pb50Ee3EXmbvuao7A/AT
 M+Z7IYxxTobaLujlHxoaDct1J9vBge4xoiBbGcBSt9ppeXO/E8QriGZyIHzfWnbA5Iov
 YQqG9inaFnnN38L6wuaJZgCBhBTlPULLvgQciUWco/lQpJsBIsfJunbTpBpZgycB5/lQ
 8eUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=pLiGjpmcY4FUKI2LKUSnnb/ge8pYbtK6HQOeHisM1Dw=;
 b=RVn3mK3MzKL0fPfIGtvPsJtzov87R1EfIS331YxMuRH0bCPSO8klsy9EamuwL9fFzq
 y+cHksbTLBfvATi3rLkhAh6A/UAQ0HOlJWl3w9of76c3mT+OkOKOl1zBziecIOs85UFt
 8mYjel3ZmH5Pjx8s6bR/2BioGDFE/UZzqR+yGZkiKIBIpd5n+JrO07jFj936xmF/eLIa
 DtsPN4IiftoWIqqg/4La3mbF7Zj3XtIEGxnbxJmdEzRkHpc/4nHmLqgRmuYR6vHHzEOw
 fFra4f/7rZQbnhAqVXwd76LC2fm9FTHFfGXwy+lIb72I4l9Xqn21wRR2HeuqvnGlyCD5
 jkiw==
X-Gm-Message-State: ACgBeo2DJHI0mJGlGE6yIaWWOnK+qNq1SuFbl3e/QQnwKTl4CQ0aBU2R
 Hli+uRKW5pGggrPVpzYh2+IHkA==
X-Google-Smtp-Source: AA6agR7TZceDzDkCkmQdysETFa9depSpZjjI3JBkH+LP+cWC7dXVvZsrQG1+VyXZEL10iM/oNvKHUw==
X-Received: by 2002:a5d:5a8d:0:b0:21d:6d69:ca03 with SMTP id
 bp13-20020a5d5a8d000000b0021d6d69ca03mr20106736wrb.135.1660230855268; 
 Thu, 11 Aug 2022 08:14:15 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 b2-20020adff242000000b002238a1f6b74sm2627088wrp.37.2022.08.11.08.14.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Aug 2022 08:14:13 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4F8E31FFB7;
 Thu, 11 Aug 2022 16:14:13 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH for 7.1 v1 0/8] memory leaks and speed tweaks
Date: Thu, 11 Aug 2022 16:14:05 +0100
Message-Id: <20220811151413.3350684-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hi,

I've been collecting a number of small fixes since the tree was
frozen. I've been mostly focusing on improving the reliability of the
avocado tests and seeing if there are any low hanging fruit for
improving the performance.

The linux-user patch is a v2 fixing the obvious de-reference I missed
in v1 and prevents a memory leak in highly threaded code. Laurent may
want to cherry-pick himself if he wants to re-run the LTP tests before
merging although I hand ran the ones he mentioned failing and they all
work (for me at least ;-).

The CPUClass caching patches are a clean-up from my earlier hacky RFC
and shave a bit more time of the execution of particularly heavy IO
executions. The same is true of the SSI fixes.

The avocado fixes are band-aids over a wider issue which is we
currently can't cleanly wait for prompts that don't end in a newline.
However they should improve the situation of stuck tests a bit.

Finally the trace_dstate fix is some left over work from the TCG based
tracing that was pulled earlier this year. There is still the question
of what to do about per-vcpu trace points but they are all currently
called direct from C code so don't concern an TCG code.

I'm still going through the > 30s avocado tests on an --enable-debug
build. The two behemoths (BootLinuxAarch64.test_virt_tcg_gicv2/3)
should be ameliorated by better TB invalidation which rth is currently
cooking up patches for. I've still got to profile
BootLinuxS390X.test_s390_ccw_virtio_tcg,
ReplayKernelNormal.test_x86_64_pc, BootLinuxConsole.test_ppc_powernv8
and BootLinuxConsole.test_ppc_powernv9 which are kings of the
check-avocado time hill to see if there is anything obvious there.

The following patches still need review:

 - accel/tcg: remove trace_vcpu_dstate TB checking
 - tests/avocado: add timeout to the aspeed tests
 - ssi: cache SSIPeripheralClass to avoid GET_CLASS()
 - cputlb: used cached CPUClass in our hot-paths
 - hw/core/cpu-sysemu: used cached class in cpu_asidx_from_attrs
 - cpu: cache CPUClass in CPUState for hot code paths
   
Alex Bennée (8):
  linux-user: un-parent OBJECT(cpu) when closing thread
  cpu: cache CPUClass in CPUState for hot code paths
  hw/core/cpu-sysemu: used cached class in cpu_asidx_from_attrs
  cputlb: used cached CPUClass in our hot-paths
  ssi: cache SSIPeripheralClass to avoid GET_CLASS()
  tests/avocado: add timeout to the aspeed tests
  tests/avocado: apply a band aid to aspeed-evb login
  accel/tcg: remove trace_vcpu_dstate TB checking

 accel/tcg/tb-hash.h             |  6 +++---
 include/exec/exec-all.h         |  3 ---
 include/hw/core/cpu.h           |  9 +++++++++
 include/hw/ssi/ssi.h            |  3 +++
 accel/tcg/cpu-exec.c            |  6 +-----
 accel/tcg/cputlb.c              | 15 ++++++---------
 accel/tcg/translate-all.c       | 13 ++-----------
 cpu.c                           |  9 ++++-----
 hw/core/cpu-sysemu.c            |  5 ++---
 hw/ssi/ssi.c                    | 18 ++++++++----------
 linux-user/syscall.c            | 13 +++++++------
 tests/avocado/machine_aspeed.py |  4 ++++
 12 files changed, 49 insertions(+), 55 deletions(-)

-- 
2.30.2



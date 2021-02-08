Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FA9313CE1
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 19:13:31 +0100 (CET)
Received: from localhost ([::1]:40356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9B2Q-0005wh-Bn
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 13:13:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l94om-0003zg-3t
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 06:35:04 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:36687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l94oM-0003t8-9s
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 06:34:58 -0500
Received: by mail-wm1-x333.google.com with SMTP id i9so12914587wmq.1
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 03:34:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CHdKYbfqw8tBUMjEoa6fcai93fEo3YHu7NQBB8/0DzU=;
 b=qJfwMtA5KTr+aIG3EjYPWGILv1xRJfukFKj5IgN2MbG2Lv6SeXe3lhPYs+wzQWHjl+
 SOJWJsfM0XkQhBFhETKQsOkEcTsLLiH8aotP9kbTGWeKeROfzxQeayCQN8ul85NBWV23
 hXD/yAGIBVSHkdnxl/SlwszzKHx7e5li1j3MVUIrOYINAbwV1LAOuWYq/8aFELsT1S9y
 Kkv30i8NK33vUZ8jdqnEMs7RLTvsFKUtZDhfAguBUPhe9+QHe5cHqalubTBM78gN1n/a
 gT4nMEUcuk05DXlg8S/69zj3UTfLRcJHdaVxsqqZAXtnmFDYrfyaDs/NUOLNC4HK22up
 QW3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CHdKYbfqw8tBUMjEoa6fcai93fEo3YHu7NQBB8/0DzU=;
 b=CDfz9BeBXAgXQe+ENt4TZl3dFOZlvR2NQUt6th7mY5q4PTvZwYPcimJ+Ip/fN3RC0+
 rzTExIzK2uHtDW0bWMj1qKvcbgG8+jg1l4uPb2AzS5vh2WX3aoZVMx0A4NB325P+Ltz8
 avNIsaQS6qwYCYK+L2H5tfgJsykt9TJ8iY99a1DW4S7InLeCqhbokUR15/uBfRhsKATP
 O/oTmXrlu4oHZNleXplvzCKhi7p9Rfl5ulC2unoCPOC9olg+FSAPIQxzcoqB5TgCLAgA
 YYnwsDVlzEavVoSnzHdKuF3dtuMLBylde82Y1D80VYZCtQjrnzqFyIaHjRnQfZas+rMG
 qqSA==
X-Gm-Message-State: AOAM532fow53W/mbZOt74Q32Bdpsw5RbhonRHun+gIz46LKJ937ZdaFX
 gEw1xVdH4zqv42VagHsGz717vqm+GClb6A==
X-Google-Smtp-Source: ABdhPJwK+GVV+dtJQhEll3sxvel7rx8cng2+uQ1EKJQK4VFq0lDbWOTkll1iHywr+/zCHiVypRqg7A==
X-Received: by 2002:a1c:2ed4:: with SMTP id u203mr14351566wmu.45.1612784071621; 
 Mon, 08 Feb 2021 03:34:31 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a21sm16818134wmb.5.2021.02.08.03.34.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 03:34:31 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/5] Drop float32/float64 accessors used by gdbstub code
Date: Mon,  8 Feb 2021 11:34:23 +0000
Message-Id: <20210208113428.7181-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We used to make a distinction between 'float64'/'float32' types and
the 'uint64_t'/'uint32_t' types, requiring special conversion
operations to go between them.  We've now dropped this distinction as
unnecessary, and the 'float*' types remain primarily for
documentation purposes when used in places like the function
prototypes of TCG helper functions.

This means that there's no need for special gdb_get_float64() and
gdb_get_float32() functions to write float64 or float32 values to the
GDB protocol buffer; we can just use gdb_get_reg64() and
gdb_get_reg32().

Similarly, for reading a value out of the GDB buffer into a float64
or float32 we can use ldq_p() or ldl_p() and need not use ldfq_p()
or ldfl_p().

This patchseries drops the use of the gdb_get_float* and ldf*
functions from the three targets that were using them, and then
removes the now-unused functions from gdbstub.h and bswap.h.

thanks
-- PMM

Peter Maydell (5):
  target/sh4: Drop use of gdb_get_float32() and ldfl_p()
  target/m68k: Drop use of gdb_get_float64() and ldfq_p()
  target/ppc: Drop use of gdb_get_float64() and ldfq_p()
  gdbstub: Remove unused gdb_get_float32() and gdb_get_float64()
  bswap.h: Remove unused float-access functions

 docs/devel/loads-stores.rst     | 14 +++-----
 include/exec/cpu-all.h          |  8 -----
 include/exec/gdbstub.h          | 20 -----------
 include/qemu/bswap.h            | 60 ---------------------------------
 target/m68k/helper.c            |  5 ++-
 target/ppc/gdbstub.c            |  8 ++---
 target/sh4/gdbstub.c            |  8 ++---
 target/ppc/translate_init.c.inc |  4 +--
 8 files changed, 17 insertions(+), 110 deletions(-)

-- 
2.20.1



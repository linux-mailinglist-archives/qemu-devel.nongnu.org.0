Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F25C5480EF0
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Dec 2021 03:36:05 +0100 (CET)
Received: from localhost ([::1]:58036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2Oou-00056A-74
	for lists+qemu-devel@lfdr.de; Tue, 28 Dec 2021 21:36:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n2Omp-0002gr-TE
 for qemu-devel@nongnu.org; Tue, 28 Dec 2021 21:33:55 -0500
Received: from [2607:f8b0:4864:20::1032] (port=38762
 helo=mail-pj1-x1032.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n2Omn-0004Y4-PP
 for qemu-devel@nongnu.org; Tue, 28 Dec 2021 21:33:55 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 l10-20020a17090a384a00b001b22190e075so17990808pjf.3
 for <qemu-devel@nongnu.org>; Tue, 28 Dec 2021 18:33:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lnMaw/HNnyt1pXZ4wN7VWyHxV57NRSbuiZnc1O1zyUo=;
 b=B2tAXli1W+GTiblsuZ4NiPE/GLk2DeGrC/8Igm7onr8ukuxGbXLzfk1AiMpIaAbDue
 BrAFCyfigfAHkHus1DO+JK2ubLHoiEuUAD9ra9If2gxJ/FmxBwPVvs/zxTjjOJXgWWtR
 WoFd84Z9OrZvxd2yTqFb7kRFCagA0BpPAA9WQR/gCU/0fCSSJQWK+SB4qfX1aONuMye5
 Lu/l+6efeC6Cyi0CkLz+kuRWJm4gC1fgLE4Kx5JkrUUW7apRu3PgQo2hKu08K9NJ5PHa
 AsmLEd1giGOJeT3XsrnJSz8ltQG5iKaanJstjwzRNnFSufyygTEcKvHfPWsLWHIm6Uer
 bXpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lnMaw/HNnyt1pXZ4wN7VWyHxV57NRSbuiZnc1O1zyUo=;
 b=2W1wZV5YlAsnad4t+aOT06kJpmXtr57Bti8xXxlLyIc//LqNoQBrp4RYf/Wpnz0/Eu
 YgwqDmdGo4TBrjYBGDWtyXmx8NhMLLA8NoxCwCunjIvMJYnz4NxfF66XUCq9G0mMpoBa
 o3PJ2JLqtTTButYjQo2QjRGLQbRoPsdkfwvm7YqyrspysjIeCRxKF10vWmopabOi+v60
 Z0YWaHjgMFecM8Nt5o7cYdIbQYlHE/lc/oKudYFWy0x9MSbSQWGKYiUO8l9DyczXmB3j
 4ZpHWVRf9wIETwgHcRDnq4d+1ACcsrK6vo4GFCdDLruurWeU9PYJ4FUR57blZzPHSBHz
 4i8w==
X-Gm-Message-State: AOAM533IBuv9sUrVEbvl8AIIgN6PN96EWfsX5j8NOHRJh4/qXdTDP4XU
 x4POpSj8VLtJ6JX68xYCl0jZqo7Qc4qYpJwx
X-Google-Smtp-Source: ABdhPJwJkhCK9Lj0D75uRwnPWpYO6x0Q1RA1gc64GMo6hiyH7WR0BKRdqZBLHl7jua702fe6Z2Xy5A==
X-Received: by 2002:a17:90b:3850:: with SMTP id
 nl16mr29569608pjb.18.1640745232219; 
 Tue, 28 Dec 2021 18:33:52 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id m3sm22613635pjz.10.2021.12.28.18.33.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 18:33:51 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH 00/17] Add RISC-V RVV Zve32f and Zve64f extensions
Date: Wed, 29 Dec 2021 10:33:27 +0800
Message-Id: <20211229023348.12606-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1032
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Frank Chang <frank.chang@sifive.com>, qemu-riscv@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

In RVV v1.0 spec, several Zve* vector extensions for embedded processors
are defined in Chapter 18.2:
https://github.com/riscv/riscv-v-spec/blob/v1.0/v-spec.adoc#zve-vector-extensions-for-embedded-processors

This patchset implements Zve32f and Zve64f extensions.

The port is available at:
https://github.com/sifive/qemu/tree/rvv-zve32f-zve64f-upstream

Zve32f can be enabled with -cpu option: Zve32f=true and
Zve64f can be enabled with -cpu option: Zve64f=true.
V is not required to be enabled explicitly.

Quote from the inclusion diagram for the six standard vector extensions
from Nick Knight <nick.knight@sifive.com>:

      V
      |
    Zve64d
      |
    Zve64f
   /      \
Zve64x   Zve32f
   \      /
    Zve32x

Note: This patchset depends on other patchsets listed in Based-on
      section below so it is not able to be built unless those patchsets
      are applied.

Based-on: <20211229021250.29804-1-frank.chang@sifive.com>

Frank Chang (17):
  target/riscv: rvv-1.0: Add Zve64f extension into RISC-V
  target/riscv: rvv-1.0: Add Zve64f support for configuration insns
  target/riscv: rvv-1.0: Add Zve64f support for load and store insns
  target/riscv: rvv-1.0: Add Zve64f support for vmulh variant insns
  target/riscv: rvv-1.0: Add Zve64f support for vsmul.vv and vsmul.vx
    insns
  target/riscv: rvv-1.0: Add Zve64f support for scalar fp insns
  target/riscv: rvv-1.0: Add Zve64f support for single-width fp
    reduction insns
  target/riscv: rvv-1.0: Add Zve64f support for widening type-convert
    insns
  target/riscv: rvv-1.0: Add Zve64f support for narrowing type-convert
    insns
  target/riscv: rvv-1.0: Allow Zve64f extension to be turned on
  target/riscv: rvv-1.0: Add Zve32f extension into RISC-V
  target/riscv: rvv-1.0: Add Zve32f support for configuration insns
  target/riscv: rvv-1.0: Add Zve32f support for scalar fp insns
  target/riscv: rvv-1.0: Add Zve32f support for single-width fp
    reduction insns
  target/riscv: rvv-1.0: Add Zve32f support for widening type-convert
    insns
  target/riscv: rvv-1.0: Add Zve32f support for narrowing type-convert
    insns
  target/riscv: rvv-1.0: Allow Zve32f extension to be turned on

 target/riscv/cpu.c                      |   6 +
 target/riscv/cpu.h                      |   2 +
 target/riscv/cpu_helper.c               |   5 +-
 target/riscv/csr.c                      |   6 +-
 target/riscv/insn_trans/trans_rvv.c.inc | 217 ++++++++++++++++++++----
 target/riscv/translate.c                |   4 +
 6 files changed, 203 insertions(+), 37 deletions(-)

--
2.31.1



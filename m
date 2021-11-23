Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F11D459E90
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 09:51:56 +0100 (CET)
Received: from localhost ([::1]:45742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpRWt-0003k3-Bk
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 03:51:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mpRVc-0002Je-Ma
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 03:50:36 -0500
Received: from [2a00:1450:4864:20::436] (port=42767
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mpRVa-00038q-Ta
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 03:50:36 -0500
Received: by mail-wr1-x436.google.com with SMTP id c4so37550811wrd.9
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 00:50:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oMr7AYt4LetBnyOf3j4TuVSHilzO0B7NfvIIzGR7qoE=;
 b=tuaPtnYgs0CrsEBuKuXKyiXX2pI1uKpyLV5jkirQCBj6VcVvRFa/VP4JI6JKEA5vvS
 3Kh/gzCyPkECyqmQokeSrUCBO9xzc8MLimVzb5GUlhx3tGuUj2Fms2Z09XmMHZQyMxFs
 B1FehkRshA471BOzs0/EPHn8yuHZqBh1XyIo05Ty30iF9xzf3bc6jys3Wo03x8LMkKwi
 zmspJIDf6xE8z9+01lJiXHcj38gWyJkyMxbA9piEwr+nVpXTCRBEf9ccvMr3E/ACI9RI
 5QgZS5t6jSDi1VVdrdIoFwoXpCdwCEibDjCVUBPMEfPd/6q6LaV3ciPS1byUt2cGWFed
 KRQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oMr7AYt4LetBnyOf3j4TuVSHilzO0B7NfvIIzGR7qoE=;
 b=Hb71oXf3SlDbiNAn3ltRHs+o1IhgGOZcVLi83gK+ncxjImnoJ0VUknq/3cg2AqpZ+7
 Vz4gv+9N+z9BQA47NLeMc2h1aeeYXd4A31ZaDG/w0fB8lUAdkuWgdMcdcP/fGiPt8Hvj
 bawQTF0bGlINAu4YL9Hb5eELbJpkkBhmsf2zVszGewl7dccbo5VaS4iDqc7ZcLj/xoy0
 h3xpzd6+ipmP5f7dLLPbVM2n1arnZa+QbQROm0ZMK6ibMNU1oyYlyoYeHwrzqzFrBA75
 CVugI8jXM/6MdaZGXGpLFsfOfrtrLNL6XDi1ITziJUKmowyVd+yiC339KthjvOW+BwIn
 lmMw==
X-Gm-Message-State: AOAM5310s6hxCFBWpvHyzGaDSS0YDL0u+PsvOF6zgkum43NNMVpoT1I0
 Zx8hMqINGSAjZI38PZ2ojq5yKxm4cCEzQbTSbgM=
X-Google-Smtp-Source: ABdhPJxEESpafXGErRCf8rdjkVYT2vZdz96tKsIGh/KvSXwDHn6Mxu+WCA++pQSH8wgDV3NYAMAN6g==
X-Received: by 2002:a5d:400e:: with SMTP id n14mr5026769wrp.368.1637657433056; 
 Tue, 23 Nov 2021 00:50:33 -0800 (PST)
Received: from cloudburst.home (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id 9sm14366078wry.0.2021.11.23.00.50.31
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 00:50:32 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 0/2] linux-user: Create a common rewind_if_in_safe_syscall
Date: Tue, 23 Nov 2021 09:50:28 +0100
Message-Id: <20211123085030.465072-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

The following changes since commit 6d9c9603ad2ffdbf2aae3f01955c17591287cb4c:

  Merge tag 'pull-target-arm-20211122-1' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2021-11-23 01:41:05 +0100)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-lu-20211123

for you to fetch changes up to 07637888687bfecf3c0cc8351c5c24f29a611691:

  linux-user/signal.c: Create a common rewind_if_in_safe_syscall (2021-11-23 01:47:20 +0100)

----------------------------------------------------------------
Create common rewind_if_in_safe_syscall function.
Resolves pointer type issues with uc_mcontext.pc
on aarch64 between glibc and musl.

----------------------------------------------------------------
Warner Losh (2):
      linux-user: Add host_signal_set_pc to set pc in mcontext
      linux-user/signal.c: Create a common rewind_if_in_safe_syscall

 linux-user/host/aarch64/host-signal.h |  5 +++++
 linux-user/host/aarch64/hostdep.h     | 20 --------------------
 linux-user/host/alpha/host-signal.h   |  5 +++++
 linux-user/host/arm/host-signal.h     |  5 +++++
 linux-user/host/arm/hostdep.h         | 20 --------------------
 linux-user/host/i386/host-signal.h    |  5 +++++
 linux-user/host/i386/hostdep.h        | 20 --------------------
 linux-user/host/mips/host-signal.h    |  5 +++++
 linux-user/host/ppc/host-signal.h     |  5 +++++
 linux-user/host/ppc64/hostdep.h       | 20 --------------------
 linux-user/host/riscv/host-signal.h   |  5 +++++
 linux-user/host/riscv/hostdep.h       | 20 --------------------
 linux-user/host/s390/host-signal.h    |  5 +++++
 linux-user/host/s390x/hostdep.h       | 20 --------------------
 linux-user/host/sparc/host-signal.h   |  9 +++++++++
 linux-user/host/x86_64/host-signal.h  |  5 +++++
 linux-user/host/x86_64/hostdep.h      | 20 --------------------
 linux-user/safe-syscall.h             |  3 +++
 linux-user/signal.c                   | 15 ++++++++++++---
 19 files changed, 69 insertions(+), 143 deletions(-)


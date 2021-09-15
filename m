Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEBA940CBF4
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 19:52:00 +0200 (CEST)
Received: from localhost ([::1]:38956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQZ4g-0002Yz-Kk
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 13:51:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQZ2i-0000tk-EJ
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 13:49:56 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:41633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQZ2g-00037M-Qr
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 13:49:56 -0400
Received: by mail-pl1-x634.google.com with SMTP id v2so2096595plp.8
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 10:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bcayDksC/Oq9jBwFrtjuESC91JhSZUwPZau7KUsWGbg=;
 b=dsLawO+Z/dWd9HNw51fZtkWuMpHnjx9m5y9aUORsrQqKIR4WZr9JOGNifsXuputiqX
 0uLTRUnUC/SEYnq0eW60rhPpv0GGJJCd1J9niZ+STNYNCIDTj6Gqc29WvVGR5ls226Ds
 0GhGiqzWOoKvHGK4DWuPXglNXp57/EWXPajwD23fBYHI5nESOEYpiXxGSBK90W4vrVEO
 a287+M7cav/5K7VLsJCVbpCjvicpm8rUKG1SiptfiP/7zo20oMxGpLjyTxhbwHtRVO5J
 2xEI0yd+FykScma/kccQj3U3ddHEh7EhTdOZ3v59EDwpPUbZiNTDdFK0ykyY1TJP3SwG
 AGPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bcayDksC/Oq9jBwFrtjuESC91JhSZUwPZau7KUsWGbg=;
 b=rJsFKjKaaT/jZpDjy/vMIRFm/OAY2KirmE1fbQjRTiKNZrDMGu4854TN6/JJqZwEZW
 P1nxkvdElyQXwo+q50CvGSB5GYdkyklNbt1a3KUtr0AVb+WhRYDJ28iGhutjy+a72hOC
 3pZiuHbtjAjz+UQ+c+FwcVInsVjXXMnyKOX1Ckb7aFP21wjflezsh4oraxWYNz8ka2TL
 Ebijt0jI+iz+uqvdPO6ov3Nk06vyUgNLtoBHBCMnnb0BQXHoFHKoEVTZh/HryqeWOGiI
 c+66q9mTGndriypYLEBQwlQANUyDdJuPxwAWCAp/xJ1Rhi/dO70O8sVWQazDJ4a8s0VW
 zTNA==
X-Gm-Message-State: AOAM530WVlW9nbQcs5EzXWDF3r2HRKvhFWLXVwj6+RTETcjkfwwr6AC7
 BukGis7p9uEXz9vMhcLMpIt3GsVKeHXrHg==
X-Google-Smtp-Source: ABdhPJzqVf1XwJ4waYABelXl6xj4Ramu5i4Y4SM+Vk6aGyWhSb5/BeCf5un1+9fH0FCTJuWlM9xu+A==
X-Received: by 2002:a17:90a:a791:: with SMTP id
 f17mr1023428pjq.225.1631728193105; 
 Wed, 15 Sep 2021 10:49:53 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id g4sm311667pjt.56.2021.09.15.10.49.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Sep 2021 10:49:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] linux-user/nios2: trap and kuser fixes
Date: Wed, 15 Sep 2021 10:49:49 -0700
Message-Id: <20210915174951.1852266-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: marex@denx.de, crwulff@gmail.com, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Based-on: 20210813131809.28655-1-peter.maydell@linaro.org
("linux-user: Clean up siginfo_t handling for arm, aarch64")
... for force_sig_fault().

Emulation of EXCP_TRAP was really wrong, in that we were using
the contents of R1 when we really wanted the trap immediate.

Emulation of the kuser page was wrong, in that the first word
contains the version, and must be readable.  The easiest way
to fix this is to map real data, but then we have to come up
with some replacement for __kuser_cmpxchg, and the easiest way
to do that is to steal an unused trap number.

Both of these stand in the way of cleaning up SIGSEGV, which
is how the kuser page is currently implemented.

I built a nios2-elf binutils and wrote a couple of asm smoke
tests for this.  So, golden!


r~


Richard Henderson (2):
  linux-user/nios2: Properly emulate EXCP_TRAP
  linux-user/nios2: Map a real kuser page

 target/nios2/cpu.h          |  5 ++-
 linux-user/elfload.c        | 35 +++++++++++++++
 linux-user/nios2/cpu_loop.c | 85 ++++++++++++++++++++-----------------
 target/nios2/translate.c    | 26 +++++++-----
 4 files changed, 99 insertions(+), 52 deletions(-)

-- 
2.25.1


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B967D34691C
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 20:31:43 +0100 (CET)
Received: from localhost ([::1]:49560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOmkg-0004Ee-Rn
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 15:31:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lOm0b-0008CH-3L
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 14:44:06 -0400
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d]:40645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lOm0J-0003eg-Dg
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 14:44:04 -0400
Received: by mail-oi1-x22d.google.com with SMTP id i3so18074105oik.7
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 11:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8yxsgXDxRWBYt7vDrsvYenTxbJqnwMLKAbtTSb7etCg=;
 b=w4af4r85MQrB7UgKcu7Jws/fdMfnPWeInAP61luNiHd/4PrwymtP/vq+CdVm0Iy4Yi
 j2RYTdBDr0v29RBJhblRUFTV1mrrAG1K/H7dluWeF94gYO2xMhFuQ4zlxjTxPoZ2fmTA
 Ilix3nTi8yHoqR62K8G3baiH1ORow34ZygrKjzEb1+ZhSSfAuOXe69UjdCw1JcPRpJHQ
 XHlGqEixyXTtvQWGwSGAL7GCYU8E1/FISBrDUoY+MXK3/R9sQIVa838mRIphYvjbz5P6
 v8OtQJSQN6amJoh0Kuslf8HXLWGXAVOWHcitG5gj4PJ9oy8t6BxUJSN1BeR/mVR9iWLY
 1MKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8yxsgXDxRWBYt7vDrsvYenTxbJqnwMLKAbtTSb7etCg=;
 b=Qdi1rzOJ68aZcOclOLMZJ6a4ZM7x4aHmjq3i2RCQJLDVoZpFsbte8KMBUp1/m2yy1j
 Y7E8FWFH01c7ypQTPDDkrkcLWDrH9kbX8whMVOMGOLrXv/A7caWn3P4My1M4mJznC73P
 snCm6ottgyKgVzIYiBhjLzrG6B14P4IWNa8ze8SgIIr5+cxEnnv/Iun7Xzeq4wcqbR3w
 ak5ydLrBbtI4fL3fBCG5hoXQ6NRngvKWsuj5YOaedVTREGivNwLQ7DAwW+/1UX3m+Pyx
 QAXAg2NPNolPM3pttOZkJeMNr/fKPrf1I4DlE4JwwcUXWdmYzrcb+WO3GEjd71oYtdJl
 K4Vw==
X-Gm-Message-State: AOAM531y9AO5v93GS5mhNGKiyOEFB8Qewvdnxo/CnjTg6IXYgoTrLw31
 ZWEo2TCJ/nOi4TCzE+hVs0gR+HsnUhpOcqgv
X-Google-Smtp-Source: ABdhPJycyZzpR6g1hFNKvNiJ+1fY3mhRKHM+FrtTkcRuIpQPUQxpngvMx7KuQqw/h+oj/AhDuqbO9g==
X-Received: by 2002:aca:2219:: with SMTP id b25mr4325268oic.112.1616525023404; 
 Tue, 23 Mar 2021 11:43:43 -0700 (PDT)
Received: from localhost.localdomain (171.189-204-159.bestelclientes.com.mx.
 [189.204.159.171])
 by smtp.gmail.com with ESMTPSA id x23sm3902825ood.28.2021.03.23.11.43.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 11:43:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 00/10] target/ppc: Fix truncation of env->hflags
Date: Tue, 23 Mar 2021 12:43:30 -0600
Message-Id: <20210323184340.619757-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Changes for v5:
 * Rebase on david's ppc-for-6.0 branch (fcc83aa7359d)
 * Extract post_load_update_msr (clg)
 * Validate MSR_FOO == HFLAGS_FOO when necessary (david)

Changes for v4:
 * Use hregs_recompute_hflags for hw/ppc/ reset.
   -- Incorporate Cedric's feedback.

Changes for v3:
 * Fixes for linux-user, signal handling and startup.
   -- Oops, the directory in which I did testing for v2
      had a reduced set of targets.

Changes for v2:
 * Do not put tcg internal state into migration, except to
   retain backward compatibility.
 * Do not touch anything in env in ppc_tr_init_disas_context.
 * Do make sure that hflags contains everything that it should.
 * Do verify that hflags is properly updated.


r~


Richard Henderson (10):
  target/ppc: Extract post_load_update_msr
  target/ppc: Disconnect hflags from MSR
  target/ppc: Reduce env->hflags to uint32_t
  target/ppc: Put dbcr0 single-step bits into hflags
  target/ppc: Create helper_scv
  target/ppc: Put LPCR[GTSE] in hflags
  target/ppc: Remove MSR_SA and MSR_AP from hflags
  target/ppc: Remove env->immu_idx and env->dmmu_idx
  linux-user/ppc: Fix msr updates for signal handling
  target/ppc: Validate hflags with CONFIG_DEBUG_TCG

 target/ppc/cpu.h          |  43 +++++++++++--
 target/ppc/helper.h       |   1 +
 target/ppc/helper_regs.h  |   1 -
 linux-user/ppc/cpu_loop.c |   5 +-
 linux-user/ppc/signal.c   |  23 ++++---
 target/ppc/excp_helper.c  |   9 +++
 target/ppc/helper_regs.c  | 128 ++++++++++++++++++++++++++++++--------
 target/ppc/machine.c      |  30 +++++----
 target/ppc/mem_helper.c   |   2 +-
 target/ppc/misc_helper.c  |   5 +-
 target/ppc/mmu-hash64.c   |   3 +
 target/ppc/translate.c    |  98 +++++++++--------------------
 12 files changed, 215 insertions(+), 133 deletions(-)

-- 
2.25.1



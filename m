Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A863536892F
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 01:04:40 +0200 (CEST)
Received: from localhost ([::1]:58108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZiND-0006hi-71
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 19:04:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZiLB-0005A7-NO
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 19:02:33 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:46871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZiL9-0007ot-Lv
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 19:02:33 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 u14-20020a17090a1f0eb029014e38011b09so216026pja.5
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 16:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iCIpDPfKFAAEZizr+/ttZJSp2BCLoqZ28R5GAq14Ksg=;
 b=PQkxiQgREungswaBPrEh9k7AWFzef8JmFuPPxW0j2atKmJvtqEiWUWSB3vtpBpqTx/
 BgS0zjHa0VX4vfVDemx1hhRl1vf8GkkKyAgbItEcyVSZB1sd7qNNq/4rq5dd8NlIxA2q
 V8prUomNf/RXTiatnnrkx8GkZn8zrQP4hJBlbp/nQHTMucn2NfmEPAU5Z1aTSo4L56K2
 Ke/VbdI+mRzTFXo8JymfFhTvAdviXpY5+ZFy3gG9/XAjxCff+/FL8AJMPFG4ce/LtWwW
 4um9qkPi16wce1Dmn707d1OJPQupd6oX46CZpvTdGuUka7KWgJcquzsw/TlKtQvkOpp2
 MMcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iCIpDPfKFAAEZizr+/ttZJSp2BCLoqZ28R5GAq14Ksg=;
 b=OTh6VhNYqEElPDwz2XFt0aA0F5xeDBvV/9as8P/xlD7zXKzYog8MXyzfm+yVNzugYn
 lyJJQ5P4mRp30ER0aL5piWaSavkkVAYCMtotCZDzrHBEJ67S6jkg8VhA4orJM4Qa1Ejf
 M3BFhmfFNRlFhyVL9MC9H9khnt6/HMo2V3iwAycMbHsB8aJYCOew+YR6k91M7iFTKexr
 HxNYZO5qd6acIeroNEituNs2BJ907v8EvDXwrFYVlvbUk551W/Mgl3s2HIvgBKka1K0o
 Y+0XAkU0Ls0Qu3plkklPXAzX1uebBzEl5ECeI1+I9Mz2F0534XC5Ra5DAxkRl0gCwr86
 II0Q==
X-Gm-Message-State: AOAM5338gwHPhF9ITEWzvRhwdPNONZAO7soVS+MWQTNEcoMCq+++fZ/Y
 nNqKfpZ1fPrsiFrqUgtWKS1BljeHt1C3hg==
X-Google-Smtp-Source: ABdhPJwenHq4wcz96tPLMXwQXEXNol9On5lR+687apm8ElDvu8hCIPMmgLVHCoNQNvsf7u5t7Mho/w==
X-Received: by 2002:a17:90b:812:: with SMTP id
 bk18mr1138317pjb.145.1619132549155; 
 Thu, 22 Apr 2021 16:02:29 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id z12sm2930605pfn.195.2021.04.22.16.02.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 16:02:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/7] linux-user: sigaction fixes/cleanups
Date: Thu, 22 Apr 2021 16:02:20 -0700
Message-Id: <20210422230227.314751-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Alpha had two bugs, one with the non-ka_restorer fallback
using the wrong offset, and the other with the ka_restorer
value getting lost in do_sigaction.

Sparc had another bug, where the ka_restorer field was
written to user memory.

Version 2 splits patch 2 into 6.


r~


Richard Henderson (7):
  linux-user/alpha: Fix rt sigframe return
  linux-user/alpha: Rename the sigaction restorer field
  linux-user: Pass ka_restorer to do_sigaction
  linux-user: Honor TARGET_ARCH_HAS_SA_RESTORER in do_syscall
  linux-user/alpha: Define TARGET_ARCH_HAS_KA_RESTORER
  linux-user/alpha: Share code for TARGET_NR_sigaction
  linux-user: Tidy TARGET_NR_rt_sigaction

 linux-user/alpha/target_signal.h |   1 +
 linux-user/syscall_defs.h        |  29 ++-------
 linux-user/alpha/signal.c        |  10 +--
 linux-user/signal.c              |   5 +-
 linux-user/syscall.c             | 107 ++++++++-----------------------
 5 files changed, 43 insertions(+), 109 deletions(-)

-- 
2.25.1



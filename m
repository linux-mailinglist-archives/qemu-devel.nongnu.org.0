Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D868352671
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Apr 2021 07:40:32 +0200 (CEST)
Received: from localhost ([::1]:45902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lSCXn-0005iF-7M
	for lists+qemu-devel@lfdr.de; Fri, 02 Apr 2021 01:40:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSCUy-0004Ol-IP
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 01:37:36 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:46760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSCUw-0004SD-Lh
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 01:37:36 -0400
Received: by mail-pl1-x634.google.com with SMTP id t20so2052788plr.13
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 22:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P7OeMQi9Fy965ZESvD0QJwHLzMPBCmAGEybjj57QBfg=;
 b=MhVf18zZkHK2y8Dn+XeLdDZiZmuk3qfm8ZcumoXmjUOs5mTqOYmhfY5RAbJuL0kkBH
 eYD6Eea0Aq3EACI7jFtorBncC0cq/Dt8jcODDhO5ZWu84N1x2gZ9Vniue1dzLhrdERY7
 ugi11IKe+YBAkkWEB9YECl4PzQwESI6whvRiV4JAczPtZF6WOy/Fkpt35MAGXGoFPA7W
 gTrLKqOCXtoXl0PVoq4MiHAYjJyKVCXBg0SnD8VWH2gFPT8/erGFojUA0J/I2RDOER/4
 gObL46lErwkj8hLr0CLpVIDJoyIQ8Ox8seLMSUg1KXMhEwYRQ9Ddnc1F5PZgEMu3fxdI
 MzOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P7OeMQi9Fy965ZESvD0QJwHLzMPBCmAGEybjj57QBfg=;
 b=FzlXyBPo0B4mnK02medDN5dgYOaPXMHkPXnApMrbLinAQahD5RBldHVp/BXO17dpdU
 sSan+s9uok0KW5x/03mFXW0gIFhL4c23wkw5stPtC+t28HBAYJIN+PpCz7MoPRt8SjhN
 KkSiwKtcJY+G6suDaEby4AxJrmp6zNKaK5/oINNnVMHrBt+WK6mJ12GG9RRenwgrpoAV
 6Z8B1mOKMpWg3YMAMSjwGroR3BA+oY7DGG9X1OwUV7u9PazwyYVkO2+zhE1pRgATw5o0
 62AQ6MyhsfYz+R+4u4vgiT3TVPIgyYY3yS1C5oW8L1WHE0y9xZD7hVRWBl1eEwnbm7ua
 cTlg==
X-Gm-Message-State: AOAM5320yF7dgEtVf9zH6WV1UmwwF5YmdDvFNRH/J3Xi0xLFxmSFhBqt
 cvZE22S0WUyBwJQ5n1KZg7EnN4jZd9df1A==
X-Google-Smtp-Source: ABdhPJwpRgl6Smfc2A53+7II92jqryGttW3fWzX5aA+wza/zPwWqvm4rMvq7kGU8pnGsiTtBYpmbLA==
X-Received: by 2002:a17:902:a404:b029:e6:23d:44ac with SMTP id
 p4-20020a170902a404b02900e6023d44acmr11073449plq.50.1617341852062; 
 Thu, 01 Apr 2021 22:37:32 -0700 (PDT)
Received: from localhost.localdomain
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id g10sm6908074pgh.36.2021.04.01.22.37.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 22:37:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] target/arm: Fix unaligned mte checks
Date: Thu,  1 Apr 2021 22:37:26 -0700
Message-Id: <20210402053728.265173-1-richard.henderson@linaro.org>
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I was incorrectly assuming that only the first byte of an MTE access
is checked against the tags.  But per the ARM, unaligned accesses are
pre-decomposed into single-byte accesses.  So by the time we reach the
actual MTE check in the ARM pseudocode, all accesses are aligned.

There's probably more that could be simplified here, but I did try to
keep the patch small-ish.


r~


Richare Henderson (2):
  target/arm: Check PAGE_WRITE_ORG for MTE writeability
  target/arm: Fix unaligned mte checks

 target/arm/helper-a64.h           |   3 +-
 target/arm/internals.h            |  13 +--
 target/arm/translate-a64.h        |   2 +-
 target/arm/mte_helper.c           | 171 ++++++++++++------------------
 target/arm/sve_helper.c           |  96 ++++++-----------
 target/arm/translate-a64.c        |  52 ++++-----
 target/arm/translate-sve.c        |   9 +-
 tests/tcg/aarch64/mte-5.c         |  44 ++++++++
 tests/tcg/aarch64/Makefile.target |   2 +-
 9 files changed, 179 insertions(+), 213 deletions(-)
 create mode 100644 tests/tcg/aarch64/mte-5.c

-- 
2.25.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 113B53C8A73
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 20:08:00 +0200 (CEST)
Received: from localhost ([::1]:60072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3jIc-0004qv-A0
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 14:07:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m3jHM-0002u2-4h
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 14:06:40 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:42827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m3jHK-0000q2-KO
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 14:06:39 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 i16-20020a17090acf90b02901736d9d2218so2261677pju.1
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 11:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bzaCw8BacxbHAgfGBgQdDuTCkpneT9gerIOcpkTFKhI=;
 b=tforjIU8fJ6G/GpNWybRmlEPQqc5DL40YTL+B9yTBmTkUaY6AXsd6GG3NLDIcRnWKN
 ox682PyZcc5fuj+hCECdPBDwv0+1pWtQmxgEJnsJ7b7L8rt/uo1llRx+KUrrg4rJZ/Ws
 AY6pKLr0g5YitRB7JIeA03j93V5CwhojiLsbZRUMxObcznpnr5IGfuOS5ebEqyHfzz4K
 1oN2kqmg0mjcaOucLynU9vrixYEVsanWi9TsjTwR/HdyjfdciYWCR0gxMCGYCjlBSWwP
 L3D6RO+Br06S7Dk0S1vUPATsQeHlsrE3QYhA963Zozd6+6AdzNwY5TaGEp+xY8xR6jW7
 vAwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bzaCw8BacxbHAgfGBgQdDuTCkpneT9gerIOcpkTFKhI=;
 b=X6Cyq8qdzm7RobVYTABOV/Eby8PzNLwrAo7A5uMr9UIp72GSQdYYdjfFSL9zX/pNmf
 x5l1K6F0xtMOpls0vvTAfFq9OgU8dfAfRFFpcsqlzkjJ5V+2utYQcz3z/PeK4So5Zq4Z
 0SRZ6ugKxSPr1I5rT4BABxmWU87Kroq2rBaqgSHRATXYEZca+ihd0shvzXSPM+Xas3+6
 fOyCInvBZQw9n44ELoOq1HfXkFr66JUrzljm2Q7VznkZF1onrCttlfn+4TyZORQT9J26
 Z1wWulJUZNs2ImmGgxjRrKztFmTi9C/yypXAxPoIls76Z9G+SKpQKbwIa/mBUCu77JFS
 cGgg==
X-Gm-Message-State: AOAM531QTVTlN4iGIcVZ1gFwKRXmMNVFzOHdGXpLChLXKjstb8FOLcka
 ffWOdPbUSFJI4I0zdLA1R3/RM19SDH62Zw==
X-Google-Smtp-Source: ABdhPJyGZc8/vVLJbE/5W2vw0a9MQDl31Q6XIOzlwT8SoGkDWZonQGitqqnOkLuV82jmjg2+h0sHog==
X-Received: by 2002:a17:90a:d18d:: with SMTP id
 fu13mr4822874pjb.206.1626285996902; 
 Wed, 14 Jul 2021 11:06:36 -0700 (PDT)
Received: from localhost.localdomain ([75.147.178.105])
 by smtp.gmail.com with ESMTPSA id d1sm2853521pju.16.2021.07.14.11.06.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 11:06:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] target/arm: Add sve-default-vector-length cpu property
Date: Wed, 14 Jul 2021 11:06:33 -0700
Message-Id: <20210714180635.1648966-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is intended to resolve #482.

I'm not sure where to document this.  The convenient place would
be in docs/system/arm/cpu-features.rst, where all of the rest of
the sve documentation lives.  But that's explicitly system-only,
and this new properly is explicitly user-only.

Suggestions?


r~


Richard Henderson (2):
  target/arm: Export aarch64_sve_zcr_get_valid_len
  target/arm: Add sve-default-vector-length cpu property

 target/arm/cpu.h    |  7 ++++++
 target/arm/cpu.c    | 14 ++++++++++--
 target/arm/cpu64.c  | 53 +++++++++++++++++++++++++++++++++++++++++++++
 target/arm/helper.c |  8 ++++---
 4 files changed, 77 insertions(+), 5 deletions(-)

-- 
2.25.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98EFA320735
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Feb 2021 22:33:07 +0100 (CET)
Received: from localhost ([::1]:43464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDZsA-0003f3-JT
	for lists+qemu-devel@lfdr.de; Sat, 20 Feb 2021 16:33:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lDZoK-000115-12
 for qemu-devel@nongnu.org; Sat, 20 Feb 2021 16:29:08 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:37362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lDZoI-0003mA-Ct
 for qemu-devel@nongnu.org; Sat, 20 Feb 2021 16:29:07 -0500
Received: by mail-pg1-x529.google.com with SMTP id j1so4367630pgh.4
 for <qemu-devel@nongnu.org>; Sat, 20 Feb 2021 13:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dLexcMILAt1/IGDNeNA5OV8M1T9BYJMPZPpNc1gxVi0=;
 b=gXZg2ORWCQV70Ed6rdOdBKnkRNFtSzXBPCkYwhmEK/pRY5jbG0a1Is7BMmcHU8iErj
 T2Kg/yyLtA7kyBzNEzxVymFgBRwMIUWXrgzsDv2qMXMC69r/w0lozZQg+3Q/S9SJGwSa
 ++s5MEru3kpflfY7bu0u39FwQ3zxr5/cAEe8We7pR6uPQW6jg4Rk6mPQNdBBKryPYChM
 zXvKPzetdv2cCKXuZJmSzm0axzCUJZE0pCAUwMHcVlqwEPpjWPnkR27etEQBhmwwYnCV
 8WDA42MMNBoNHI/ZLj20r/lVnuHrmQqhYQuqILZT6Hb4N+n5kGW6eiu9fJc6t+ECQL1q
 wwZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dLexcMILAt1/IGDNeNA5OV8M1T9BYJMPZPpNc1gxVi0=;
 b=ZsGh/srXRYBmck9spUA7ff3QhJY3i2OKoxigEhBWcRhRoDvrqHfDroy/0x5WjnM9kO
 kAP3YR6dZDUnR9Vw8tLC4vUBMenBglqTRmWOuUH49gwNWZJ37Ieq4rTtmQXgutVNzdNp
 m+J8hgj9p4SPsGUI01wlj7WqaiUZa4LReVkKFGMUzrUZWOBNSUa/2Mwe6vYWhI5Ec3tb
 SGD2LzeoBqNEmBtSZW34bjuBbBoOzbIY6LIBzWsapZymNYmYHtqQ06/t7iFhrIweyNVO
 nnhHIOCAXO6Ana7J7N/heMBSORGjpeCh/i0uflc6ZeD8E6jj7rissNtbW7mX0g0HVqPD
 h0yg==
X-Gm-Message-State: AOAM533RtZAhMvloxUB76VZhJ1uhSU4R5Hv1RKuZtZqWiOTM0BwWjjcb
 BSk/bZoLgS0GYVESIEJmAmvswaVQYa80fw==
X-Google-Smtp-Source: ABdhPJytl0rmgfgktms1ioHiJ7vpQeVmnFrxpLvaPl58JpwU7y0nTJml7tZV7HjfAKSEpDmXhOX3cQ==
X-Received: by 2002:a65:64ce:: with SMTP id t14mr13854024pgv.36.1613856544842; 
 Sat, 20 Feb 2021 13:29:04 -0800 (PST)
Received: from localhost.localdomain (24-113-145-216.wavecable.com.
 [24.113.145.216])
 by smtp.gmail.com with ESMTPSA id h186sm9726559pgc.38.2021.02.20.13.29.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Feb 2021 13:29:04 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] tcg/aarch64: Fixes to vector ops
Date: Sat, 20 Feb 2021 13:29:01 -0800
Message-Id: <20210220212903.20944-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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

I guess it has been a while since I've run aa32 risu on aa64 host.

The launchpad bug is something that should have been seen from the
beginning, but the similar aa64 operations are expanded as integer
code, not vector code.  The aa32 neon code has only recently been
converted to use gvecs.

The cmle0 (zero) bug has been exposed by the recent constant
propagation improvements; previously we saw a reg/reg compare.


r~


Richard Henderson (2):
  tcg/aarch64: Fix I3617_CMLE0
  tcg/aarch64: Fix generation of "scalar" vector operations

 tcg/aarch64/tcg-target.c.inc | 213 ++++++++++++++++++++++++++++++-----
 1 file changed, 182 insertions(+), 31 deletions(-)

-- 
2.25.1



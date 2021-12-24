Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05EA647EA69
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Dec 2021 02:55:13 +0100 (CET)
Received: from localhost ([::1]:37552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0Znb-0008AW-6w
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 20:55:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n0ZlD-0006lN-2d
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 20:52:43 -0500
Received: from [2607:f8b0:4864:20::531] (port=40921
 helo=mail-pg1-x531.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n0Zl8-0004jN-V5
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 20:52:42 -0500
Received: by mail-pg1-x531.google.com with SMTP id l10so6348340pgm.7
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 17:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kRV8NakYR6RcTZe0hRveAEfBsVx6jkxWDsmE0pRWFmM=;
 b=F68akXfWHXtYUo+brRe5Q7fEMFp/mQZ8BQMsZlEysfYRIBmGK5YBQMAP6igjJJK4fk
 k1IPdEbYJIi4H8ol/sw3g61ewvDzJgEYfYW3kUtJADw1vFYMIKcbTnX80BbibJRcYxej
 RyHjWjUODcPtxM1L4YhVrsgNRVgAOqkxqTYw2S+3Tp633Ztna+RzoQA1pHUGIbde/t7p
 /3KtbV8BRmJH5vxdiCDoFvhvKKQFmeiUNdkALBD3QZ2hHiWNegDfrqXvGT1xrer3ZYHD
 Q6JpyIcdHn7lK4jaDA2+3x9ja37Ji7UxcBkbPGxSPgZ8s6PTxCeMmjySwUji8S4LZAv7
 eM8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kRV8NakYR6RcTZe0hRveAEfBsVx6jkxWDsmE0pRWFmM=;
 b=6voVjDGKpd12Llwy9y4aADFnrGnrgvHfdf2qJtA0MxcW3Kj6YsyDCOqn1FkBxj9kMt
 LN+aePhqU+TQnspnnEcaxY3X+cGlPmlFfCIlllwlgLe6Omn5MXb7Lmogt6vHH1KRBSN8
 DHd/rkgrvMJnK5qsxNrE/yowLynUNUOJ6/Q1UjxDfKfTS1XYdfj1bUnATrfGm7LHzWGk
 YNSjfwthPdWrq3QzsJBgYWPl9ViUvrztHRK8NF+jWcJU7DPRRbBzcX9iPlyjBZPe2ln2
 IdyVwwD1Vd+lUIdAt9WnaAh/rR3IP0YEYEa2texWiBOHW0wjG6rQm8su1XbILLQbLM+2
 vE2A==
X-Gm-Message-State: AOAM533Alh+BJUHe9aD/Q9WwSrtmTqwKHFtiTDrypRyI3zMqBtSwMUQp
 wRltYsVRyibkJC/oWEncOOwtR6i2fs3hDg==
X-Google-Smtp-Source: ABdhPJy5m7wfhJ0dKe415z+GHq6Iss8eUD3LiNI/fK9ty4Akfy3y8OxeG4JMc0C1s64n4DlW1VCMpA==
X-Received: by 2002:a63:6dcc:: with SMTP id i195mr4195746pgc.462.1640310756439; 
 Thu, 23 Dec 2021 17:52:36 -0800 (PST)
Received: from localhost.localdomain ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id v6sm5769723pgj.82.2021.12.23.17.52.32
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Dec 2021 17:52:36 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 0/1] target/hppa: Fix deposit assert from trans_shrpw_imm
Date: Thu, 23 Dec 2021 17:51:58 -0800
Message-Id: <20211224015159.2155441-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::531
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit f18155a207dbc6a23f06a4af667280743819c31e:

  Merge tag 'for-upstream-mtest' of https://gitlab.com/bonzini/qemu into staging (2021-12-23 11:35:48 -0800)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-pa-20211223

for you to fetch changes up to 05bfd4db08608bc4c22de729780c1f74612fbc0e:

  target/hppa: Fix deposit assert from trans_shrpw_imm (2021-12-23 17:47:01 -0800)

----------------------------------------------------------------
Fix target/hppa #635

----------------------------------------------------------------
Richard Henderson (1):
      target/hppa: Fix deposit assert from trans_shrpw_imm

 target/hppa/translate.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)


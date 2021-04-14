Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1C035FCC2
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 22:37:10 +0200 (CEST)
Received: from localhost ([::1]:44276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWmG4-00071p-Pg
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 16:37:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lWmBn-0005CE-4e
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 16:32:43 -0400
Received: from mail-qv1-xf44.google.com ([2607:f8b0:4864:20::f44]:35744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lWmBj-0004nD-E7
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 16:32:42 -0400
Received: by mail-qv1-xf44.google.com with SMTP id x27so10613960qvd.2
 for <qemu-devel@nongnu.org>; Wed, 14 Apr 2021 13:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OLB3+PW+usE0uivpk/5WOQnHeURqQpL1qML3odejfOY=;
 b=xGRSVj4duVTp2C/wt/+zytLge3Ml/+j8fET56eVD9PZ2bs8kCHIpbdL5FtZJ4RiZFA
 of8gPqtAcXErP8KP9k+KTH8zKd4bI2j77banHjIvds6U8WYdFISgO/r2Z5Ln+dqmORWv
 jp40cEpVaZUbUmZb9MhKWX5V0rHY3HkJJSi7fhhRVWFEYnAnPCCPQIz6XXC+Ldzyc79a
 SPwikrjNaYhsW3ns13e3rtD2avj4o3nPnFpZOKGOLJZiROvfwJpWbYfe+L+pgVOZdLXw
 kQd5PsffSrUF9XX3NgUm92pstr94xRIMyz/sZZRysZmztt+UVhEdoG+nDwtf1wmw24KU
 R9Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OLB3+PW+usE0uivpk/5WOQnHeURqQpL1qML3odejfOY=;
 b=Ld15TwSBwIpE1hYA3nX9q6L4GFuY2NSLk+6B/MBwl4rVt7IAasFX5t40DpaieGfMIP
 jnUcIOtzAoLTNlaxG8VHSuQH1gfID0s9CL7NgeSzYuXD3Dzhs5Oux4WK+RZjOHxqG0IK
 tZPsJlQRTB9p7kc2eweG+cyR1hdo7vF+JngjFdSSg4R5euQppzF9pqaNIGxxB8yAV07m
 Y6e4WFY1y/amLNvVBSNUjAYpIb19uao4MF5UPl+DspJskfDkL+a6krLL4tqjRV3u1XAq
 04YTcGk6XdGBt+MWD5nWcahVfV6Zq2HMaoZ5g8FfTUW3vUu/HRilfcE7gaNn81WhvEgv
 pbuw==
X-Gm-Message-State: AOAM531nLvMboti4g/xg/0G7RgnBa/v72qSGqT6LwLc/b0LckBTpXHdk
 +tzF1MTYZfwu220b24nCXo3Vvw==
X-Google-Smtp-Source: ABdhPJw+MSYeUI1AMIqvUMN1tg4jLUHlqjSI1A9FidalnnY/+Ar0jmKEQRVhngofe7W9Ydc2v9gnow==
X-Received: by 2002:a0c:e9cd:: with SMTP id q13mr135268qvo.3.1618432357940;
 Wed, 14 Apr 2021 13:32:37 -0700 (PDT)
Received: from cube.int.bluestop.org (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id q3sm304692qtw.40.2021.04.14.13.32.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Apr 2021 13:32:37 -0700 (PDT)
From: Rebecca Cran <rebecca@nuviainc.com>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Subject: [PATCH v7 0/4] Add support for FEAT_TLBIOS and FEAT_TLBIRANGE
Date: Wed, 14 Apr 2021 14:32:27 -0600
Message-Id: <20210414203231.824-1-rebecca@nuviainc.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f44;
 envelope-from=rebecca@nuviainc.com; helo=mail-qv1-xf44.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Rebecca Cran <rebecca@nuviainc.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ARMv8.4 adds the mandatory FEAT_TLBIOS and FEAT_TLBIRANGE. 
They provides TLBI maintenance instructions that extend to the Outer
Shareable domain and that apply to a range of input addresses.

Changes from v6 to v7:

o Fixed the tlbi_aa64_rvae1_write the tlbi_aa64_rvae1is_write functions
  to pass the correct value into functions which use an ARMMMUIdx.

o Fixed comments in helper.c which referred to non-existent instructions.

Testing:

o Booted Linux 5.11 - verified the previous assert failure in qemu is
  resolved.
o Ran checkpatch.pl.

Rebecca Cran (4):
  accel/tcg: Add TLB invalidation support for ranges of addresses
  target/arm: Add support for FEAT_TLBIRANGE
  target/arm: Add support for FEAT_TLBIOS
  target/arm: set ID_AA64ISAR0.TLB to 2 for max AARCH64 CPU type

 accel/tcg/cputlb.c      | 130 ++++++-
 include/exec/exec-all.h |  46 +++
 target/arm/cpu.h        |  10 +
 target/arm/cpu64.c      |   1 +
 target/arm/helper.c     | 371 ++++++++++++++++++++
 5 files changed, 555 insertions(+), 3 deletions(-)

-- 
2.26.2



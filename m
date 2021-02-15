Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 717FD31C3DF
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 23:00:12 +0100 (CET)
Received: from localhost ([::1]:37564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBluc-0007yi-UI
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 17:00:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lBlt7-0006OD-RJ
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 16:58:37 -0500
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:47035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lBlt6-0007oI-9Z
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 16:58:37 -0500
Received: by mail-io1-xd2b.google.com with SMTP id u8so8173552ior.13
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 13:58:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H/BIETWzaZJmb7wMKtw4nqWT52RSETxWIhxUFg1PsEg=;
 b=MyZb5Oa3AXTEuUfQY5+/TsMpimoizs3hQ+Y6T2dA0tRGHU/Bm9+I3IPHzUHPsvamaM
 fCKW1w36eBIW2/1DXFlo5DszcZ7KJ2jKk64fZ/Bc0gYAMrY0f82gmp+9OcNm6fqE0F91
 z12DbnLNd+pEYWt4PfVLH5v8bfezq74WbQSFnF11GrLd94TaRb5GjOdWUEMFOl+m3ADM
 8v2dwBOYVmRYZ/dlyB/I8vFC52eetsHldcEMu09MhWE2H6QN445IakxBU4L4aqr0yZ1Y
 3IJLhpEyowqW40NFWztbRrVYCLXTxSYQMbjj1j2xKP3zVlikbXQlw9jChOLgaUWq3hkb
 6v1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H/BIETWzaZJmb7wMKtw4nqWT52RSETxWIhxUFg1PsEg=;
 b=h6Fl/d81E7BolnqPzYEKhLwFy4EsvFhKk1S7edw/nDjgiIezYEqpIPxAleIng4gCw9
 vF9z+gmgSRa+V9FrzCGBO9TOjHi9MjpIgNyHaFjYbkiHfo/qu+tAMAcb0Oy4hPz17Dfm
 mdMlcjGdVjU+d11Qisguk/Ual0ip5eBEQG9v1InNNHIJpal3FplS71hNXYhjur7sibrG
 E58EstsSQ64IpayUt40UobUKEz2oymXBz+rY7zOXuZkI/+4fBT9Kdta2G954dEGqaLih
 OJKQ1Pckv6uztl0N6gkrsG4joGiqfqL6H9UX3B104SbvwMJjH9Xjqc3/XhIbth8ekqkQ
 y15Q==
X-Gm-Message-State: AOAM530Xtel94cN61n8Hsq+A2dplxIQH+y9VulnH3Suu9gb+XGCUBDfs
 hCZXsEx77GNnnFJ2SNkowWsrZA==
X-Google-Smtp-Source: ABdhPJwPQMLqOLPUD1VPXnB0mgcIgEntv957SE6DowKHNvEoOA329a7/nS1xPiJs5cbb1oda/2ALaA==
X-Received: by 2002:a5d:9ec7:: with SMTP id a7mr13891250ioe.126.1613426313533; 
 Mon, 15 Feb 2021 13:58:33 -0800 (PST)
Received: from cube.int.bluestop.org (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id j12sm9812254ila.75.2021.02.15.13.58.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 13:58:33 -0800 (PST)
From: Rebecca Cran <rebecca@nuviainc.com>
To: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 0/3] target/arm: Add support for FEAT_SSBS
Date: Mon, 15 Feb 2021 14:58:16 -0700
Message-Id: <20210215215819.1142-1-rebecca@nuviainc.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=rebecca@nuviainc.com; helo=mail-io1-xd2b.google.com
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
Cc: Rebecca Cran <rebecca@nuviainc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add support for FEAT_SSBS, Speculative Store Bypass Safe. SSBS is an
optional feature in ARMv8.0 and is mandatory in ARMv8.5.

Rebecca Cran (3):
  target/arm: Add support for FEAT_SSBS, Speculative Store Bypass Safe
  target/arm: Enable FEAT_SSBS for "max" AARCH64 CPU
  target/arm: Set ID_PFR2.SSBS to 1 for "max" 32-bit CPU

 target/arm/cpu.c           |  4 ++
 target/arm/cpu.h           | 15 +++++-
 target/arm/cpu64.c         |  5 ++
 target/arm/helper-a64.c    |  6 +++
 target/arm/helper.c        | 52 ++++++++++++++++++++
 target/arm/internals.h     |  6 +++
 target/arm/translate-a64.c | 12 +++++
 7 files changed, 99 insertions(+), 1 deletion(-)

-- 
2.26.2



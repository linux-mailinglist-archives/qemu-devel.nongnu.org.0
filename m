Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B895731D2CA
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 23:48:17 +0100 (CET)
Received: from localhost ([::1]:55982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC98i-0002WB-9t
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 17:48:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lC96P-0000qP-FY
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 17:45:53 -0500
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a]:45767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lC96N-0004s9-NC
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 17:45:53 -0500
Received: by mail-oi1-x22a.google.com with SMTP id q186so8980998oig.12
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 14:45:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hrJrCx4IupfkxEsF5d43g+ctOQybqXDlHjJYCDnVPX4=;
 b=kuVMuxFJKSdcZ8S9+jzEIT/s2KsIGJ+KI2Lf0pxe1osmHZHiWu/pfTjWUp42JVmCU6
 qOZ3IpmL1Qq7B9AN3OaGZHiSS1/F2GVZzcV71sb1qDadMTEdIPkvbvUbM3O0ny28r+QI
 AR1F9zKJxJYXxrpbbRIW33p6rHugjOdgythG9R2SYFZDHLasr6FNQsoxE6Z4tbZ/oW8E
 h3k7rKig+bEGLSp/jmketsHJ2ZYja9c8KelVM7sZ5ulG1TBmVjoL/E+PTefpkGq/QU2E
 veL2EyrL1MIJki6Moe0MApUZcKR40Cekn8ycMsSyJ+TpvKhlzs2afXGY2S9QvdWuhlhb
 jVTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hrJrCx4IupfkxEsF5d43g+ctOQybqXDlHjJYCDnVPX4=;
 b=NBhdev+lbpZvTq5zpvI8yTf5JdvsoxrQweOgyiKk3eOnQSRQoxaQC82P4tj8LAmv5Y
 rzpWYM+HJ91N5l8ZaXV9tZF0WGtvANSbfJOIxIP562Ly+lgbg5nxx349myXkRtVDlh88
 hJDcouHAg3OOuaX/3VKhwMwLAA7gbYh0rUxcQhX8j9l+BcUCNowxFJ1Vj6dwzEw+t1Dk
 P5Y/U+mn1hrQGe8ClBoD1p6bPKLk2lNhYCS1JoHgjPfunW9KgrbBwDbtagviKllmt15U
 W6xlgaWFBVE5zPfJR2CCWqYG5HvZLUifPmrvJfigE5WUyXRg6dxt4TIA+hPYqqhsxdlH
 kt8Q==
X-Gm-Message-State: AOAM532oGHSAqTXr8u4ZnWVdWhFWmp65M96vqmRJTKzZPZ6j2MIvfafC
 5q29m1KOuyUjSVBcC+IS26VBBg==
X-Google-Smtp-Source: ABdhPJynqDuKF9Gycbi83IaXhCZCI2M71c/ZsnEOBp2XMuToisuzXsbtowqf6Ov+4G9hE5m8V0tMQA==
X-Received: by 2002:aca:eb13:: with SMTP id j19mr4074829oih.10.1613515549906; 
 Tue, 16 Feb 2021 14:45:49 -0800 (PST)
Received: from cube.nuviainc.com (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id b12sm32909oti.65.2021.02.16.14.45.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Feb 2021 14:45:49 -0800 (PST)
From: Rebecca Cran <rebecca@nuviainc.com>
To: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 0/3] target/arm: Add support for FEAT_SSBS
Date: Tue, 16 Feb 2021 15:45:40 -0700
Message-Id: <20210216224543.16142-1-rebecca@nuviainc.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=rebecca@nuviainc.com; helo=mail-oi1-x22a.google.com
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

Changes from v1 to v2:

o Removed changes to cpsr_write_from_spsr_elx and cpsr_read_for_spsr_elx.
o Moved the SSBS case in translate-a64.c above DIT to keep the numbers in
  order.
o Moved the check for SCTLR_DSSBS_32 in take_aarch32_exception.

Rebecca Cran (3):
  target/arm: Add support for FEAT_SSBS, Speculative Store Bypass Safe
  target/arm: Enable FEAT_SSBS for "max" AARCH64 CPU
  target/arm: Set ID_PFR2.SSBS to 1 for "max" 32-bit CPU

 target/arm/cpu.c           |  4 +++
 target/arm/cpu.h           | 15 +++++++-
 target/arm/cpu64.c         |  5 +++
 target/arm/helper.c        | 37 ++++++++++++++++++++
 target/arm/internals.h     |  6 ++++
 target/arm/translate-a64.c | 12 +++++++
 6 files changed, 78 insertions(+), 1 deletion(-)

-- 
2.26.2



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44850333279
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 01:32:02 +0100 (CET)
Received: from localhost ([::1]:56298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJmlc-00023I-Qy
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 19:32:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lJmj7-0000Ui-Kk
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 19:29:25 -0500
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29]:40881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lJmj5-0001HI-Gt
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 19:29:25 -0500
Received: by mail-io1-xd29.google.com with SMTP id i8so16016956iog.7
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 16:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=My+j4KnGaAroxQolaO5aq5DcwlmNegq105KVJ4aBaAE=;
 b=EBOKfENt3VrRvUhgmzAG823E9iGGLJwcC1oWRwmMntrR9p7o/m3PrRBFvfhWOlhIo2
 pO6AGA88uw6Vbo6zh3GSxIX9ggZI8AdeJBeZLLlKAQvhee7MXJ2KAdH1fZtpG35rX0jA
 LecuRIIrMGpcnXdWdIu+evYHalFh01zfMWZ/K7hN7+BQ1nVwDF0M9+7aDPlxAOFQSGaL
 ZwnWJbmA2LO9AyxgwIeHr4sBkUk+K6Le6jg6R8N+nMBLB96C3H/Xczo/wggZRT4wX/SR
 i3zK8byhKrbzmOyFQTma7Z8vrx76pa7SOFnKTZT7ThORC35KKginiFdwUlV/vYhbJpPe
 xyCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=My+j4KnGaAroxQolaO5aq5DcwlmNegq105KVJ4aBaAE=;
 b=WgTSxCun6LQ9al8NXAwr1+QxsnJ9Hdmd1fHUBq2ujevP5LL+29P0H6zNQVR+Itpzni
 9kFq+3ZGvBPH4r5hleiE+IaXzVJw0yZIKy0nX8+MRVC+8Q/ic+ytiyq/PzLIbQJ3r1mG
 hTqoYlt8oxfsUvSWR1WDMjv+aysmUz7T0Z6CpgKWH4YrIo3x6QSDLvGss76q6l16De/q
 v7IyoJjcetqiSbhf/cBKuqtGH5OSJfVaLTAxtlEP2W1XUWdugdgvqsKLUUbiIkKyUKtN
 mKipPG0+ysSCRalIJ0KFXnJV3WXXSpdTn775cy8y3W3685QEp7WZNAc+eC4E+n6lIRuA
 bs+g==
X-Gm-Message-State: AOAM532myfriWDSHebEf/Yg2yBpOH3hEr57+Zvj/MTRqYUoKI6wfCYrF
 lw1woRCVuexXcEc/T9K77E0yoA==
X-Google-Smtp-Source: ABdhPJwPR1MKYJRg0soS3uDYQBzUMkjzxrX2i2BljX//yrMjCYjhnJNzWWD3ZKi2xGqVEMrK7CCeNA==
X-Received: by 2002:a05:6638:1914:: with SMTP id
 p20mr728812jal.92.1615336162248; 
 Tue, 09 Mar 2021 16:29:22 -0800 (PST)
Received: from cube.int.bluestop.org (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id h23sm8048808ila.15.2021.03.09.16.29.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 16:29:21 -0800 (PST)
From: Rebecca Cran <rebecca@nuviainc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org
Subject: [PATCH v3 0/3] target/arm: Add support for FEAT_TLBIOS and
 FEAT_TLBIRANGE
Date: Tue,  9 Mar 2021 17:29:14 -0700
Message-Id: <20210310002917.8876-1-rebecca@nuviainc.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d29;
 envelope-from=rebecca@nuviainc.com; helo=mail-io1-xd29.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Rebecca Cran <rebecca@nuviainc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ARMv8.4 adds the mandatory FEAT_TLBIOS and FEAT_TLBIRANGE. 
They provides TLBI maintenance instructions that extend to the Outer
Shareable domain and that apply to a range of input addresses.
    
Changes from v2 to v3:

o Change the functions in cputlb.c to do a full flush. This should
  only be a short-term implementation.

Testing:
  o Ran scripts/checkpatch.pl: functions in exec-all.h fail,
    but I think that's acceptable?
  o Built all targets
  o Ran test code that executed the new instructions
  o Ran "make test"

Rebecca Cran (3):
  target/arm: Add support for FEAT_TLBIRANGE
  target/arm: Add support for FEAT_TLBIOS
  target/arm: set ID_AA64ISAR0.TLB to 2 for max AARCH64 CPU type

 accel/tcg/cputlb.c      |  22 ++
 include/exec/exec-all.h |  41 +++
 target/arm/cpu.h        |  11 +
 target/arm/cpu64.c      |   1 +
 target/arm/helper.c     | 323 ++++++++++++++++++++
 5 files changed, 398 insertions(+)

-- 
2.26.2



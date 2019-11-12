Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24192F9396
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Nov 2019 16:04:40 +0100 (CET)
Received: from localhost ([::1]:36090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iUXig-00074f-ML
	for lists+qemu-devel@lfdr.de; Tue, 12 Nov 2019 10:04:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37916)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <robert.foley@linaro.org>) id 1iUXgZ-0005vR-07
 for qemu-devel@nongnu.org; Tue, 12 Nov 2019 10:02:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <robert.foley@linaro.org>) id 1iUXgX-0002EF-FH
 for qemu-devel@nongnu.org; Tue, 12 Nov 2019 10:02:26 -0500
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:42046)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <robert.foley@linaro.org>)
 id 1iUXgX-00029l-8R
 for qemu-devel@nongnu.org; Tue, 12 Nov 2019 10:02:25 -0500
Received: by mail-pf1-x444.google.com with SMTP id s5so13516549pfh.9
 for <qemu-devel@nongnu.org>; Tue, 12 Nov 2019 07:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=GDpBTG0OewJd7duOA0Lf8cDoIElQd+Bj0ifLtqWN2iw=;
 b=cRKaPsQAIPOWNmnDY85ORCQ7Lctqy+DpK2zc9wAXdagcIIlHRAHGbgxaaju4Im94Cs
 IRmnsqgB36Wr37UyoDF4+jgwagRLiq2WRSqxd/ECam/Z89NW3eVzZod9ddsMDhx3btwi
 Kry05RvGyEJ0/23DJmZY0Lmc8MZcFUlUvFwcuv0n8PXHkTRYRXQsXFMKB1C9DctJz+AQ
 gFQpawENW0RVbjNNaCNbMOf2wVUuFkwsszG8UYnANa1uy+NKcE10SZNanQSk60sgk7M5
 pHAYNWWBB4pbiE18q6GVlqU1ITpQQI6CGfsfrLpEXhpXRdPumXGo6wYiJJjrC3oeBGZg
 Yo8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=GDpBTG0OewJd7duOA0Lf8cDoIElQd+Bj0ifLtqWN2iw=;
 b=tVBk2uVrKPt6UrfaKQRD26CqK0Ou635TGvtQlSKu3ZCLXw+7KCpZ/BppgqwjxAKAFb
 qqtiQSrlrR8WgdiJntxH2VsGbD2a1z42eq5U3v+4h1va6SL0asrZbo7SNWJJwb8fRrmt
 SA9HyVQPg5ZprM6w6/8ZFLz7fQ1KBS/SxEwdAqxHXd8JZGJ0OocxdBz8CPUVgDefyuI+
 pTEcXcCwr1T3Q0QHREf8OTcMXQNwBYhdN6avaNaBec3HQp36gzD20ve1RZ3EXKL4Xsax
 Y90U9kBEk5gD99pGN2w4njbGwLI4oBgLVp5LGGPD1TfXP9xoHAXLXCmm/C82IQCeBfT2
 I7Hg==
X-Gm-Message-State: APjAAAU1ke9UJ68p7DnyW/zX+BnonBSF1/7iHejbzusdMemz24nejbYg
 oRj7q7lsyz9WieUCP8lsBw3s6+UxHLI=
X-Google-Smtp-Source: APXvYqyqpWXL3dF7aIca2ZN1cWeGJRYkjzjQ67pMYuERR6hfZzYT2EInRQy+G2LX2+Fro17evB0Lvg==
X-Received: by 2002:a17:90b:46cf:: with SMTP id
 jx15mr7181532pjb.19.1573570942513; 
 Tue, 12 Nov 2019 07:02:22 -0800 (PST)
Received: from Rfoley-MA01.usrd.futurewei.com ([12.111.81.71])
 by smtp.gmail.com with ESMTPSA id a3sm8235511pfo.71.2019.11.12.07.02.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2019 07:02:21 -0800 (PST)
From: Robert Foley <robert.foley@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 0/5] Make the qemu_logfile handle thread safe.
Date: Tue, 12 Nov 2019 10:01:00 -0500
Message-Id: <20191112150105.2498-1-robert.foley@linaro.org>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
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
Cc: peter.puhov@linaro.org, alex.bennee@linaro.org, robert.foley@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch adds thread safety to the qemu_logfile handle.  This now
allows changing the logfile while logging is active, and also solves 
the issue of a seg fault while changing the logfile.

This patch adds use of RCU for handling the swap out of the 
old qemu_logfile file descriptor.

Also added a few tests for logfile including changing the logfile
and closing the logfile.

One change also added for a pre-existing double free issue in 
qemu_set_log_filename() uncovered with the new test.

---
v1
    - This version of the patch incorporates changes 
      from the first round of review.  
    - It also includes a fix for an issue in
      qemu_set_log_filename().  This issue was uncovered 
      by the test added for this patch.
---
Robert Foley (5):
  Add a mutex to guarantee single writer to qemu_logfile handle.
  qemu_log_lock/unlock now preserves the qemu_logfile handle.
  Add use of RCU for qemu_logfile.
  Added tests for close and change of logfile.
  Fix double free issue in qemu_set_log_filename().

 accel/tcg/cpu-exec.c          |  4 +-
 accel/tcg/translate-all.c     |  4 +-
 accel/tcg/translator.c        |  4 +-
 exec.c                        |  4 +-
 hw/net/can/can_sja1000.c      |  4 +-
 include/exec/log.h            | 33 ++++++++++++--
 include/qemu/log.h            | 49 ++++++++++++++++----
 net/can/can_socketcan.c       |  5 +-
 target/cris/translate.c       |  4 +-
 target/i386/translate.c       |  5 +-
 target/lm32/translate.c       |  4 +-
 target/microblaze/translate.c |  4 +-
 target/nios2/translate.c      |  4 +-
 target/tilegx/translate.c     |  7 +--
 target/unicore32/translate.c  |  4 +-
 tcg/tcg.c                     | 28 ++++++++----
 tests/test-logging.c          | 80 ++++++++++++++++++++++++++++++++
 util/log.c                    | 86 +++++++++++++++++++++++++++--------
 18 files changed, 264 insertions(+), 69 deletions(-)

-- 
2.17.1



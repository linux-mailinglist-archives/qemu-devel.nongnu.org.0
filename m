Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9013B3A74B0
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 05:09:47 +0200 (CEST)
Received: from localhost ([::1]:49556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lszSU-00087g-L9
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 23:09:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lszQc-0004YY-Pw
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 23:07:50 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:40789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lszQa-000876-SW
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 23:07:50 -0400
Received: by mail-pl1-x62a.google.com with SMTP id e7so7701103plj.7
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 20:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m+ONvOy6BybEkcrsOQ5EfyN70Y/8S9L0jNeLEmKpXlU=;
 b=GoGV8yd2eCg4urI5zzXH3jsF4br8f8AF18x2Oj9he+76WAEA+4jPOkM2R+opEXs+qh
 XM0NHdi+/rz3pDLb+fZTfv0gMCLtYpzJMcHmdTs+TRHMrnIlPZnqZvr3KHCh70Q0kaN3
 dB8OHjUGHmP/riR48bWR42g5ZM25XqrOwiQGP1trg5aCounqCV1ekUjFCScuwFi5jd8T
 tucslrhy0QApVxy3TL6cpJa1NfHNEGQRnqHiejr7Yp6HU8YTHl4RhAB9ZBMLGWnqcBzv
 4YejpM18QJQmsrBbsM7xKgXS0Z13CrHrozKpSNG5ddPyhV426JyFnBmayk6FO8jDXgI2
 SWpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m+ONvOy6BybEkcrsOQ5EfyN70Y/8S9L0jNeLEmKpXlU=;
 b=lhC8F6yc5WPIILX3kIf0JhZ8/8DBA87RL9R7n0V79ijun+ca57upAhu/qO3ZNjnGDn
 /CWoH+cMm6PMxqySJYH7+uij5EPeSgheaPNe4Z/jquMlnhghX3i7XP4S42OFykRfTDvr
 AkXqbn49EhQYxntlbEvdqK9w+5qBNj/vrQL+86Mm9levANKycvRp6C3cB+2UO6dEKnB9
 XJLwT4ALaZcq0w4tHCOWygSz90ipyazbZFHjcE5vwrJ4UUChAkDhlMVF1wUkAuJ42zmD
 hihvfo0rtgHj30ui8uTf8jLNLJZocof+w/K9DTTvWXGHZb2e05xnxGii/PVj5UQ/yB/N
 9O3Q==
X-Gm-Message-State: AOAM530St+QNKXP3Idi00tXp3KzPkf578pZp+EnJHKk0GI8gXioGqOpO
 KFwvWQqgLXEf7ngpdinrMw0j0+GeqONrIg==
X-Google-Smtp-Source: ABdhPJwrhzhoV/6Q6cQ6yTyioDKNcyE8kppCziDf9bs9q1NgYMwx1IBFuDgycDE5PYFUgW1jvighAQ==
X-Received: by 2002:a17:902:7b8a:b029:109:7bdb:ed9 with SMTP id
 w10-20020a1709027b8ab02901097bdb0ed9mr2102885pll.73.1623726466664; 
 Mon, 14 Jun 2021 20:07:46 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id w71sm7554666pfc.164.2021.06.14.20.07.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 20:07:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/5] linux-user/s390x: Fix psw.mask handling in signals
Date: Mon, 14 Jun 2021 20:07:39 -0700
Message-Id: <20210615030744.1252385-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
Cc: ruixin.bao@ibm.com, jonathan.albrecht@linux.vnet.ibm.com, cohuck@redhat.com,
 qemu-s390x@nongnu.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The PSW_MASK_CC component of psw.mask was not handled properly
in the creation or restoration of signal frames.


r~


Richard Henderson (5):
  target/s390x: Expose load_psw and get_psw_mask to cpu.h
  target/s390x: Do not modify cpu state in s390_cpu_get_psw_mask
  target/s390x: Improve s390_cpu_dump_state vs cc_op
  target/s390x: Use s390_cpu_{set_psw,get_psw_mask} in gdbstub
  linux-user/s390x: Save and restore psw.mask properly

 target/s390x/cpu.h         |   3 ++
 target/s390x/internal.h    |   5 --
 linux-user/s390x/signal.c  |  37 ++++++++++++--
 target/s390x/cc_helper.c   |   2 +-
 target/s390x/excp_helper.c |  28 +++++-----
 target/s390x/gdbstub.c     |  15 +-----
 target/s390x/helper.c      | 101 ++++++++++++++++++++-----------------
 target/s390x/sigp.c        |   3 +-
 8 files changed, 110 insertions(+), 84 deletions(-)

-- 
2.25.1



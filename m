Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC6360BE80
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 01:25:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1on6oH-0007GA-TV; Mon, 24 Oct 2022 19:24:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1on6oG-000707-2Z
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 19:24:44 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1on6oE-0000D1-HX
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 19:24:43 -0400
Received: by mail-pl1-x62b.google.com with SMTP id io19so4784550plb.8
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 16:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=qhqlCbK+Vyfuhw07z3L7AMoxj5A7y8nNEGzeS8BGSg4=;
 b=BuvzTWK5X1qutaiB8mWsdfz9g5Ef1YwqgoWPzqTocosB66KVEzasgW9kbSAnhCD4rw
 z9EoXLatbit/MFo8kQwQBcp+hu6PTXHJFdWhxXUAwDhafQf1AvxHNOnwhV4AKbEtUGaO
 giZQ6owBIdWSnS5WiWG39sKyIMWemngFbChMjUUSDXQqJBSJJfu3X6fyy4XSkRdZCQ9P
 sJAaGaTj0sp/jkvLNBEQ9Yg5bWn/MgA0kMzM9jJYorqmncallTqGtVsYJ9zTzFjzsGXv
 y99YVdifjVLzV4ecoEzh6ANOnmqOvUUlKLNDw7LoIfCBlvtWyPcSuTFIG10aUIeA+rAs
 CAig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qhqlCbK+Vyfuhw07z3L7AMoxj5A7y8nNEGzeS8BGSg4=;
 b=wXDyDbRnGD3EI86mCN9z2pY6atO9nc10FvLWAJiwcedczNKjjmF8x+PBiCCA66uuNf
 JJ0a2eyeeVRe2KYXMmT6hjW4Y9j+6fMCNVVHq2NfnYgqVgi9Yv0SV4ItVucf4jb1mRf/
 D2fTtOFITdjEK9lOHlOV/P06ljxM40mPrJ7CABxBhXLACduEqpYPAZktU3M7zZEgUOLP
 c2+xhW/z2ND3kb5+Oyyidv0103xDZk7Siq2SD26+gDp42REmXoGgZTQeLLLA2Y560NQs
 Jrg9wD9i2wbJM8F8FRKu32lebb69O4Hnizd8dV21I2mkKhqpLnlyExNzSzr93VziWIqn
 mZXA==
X-Gm-Message-State: ACrzQf0M8vwTpGqFbMMcYBUPmWkPiUnAsrO4o2yLUjfH8LdJbDOqxKBK
 QzOT7sogdevHJXLsfAAXm4uMn4xWHTMylA==
X-Google-Smtp-Source: AMsMyM5lZ6eFcYPxZSIjB2jJgsKRAOCgA4D4ULHnW9uBdQZwR1y16RUcdI/vqOuZ8bBVloFqBIychg==
X-Received: by 2002:a17:902:ab8f:b0:185:46d3:8c96 with SMTP id
 f15-20020a170902ab8f00b0018546d38c96mr37315321plr.136.1666653881115; 
 Mon, 24 Oct 2022 16:24:41 -0700 (PDT)
Received: from stoup.. ([103.100.225.182]) by smtp.gmail.com with ESMTPSA id
 k3-20020aa79983000000b0056bfa2cf517sm324788pfh.3.2022.10.24.16.24.39
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 16:24:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] atomic: Friendlier assertions, avoidance of __sync
Date: Tue, 25 Oct 2022 09:24:31 +1000
Message-Id: <20221024232435.3334600-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The current use of _Static_assert, via QEMU_BUILD_BUG_ON, requires
the user have #if conditionals to avoid the statement from appearing
in the preprocessed file at all.  Introduce a new primitive that
allows normal C conditionals and dead-code elimination.

Remove all use of __sync* builtins in favor of __atomic*.
We have required them since 47345e71247, last year, and
should have removed these at that point.  My bad.


r~


Richard Henderson (4):
  include/qemu/osdep: Add qemu_build_assert
  include/qemu/atomic: Use qemu_build_assert
  include/qemu/thread: Use qatomic_* functions
  include/qemu/atomic128: Avoid __sync_val_compare_and_swap_16

 include/qemu/atomic.h    | 16 ++++++++--------
 include/qemu/atomic128.h |  8 +-------
 include/qemu/osdep.h     |  8 ++++++++
 include/qemu/thread.h    |  8 ++++----
 meson.build              |  3 ++-
 5 files changed, 23 insertions(+), 20 deletions(-)

-- 
2.34.1



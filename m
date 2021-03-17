Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFCC33FBDA
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 00:35:38 +0100 (CET)
Received: from localhost ([::1]:37716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMfhR-0005eo-KT
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 19:35:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lMff6-0004J8-Cp
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 19:33:12 -0400
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33]:35609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lMff2-0001rI-OB
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 19:33:12 -0400
Received: by mail-io1-xd33.google.com with SMTP id v3so374735ioq.2
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 16:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wDZ/n6ipsC3PKWfRqva6sPfY+Tp4bT/yJoMTCHmsHwY=;
 b=bOKm8yF+dsH6iIpqAHRGmQGL+g1rr2QuPnIZbgcX6p2+cNIsYeBl7GWvVNA72WVhvD
 Fn5MT9zBHg8a335PQHHCGHmQbbQO3YcEG1HseopMeAyW3Ad+4YJ1jDATdRtLNkE5mTle
 INwqmNwI7Rh1jnbO1xc0A0Z/j2SlZNYV66lv5gT+hz2yOpkGWfNtrAH6qVrr5u3hE3xd
 ohe45Um43LC2P+r41W5HgSyIrVrD37B99BBelqBANvkzTxcLKUYgX9VeWWxOHaW2/l6O
 P35Jz/hTgMMqxrSnGwVedL/n8OyVZQqOOTZtT52SJhVVDRr+/AQTEZNsyfrADmpIHN68
 B/mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wDZ/n6ipsC3PKWfRqva6sPfY+Tp4bT/yJoMTCHmsHwY=;
 b=lXiwJNKbzgB1pFHwpCCf8CsYMl9mg8CkTd3aBe4XbcFkv9llcaHPrjjco+hheI0FXH
 jMVGdytBw3j6PTb2LAd4jtTXJ38L46MRSitNM45TVmPTY5iR0lHW01sJxcsa5gXP+ZFc
 HW23pMqpU5L84ZF3dP1K/c/0BFHOqMZp9eUpCCsTn1CtysnyYQtKeUksM20giWX1EngV
 +EBEt4Hu0Uo+YpBqgl0AyObycSdCmLW5kC9AmKFeEYf6w2HBNt1U2huB8AWFG43Ehaip
 8OASfTaBHnIDXACVI10pagBeeyDGEYTk91WO6QP3tAWWBJ5+f5iNJKrlPhWanyFRPEui
 nang==
X-Gm-Message-State: AOAM532mgNTfsCV5sHZ4wWQkeVOZV8jx0JFGT5pww3gTIN0D0vMDkNZa
 szROHowwcr4EZEIgEt62+9aY7Q==
X-Google-Smtp-Source: ABdhPJzU5XJbP9cXC7LHURo7oJdj+91Pshu79ii/b4vLrvDTP8MTwmqhF1nUChWXXflV5nnaphNq9g==
X-Received: by 2002:a02:9986:: with SMTP id a6mr4903004jal.46.1616023986903;
 Wed, 17 Mar 2021 16:33:06 -0700 (PDT)
Received: from cube.int.bluestop.org (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id k12sm235183ios.2.2021.03.17.16.33.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 16:33:06 -0700 (PDT)
From: Rebecca Cran <rebecca@nuviainc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org
Subject: [PATCH v5 0/4] target/arm: Add support for FEAT_TLBIOS and
 FEAT_TLBIRANGE
Date: Wed, 17 Mar 2021 17:32:57 -0600
Message-Id: <20210317233301.4130-1-rebecca@nuviainc.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d33;
 envelope-from=rebecca@nuviainc.com; helo=mail-io1-xd33.google.com
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

ARMv8.4 adds the mandatory FEAT_TLBIOS and FEAT_TLBIRANGE. 
They provides TLBI maintenance instructions that extend to the Outer
Shareable domain and that apply to a range of input addresses.

Changes from v4 to v5:

o Split changes to cputlb.c and exec_all.c into a separate commit.
o Return a bool from tlb_flush_page_bits_locked to indicate if a full
 flush has been done.
o Update flush_page_range_bits_* to exit early when a full flush has
 been done.
o Run tb_flush_jmp_cache in a separate loop.
o Don't check for 2 regimes for cases where we know there's only one.


Rebecca Cran (4):
  accel/tcg: Add TLB invalidation support for ranges of addresses
  target/arm: Add support for FEAT_TLBIRANGE
  target/arm: Add support for FEAT_TLBIOS
  target/arm: set ID_AA64ISAR0.TLB to 2 for max AARCH64 CPU type

 accel/tcg/cputlb.c      | 130 ++++++-
 include/exec/exec-all.h |  45 +++
 target/arm/cpu.h        |  10 +
 target/arm/cpu64.c      |   1 +
 target/arm/helper.c     | 369 ++++++++++++++++++++
 5 files changed, 552 insertions(+), 3 deletions(-)

-- 
2.26.2



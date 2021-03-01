Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A42E327E7E
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 13:43:39 +0100 (CET)
Received: from localhost ([::1]:53930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGhth-0007sN-V5
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 07:43:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lGhrv-0006yj-AZ; Mon, 01 Mar 2021 07:41:47 -0500
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735]:33900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lGhrt-0002PB-Hj; Mon, 01 Mar 2021 07:41:47 -0500
Received: by mail-qk1-x735.google.com with SMTP id x124so16288420qkc.1;
 Mon, 01 Mar 2021 04:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=19xrvCQnTHanHxLFr7a+mSBkIfHF9X0QKdwb5VptyYg=;
 b=DxAVHihQH0abzrj169tFS14Zc3zgjM5U5BhTGwbeR9oSPbe4KOoiIhJQs93KQFqJBi
 9EenReDwWGUkFAUQ6v+d1MogBRHvHDaWNYs6NXJf8FuSRybvJizbdsNv5EXfoMT5Q0zQ
 XRrrWJ0Z5QfBYqmCOQS8nWXveRUZAhRZTbZFcWpVFqP9pUh4Jj/0hpjfCdROa8HsJTHH
 jMcfJqESGbL2D77WBPAwnl7coEz8Jrj2UKHkAPXqGPUHF8mWwOxYf6YR6ENdpZBYpJNV
 Xg3sygxUJnzskfsWN0m4PnzgOioAYM9Xxi8cdO77L2kZM/E7B81D3joycuI69CQ/GTwE
 0p4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=19xrvCQnTHanHxLFr7a+mSBkIfHF9X0QKdwb5VptyYg=;
 b=RPj68Bjl76s2h8czOjTUufIR3xHTuJwtHLkVTN/YHt4sMaGy+1q0lRjNYzsQ1skECh
 JvD/sobIbc8TUr9q5evUXPzVuljleChzSwpiqCYcHuKvW9YDNcGajL63x9AxrDa5i9l+
 uBMwKfZBMAMjzDWiWXqaqSE5PAbgMj9EWrgG4iWBhOE2f2HcXrlRUEEI6ldRoU8APYFZ
 8WvGduqSw0Auy5mpc4WUwUxrW9JJmHMhmFEdl4pUtmCaIMz2lXE4FVafXQ3S4X33+Gd5
 rqkorOApeGVTdqD65iWVFtgaNE9jiRiJCUCBhy5LU5pNE36cpJII08rboXK46F1heUP1
 O36w==
X-Gm-Message-State: AOAM531zdQv+N0oPe0wyJVSldTXAyZuL2/XBqLHlAXFIKRK5ftzmW1UD
 HAjXC0Nh58CSAWFyHFj949ofQ8Lx9pbfxQ==
X-Google-Smtp-Source: ABdhPJxF6MCfumFjzIZFbPN3NsmX+qrqFLPUwvLc9CTo/xWTA0mtdxpDm5C9j8XaFpTPX9Q2rfW3xQ==
X-Received: by 2002:a37:7fc2:: with SMTP id
 a185mr14702253qkd.202.1614602503449; 
 Mon, 01 Mar 2021 04:41:43 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:cd1c:d722:e26f:4e76:c5c1])
 by smtp.gmail.com with ESMTPSA id t16sm10981755qto.58.2021.03.01.04.41.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Mar 2021 04:41:42 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/1] qemu_timer.c: add timer_deadline_ms() helper
Date: Mon,  1 Mar 2021 09:41:32 -0300
Message-Id: <20210301124133.23800-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::735;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x735.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Changes from v1:
- Added Paolo's ACK
- Changed the helper to get the clock via timer->timer_list->clock->type
  instead of assuming QEMU_CLOCK_VIRTUAL, as suggested by Greg 
- v1 link: https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg08097.html

Daniel Henrique Barboza (1):
  qemu_timer.c: add timer_deadline_ms() helper

 hw/ppc/spapr_drc.c   |  5 ++---
 include/qemu/timer.h |  8 ++++++++
 util/qemu-timer.c    | 13 +++++++++++++
 3 files changed, 23 insertions(+), 3 deletions(-)

-- 
2.29.2



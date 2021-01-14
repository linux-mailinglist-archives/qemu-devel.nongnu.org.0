Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1332E2F6903
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 19:12:54 +0100 (CET)
Received: from localhost ([::1]:40034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0777-0006Kq-0X
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 13:12:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1l071D-0001tB-Hb; Thu, 14 Jan 2021 13:06:49 -0500
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830]:36232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1l0716-0004yt-Cj; Thu, 14 Jan 2021 13:06:47 -0500
Received: by mail-qt1-x830.google.com with SMTP id z20so4174085qtq.3;
 Thu, 14 Jan 2021 10:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uzgt5ZPXYkxJXjz1pCTuKTOHt/+dYdrVtuh+KfRYOYc=;
 b=eE3qvzeH8iF9058z7YRa4nzlxb8WPoTxH+mZ/24jlcq9IolO7Pqyl5mf4tdkq3kkcy
 nF7QpUjaNmWfU9PuWB33MP7dlahngxeVMsTCD3YfONHI3/m+kI3Pu8YQvHyPj96c1ZFJ
 dHwf+G6whKehOAiismAqoOQoHt8V1AkSpHami55cejcEIv3W90Bl8NhU8N6FnsJTepzU
 Us89ktZdOFdDH9BejI2XufLkFfKJGc1fCNsOdoZEaUgsKmX59UPHLK/dSdsyC8T6JjDb
 qDLLwxgZc0ObAVEkN+xvoKhBOsq4trAY7IjcHGuxUlrl4bhh/5r15gOSJsNA4o2HRbVo
 xpGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uzgt5ZPXYkxJXjz1pCTuKTOHt/+dYdrVtuh+KfRYOYc=;
 b=KYNBgNwkd+oYmIqxGZjtJ39K1bJ7lnTZCIK4WQoUs24hWq/+0M60LtIHE1L78EqShl
 Ptkujk+XJ+ejjfnfaVKvH8NLWMwmV07WjV5BZVaeSiPdEnTfWtWma6Ea5aGaGjYY9LKT
 xYOgoBpG2+D8Hra2Il2WlDjmuMT+mHdJ+E6J/JrQoXsJacVAAEls974yg6RxM+eXTU6T
 HiAcOd4UZzEDQBiD3CI1hOxCtUdY42G8WL1VbpBrmFuVAe7gzrsscV+vne5feV88BQYI
 BPa0BAuNpPfbg3jCrFp+ZF4N/qubVwkxXWPeci7W9LbqQiE9snq+JgbGKF9vHZyT2lBB
 HmVg==
X-Gm-Message-State: AOAM5332sVb83Sl3wnwHq7Isk6/4lKk5ymigWwkkTVbo6zxZQsBJdU43
 f6sJmsAI+rl/xnAHsqmxl41vMFSD63MTtw==
X-Google-Smtp-Source: ABdhPJwafNMJ4XWPxNnyE/a/bkuqxyhMgLMLtZvbr7Vj5yQk+mAQakpK6XkqGKPWSv6ZntzmBnu+kA==
X-Received: by 2002:ac8:75d4:: with SMTP id z20mr8173783qtq.267.1610647597183; 
 Thu, 14 Jan 2021 10:06:37 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:b984:ff01:270:b51c:24a5])
 by smtp.gmail.com with ESMTPSA id a1sm3448129qkn.104.2021.01.14.10.06.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 10:06:36 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 0/7] pseries: avoid unplug the last online CPU core +
 assorted fixes
Date: Thu, 14 Jan 2021 15:06:21 -0300
Message-Id: <20210114180628.1675603-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::830;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x830.google.com
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

Hello,

The last 2 patches of this series contains a fix for a hotunplug
situation that we have in the pseries machine, where hotunpluging the
last online CPU of the guest causes the machine to behave not that
great (https://bugzilla.redhat.com/show_bug.cgi?id=1911414).

First 5 patches are somewhat trivial changes that I ended up doing
while investigating.

Daniel Henrique Barboza (7):
  spapr.h: fix trailing whitespace in phb_placement
  spapr_hcall.c: make do_client_architecture_support static
  spapr_rtas.c: fix identation in rtas_ibm_nmi_interlock() string
  spapr_rtas.c: fix identation of rtas_ibm_suspend_me() args
  spapr_cpu_core.c: use g_auto* in spapr_create_vcpu()
  spapr.c: introduce spapr_core_unplug_possible()
  spapr.c: consider CPU core online state before allowing unplug

 hw/ppc/spapr.c          | 66 ++++++++++++++++++++++++++++++++++++-----
 hw/ppc/spapr_cpu_core.c | 12 ++------
 hw/ppc/spapr_hcall.c    |  1 +
 hw/ppc/spapr_rtas.c     |  9 +++---
 include/hw/ppc/spapr.h  |  7 +----
 5 files changed, 68 insertions(+), 27 deletions(-)

-- 
2.26.2



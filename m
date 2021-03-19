Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 030343424CD
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 19:37:06 +0100 (CET)
Received: from localhost ([::1]:39524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNJzb-0008EN-MW
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 14:37:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lNJxm-00072E-AL; Fri, 19 Mar 2021 14:35:10 -0400
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730]:45905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lNJxk-0006XO-Mv; Fri, 19 Mar 2021 14:35:10 -0400
Received: by mail-qk1-x730.google.com with SMTP id q3so3954371qkq.12;
 Fri, 19 Mar 2021 11:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KBZd2UfLHPVj/e7c0SPe4gmj9TQ4BsYzxE6Lt0d4LhE=;
 b=sMX5Z+kyWVngqjCBpHEdl52uFgBVZ29qsU+m5FMMzB58cOOKDgngvwP827CiX2gbLi
 DGMrtCL5XY0mFwXrmr9+TNmb07PDUxNhQ5fRqrbv8d7yzpc+SNeNRah7jyUpDd+cnyJF
 htGAUE+o/TSomwirJn7/GzdCE7uk/zfoGjd0fsDyjk180QtqDo987VOTGFabbXsY8qsx
 KLV4cOnQ38K1J/4aClrWWcLuWQaWQJPX+1ePRgceYNDGt8lFEpsFQVsSocIQwBSbBiod
 CIqTVBbNg5pS/Nh8a6mJRxygivdqdf/SSHZrZQKM9FSvWPsGlL68E0uKAjxwbQUovOvC
 GTMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KBZd2UfLHPVj/e7c0SPe4gmj9TQ4BsYzxE6Lt0d4LhE=;
 b=JQ03KVMb1iDM5FrRzHhFRqKM4fe78USITJwfGbKfoCcsstRUtvs1dmvHSUULpib7ka
 x9zrLesL9FMr9htlz1+WyBiKRLBFempp6Un/AhsyVhUnBj3BFwOSi0seid2BJ93/GVga
 xqtsx9kDR45l9kV6aV2pk565JKPbE1KBy0UNqeWHjYYTn4xr0pvB/1COGePGFEdiM2wy
 g+tjcRFOOoAipbNbV1qu79OwmtuzSANpnterFcyHk+2Nf1+X63GXXC3AM6KpXcBRDGD7
 ShaWyj4sQBMvdl0TFqCgTP+tskUoX5JJQD3KhxenPPE8uwS/WSm20L9aeY6bREJTgStQ
 O2zQ==
X-Gm-Message-State: AOAM530/qF2viZKCkRaWgilEtQwabXJd1M9ZR2V/fDcK2Jk4kCR6LE0k
 lHtIqZnJjgZDGM76g951Ru8IXkKytsA=
X-Google-Smtp-Source: ABdhPJz2UMe9NcQj4G56DWoggsBkMEcAQ3J1iD/BeP+g2KxTwAct+nY+jyBhPlM1YezB+QZaiHAywA==
X-Received: by 2002:a37:ae44:: with SMTP id x65mr10805070qke.9.1616178906802; 
 Fri, 19 Mar 2021 11:35:06 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7c7:cc80:21a:fa87:b9b8:5376])
 by smtp.gmail.com with ESMTPSA id
 r35sm2660225qtd.95.2021.03.19.11.35.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 11:35:06 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] pseries: SMP sockets must match NUMA nodes
Date: Fri, 19 Mar 2021 15:34:51 -0300
Message-Id: <20210319183453.4466-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::730;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x730.google.com
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
Cc: clg@kaod.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 qemu-ppc@nongnu.org, groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

The main change made in this series, in patch 01, is result of
discussions with the kernel community. See the commit message
for more details.

Patch 02 is a second version of the patch sent in [1], but now the
changes are only effective for the default pseries machine. It's being
sent/reported together with patch 01 since they 'share history'.


[1] https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg04029.html


Daniel Henrique Barboza (2):
  spapr: number of SMP sockets must be equal to NUMA nodes
  spapr.c: remove 'ibm,chip-id' from DT

 hw/ppc/spapr.c                 | 10 +++++--
 hw/ppc/spapr_numa.c            |  7 +++++
 include/hw/ppc/spapr.h         |  1 +
 tests/qtest/cpu-plug-test.c    |  4 +--
 tests/qtest/device-plug-test.c |  9 +++++-
 tests/qtest/numa-test.c        | 52 ++++++++++++++++++++++++++++------
 6 files changed, 69 insertions(+), 14 deletions(-)

-- 
2.29.2



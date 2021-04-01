Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 169DE350B0D
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 02:07:24 +0200 (CEST)
Received: from localhost ([::1]:45146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRkrq-0005Tn-Lt
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 20:07:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lRkpU-0003s3-NL; Wed, 31 Mar 2021 20:04:56 -0400
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834]:37468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lRkpS-0006aX-RX; Wed, 31 Mar 2021 20:04:56 -0400
Received: by mail-qt1-x834.google.com with SMTP id f12so316106qtq.4;
 Wed, 31 Mar 2021 17:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HqFqafy3C85N98kTXsr+ZAcbQ+szhS2lHE2Cs0cXkIY=;
 b=C3Fy6DUTtNtLQ2ScTFHvAtPdMh62LEqTUzFd3n318In8J4wIs/YdpUgAZav7L0kHkz
 ifk14Q+UF058Znt6l1Z0aFotXNzDlW+Cr4vl35FyFydvnVqqRtuKoYeIKPJwfhzX3BBG
 Q597FhJlUgyOgJXe7nkPKpEoM0f7TyM3/nrM+samtBOAk8zHt7hLPKz9tLpoC3nFvcpn
 IkUYJouJW8BoXbWuueRVTM/kDlXKNK7PCKNtWYghPayLJ+7T5UADkXoCPZH8CP2iuzka
 rI96sI1EdGumHiQyCGNwu+iBQjACcqToQqUBThNDUGLHR6FKbeO9ChYBIpONosISRGKj
 09vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HqFqafy3C85N98kTXsr+ZAcbQ+szhS2lHE2Cs0cXkIY=;
 b=tFba4LTIqQnYTgs4Fe6Tg7DBI51J0+wQh0E1sSZGrC6FZSoRDvdmOndRRh2uPbt0A4
 r0DOz4v0bZRUZGjZhx9zX+JGlBmZ2lhXD8q7cz7SLJDidcF+BTqyONoZ04Ff+dXiPXDI
 t5EBQ1VPPZUdtLQHZxcoCSlbIqu7B7V9Xt2FLCuMxzjeBYsmqDrmUrGDuOPsjHn4Ka6j
 dtFzeWqe8QmJqcdOS+1JaZYlFsTCDFMkyAaFcAcbvBwJBYmkLCbU6wVWNsZHVIvB2SIn
 QJOSD1kMJRcq+txrPlsEErSGQI21T2c90mXWk4ZsFX0bSEE3BLKbT955k+2Q786Za2IE
 YECg==
X-Gm-Message-State: AOAM532Uh1HI332R5uiBSZhcmFViMSdRq6Rm9OXTzH4pqR/F6yyuB4TU
 Io142vn4fQlMryV6l+Nb33tRQspqPV8=
X-Google-Smtp-Source: ABdhPJyLh7qN67gyRWbQDpJCF+UKnOQjc3sTPIKpNhkOxwTea00LM72/gQ/JAmxAb76K4fTYKM8Txg==
X-Received: by 2002:a05:622a:1647:: with SMTP id
 y7mr4704724qtj.210.1617235492067; 
 Wed, 31 Mar 2021 17:04:52 -0700 (PDT)
Received: from rekt.ibmuc.com ([2804:431:c7c6:e000:6f43:93dd:11a0:93a1])
 by smtp.gmail.com with ESMTPSA id h8sm2346830qta.53.2021.03.31.17.04.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Mar 2021 17:04:51 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] pSeries: revert CPU unplug timeout
Date: Wed, 31 Mar 2021 21:04:35 -0300
Message-Id: <20210401000437.131140-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::834;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x834.google.com
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

Hi,

This series reverts the CPU hotunplug timeout mechanism that was added
during the 6.0.0 cycle. See patch 1 for the reasoning behind this
decision.

Patch 2 is a re-post of a patch that allows CPU hotunplug events to be
re-send to the guest [1], regardless of any existing hotunplug pending
state present in QEMU. This will give users a way to retry hotunplugging
CPUs without relying on unplug timeouts.

[1] https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg04399.html


Daniel Henrique Barboza (2):
  spapr: rollback 'unplug timeout' for CPU hotunplugs
  spapr.c: always pulse guest IRQ in spapr_core_unplug_request()

 hw/ppc/spapr.c             | 15 +++++++----
 hw/ppc/spapr_drc.c         | 52 --------------------------------------
 include/hw/ppc/spapr_drc.h |  5 ----
 include/qemu/timer.h       |  8 ------
 util/qemu-timer.c          | 13 ----------
 5 files changed, 10 insertions(+), 83 deletions(-)

-- 
2.30.2



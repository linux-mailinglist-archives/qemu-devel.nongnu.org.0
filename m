Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9288A6F4E35
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 02:41:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu0XU-0001NG-1L; Tue, 02 May 2023 20:40:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1pu0XQ-0001Mr-84; Tue, 02 May 2023 20:40:08 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1pu0XO-0006fJ-Ip; Tue, 02 May 2023 20:40:07 -0400
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-63b51fd2972so3231329b3a.3; 
 Tue, 02 May 2023 17:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683074402; x=1685666402;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ltTbutF9TCzNEkXc7Z7ZY4GIBEFBC2R5a4IJ9+TV5pY=;
 b=WNMSwU5WO+ztnBNCEpPvDvPYKRoyVkxhO3RawKpGM5KOSkQNFQCQTAC6v5zwo7pXP/
 MU9biXW/ObEX2vVOjLpv+VXsgo1gIzRhigrLjZ3N3hm05XqiTDZAPTNu/hR4NiPj7x8F
 B85wX9qaYe2LpWcpcR6KIi97wzRRBPHMaj3hVoliMm7jUvRyI9TB9Oy9nEGFHsmn9AF5
 VZvEoGHCHei+M97ZZIbA6Q1pzIzWukX3ttqCXiELNGDIYqG+eIm5jr0L2n2LefPRFPgc
 hiF24BcevCtxYG1/lXt8IcxVpbr2XrqRCUgGZfE13L3eGSba5zAZ8YWDpmXfY/BPvGij
 WPHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683074402; x=1685666402;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ltTbutF9TCzNEkXc7Z7ZY4GIBEFBC2R5a4IJ9+TV5pY=;
 b=OGW7ZDDJhi2BW9BM58Iv+3xxzcscJQbTpRx7929zAZyu00M+48JgaXJPYVw1S08FTu
 R/Tc+GhrwSQc6KjqvRMSqnYEDf5K8btqGeIzmosnWs2/jhFO9km5TlARbq8/L94SHtWq
 IxbG5J8HIxGLo38n0CR/WwcypYkZoRRxE0snjjht3LUN/zWZlEQiYm10i5T2UXfVBGc4
 55EwZcGs/va3PxzbUpZcwpbScgQGXkDqVCRiwsFFJkhSgzNNGtlxYCI/wszCPIlDqxRd
 TSRqJVzrWnyLIEbyWl6D/kB2nvaPPW6NJTzztz/pgjTySvF4gpWHOpkb9H/68U56jPnv
 vlrA==
X-Gm-Message-State: AC+VfDw0IvfTADjtuS5RYRAFPifWZOTp763o4Fxta1FAT8zyy9oXRkj2
 e6T/9iu4F/3CLWzTxYYtnzBatjh86D3oIg==
X-Google-Smtp-Source: ACHHUZ4YOM3ly+cYJF304zK428o6MC/bz5u+z9WHpH/WUTb0NZ9PfJLdDPW8/346kJFkStqcLxI/aQ==
X-Received: by 2002:a05:6a20:394a:b0:ec:5eb2:a2bb with SMTP id
 r10-20020a056a20394a00b000ec5eb2a2bbmr24956738pzg.61.1683074401664; 
 Tue, 02 May 2023 17:40:01 -0700 (PDT)
Received: from wheely.local0.net (118-208-214-188.tpgi.com.au.
 [118.208.214.188]) by smtp.gmail.com with ESMTPSA id
 e13-20020a63db0d000000b0050f7208b4bcsm19332338pgg.89.2023.05.02.17.39.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 17:40:01 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Cc: Nicholas Piggin <npiggin@gmail.com>, qemu-devel@nongnu.org,
 Harsh Prateek Bora <harsh@linux.vnet.ibm.com>
Subject: [RFC PATCH 0/4] spapr: clean up nested hv
Date: Wed,  3 May 2023 10:39:50 +1000
Message-Id: <20230503003954.128188-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=npiggin@gmail.com; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Something like this is the way I'd been wanting to refactor nested hv.
The state load/store functions and data is (somewhat) abstracted, and
the hcall interface remains in the hcall handlers.

If, hypothetically, you had a new flavour of nested enter hcall that had
some other way of specifying the L2 state to load, then you would
(hopefully) be able to extend and reuse the state struct and load/store
helpers.

Thanks,
Nick

Nicholas Piggin (4):
  spapr: H_ENTER_NESTED should restore host XER ca field
  spapr: Add a nested state struct
  spapr: load and store l2 state with helper functions
  spapr: Move spapr nested HV to a new file

 hw/ppc/meson.build              |   1 +
 hw/ppc/spapr_hcall.c            | 348 +---------------------
 hw/ppc/spapr_nested.c           | 496 ++++++++++++++++++++++++++++++++
 include/hw/ppc/spapr.h          |  61 +---
 include/hw/ppc/spapr_cpu_core.h |   5 +-
 5 files changed, 502 insertions(+), 409 deletions(-)
 create mode 100644 hw/ppc/spapr_nested.c

-- 
2.40.1



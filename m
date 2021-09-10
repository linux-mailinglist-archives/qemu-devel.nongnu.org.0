Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 208FD4066F7
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 07:58:18 +0200 (CEST)
Received: from localhost ([::1]:33614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOZYG-00010E-OP
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 01:58:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mOZWY-0007Fm-IO
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 01:56:30 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:39788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mOZWX-0002At-0r
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 01:56:30 -0400
Received: by mail-pl1-x634.google.com with SMTP id l11so460494plk.6
 for <qemu-devel@nongnu.org>; Thu, 09 Sep 2021 22:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3DDyJdm6ecbaUrCvR4xtBAx8JjQqR3bPgB3rRz2IrFc=;
 b=OepKyoxmwdheuKQwpBpkQnk7Ls2P65kU741KeH0b/fk/X5kCQSARqcFbaFEGkfiPbs
 4vm7i+qFarYTdtzxpvzb37H5ZDeMjt9pC7e2VYaz6HmAn6pSf2v4kbOw/C+Qe7ItAFJi
 vEDtFE/S4AUrJsJU8AGdF77+JaHhCM4XPWfiTI4GwULcGbD5s7wzFntNRvQBwYqiX6bt
 uFdAuZmy37cuan50jg7bLIt3ac/7/H2rB2WCsDfUyqsrPl9/oG8bWAIOTbAl3khUJ1qt
 lUeliCglkIfbSzY65jFY1tP/op0nZow3TZMo8gvmxJiJRwMtC3jPEDqvBg1s/5EgfxmS
 zZIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3DDyJdm6ecbaUrCvR4xtBAx8JjQqR3bPgB3rRz2IrFc=;
 b=GxwSIJ7bbrVueNqJxQdu+bJzRBxJjHAWHxVWbzGXizTIzFMl+OxROKtEnpVhBpLnri
 vbhNG9JGQKWStc0GoC5IxclI/jF4bCLMijd+op2BYSL+gXzxgprJotqI6iWrzYrMS1Rq
 cC24GizX0H3Y9pM1xAptmgk6LAouojq9MkYSj06lRsHxy1m9C1S6Gq2u7PVIefuT/FkD
 MTzRy6o2ECphBbtrs9iejDqpsG2JdjyDQODXaB7lONoaa8qkB/lGd/yx8QoN0IdnXq17
 ZUh6bDcwLTpnkSmXwb/ZJWvK90XuRPRVzE1NIcIyi8/kAntKe8NBs5kpvB+7jKzV4WlK
 lpkA==
X-Gm-Message-State: AOAM533/Pag4rq/HFmE6qLwM9FexJdA+5aS+y5R/b3eMucc1Kmd/Zxl2
 PV0n9kZFC1Vj32GoQ6aeujToG+Gr/IsdMy1Z
X-Google-Smtp-Source: ABdhPJzYYkCtaDZH8ShjXaH+A5rhRDTQy971dwKLKJZHcKT7CUZKjtSTltLTyrge/sJdQBJwWOaHSA==
X-Received: by 2002:a17:90b:1c10:: with SMTP id
 oc16mr7799527pjb.1.1631253386816; 
 Thu, 09 Sep 2021 22:56:26 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id v17sm3739101pff.6.2021.09.09.22.56.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Sep 2021 22:56:26 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH 0/4] hw/dma: Align SiFive PDMA behavior with real hardware
Date: Fri, 10 Sep 2021 13:56:12 +0800
Message-Id: <20210910055620.946625-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x634.google.com
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
Cc: Frank Chang <frank.chang@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Current QEMU PDMA doesn't align with real PDMA's behavior. This would
result in Linux dmatest failed. This patchest aligns with real PDMA's
behavior we tested on the real board. The golden results are performed
in U-boot on the Unmatched board with PDMA supported.

Frank Chang (3):
  hw/dma: sifive_pdma: reset Next* registers when Control.claim is set
  hw/dma: sifive_pdma: claim bit must be set before DMA transactions
  hw/dma: sifive_pdma: don't set Control.error if 0 bytes to transfer

Green Wan (1):
  hw/dma: sifive_pdma: allow non-multiple transaction size transactions

 hw/dma/sifive_pdma.c | 50 ++++++++++++++++++++++++++++++++++----------
 1 file changed, 39 insertions(+), 11 deletions(-)

--
2.25.1



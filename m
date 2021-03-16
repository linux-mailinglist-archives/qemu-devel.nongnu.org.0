Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B141533E13D
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 23:16:12 +0100 (CET)
Received: from localhost ([::1]:34826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMHz1-00073N-Pu
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 18:16:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMHqm-0005dM-On
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 18:07:40 -0400
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734]:46246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMHql-0002aR-1v
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 18:07:40 -0400
Received: by mail-qk1-x734.google.com with SMTP id a9so36922410qkn.13
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 15:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=J1tKnZ+Z5Gv/Sv3p+d07e5sPy6aVH49CJw3OiYMO5w8=;
 b=lcRy+e895cMBOA2tKqV+iD5+Q846OBuz87DmOtpKXoxvxXoWW5cp0NwCZCL+MNpCqJ
 DxuHQwiNXawnSPNwlgvpl3nYmjfrdJuBidrnpNBlhIartT5GeK4fFSGiBXTp2g98Uv0Y
 isg9FGxpa2GSa47KjN2z/Je2GXcjm4Kv5YpzVcU8WCY5HBqNvelntby4pTMg9ze7sbU5
 KlthFpd0OIUhPkP1B4nTDbN20Amz67+TYKVcm2dPlRmdvLNKh6t2Tyig7HAgrzsEQrxA
 1RMGiuA5kZSOT9kfNlE1K5BUqI/zLqpOy2NZZF+T3KmwD7bJEOv3MgMGm9Fd2trM+IuX
 Tg6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=J1tKnZ+Z5Gv/Sv3p+d07e5sPy6aVH49CJw3OiYMO5w8=;
 b=HqSbtZVxvxkotxpxCFzSfGugmtiLm0eTV7Zn7e030vmyiu+Y7fPrtHEXZXQzzfc85D
 o+zLAKnzAL2KwtOVrK1aRG15o4AB7fkc9tgXUYsZ1b0NLYbFSlPp/igNGWUBC+OegTlB
 jlMBJD3O3PdqFiXsz/WMpim+6pPdorJTBSGn3Of2zbTfKP7CGCeqYkKnxLmYgWVzLG0b
 PQ9AmbD+ZuKdAuD3feTZaTyytiM+wAjtsxFvYB4e0bw0/rOwxISYoIb3XnFJzwn+mFDa
 oaSF9/N0yjgV50rz1mscnOloltc1X7hDiK2+/YJ3eOBx1MXrRVwKgCaCcN2pmiF4a+4E
 nlPA==
X-Gm-Message-State: AOAM532vLlfRcqQ4JBIF5zQsRaad04k0NF+FXWZstnpxhngfOybVJKPc
 qEQjjrdJR/O63/EKff3zQNLwhHxpE3JK5yXj
X-Google-Smtp-Source: ABdhPJzEUxBxbbSJK9j14GE38mn7AP7g1IDRhopMGpSVLC5m2RlvzA/dfVKZjmIcO5VujJvvMeajvQ==
X-Received: by 2002:a05:620a:1528:: with SMTP id
 n8mr1289307qkk.329.1615932457780; 
 Tue, 16 Mar 2021 15:07:37 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id n77sm16546918qkn.128.2021.03.16.15.07.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 15:07:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/5] tcg: Issue memory barriers for guest memory model
Date: Tue, 16 Mar 2021 16:07:30 -0600
Message-Id: <20210316220735.2048137-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::734;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x734.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FUZZY_BITCOIN=0.007,
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is intending to fix the current aarch64 host failure
for s390x guest cdrom-test.  This is caused by the io thread
issuing memory barriers that are supposed to be matched by
the vcpu, but are elided by tcg in rr mode as "unnecessary".

I know Peter would like a smaller patch to sync the io thread
with the vcpu thread.  I've made a couple of attempts at this,
but havn't managed to get something reliable (although now
irritatingly infrequent -- about 1 in 500).

I have further patches to further optimize barriers, and to
generate load-acquire/store-release instructions in tcg.
But it's late in the release cycle, etc etc.

I've done nothing to measure the performance impact of this.
I quit the cdtom-test cycle after 4000 passes.


r~


Richard Henderson (5):
  tcg: Decode the operand to INDEX_op_mb in dumps
  tcg: Do not elide memory barriers for CF_PARALLEL
  tcg: Elide memory barriers implied by the host memory model
  tcg: Create tcg_req_mo
  tcg: Add host memory barriers to cpu_ldst.h interfaces

 include/exec/cpu_ldst.h |  7 ++++
 include/tcg/tcg.h       | 20 +++++++++++
 accel/tcg/cputlb.c      |  2 ++
 accel/tcg/tcg-all.c     |  6 +---
 accel/tcg/user-exec.c   | 17 +++++++++
 tcg/tcg-op.c            | 19 +++++-----
 tcg/tcg.c               | 79 +++++++++++++++++++++++++++++++++++++++++
 7 files changed, 137 insertions(+), 13 deletions(-)

-- 
2.25.1



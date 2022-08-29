Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CEE5A40FA
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 04:13:20 +0200 (CEST)
Received: from localhost ([::1]:38838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSUH9-0000My-O7
	for lists+qemu-devel@lfdr.de; Sun, 28 Aug 2022 22:13:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oSUE8-0003RN-Vn
 for qemu-devel@nongnu.org; Sun, 28 Aug 2022 22:10:13 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:38597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oSUE7-0001b4-4h
 for qemu-devel@nongnu.org; Sun, 28 Aug 2022 22:10:12 -0400
Received: by mail-pg1-x532.google.com with SMTP id r22so6443944pgm.5
 for <qemu-devel@nongnu.org>; Sun, 28 Aug 2022 19:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=utqcsl5SCMWe0M/OxVEMVx6dMvkHqtyR4CX1E9ouDOk=;
 b=XAv0ZCdhntJNzHOUP0j+neCmCQHxsgy5Muzqd0iMs9l4rKAWswN11lS1uLHaFuO7VD
 +Vjj/LqCGRkDPGvW4Z+7pOnifkmNCevBOb36n1LYyu5fC9z9vObQP53f3cPMkRWYnm1q
 h3Cwi9w0CqMjUphkGO85Ax5vXa6E8MWFIPSxx0AgbLvkeo2mzMhK2kRoGZNleKgbhLvt
 5AmqckgqqGlj+1JnQWDiwtqT++Fg5HftZ63EfgAJjmAqwN1DPumnITu3aD1YEV2T1GDs
 q1x9TuLwPCtDypIhCaxeaWEDc7MDXR/vqnEGvtYaWRtItFFopcAptyEv8Emx+Ebuqknb
 dw0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=utqcsl5SCMWe0M/OxVEMVx6dMvkHqtyR4CX1E9ouDOk=;
 b=MiXNS+QxTVWRyeTCWVp14B8BRFhMidhNQ1d1rMRgyKc/r8gyuhI0Cn2OxYjnny2OT1
 OR72mR03dfO23fCTpfticIZETh4jq7hWW1ZNks41ybYzCfCvZ1juPZzipKyl32wtibYA
 H9DmG5tAF4+pSraN8CRFhHz7h5V86qz9K4tlbYuLpWG/d4u6WaRkeq3RIrbcM4fTmFAg
 zQ1Bb7Q2vEj6fYDrvkzCVOS4aWFrOrKap48qmB27kzPMwQFnCVhBMhq8Lfobml+IcoSc
 PLnYIhEvKNfHNcTH654m9e+NDZxowgmls8uO0hq6OpOyAPSjP+G+JrwTFsWbrLrYwcjr
 3Mlg==
X-Gm-Message-State: ACgBeo1GlA+HJFJXHwYuKbDjoiwdIH8k8thEzvx3KkkZKg6+5EI/GaHi
 GmMV4GLJVC/98FDuamqehStV9VYuuf/ysQ==
X-Google-Smtp-Source: AA6agR6U/946vn0ObA/7tjp2keOkiplgs2Vtsw4A70z0ULVtHt2U5yzAdZWzEOreLtnA2z+NzfR1hw==
X-Received: by 2002:a62:1795:0:b0:536:4e84:5ee9 with SMTP id
 143-20020a621795000000b005364e845ee9mr14536495pfx.52.1661739009017; 
 Sun, 28 Aug 2022 19:10:09 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:2fa6:2ab5:a96e:2a35])
 by smtp.gmail.com with ESMTPSA id
 ik30-20020a170902ab1e00b0016bdc98730bsm6035139plb.151.2022.08.28.19.10.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Aug 2022 19:10:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu
Subject: [PATCH 0/8] linux-user: Futex improvements
Date: Sun, 28 Aug 2022 19:09:58 -0700
Message-Id: <20220829021006.67305-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fixes a bug in FUTEX_FD, and implements a bunch of other ops.
Also, some assorted strace fixes.

r~

Richard Henderson (8):
  linux-user: Combine do_futex and do_futex_time64
  linux-user: Sink call to do_safe_futex
  linux-user: Implement FUTEX_WAKE_BITSET
  linux-user: Convert signal number for FUTEX_FD
  linux-user: Implement PI futexes
  linux-user: Update print_futex_op
  linux-user: Lock log around strace
  linux-user: Log tid for strace

 linux-user/syscall_defs.h |   3 +
 linux-user/strace.c       | 130 ++++++++++++++++++++++----------------
 linux-user/syscall.c      | 125 ++++++++++++++----------------------
 3 files changed, 125 insertions(+), 133 deletions(-)

-- 
2.34.1



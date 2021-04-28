Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6609936DFC2
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 21:43:10 +0200 (CEST)
Received: from localhost ([::1]:37618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbq5V-0004tM-F7
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 15:43:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbpws-0005o6-TR
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 15:34:14 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:42544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbpwo-0004Zb-SY
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 15:34:14 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 j6-20020a17090adc86b02900cbfe6f2c96so9680503pjv.1
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 12:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VN8zDpwjQhdM/PGDzieIjwlaBmqKhQTRODbF2sbw7Zs=;
 b=AMTR8urlcowSfou01NvEVa1OT6naZFYVI0f/xicsBo5Xj+wVKMcHZkfkwbzvyk/wGn
 6tpswtImKHhZ6cos+9Qby7LarU23iYFIr/RF+f2tJoTK6m5us8jcg4KHxeZzuDGLEeup
 X2hrRt17IFPn8CrBRuRp7yRtDq8p4jVw+wBAmWVLy04HHs9TXpof0BP1xGzHO+ytsTrQ
 UKln+5hm6oy6m3/DNW9MD7YQvUJEmUvkQ1Hl9zxo1StRMInw4dvE7ppwWOvoDbwsIZH5
 9rakjoD2fb2dMdgec12EgFEvBVPcr1q3HLIflhCdT4FYJRJ/DC4+KMarYPR4Acxm/MY3
 VEtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VN8zDpwjQhdM/PGDzieIjwlaBmqKhQTRODbF2sbw7Zs=;
 b=ZqtuoGTE7EcJRccmyhEJIS2RUtkQJkpWSp/NR5SDgDfA/W+zgaH5twPhBwnqPatE4m
 YLLt3pzjBSFxXiAp3f16uRuhphQn25PE0oPyGDvmSEH4PzDM/1UsdedhLc+3KTgJvEyg
 my4U+JqUNO0T0HOFVfgKJBaSU9S74PmQawhapXVX1Lj/wKIcgBxFHZIpq0TgfB5/rAP5
 V+DgXcUS4Aj4VMU2JSJSNhflIzBVea9gEx51BiVKzj4GT6jqIeJ/XfJbVY92VbyDrEug
 Vivg5dzF3LiUfqEgRgZId9nlttyG1AmvNq4gzGQ4hdXVy4LpbfbQamTKh089D8ldUoWc
 OAyQ==
X-Gm-Message-State: AOAM533nDxUh4mQqj3+UutiRzTd3IgUnIdzhgb/zV6/alb4a+xzTgzTp
 hEAnhfbYxMx02vbVUjKgljqVCX0ArTYvOA==
X-Google-Smtp-Source: ABdhPJzLCx37LWBkHVLQaZHNO5DlfWmtsTh7RXGtyHkLQakzd3hIVPVjZz9VCb+CYKWqpxuzI1e27Q==
X-Received: by 2002:a17:902:b947:b029:ec:b04d:c8a2 with SMTP id
 h7-20020a170902b947b02900ecb04dc8a2mr32257777pls.2.1619638449348; 
 Wed, 28 Apr 2021 12:34:09 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id h21sm403725pfo.211.2021.04.28.12.34.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 12:34:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/15] linux-user/s390x: some signal fixes
Date: Wed, 28 Apr 2021 12:33:53 -0700
Message-Id: <20210428193408.233706-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: thuth@redhat.com, qemu-s390x@nongnu.org, cohuck@redhat.com,
 laurent@vivier.eu, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Version 2 splits lazy do-it-all patch.
Patch 1 has an additional fix, so I dropped the r-b.

r~

Richard Henderson (15):
  linux-user/s390x: Fix sigframe types
  linux-user/s390x: Use uint16_t for signal retcode
  linux-user/s390x: Remove PSW_ADDR_AMODE
  linux-user/s390x: Remove restore_sigregs return value
  linux-user/s390x: Fix trace in restore_regs
  linux-user/s390x: Fix sigcontext sregs value
  linux-user/s390x: Use tswap_sigset in setup_rt_frame
  linux-user/s390x: Tidy save_sigregs
  linux-user/s390x: Clean up single-use gotos in signal.c
  linux-user/s390x: Set psw.mask properly for the signal handler
  linux-user/s390x: Add stub sigframe argument for last_break
  linux-user/s390x: Fix frame_addr corruption in setup_frame
  linux-user/s390x: Add build asserts for sigset sizes
  linux-user/s390x: Clean up signal.c
  linux-user/s390x: Handle vector regs in signal stack

 linux-user/s390x/signal.c | 280 +++++++++++++++++++++++---------------
 1 file changed, 170 insertions(+), 110 deletions(-)

-- 
2.25.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3654140EB
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 06:59:32 +0200 (CEST)
Received: from localhost ([::1]:48166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSuLy-0000fi-VQ
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 00:59:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mSuJM-0006VE-Uh
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 00:56:48 -0400
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e]:44667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mSuJK-0007eB-MP
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 00:56:48 -0400
Received: by mail-io1-xd2e.google.com with SMTP id y197so1676959iof.11
 for <qemu-devel@nongnu.org>; Tue, 21 Sep 2021 21:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sdYFe+XaAbJ2lLlSpnamIeeO0RoAtUjMZem4Y7kI5W8=;
 b=evprAlhCQpt3B822desCUloEQqKDArsFfD2rfBNsSXFKuS1U8Y9+HzJfKbkAh0NNGR
 NDbFMjKxA4WP7MYfErp5FL7vAe9j9c+CzazEZTelKa5yfJ861ogY3XjsmMq6N9ohAX0o
 nPJKgXCb1azWv3OE3WcakONIqN/BhEkRBbwOGbSN5DZ/HZ/jkqA91kPNlIOXX9AhBw03
 EtANnl1C+WAJMn/nUSi3o9K39X8mv1MXkomNuXj3qKBbilBhwuMrvYLSa/EjWTFxM1Eo
 XPtPqdMqlNHWvQZJFvLZCrt70b8VhdbH/psA73zq5t+ilTQl796+IV4k3ZY8lkBFma1/
 f8TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sdYFe+XaAbJ2lLlSpnamIeeO0RoAtUjMZem4Y7kI5W8=;
 b=LwXkxcR8Jf8rudUI+9+LPK0nzx6FDZCrNo/4ExOk+mqPpfwPPmB7wv6UwKdrg1nz8v
 EiHRWUn5D+rGKMTrN0AGPuZ4D/iWw3JGSRRHezaFn4rCKrAguOHviMJc+rJCK0xC6QTE
 QX6V2eOONW2BYd/jGfWz5ejw9HnG4nCVOoIU/euH/tmGv8JWkLSo01wdS5OYERw9yAwF
 TwF2+qqLxTDJ2C19zsKJDT6dPsee+Nejoic8LYx0KRXMYFfQGHSk/QN3G1dSquicVaJI
 iINV2am7m+V0UwjjBEZHYQ53OlLccmuoCK58O8Y5CFqpQiG8Tf2QjkmHl4JsdIpwVUbb
 OBXQ==
X-Gm-Message-State: AOAM530VWE4m8n+aKmqGzMjqGGsBWWJVSPebU26EWRy7lbwG72IROdh/
 zwOhMW2aEhPJt03QDmMTe+3IobyqLrIbt7mdV9o=
X-Google-Smtp-Source: ABdhPJznUwSj/XbS8Pd/X9foZGTctsRAibn9bIrVM+sUIm2G05QnjwPnGbBGuaEmlWy2STQBQhY2Yw==
X-Received: by 2002:a5d:8185:: with SMTP id u5mr2885325ion.173.1632286604459; 
 Tue, 21 Sep 2021 21:56:44 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id j5sm512833ilk.58.2021.09.21.21.56.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 21:56:44 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/9] bsd-user mmap fixes
Date: Tue, 21 Sep 2021 22:56:27 -0600
Message-Id: <20210922045636.25206-1-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: kevans@freebsd.org, richard.henderson@linaro.org, f4bug@amsat.org,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series synchronizes mmap.c with the bsd-user fork. This is a mix of old bug
fixes pulled in from linux-user, as well as some newer fixes to adress bugs
found in check-tcg and recent FreeBSD developments. There are also a couple of
style commits.

v2: do the cherry-picks from linux-user in qemu-style.

Guy Yur (1):
  bsd-user/mmap.c: Don't mmap fd == -1 independently from MAP_ANON flag

Kyle Evans (1):
  bsd-user/mmap.c: Implement MAP_EXCL, required by jemalloc in head

Mikaël Urankar (2):
  bsd-user/mmap.c: Always zero MAP_ANONYMOUS memory in mmap_frag()
  bsd-user/mmap.c: check pread's return value to fix warnings with
    _FORTIFY_SOURCE

Warner Losh (5):
  bsd-user/mmap.c: MAP_ symbols are defined, so no need for ifdefs
  bsd-user/mmap.c: mmap return ENOMEM on overflow
  bsd-user/mmap.c: mmap prefer MAP_ANON for BSD
  bsd-user/mmap.c: line wrap change
  bsd-user/mmap.c: assert that target_mprotect cannot fail

 bsd-user/mmap.c | 69 +++++++++++++++++++++++++------------------------
 1 file changed, 35 insertions(+), 34 deletions(-)

-- 
2.32.0



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC29C382994
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 12:13:25 +0200 (CEST)
Received: from localhost ([::1]:59754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liaFY-0004sp-Mq
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 06:13:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lia8J-0004kv-6f; Mon, 17 May 2021 06:05:56 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:37808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lia8H-0001eM-2p; Mon, 17 May 2021 06:05:54 -0400
Received: by mail-ej1-x636.google.com with SMTP id et19so1238848ejc.4;
 Mon, 17 May 2021 03:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NzsmSw0im+jZi3pBSWvhIDCfGwwRb47dYmbnqAOnC5Q=;
 b=RTQD7GMcca8wBI4Mr1hCtO6cbJRU/POjRzxvtKspE1xh19ivryqBi7xBHiRaa/aPQ0
 QakUmsAe2NoQcP1VuRFNtouqsCOsNWZTzZVtn3CHncg4zc+KPU1u2e0SQmoisUavOSvF
 nho775VniAREzWspu+buE5NyPJ9xhKtU7Bh8ZcvuRzgAasOo9E8yMqSJ9k+3dwL7Bgry
 4qSjGLfkDcWGQXGbBsszR5OQ6sZLff51MJCRB8JiG5jPoqyIfJQUQaIcJCJiLEcnqZwS
 Wr1ZWc2fGWkyjYPH0SOms7fRoqe1bhYEB5rJ2Nrp2Qlc2OLNv3jrzO5kHkedCaRFb+bc
 t76A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=NzsmSw0im+jZi3pBSWvhIDCfGwwRb47dYmbnqAOnC5Q=;
 b=LcOhHlK9wMbartb4BCS9Qd/Cy7C8IFOepZ5/yu+HUpS7K2bUD189E3Me5OOZFyj8Fq
 NQ5hlpBv+BZip2uBBDQ3Vzerheeoib1UVjI/uwIB4gwZSyR//MX3KiRsDJmrgr2L0s6n
 B++eMCCdU1XPcQkRWaP5b7vVx1cdA4gQ5ANdU/TJQGDxi43JUcbEX1+hhr4crOyWed+6
 XoSqPRbocQ9q3xYdXeHpe75S/+E5V+lHSLQx7JOlE1bbyRV4s/mY2NQpeyOjOdhSMAYT
 yLAKyx6LG5Xyqntv1l8I6S7XHawZY39yYo1ZWdy5ycKFm1TyfOhC1TBCdYXQMkq7cVqt
 Zj2w==
X-Gm-Message-State: AOAM531eBHinT/oB+3mSrYzZF/m2/pYSSM6kSiY7nCof51turYqYajAX
 p32T2lPatryWE3nHoB3RNnYDsMXCi86c+Q==
X-Google-Smtp-Source: ABdhPJwcul9tmqqGssEwrISocpfdAWqsxAlLR0zwHp7PCaxEVkT9yhU0TCDGdcaDiR1PoyDuuD10zQ==
X-Received: by 2002:a17:907:7b9f:: with SMTP id
 ne31mr61826723ejc.139.1621245950517; 
 Mon, 17 May 2021 03:05:50 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id h9sm10659926ede.93.2021.05.17.03.05.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 03:05:50 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/6] coroutine: new sleep/wake API
Date: Mon, 17 May 2021 12:05:42 +0200
Message-Id: <20210517100548.28806-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: eesposit@redhat.com, vsementsov@virtuozzo.com, stefanha@redhat.com,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a revamp of the qemu_co_sleep* API that makes it easier to
extend the API: the state that is needed to wake up a coroutine is now
part of the public API instead of hidden behind a pointer-to-pointer;
the API is made more extensible by pushing the rest of QemuCoSleepState
into local variables.

In the future, this will be extended to introduce a prepare/sleep/cancel
API similar to Linux's prepare_to_wait/schedule/finish_wait functions.
For now, this is just a nice refactoring.

Paolo

v1->v2: comment and commit message updates in patches 3, 5 and 6

Paolo Bonzini (6):
  coroutine-sleep: use a stack-allocated timer
  coroutine-sleep: disallow NULL QemuCoSleepState** argument
  coroutine-sleep: allow qemu_co_sleep_wake that wakes nothing
  coroutine-sleep: move timer out of QemuCoSleepState
  coroutine-sleep: replace QemuCoSleepState pointer with struct in the
    API
  coroutine-sleep: introduce qemu_co_sleep

 block/block-copy.c          | 10 ++---
 block/nbd.c                 | 14 +++----
 include/qemu/coroutine.h    | 27 ++++++++-----
 util/qemu-coroutine-sleep.c | 75 +++++++++++++++++++------------------
 4 files changed, 64 insertions(+), 62 deletions(-)

-- 
2.31.1



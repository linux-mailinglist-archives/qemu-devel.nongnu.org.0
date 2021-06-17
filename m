Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE363AA874
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 03:13:50 +0200 (CEST)
Received: from localhost ([::1]:59730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltgbM-000713-VW
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 21:13:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltga7-0005iG-8O
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 21:12:31 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:46796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltga3-0001bL-CL
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 21:12:31 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 o10-20020a17090aac0ab029016e92770073so2852702pjq.5
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 18:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vDuDxOS0b43Z5EQvm49C4vqgLMC9XefMxHazpXvkYF8=;
 b=bUyKXahbTW8B+zt+tL3N3EulBFYDEb4Gamo7++7mYUYOTjvmYBnVh9CjRjhJmkmcV4
 A0kEXQAS4o+pWEqfoy3gmUIXjRg+hytlbZUwNgrAUGZ4GMUQkX6yj8g6zbSA0B4f3h9R
 nZSJff1X2JDnfjgbrCBCVGkVUz9haYJwfo3rttuPFfvL0yPpSy4gdTDpSjlHMQC/wZK4
 W5sFeUIufsgpiSlJmOohE8kuDvFXDTv+TC3UOFYI9tUgwu7xuOL8fUbaoQDbRUBFxjTx
 YoHNcFyu1K3kTMz752JvC2ThlRtYRtbu8iHPBO2LPs42ShcIuaP0khHjb4++woRWSEZI
 eRwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vDuDxOS0b43Z5EQvm49C4vqgLMC9XefMxHazpXvkYF8=;
 b=MkGa3qy57bZCAxJeRbSbtz2kSyhk0qs73IAOQI6PJGsmvjRiXJeIiFqkawrGjobQw+
 x6fNTispGrT6ZWzMAIFh8T8Ibw7rIclecpgsnNA34bMqMCB4DFN0VJObtKqHvfk/BA/6
 tMlP8s6yT/QyNOweSQgdux/bm9+hEElyxy/eN5TfEuZtwF/wSkS2twLYQJsfE1XiE3Dc
 TORdgNYu5O0/Vp5hTQW2bM42SjRBOdI4RD3peGonjCOQm+CL9V8p5dwFJoGccOtuss2e
 QyjlieIlO19eLdgwEF5/Xn3doYXKFcsyRpLJ5ypw+hwtDO5kMSbqhsBrgAv+7xBDydMZ
 7Tug==
X-Gm-Message-State: AOAM530vZa9lyNR55txgqyudnT3njzVnhDMYtLj9+IWWCFFdEscJ4wQt
 M04SCEkp6GLWxy7GY/Jj099pLONdXni/mQ==
X-Google-Smtp-Source: ABdhPJwHjdirl7cr6b2YdVHaTud4UdAmpZGcyTjxqBIoBbNenRD4CdFfiOTb2YtKzQqsFpIzHXiP6A==
X-Received: by 2002:a17:90b:f90:: with SMTP id
 ft16mr13749411pjb.45.1623892345501; 
 Wed, 16 Jun 2021 18:12:25 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id j19sm3470829pgm.44.2021.06.16.18.12.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 18:12:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/1] accel/tcg: Fix #390 and other atomicity musings
Date: Wed, 16 Jun 2021 18:12:23 -0700
Message-Id: <20210617011224.1602932-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
Cc: alex.bennee@linaro.org, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This fixes some bugs reported against 128-bit atomic operations.

Just a note that the ppc insns that uses this, LQ and STQ, do not require
atomic operations if the address is unaligned, or if the address does not
resolve to ram.  So for some things we are working harder than required.

I've also had a good read of Power's atomicity requirements, for all
instructions.  It requires that the lsb of the address control the
minimum atomicity.  E.g. for (addr % size) == 2, each 2-byte component
must be atomic.

Which is certainly not what we're doing at the bottom of our memory
model at present.

I've also been reading up on Arm's FEAT_LSE2, which is mandatory for v8.4.
This vastly strengthens the single-copy atomicity requirements for the
whole system.  Strikingly, any access that does not cross a 16-byte
boundary -- aligned or unaligned -- is now single-copy atomic.

In both cases, I would imagine that we should only allow the softmmu
fast path for aligned accesses.  That's single-copy atomic on all hosts.
But then we need different handling for each platform at the bottom
of cputlb...

Suggestions on ways to approach this that aren't overwhelmingly ugly?


r~


Richard Henderson (1):
  accel/tcg: Probe the proper permissions for atomic ops

 accel/tcg/atomic_template.h | 24 +++++-----
 accel/tcg/cputlb.c          | 95 ++++++++++++++++++++++++++-----------
 accel/tcg/user-exec.c       |  8 ++--
 3 files changed, 83 insertions(+), 44 deletions(-)

-- 
2.25.1



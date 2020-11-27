Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA612C6D63
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 23:53:06 +0100 (CET)
Received: from localhost ([::1]:37858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kimbx-0002cO-Tn
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 17:53:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kimaY-0001hj-05
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 17:51:39 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:43785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kimaS-00058C-PU
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 17:51:37 -0500
Received: by mail-wr1-x442.google.com with SMTP id s8so7041042wrw.10
 for <qemu-devel@nongnu.org>; Fri, 27 Nov 2020 14:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QTGrTaVuJuSiVBQceY38No+SvKJpSGjN4L431x5ESuU=;
 b=uA7aNYPcL/V5XuZrNBtEfXoVFPl4a32m1gcxozxlqX3wAkvIwrItVh5Vq/FhVP3uqU
 pvDH1dnE77Asf4W7nV/TlHX707X9IxjVILtS/roPYUCnAVWC4FMPhJ9p3I5mEaLfRx42
 toRuZf01URAWeK7D0sw0+VeCECKc3mafMlk3PE3yYs35198Arg/tqoPJTIVsh7LvMSM9
 OvqZnyjiaRzDT+Qb5gZQzRPpHCYzPp6iKDeFiKOAhS0iwmm3FV50e+pIlxvHIc69GRZl
 11R3XUbUKTmy0AFUSJYYvQUHBaFAEEWdxxcnWpwM6zJf61eR9k6Jsb/O+/1Nu+NoakyR
 fhKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QTGrTaVuJuSiVBQceY38No+SvKJpSGjN4L431x5ESuU=;
 b=E2A7jDwzkvjC9jznVMVTeMR4msgirhvaiGu9EV6xEdi/TMa+mpDjhUBN+lkIurHrPQ
 0m5LXrryCeaRWHCCC50QXx6h2W6ZVZwfB+19JcfTJ0ekLD8BAABKo+CbjIoaDqRS7nzx
 2qILMHOCQazd7dqfWC8E9pZA0zLZ4/R37F9BS7nSWLqNGapqPxned0aY0E07pWstTFyv
 zy3RJSU6Qx90wKneVqSfbmOxamCA0BTC94cx7CvV/yYkgZcngW1+Gk1oCKOiAj+0ymdg
 7Ms8Sc0k2KxULrw9MY3R6AelY3xAXQf6MXC0GKO4HvAO9zXtVlagbQaA3SdhzI04zIfB
 EwAA==
X-Gm-Message-State: AOAM530RyBFoWoOTY1xs8Owu+fy1wAEepbPuanOowdttOH673/n7O7VZ
 sU4qdYScPYDNr3whilHJU1zId64ClmC5Jg==
X-Google-Smtp-Source: ABdhPJz5JG3rozEmKSjYFXMMQ4izdA/rO4+QSzvkXPr4uFmS6hTuo8wW6ME623/n3ADjV94CbJAY3w==
X-Received: by 2002:a5d:634d:: with SMTP id b13mr13924955wrw.310.1606517489749; 
 Fri, 27 Nov 2020 14:51:29 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q16sm17429756wrn.13.2020.11.27.14.51.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2020 14:51:28 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] target/openrisc: Move pic_cpu code into CPU object
Date: Fri, 27 Nov 2020 22:51:24 +0000
Message-Id: <20201127225127.14770-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x442.google.com
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
Cc: Stafford Horne <shorne@gmail.com>, Jia Liu <proljc@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The openrisc code uses an old style of interrupt handling, where a
separate standalone set of qemu_irqs invoke a function
openrisc_pic_cpu_handler() which signals the interrupt to the CPU
proper by directly calling cpu_interrupt() and cpu_reset_interrupt().
Because CPU objects now inherit (indirectly) from TYPE_DEVICE, they
can have GPIO input lines themselves, and the neater modern way to
implement this is to simply have the CPU object itself provide the
input IRQ lines.

The main aim of this patch series is to make that refactoring,
which fixes a trivial memory leak reported by Coverity of the IRQs
allocated in cpu_openrisc_pic_init(), and removes one callsite of
the qemu_allocate_irqs() function.

Patch 1 is a minor bugfix noticed along the way; patch 2 is
there to make the change in patch 3 simpler and clearer to review.

Tested with 'make check' and 'make check-acceptance'.

thanks
-- PMM

Peter Maydell (3):
  hw/openrisc/openrisc_sim: Use IRQ splitter when connecting IRQ to
    multiple CPUs
  hw/openrisc/openrisc_sim: Abstract out "get IRQ x of CPU y"
  target/openrisc: Move pic_cpu code into CPU object proper

 target/openrisc/cpu.h      |  1 -
 hw/openrisc/openrisc_sim.c | 46 +++++++++++++++++-----------
 hw/openrisc/pic_cpu.c      | 61 --------------------------------------
 target/openrisc/cpu.c      | 32 ++++++++++++++++++++
 hw/openrisc/Kconfig        |  1 +
 hw/openrisc/meson.build    |  2 +-
 6 files changed, 63 insertions(+), 80 deletions(-)
 delete mode 100644 hw/openrisc/pic_cpu.c

-- 
2.20.1



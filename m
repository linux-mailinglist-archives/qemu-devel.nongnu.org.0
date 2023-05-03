Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 428086F546E
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 11:18:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu8cd-0002jK-H6; Wed, 03 May 2023 05:18:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pu8cb-0002cL-I5
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:18:01 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pu8cZ-0000Lb-K9
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:18:01 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f315712406so15573475e9.0
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 02:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683105478; x=1685697478;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=l3OH7urWoHKg3VabeYBsA0ZRMxDZKatUQbuechO5qNw=;
 b=YmuKDp9GZm1If1WeBUbbyXQ7IJSbplU2ZXqkyiDYtrDe+uIbLdEkom47x+GW4us7G8
 nTk5BdqwvwfpH6OhQQEBbcqs8WRCFh3nN8Ln+qHafM3InZ7TQkebr9Y8yMki5KKm6YHI
 5Kw/769vg0YNgoEzt4oNpctlwov3Dvn5jJ3+N1VXyQ6RES0VHgqSmy0j7EiOfKob7L3T
 6gQkIdsDRYv+Qy4S3mK2aCK3w+51U2Zak09inVytl7Q3FhLjBulVZ76m/ESXzmUskQLA
 bpXsV8GB59jVukMC5TI/RVPSDSsQaTdKO3U5DoJo/j9FqDJrRyNHLmGTEgfScNvQdnCm
 He5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683105478; x=1685697478;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l3OH7urWoHKg3VabeYBsA0ZRMxDZKatUQbuechO5qNw=;
 b=OELzxOYfpNlfYPGgD5LnuJlQmlQPNA80eYP8yYIFyHYtb6MgqXaMULMJVycRaZ1xPv
 V0dsk7PnqgkegX68Y0NaQt7NIFupIJbyOO6GS1lIT5bNAddqREHtz8D3TvZ99sSkRVvd
 til5euOL36bsJMQA1kSC2Bezc0I1gJ/qPvGltjThKu4s5lSS5I6Tfmuc24QPv2VdD2mq
 oElhrIGCeeJhsjIh+RVh8g9woSjPW4IgU4tDqDxMTBtSCx3DfqxZyA0oenthSpiStn/2
 GYf53hVYjp5Vohvr9FdY8WpD9NCYoML3OTYYCtNRCVkNvaLLpFT/w+uDejUe/I6Rj2Wu
 T6PQ==
X-Gm-Message-State: AC+VfDypCoIrK5eofFKH79ODhkF7asyQGOingH3/Lc95L6Quafw/lfE5
 8aFXC/xLcjgVpMEbAtdJZwlwbA==
X-Google-Smtp-Source: ACHHUZ4GCAC1uxiFBCDNb70AYpyNtf1CDz4/a1Ovro7OFCs38qhPwkln3y1Ok3fdrMa8tEKCrAamRQ==
X-Received: by 2002:a5d:6741:0:b0:2f6:3930:fa7f with SMTP id
 l1-20020a5d6741000000b002f63930fa7fmr1085982wrw.7.1683105477829; 
 Wed, 03 May 2023 02:17:57 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 bl13-20020adfe24d000000b003062d3daf79sm7745595wrb.107.2023.05.03.02.17.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 02:17:57 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EEF771FFBB;
 Wed,  3 May 2023 10:17:56 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org,
	Stefan Hajnoczi <stefanha@redhat.com>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Kyle Evans <kevans@freebsd.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Riku Voipio <riku.voipio@iki.fi>, Yanan Wang <wangyanan55@huawei.com>,
 Eduardo Habkost <eduardo@habkost.net>, Greg Kurz <groug@kaod.org>,
 Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Blake <eblake@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 00/10] tracing: remove dynamic vcpu state
Date: Wed,  3 May 2023 10:17:46 +0100
Message-Id: <20230503091756.1453057-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Stefan,

The references dynamic vcpu tracing support was removed when the
original TCG trace points where removed. However there was still a
legacy of dynamic trace state to track this in cpu.h and extra hash
variables to track TBs. While the removed vcpu tracepoints are not in
generated code (or helpers) they still bring in a bunch of machinery
to manage the state so I've pulled them out. We keep and rename one
(cpu_reset) to a static trace points which dump vcpu->index as it is
useful to f4bug.

While most of the changes are excising bits of the tracing code I've
also cleaned up the xxhash function use and simplified the core
function to qemu_xxhash6.

v2 only has some minor changes to address review comments (c.f.
conversion of a tracepoint). Otherwise all the review comments have
been addressed and the series is fully review now.

Please queue into your tree.

Alex Bennée (10):
  *-user: remove the guest_user_syscall tracepoints
  trace-events: remove the remaining vcpu trace events
  trace: remove vcpu_id from the TraceEvent structure
  scripts/qapi: document the tool that generated the file
  qapi: make the vcpu parameters deprecated for 8.1
  trace: remove code that depends on setting vcpu
  trace: remove control-vcpu.h
  tcg: remove the final vestiges of dstate
  hw/9pfs: use qemu_xxhash4
  xxhash: remove qemu_xxhash7

 qapi/trace.json               |  22 +++----
 accel/tcg/tb-hash.h           |   6 +-
 include/exec/exec-all.h       |   3 -
 include/hw/core/cpu.h         |   5 --
 include/qemu/xxhash.h         |  17 ++----
 include/user/syscall-trace.h  |   4 --
 trace/control-internal.h      |  10 ---
 trace/control-vcpu.h          |  63 -------------------
 trace/control.h               |  48 ---------------
 trace/event-internal.h        |   2 -
 accel/tcg/cpu-exec.c          |   7 +--
 accel/tcg/tb-maint.c          |   5 +-
 accel/tcg/translate-all.c     |   6 --
 bsd-user/freebsd/os-syscall.c |   2 -
 hw/9pfs/9p.c                  |   4 +-
 hw/core/cpu-common.c          |   6 +-
 stubs/trace-control.c         |  13 ----
 trace/control-target.c        | 111 +++-------------------------------
 trace/control.c               |  28 ---------
 trace/qmp.c                   |  76 +++--------------------
 trace/trace-hmp-cmds.c        |  17 +-----
 hw/core/trace-events          |   3 +
 scripts/qapi/gen.py           |   4 +-
 scripts/tracetool/format/c.py |   6 --
 scripts/tracetool/format/h.py |  16 +----
 trace-events                  |  50 ---------------
 26 files changed, 48 insertions(+), 486 deletions(-)
 delete mode 100644 trace/control-vcpu.h

-- 
2.39.2



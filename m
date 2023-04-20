Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C65036E97DE
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 17:02:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppVls-0003l7-0q; Thu, 20 Apr 2023 11:00:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ppVlh-0003af-FV
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 11:00:17 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ppVle-00045f-EP
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 11:00:17 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f182d74658so5451805e9.0
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 08:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682002811; x=1684594811;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XBP9GX+3g7jnpQbho/wZSE31+XgbvM3Wes9mTCAwjIY=;
 b=LqloKtWzQxAA+SsGG55ds85QfkySzl6s1RT6Tj01LRqxfUUi+2iJyrL2h59a0/T3fB
 HcIhN/R9JsAeXon0P3aqGsq/IDl6PiRiN6MfOURfXSS8aQJtDP0EFGXMaGHJ2cAqbEjW
 EJw/h4fPaQlw/ljqoHen9q8xHszO73sLIvbkvcfHl8rLXBIkuEuZDNWlF8ZeC614njT0
 Y3nhVPbIdXT4H2/ddOxx/z8DIaEpovVPnYYUrAxCsvZLBn2AQ21j5YtC/l/nGAwmu6qV
 nogeHeWYnOtb880tDhf3H6040lv0OFYx4i/d1t3+hs0REdnNCJ5uRrxGW3+cx0exR71j
 4zXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682002811; x=1684594811;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XBP9GX+3g7jnpQbho/wZSE31+XgbvM3Wes9mTCAwjIY=;
 b=EQFeiFu0/URrlYeu2VLD/yOxnmrFDZ9wfiSHtMNa6o4LRL0uHG1roKLJmkxfPEa/5N
 t0R48Rc+tbnOW6GguMQupiARdBQOeb+1QDJCylpybztGDN2pQCCt/b9PMEL8nq29NCHP
 L08WSyTZvAZ0YVmqEzVlWuYNUMClpXqyfygQDDEakvROayYbQfxabAtSi/VWVY5WL+wl
 qqrP68gIGRr8uJvEiNKtjZKbm495dEQz7mvKaVawgEcsYtgALwY/PuKjr2E61PoBd76P
 tmTKJ1bosDPOfIjx9khIWdpcdlrar18rCY2RNFKCFkze6xDucDbRt3yjjII9nQ4Rttt8
 GJHw==
X-Gm-Message-State: AAQBX9dmqsJjzAU7HwFeDmXE8nnx52bblnCckodplYCyhfCxFhPj99tb
 mS0TDk4fmRGmZpTJE0a8qa0+ng==
X-Google-Smtp-Source: AKy350ZdmL5U2dwK/64gQONGDDDdO2bx3axX4HLMdjZ3+BSbj9sdnExmaJG24mnJMRoCa6lnOs5plA==
X-Received: by 2002:adf:ffc9:0:b0:2f2:4db4:1f5b with SMTP id
 x9-20020adfffc9000000b002f24db41f5bmr1730423wrs.29.1682002810812; 
 Thu, 20 Apr 2023 08:00:10 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 p6-20020adfe606000000b002ff1751ec79sm2146026wrm.65.2023.04.20.08.00.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 08:00:10 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E43151FFB7;
 Thu, 20 Apr 2023 16:00:09 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Michael Roth <michael.roth@amd.com>, Riku Voipio <riku.voipio@iki.fi>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Yanan Wang <wangyanan55@huawei.com>, Greg Kurz <groug@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kyle Evans <kevans@freebsd.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Warner Losh <imp@bsdimp.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 00/10] tracing: remove dynamic vcpu state
Date: Thu, 20 Apr 2023 15:59:59 +0100
Message-Id: <20230420150009.1675181-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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

The references dynamic vcpu tracing support was removed when the
original TCG trace points where removed. However there was still a
legacy of dynamic trace state to track this in cpu.h and extra hash
variables to track TBs. While the removed vcpu tracepoints are not in
generated code (or helpers) they still bring in a bunch of machinery
to manage the state so I've pulled them out. We could just replace
them with static trace points which dump vcpu->index as one of their
arguments because they don't happen that often.

While most of the changes are excising bits of the tracing code I've
also cleaned up the xxhash function use and simplified the core
function to qemu_xxhash6.

Please review.

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
 hw/core/cpu-common.c          |   4 --
 stubs/trace-control.c         |  13 ----
 trace/control-target.c        | 111 +++-------------------------------
 trace/control.c               |  28 ---------
 trace/qmp.c                   |  76 +++--------------------
 trace/trace-hmp-cmds.c        |  17 +-----
 scripts/qapi/gen.py           |   4 +-
 scripts/tracetool/format/c.py |   6 --
 scripts/tracetool/format/h.py |  16 +----
 trace-events                  |  50 ---------------
 25 files changed, 43 insertions(+), 486 deletions(-)
 delete mode 100644 trace/control-vcpu.h

-- 
2.39.2



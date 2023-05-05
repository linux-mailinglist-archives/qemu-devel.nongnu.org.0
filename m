Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A736F8647
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 17:55:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puxkj-0003Nw-44; Fri, 05 May 2023 11:53:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1puxkd-0003KT-KJ
 for qemu-devel@nongnu.org; Fri, 05 May 2023 11:53:43 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1puxka-0008Cz-J3
 for qemu-devel@nongnu.org; Fri, 05 May 2023 11:53:43 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f315712406so104946775e9.0
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 08:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683302018; x=1685894018;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hAbIGSO/ByX3t3XbpeNJdx3+XPcMcWKnVnO0xRyXXrc=;
 b=zDkDYwxLILIw54p54OActf2gm+rQAEGKDHoY82OIQ9nY12KEOH4sm2SXwqaTm2QcfJ
 7UjgINqNEDeHlwPP/g1n4WmfCGQox/P0/R1RPcf7Qbz5izQf1Hnp0CMyKLXdpZZxV653
 xMhZJQFhuSuyq1zDI58V8PpQKhiuvLvWtrP906M6cmYNeBdSnGWlXwtZdGZPbNzOsnzy
 5Rzu0xx4SnqL9boNR6zPVgEQyhE7o5xEpzb3ia8lIbfE7sJ28CPGcFvWfvXVxm8wJafh
 XbBc8EM5lEQEXmK6xOExXabexSdG1fPeesVvGl8zt8qFQGghlwX1fAAAGGBxeOoZryLg
 la/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683302018; x=1685894018;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hAbIGSO/ByX3t3XbpeNJdx3+XPcMcWKnVnO0xRyXXrc=;
 b=YCQzQxUp7A/TwFAeDCWmrjOmg8NfR7CN/aS22eamWkyqn8JN/nF9sQ+8NO37AgRK16
 lTlfMBhmXU+Wq9fdTX8iH6ynhL28Rj+SMPGonDQRI30F1bIBfUHgo+oEqK66upMXbG2b
 9ZwhhYDggjbAFy7f4LXhRScHBNNYp2pLIr/4Pq5JgicUnUUcp3SoTO2tB9yFjfi0dIe4
 TDnBNmOjpMm3uqSNZiX0GjI6mNfipSymxVGQcSVxKmu7A5kJZMGNMTP1tn6RArc11msM
 385TFWNzHX4IKLBapurPa5MaSlOi6LUUvEAEBNdIsFnQuUHP2vqPlE0irBOmUhgKfz8y
 km6w==
X-Gm-Message-State: AC+VfDzoDg+k0p2uadFxMhKRu1YE+VPYl0EWE8cpS+BIi/jLGemyS0/8
 KnWejlkjUSHDBgF3/+T2EQG4Dg==
X-Google-Smtp-Source: ACHHUZ7XJHWDkuJ3lZE8lxfHd2WlUf+nyR4T7uqomg+kUr4D2bTP+bwsRFPWQ2GrOnlAirhmVSRbAQ==
X-Received: by 2002:a5d:4090:0:b0:2fa:7203:5bae with SMTP id
 o16-20020a5d4090000000b002fa72035baemr5507691wrp.18.1683302017743; 
 Fri, 05 May 2023 08:53:37 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 u20-20020a05600c211400b003f183127434sm8336658wml.30.2023.05.05.08.53.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 08:53:37 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8A1A61FFBB;
 Fri,  5 May 2023 16:53:36 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Michael Roth <michael.roth@amd.com>, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Greg Kurz <groug@kaod.org>,
 Eduardo Habkost <eduardo@habkost.net>, Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 00/10] tracing: remove dynamic vcpu state
Date: Fri,  5 May 2023 16:53:26 +0100
Message-Id: <20230505155336.137393-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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

v3 fixes some minor comments and instead of simplifying to
qemu_xxhash6 we extend to qemu_xxhash8 so we can include cs_base. I've
added some initial benchmarks to the comments but you might want to
drop the last patch and leave it up to Richard to queue via his tree
once you've merged.

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
  accel/tcg: include cs_base in our hash calculations

 qapi/trace.json               |  22 +++----
 accel/tcg/tb-hash.h           |   7 ++-
 include/exec/exec-all.h       |   3 -
 include/hw/core/cpu.h         |   5 --
 include/qemu/xxhash.h         |  21 +++++--
 include/user/syscall-trace.h  |   4 --
 trace/control-internal.h      |  10 ---
 trace/control-vcpu.h          |  63 -------------------
 trace/control.h               |  48 ---------------
 trace/event-internal.h        |   2 -
 accel/tcg/cpu-exec.c          |   7 +--
 accel/tcg/tb-maint.c          |   5 +-
 accel/tcg/translate-all.c     |   6 --
 bsd-user/freebsd/os-syscall.c |   2 -
 hw/9pfs/9p.c                  |   5 +-
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
 26 files changed, 60 insertions(+), 480 deletions(-)
 delete mode 100644 trace/control-vcpu.h

-- 
2.39.2



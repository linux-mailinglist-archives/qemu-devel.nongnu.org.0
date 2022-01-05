Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3920484D0D
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 05:22:28 +0100 (CET)
Received: from localhost ([::1]:34670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4xog-0005D1-E8
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 23:22:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tonistiigi@gmail.com>)
 id 1n4xlA-00033A-Al
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 23:18:48 -0500
Received: from [2607:f8b0:4864:20::102b] (port=41942
 helo=mail-pj1-x102b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tonistiigi@gmail.com>)
 id 1n4xl8-0002IO-9r
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 23:18:48 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 b1-20020a17090a990100b001b14bd47532so5232605pjp.0
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 20:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yH677ySnRKUGMb+XRlWWYja73AQccfK8KR/qyOOvqXk=;
 b=pOoS+kmp/LfAOSeamuXbmOJJzigvOWx+eHnXDSIGG8aGbr4Ya8j3kQ38DPu1xQhHoP
 hKfeACqsw8d844iCaVpvY9anAXTVbKnfXUmiyGOklhbasXu1w7SwKM5Ad+fYeM9pg/Y8
 Ny6whLML/hewZcK3GfLiv8v301EYdJlfvr4AS1cRoHPfU6pHaF1zpEmkWEUQOxvDFi/W
 qNpkP69ruJCHoTRQxnL3BoplX5t68r9Vo6NDPTmXy6DbSyuKk8M9hECsYCU40gnz/Vvi
 R7jsPmpFTeAIbVDE/jzlr9IwyJVeCUcgqakzY6RezpeWQGGspQGJh9qSIuqFPQrFOlfn
 kBVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yH677ySnRKUGMb+XRlWWYja73AQccfK8KR/qyOOvqXk=;
 b=R0kV1xYWTOleLQKQzk3EcPphd8VIQMGtPAoGlsBMmv76TRjVSOoa9PxnisE2nefiAy
 HGzQ/JERyF3BnPonOHrCEr9V6le/Y0Qa2GfqDfrNavjaGUgBckR8kIqzEDih0vgINRDI
 5Cz2VIkLwc0parELH1pLwnaJgzzTgfnA/2QExqqCe0lbjJhYGOkBi/6vowGU46Idb/HR
 2zmm3QjSrx3W95elChZdMV+Dq6RKX25MaUipdW1xKBzNuE8xJy7hP5h1rx3DNT/0/hfe
 YXUWNMhgkYhAqkCAyDzfxJXYsJF+LuiwE7h4C32ooTDC3bvSTs6g0pnfMJWcmZxddU5y
 dRUg==
X-Gm-Message-State: AOAM530Rm3nfT/8zk1X0VjyQ2QOv9gCqDihUZk5wWqckjLyS7h0saCbj
 L2xnOcIT91wwJnKgoF709A9j2ZqaQgmD5A==
X-Google-Smtp-Source: ABdhPJxb7yAMjnaHheHFARmsUQzmCi4ZAt3lAD2RbAPQWZmFBA/AhPhCER/Rl/2mwFX8tL9wdVcerQ==
X-Received: by 2002:a17:90b:314e:: with SMTP id
 ip14mr1943540pjb.19.1641356324013; 
 Tue, 04 Jan 2022 20:18:44 -0800 (PST)
Received: from localhost ([2601:646:100:6be:50e6:7c07:b67:f135])
 by smtp.gmail.com with UTF8SMTPSA id d13sm38144667pfl.18.2022.01.04.20.18.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jan 2022 20:18:43 -0800 (PST)
From: Tonis Tiigi <tonistiigi@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/2] linux-user: fixes for sched_ syscalls
Date: Tue,  4 Jan 2022 20:18:17 -0800
Message-Id: <20220105041819.24160-1-tonistiigi@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=tonistiigi@gmail.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Tonis Tiigi <tonistiigi@gmail.com>, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patchset improves support for sched_* syscalls under user emulation.

The first commit adds support for sched_g/setattr that was previously not 
implemented. These syscalls are not exposed by glibc. The struct type needs
to be redefined as it can't be included directly before
https://lkml.org/lkml/2020/5/28/810 .

sched_attr type can grow in future kernel versions. When client sends
values that QEMU does not understand it will return E2BIG with same
semantics as old kernel would so client can retry with smaller inputs.

The second commit fixes sched_g/setscheduler and sched_g/setparam, when QEMU is 
built with musl. Musl does not implement these due to conflict between what 
these functions should do in syscalls and libc 
https://git.musl-libc.org/cgit/musl/commit/?id=1e21e78bf7a5c24c217446d8760be7b7188711c2
 . I've changed it to call syscall directly what should always be the expected 
behavior for the user.

Via https://github.com/tonistiigi/binfmt/pull/70
https://github.com/tonistiigi/binfmt/pull/73 with additional tests.


Changes v4->v3:
- host `sched_param` type is used for local syscalls
- Added check_zeroed_user() helper. This function takes kernel and userspace size
and checks if the extra padding is empty with same rules as kernel does. I also
tried with only one size parameter but doing all the `size-sizeof()` calculations
on caller side made the function quite useless.
- Defined local host version for `sched_param` so target and host types are defined
separately.
- Moved size type declaration to the beginning of the function.

Changes v3->v2:
- Fix wrong property name for sched_flags
- Validate size parameter and handle E2BIG errors same way as kernel does. There
is one case where it can't be done completely correctly but clients should still
be able to handle it: when client sends a bigger non-zero structure than current
kernel definition we will send E2BIG with the struct size known to qemu. If now
the client sends structure with this size it may still get another E2BIG error
from the kernel if kernel is old and doesn't implement util_min/util_max. I don't
think this can be handled without making additional syscalls to kernel.

Changes v1->v2:
- Locking guest addresses for sched_attr is now based on size inputs, not local 
struct size. Also did the same for setter where I now read only the size field 
of the struct first.
- Use offsetof() when checking if optional fields are supported.
- `target_sched_attr` now uses aligned types as requested. I didn't quite 
understand why this is needed as I don't see same in kernel headers, but as 
this type uses only constant width fields and is already aligned by default it 
can't break anything.
- Fixed formatting.
- Defined own `target_sched_param` struct as requested.

Tonis Tiigi (2):
  linux-user: add sched_getattr support
  linux-user: call set/getscheduler set/getparam directly

 linux-user/syscall.c      | 157 +++++++++++++++++++++++++++++++++++---
 linux-user/syscall_defs.h |  18 +++++
 2 files changed, 165 insertions(+), 10 deletions(-)

-- 
2.32.0 (Apple Git-132)



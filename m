Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C31650ECC1
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 01:43:05 +0200 (CEST)
Received: from localhost ([::1]:47032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nj8MC-0001PS-0v
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 19:43:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nj8IB-0006pq-Rs
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 19:38:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nj8I8-0007hc-Rt
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 19:38:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650929932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=a6ZC1D2S6iwiTJdZChBd9yf0KS03QRkc+jL+xfN7BUI=;
 b=irtQe0T9gmuQ3+e4UyzFTUMpPzlDq9MLiFY0L5kud7tp01XuD3zjkhEPQ+o/sntebML+uV
 swSMonGxvuKKH8+hA9vh93wDoFIma8uBwx7Blm73e/tG9UYUHFVi9VUZMLeUQCkJC1CizZ
 z8n+0ddX9vDJ3lRmHPe8bj6cwxbN5Ew=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-375--KfmoBaIPiSq4YaeNcQ0nQ-1; Mon, 25 Apr 2022 19:38:51 -0400
X-MC-Unique: -KfmoBaIPiSq4YaeNcQ0nQ-1
Received: by mail-il1-f200.google.com with SMTP id
 y19-20020a056e02119300b002c2d3ef05bfso6900870ili.18
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 16:38:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a6ZC1D2S6iwiTJdZChBd9yf0KS03QRkc+jL+xfN7BUI=;
 b=EJliHwsG2Kei7ecIisoDLraEIUnQldev9OWlxLmBiWI7w9ATID6NJmwTw6uGq0zK/L
 T4knRgx/7/D7vbtDhpSXNnH2dO4Lv77ZZn9V5vlfHAvkr7UcRay659kOYSmrwzoVdjFz
 WFiDLwIvUsMarDGIAxIbrJEZN2Mc1WyTH8RLbKkwbv/GnRTD7dOY0GB5UiVWh88+Pabh
 vEwPbWMJVMm8y/S0JZRCAD4ljojUGYpMx8tSC81sOC1nWZk5gFk0d3aNd6fDp/TA4wGv
 TQ5gTbk3FrPqJSIqlTMG6e3pvOKyfJOzQCF13hesvVjEGhIIZWvrX+KcvTk4NPaOPWSE
 z+mA==
X-Gm-Message-State: AOAM531vYV2EcuNaNKgfNWN9iljOALCt+3iv1WHkLeEtmmgetzqvwmk4
 3Z/YenZGHwpE5hKJCp5UzcAmdHoXdvQ4YNknLEx2QXNE1UqPJorJpF0MqttDqJQFXNqccyisZ2D
 c/Qotud3JgivAFl3mMUBdPWxK60bxljbTWuRmV4pwHYagvsfGFMAJZPGnnwDYFfB0
X-Received: by 2002:a92:cf01:0:b0:2cd:aeb6:b3f8 with SMTP id
 c1-20020a92cf01000000b002cdaeb6b3f8mr891540ilo.265.1650929930104; 
 Mon, 25 Apr 2022 16:38:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwquyagT/q2JFQeZwAHeG6v5c9SonSOH8qXmZLCMWGSG2+gvBA/14/RyB1K/IA2AnD0HrCbiA==
X-Received: by 2002:a92:cf01:0:b0:2cd:aeb6:b3f8 with SMTP id
 c1-20020a92cf01000000b002cdaeb6b3f8mr891528ilo.265.1650929929772; 
 Mon, 25 Apr 2022 16:38:49 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a92c087000000b002cd809af4e4sm5435072ile.56.2022.04.25.16.38.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 25 Apr 2022 16:38:49 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 00/21] migration: Postcopy Preemption
Date: Mon, 25 Apr 2022 19:38:26 -0400
Message-Id: <20220425233847.10393-1-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is v5 of postcopy preempt series.  It can also be found here:

  https://github.com/xzpeter/qemu/tree/postcopy-preempt

RFC: https://lore.kernel.org/qemu-devel/20220119080929.39485-1-peterx@redhat.com
V1:  https://lore.kernel.org/qemu-devel/20220216062809.57179-1-peterx@redhat.com
V2:  https://lore.kernel.org/qemu-devel/20220301083925.33483-1-peterx@redhat.com
V3:  https://lore.kernel.org/qemu-devel/20220330213908.26608-1-peterx@redhat.com
V4:  https://lore.kernel.org/qemu-devel/20220331150857.74406-1-peterx@redhat.com

v4->v5 changelog:
- Fixed all checkpatch.pl warnings
- Picked up leftover patches from Dan's tls test case series:
  https://lore.kernel.org/qemu-devel/20220310171821.3724080-1-berrange@redhat.com/
- Rebased to v7.0.0 tag, collected more R-bs from Dave/Dan
- In migrate_fd_cleanup(), use g_clear_pointer() for s->hostname [Dan]
- Mark postcopy-preempt capability for 7.1 not 7.0 [Dan]
- Moved migrate_channel_requires_tls() into tls.[ch] [Dan]
- Mention the bug-fixing side effect of patch "migration: Export
  tls-[creds|hostname|authz] params to cmdline too" on tls_authz [Dan]
- Use g_autoptr where proper [Dan]
- Drop a few (probably over-cautious) asserts on local_err being set [Dan]
- Quite a few renamings in the qtest in the last few test patches [Dan]

Abstract
========

This series contains two parts now:

  (1) Leftover patches from Dan's tls unit tests v2, which is first half
  (2) Leftover patches from my postcopy preempt v4, which is second half

This series added a new migration capability called "postcopy-preempt".  It can
be enabled when postcopy is enabled, and it'll simply (but greatly) speed up
postcopy page requests handling process.

Below are some initial postcopy page request latency measurements after the
new series applied.

For each page size, I measured page request latency for three cases:

  (a) Vanilla:                the old postcopy
  (b) Preempt no-break-huge:  preempt enabled, x-postcopy-preempt-break-huge=off
  (c) Preempt full:           preempt enabled, x-postcopy-preempt-break-huge=on
                              (this is the default option when preempt enabled)

Here x-postcopy-preempt-break-huge parameter is just added in v2 so as to
conditionally disable the behavior to break sending a precopy huge page for
debugging purpose.  So when it's off, postcopy will not preempt precopy
sending a huge page, but still postcopy will use its own channel.

I tested it separately to give a rough idea on which part of the change
helped how much of it.  The overall benefit should be the comparison
between case (a) and (c).

  |-----------+---------+-----------------------+--------------|
  | Page size | Vanilla | Preempt no-break-huge | Preempt full |
  |-----------+---------+-----------------------+--------------|
  | 4K        |   10.68 |               N/A [*] |         0.57 |
  | 2M        |   10.58 |                  5.49 |         5.02 |
  | 1G        | 2046.65 |               933.185 |      649.445 |
  |-----------+---------+-----------------------+--------------|
  [*]: This case is N/A because 4K page does not contain huge page at all

[1] https://github.com/xzpeter/small-stuffs/blob/master/tools/huge_vm/uffd-latency.bpf

TODO List
=========

Avoid precopy write() blocks postcopy
-------------------------------------

I didn't prove this, but I always think the write() syscalls being blocked
for precopy pages can affect postcopy services.  If we can solve this
problem then my wild guess is we can further reduce the average page
latency.

Two solutions at least in mind: (1) we could have made the write side of
the migration channel NON_BLOCK too, or (2) multi-threads on send side,
just like multifd, but we may use lock to protect which page to send too
(e.g., the core idea is we should _never_ rely anything on the main thread,
multifd has that dependency on queuing pages only on main thread).

That can definitely be done and thought about later.

Multi-channel for preemption threads
------------------------------------

Currently the postcopy preempt feature use only one extra channel and one
extra thread on dest (no new thread on src QEMU).  It should be mostly good
enough for major use cases, but when the postcopy queue is long enough
(e.g. hundreds of vCPUs faulted on different pages) logically we could
still observe more delays in average.  Whether growing threads/channels can
solve it is debatable, but sounds worthwhile a try.  That's yet another
thing we can think about after this patchset lands.

Logically the design provides space for that - the receiving postcopy
preempt thread can understand all ram-layer migration protocol, and for
multi channel and multi threads we could simply grow that into multile
threads handling the same protocol (with multiple PostcopyTmpPage).  The
source needs more thoughts on synchronizations, though, but it shouldn't
affect the whole protocol layer, so should be easy to keep compatible.

Please review, thanks.

Daniel P. Berrangé (9):
  tests: fix encoding of IP addresses in x509 certs
  tests: add more helper macros for creating TLS x509 certs
  tests: add migration tests of TLS with PSK credentials
  tests: add migration tests of TLS with x509 credentials
  tests: convert XBZRLE migration test to use common helper
  tests: convert multifd migration tests to use common helper
  tests: add multifd migration tests of TLS with PSK credentials
  tests: add multifd migration tests of TLS with x509 credentials
  tests: ensure migration status isn't reported as failed

Peter Xu (12):
  migration: Add postcopy-preempt capability
  migration: Postcopy preemption preparation on channel creation
  migration: Postcopy preemption enablement
  migration: Postcopy recover with preempt enabled
  migration: Create the postcopy preempt channel asynchronously
  migration: Parameter x-postcopy-preempt-break-huge
  migration: Add helpers to detect TLS capability
  migration: Export tls-[creds|hostname|authz] params to cmdline too
  migration: Enable TLS for preempt channel
  tests: Add postcopy tls migration test
  tests: Add postcopy tls recovery migration test
  tests: Add postcopy preempt tests

 meson.build                          |   1 +
 migration/channel.c                  |  10 +-
 migration/migration.c                | 146 +++-
 migration/migration.h                |  46 +-
 migration/multifd.c                  |   7 +-
 migration/postcopy-ram.c             | 186 ++++-
 migration/postcopy-ram.h             |  11 +
 migration/qemu-file.c                |  27 +
 migration/qemu-file.h                |   1 +
 migration/ram.c                      | 283 +++++++-
 migration/ram.h                      |   4 +-
 migration/savevm.c                   |  46 +-
 migration/socket.c                   |  22 +-
 migration/socket.h                   |   1 +
 migration/tls.c                      |   9 +
 migration/tls.h                      |   4 +
 migration/trace-events               |  15 +-
 qapi/migration.json                  |   8 +-
 tests/qtest/meson.build              |  12 +-
 tests/qtest/migration-helpers.c      |  13 +
 tests/qtest/migration-helpers.h      |   1 +
 tests/qtest/migration-test.c         | 997 ++++++++++++++++++++++++---
 tests/unit/crypto-tls-psk-helpers.c  |  18 +-
 tests/unit/crypto-tls-psk-helpers.h  |   1 +
 tests/unit/crypto-tls-x509-helpers.c |  16 +-
 tests/unit/crypto-tls-x509-helpers.h |  53 ++
 tests/unit/test-crypto-tlssession.c  |  11 +-
 27 files changed, 1779 insertions(+), 170 deletions(-)

-- 
2.32.0



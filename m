Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6A94ECEEC
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 23:43:15 +0200 (CEST)
Received: from localhost ([::1]:36274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZg5y-0004Np-JE
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 17:43:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nZg2B-0005eI-EJ
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:39:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nZg28-0005De-4t
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:39:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648676355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=r35lHW1jywZCFhCg+K5HzbhdN+hn/fmLUxOHmYEEHrk=;
 b=ZBZzgwhCrhgJrFFgH6TxdC4dynu32CYFFKhSUgC4PHAULNwYj36sKqhK1lIHAxzPJVgPxn
 cdm8ZkIOn0Yqkzla6NODj35k+2hqO6c8lM7GeyoZ3NDwQL/5HBDVn0msYH3FAo7rLeznQv
 hAZJmPU1kNxhELl9HqUEP3reJQBoH0A=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-132-UVGv5qQVNTG-yZDB2Fp04w-1; Wed, 30 Mar 2022 17:39:12 -0400
X-MC-Unique: UVGv5qQVNTG-yZDB2Fp04w-1
Received: by mail-qk1-f197.google.com with SMTP id
 b133-20020a37678b000000b0067d24942b91so13418548qkc.12
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 14:39:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=r35lHW1jywZCFhCg+K5HzbhdN+hn/fmLUxOHmYEEHrk=;
 b=K6scXdtrOTxCCY82hi/npp0uyAOCphD8JJF+4gEV23mo3peXMdLhO3VdyJTgNe9JAX
 LNBlZQXtLBUzt3ewexdp/FfZqwD7HJSy+zCc8vvDmHDLVbPUZ6TDGK2xyc2U69YXW0+Y
 HRwtTZ7Ph/fFeLm9zStmqSrdfSUTvizZtn/rV9eXtbRt0tSTuOrMuWup9+hcoIx3F8GV
 yGvIQtZxiIdKcxKWeHuPhLWRyGFJONEpX0I2zg1G0DyA66QnYWqt1PlLk7h/XafsnxWM
 926gAZxUqvLg5izMbIJcuNbEn0WG5sROCmtC9DA8BQrYmlDVqoS39va3mlyAXXny178X
 KbjA==
X-Gm-Message-State: AOAM531aQNVzBsywkIYLho2tmqO3p7mUS7I0pOWcnU4GFdp3rPDVKyeR
 ynPJVKyvKkR12D5TY16AL7oPXXmisnLyziVAfyHEcZp1ji+A1ThhT6/XgUfwhiItKglwhM0B5Px
 /LJBZe7+sZhpSvsSEkZM8dOY+5H0zxUFDxDknMGIVaZJTCVTyl5xyNpSYu/4icASn
X-Received: by 2002:ad4:594a:0:b0:441:5e50:471e with SMTP id
 eo10-20020ad4594a000000b004415e50471emr33011797qvb.45.1648676351505; 
 Wed, 30 Mar 2022 14:39:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzDRsLkivgwoRFMZjRcC0861UqsYRmmqqD8giCsFmjwBl7A0hSYYyNGXDBs7dV8gLo/QG0Adg==
X-Received: by 2002:ad4:594a:0:b0:441:5e50:471e with SMTP id
 eo10-20020ad4594a000000b004415e50471emr33011768qvb.45.1648676351132; 
 Wed, 30 Mar 2022 14:39:11 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 a23-20020a05620a16d700b0067e98304705sm11306313qkn.89.2022.03.30.14.39.10
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 30 Mar 2022 14:39:10 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/19] migration: Postcopy Preemption
Date: Wed, 30 Mar 2022 17:38:49 -0400
Message-Id: <20220330213908.26608-1-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>, peterx@redhat.com,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Not for 7.0 for sure; but post out for earlier review]

This is v3 of postcopy preempt series.  It can also be found here:

  https://github.com/xzpeter/qemu/tree/postcopy-preempt

RFC: https://lore.kernel.org/qemu-devel/20220119080929.39485-1-peterx@redhat.com
V1:  https://lore.kernel.org/qemu-devel/20220216062809.57179-1-peterx@redhat.com
V2:  https://lore.kernel.org/qemu-devel/20220301083925.33483-1-peterx@redhat.com

v2->v3 changelog:
- Rebased to master since many patches landed
- Fixed one bug on postcopy recovery when preempt enabled, this is only
  found when I test with TLS+recovery, because TLS changed the timing.
- Dropped patch:
  "migration: Fail postcopy preempt with TLS for now"
- Added patches for TLS:
  - "migration: Postpone releasing MigrationState.hostname"
  - "migration: Drop multifd tls_hostname cache"
  - "migration: Enable TLS for preempt channel"
  - "migration: Export tls-[creds|hostname|authz] params to cmdline too"
  - "tests: Add postcopy tls migration test"
  - "tests: Add postcopy tls recovery migration test"
- Added two more tests to the preempt test patch (tls, tls+recovery)

Abstract
========

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

Peter Xu (19):
  migration: Postpone releasing MigrationState.hostname
  migration: Drop multifd tls_hostname cache
  migration: Add pss.postcopy_requested status
  migration: Move migrate_allow_multifd and helpers into migration.c
  migration: Export ram_load_postcopy()
  migration: Move channel setup out of postcopy_try_recover()
  migration: Allow migrate-recover to run multiple times
  migration: Add postcopy-preempt capability
  migration: Postcopy preemption preparation on channel creation
  migration: Postcopy preemption enablement
  migration: Postcopy recover with preempt enabled
  migration: Create the postcopy preempt channel asynchronously
  migration: Enable TLS for preempt channel
  migration: Parameter x-postcopy-preempt-break-huge
  migration: Add helpers to detect TLS capability
  migration: Export tls-[creds|hostname|authz] params to cmdline too
  tests: Add postcopy tls migration test
  tests: Add postcopy tls recovery migration test
  tests: Add postcopy preempt tests

 migration/channel.c          |  11 +-
 migration/migration.c        | 215 +++++++++++++++++++++-----
 migration/migration.h        |  52 ++++++-
 migration/multifd.c          |  36 +----
 migration/multifd.h          |   4 -
 migration/postcopy-ram.c     | 190 ++++++++++++++++++++++-
 migration/postcopy-ram.h     |  11 ++
 migration/qemu-file.c        |  27 ++++
 migration/qemu-file.h        |   1 +
 migration/ram.c              | 288 +++++++++++++++++++++++++++++++++--
 migration/ram.h              |   3 +
 migration/savevm.c           |  49 ++++--
 migration/socket.c           |  22 ++-
 migration/socket.h           |   1 +
 migration/trace-events       |  15 +-
 qapi/migration.json          |   8 +-
 tests/qtest/migration-test.c | 113 ++++++++++++--
 17 files changed, 918 insertions(+), 128 deletions(-)

-- 
2.32.0



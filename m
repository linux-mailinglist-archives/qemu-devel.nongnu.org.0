Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2715B4B80B9
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 07:33:16 +0100 (CET)
Received: from localhost ([::1]:32956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKDsI-0006Qk-UN
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 01:33:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nKDns-0003tf-2N
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:28:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nKDnn-0006BZ-Dc
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:28:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644992911;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=IfYz64FhyR1+Y/3c9+UlHk4jX4zFAtudGxBPXX7XU0Y=;
 b=Rp/vwK8xTtOU2h/ZqXrRDpeiffSBVMGX21rltHLcCb3b9iOP9xTJoJ6qyf5UC/ALU4VfnH
 92ZE8KxLHCWIUS1VChodZjQI8p9BRQ2zc2DED6UhiP7RjS1nSGw9OdqE+V2kdjB9e8Wj8r
 rex50jkjVJ7hQvO3RX1OCFqY8MlirmQ=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-206-FlYP0V3lPwuVnnH8BUBhFQ-1; Wed, 16 Feb 2022 01:28:29 -0500
X-MC-Unique: FlYP0V3lPwuVnnH8BUBhFQ-1
Received: by mail-pj1-f72.google.com with SMTP id
 a15-20020a17090ad80f00b001b8a1e1da50so940547pjv.6
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 22:28:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IfYz64FhyR1+Y/3c9+UlHk4jX4zFAtudGxBPXX7XU0Y=;
 b=6lRDkR+rzLSBO5gwwPquSyF0x5LLH1tftILGpJGCu5h6nRpdZpyMWEMqN3mdTLZ8l2
 bIwrAO6huOPgunOCtWXdK0sp57V9E6CF+A23YKOEHwT7LPGEclD1ljw2Gircoa0kThYW
 c4gOQY+h6pSMtbOEQ6jnazF3epZNzAa2a9vBVGATyvW1Vkjna770eB6oEtRlwJhfyaXY
 L5hLiZUx+fU25Uc45O36U9RNDtPp3LpLWRMS7NBHv3Lxi3qM6d1XblpYFG35mUG9YGWH
 RFi2fX8nGCa/SQ8tP2tf5fP2gWXOuHa3a/qS0oyzkJg/Blvn6UCHQJQuAo80qaQ95Drs
 L9dg==
X-Gm-Message-State: AOAM531ziUH27OwfATtRYN7D4+nYQGgDoautV2zEPgLRRLHOZvUbi92Z
 PizsMEGdnPsNAfZGysYjYadQYRd8nuFRROwkyfG3efsz9X+daJmh9ODw3zGdCV18ZR2c96ukcfp
 OsTOVy0Gh/MKkdHE9e+Nwl41nIlNMjpbNYE1creiKqauz6dOFSMLIGLrLqrizJknv
X-Received: by 2002:a17:90b:ecf:b0:1b8:c0f1:3ae7 with SMTP id
 gz15-20020a17090b0ecf00b001b8c0f13ae7mr95116pjb.63.1644992907676; 
 Tue, 15 Feb 2022 22:28:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxXtVejDBQV6FMJW68rOL5qYfL9jrRtOkgej5Ez20mWTYlNWE3sxdX1JJELQhkAOd8dbdk06w==
X-Received: by 2002:a17:90b:ecf:b0:1b8:c0f1:3ae7 with SMTP id
 gz15-20020a17090b0ecf00b001b8c0f13ae7mr95083pjb.63.1644992907135; 
 Tue, 15 Feb 2022 22:28:27 -0800 (PST)
Received: from localhost.localdomain ([64.64.123.81])
 by smtp.gmail.com with ESMTPSA id 17sm42104657pfl.175.2022.02.15.22.28.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 15 Feb 2022 22:28:26 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/20] migration: Postcopy Preemption
Date: Wed, 16 Feb 2022 14:27:49 +0800
Message-Id: <20220216062809.57179-1-peterx@redhat.com>
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
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
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is v1 of postcopy preempt series.  It can also be found here:

  https://github.com/xzpeter/qemu/tree/postcopy-preempt

This series added a new migration capability called "postcopy-preempt".  It can
be enabled when postcopy is enabled, and it'll simply (but greatly) speed up
postcopy page requests handling process.

  |----------------+--------------+-----------------------|
  | Host page size | Vanilla (ms) | Postcopy Preempt (ms) |
  |----------------+--------------+-----------------------|
  | 2M             |        10.58 |                  4.96 |
  | 4K             |        10.68 |                  0.57 |
  |----------------+--------------+-----------------------|

The major change since RFC is:

  - The very large patch is split into smaller ones
  - Added postcopy recovery support, and its unit test

The RFC series actually broke postcopy recovery on huge pages, and this version
will also have that issue fixed.

Just a quick note: this series is partly preparing for the doublemap support
too in the future.  The channel separation speedup will be beneficial for both
current postcopy or when doublemap is ready.  The huge page preemption part may
only benefit current postcopy, and it won't be enabled in the future doublemap
support because in that new doublemap world there will have no huge pages at
all being mapped.

The new patch layout:

Patch 1-3: Three leftover patches from patchset "[PATCH v3 0/8] migration:
Postcopy cleanup on ram disgard" that I picked up here too.

  https://lore.kernel.org/qemu-devel/20211224065000.97572-1-peterx@redhat.com/

  migration: Dump sub-cmd name in loadvm_process_command tp
  migration: Finer grained tracepoints for POSTCOPY_LISTEN
  migration: Tracepoint change in postcopy-run bottom half

Patch 4-9: Original postcopy preempt RFC preparation patches (with slight
modifications).

  migration: Introduce postcopy channels on dest node
  migration: Dump ramblock and offset too when non-same-page detected
  migration: Add postcopy_thread_create()
  migration: Move static var in ram_block_from_stream() into global
  migration: Add pss.postcopy_requested status
  migration: Move migrate_allow_multifd and helpers into migration.c

Patch 10-15: Some newly added patches when working on postcopy recovery
support.  After these patches migrate-recover command will allow re-entrance,
which is a very nice side effect.

  migration: Enlarge postcopy recovery to capture !-EIO too
  migration: postcopy_pause_fault_thread() never fails
  migration: Export ram_load_postcopy()
  migration: Move channel setup out of postcopy_try_recover()
  migration: Add migration_incoming_transport_cleanup()
  migration: Allow migrate-recover to run multiple times

Patch 16-19: The major work of postcopy preemption implementation is split into
four patches as suggested by Dave.

  migration: Add postcopy-preempt capability
  migration: Postcopy preemption preparation on channel creation
  migration: Postcopy preemption enablement
  migration: Postcopy recover with preempt enabled

Patch 20: the test case.

  tests: Add postcopy preempt test

For more information, feel free to refer to the RFC series cover letter:

  https://lore.kernel.org/qemu-devel/20220119080929.39485-1-peterx@redhat.com/

Please review, thanks.

Peter Xu (20):
  migration: Dump sub-cmd name in loadvm_process_command tp
  migration: Finer grained tracepoints for POSTCOPY_LISTEN
  migration: Tracepoint change in postcopy-run bottom half
  migration: Introduce postcopy channels on dest node
  migration: Dump ramblock and offset too when non-same-page detected
  migration: Add postcopy_thread_create()
  migration: Move static var in ram_block_from_stream() into global
  migration: Add pss.postcopy_requested status
  migration: Move migrate_allow_multifd and helpers into migration.c
  migration: Enlarge postcopy recovery to capture !-EIO too
  migration: postcopy_pause_fault_thread() never fails
  migration: Export ram_load_postcopy()
  migration: Move channel setup out of postcopy_try_recover()
  migration: Add migration_incoming_transport_cleanup()
  migration: Allow migrate-recover to run multiple times
  migration: Add postcopy-preempt capability
  migration: Postcopy preemption preparation on channel creation
  migration: Postcopy preemption enablement
  migration: Postcopy recover with preempt enabled
  tests: Add postcopy preempt test

 migration/migration.c        | 184 +++++++++++++++-----
 migration/migration.h        |  64 ++++++-
 migration/multifd.c          |  19 +--
 migration/multifd.h          |   2 -
 migration/postcopy-ram.c     | 208 ++++++++++++++++++-----
 migration/postcopy-ram.h     |  14 ++
 migration/ram.c              | 320 +++++++++++++++++++++++++++++++----
 migration/ram.h              |   3 +
 migration/savevm.c           |  66 ++++++--
 migration/socket.c           |  22 ++-
 migration/socket.h           |   1 +
 migration/trace-events       |  19 ++-
 qapi/migration.json          |   8 +-
 tests/qtest/migration-test.c |  39 ++++-
 14 files changed, 803 insertions(+), 166 deletions(-)

-- 
2.32.0



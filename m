Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF1049364B
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 09:26:48 +0100 (CET)
Received: from localhost ([::1]:42400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nA6Io-0007Li-O0
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 03:26:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nA62T-0006xC-R1
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 03:09:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54139)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nA62P-0000t5-18
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 03:09:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642579786;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=kQGqAQwktNfg+/SKPgg4iEIF+aNCOGCgmk1kPBKoDPQ=;
 b=KDNJBnctCsxi1ESGSaTl/W9eWeZx2b5haQEaOcIIhFRGZ1AEA7YGC6OuMxuQ86cxQCVYbK
 d65O+Ab6mPOhWh82S8xsQ9D6LTPXxxtKwLkyx1fKBWJ7lLj3/oGZsn7r3Mi5KE/yig1TAj
 yDaQHN5dZF4tjuYtEQ+2BQJl5rgt8GE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-462-zlHujwcMNCWuMWd7AeOgwA-1; Wed, 19 Jan 2022 03:09:42 -0500
X-MC-Unique: zlHujwcMNCWuMWd7AeOgwA-1
Received: by mail-wm1-f70.google.com with SMTP id
 az10-20020a05600c600a00b0034d64b1203aso2395406wmb.4
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 00:09:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kQGqAQwktNfg+/SKPgg4iEIF+aNCOGCgmk1kPBKoDPQ=;
 b=V2R+a+cLZKkVZWTJB76UtLDsPSra/r89+wlgkBOUzzSo/tzYqgZoJTrVvRG4ZeNJoc
 ZW3fofZSp+vkc/mbyE5rg45X/+9W/ducLOhrJk58IXREPxEbnUNx8rEtD5+/hXfi6OLn
 g3Lb4Lmf5ShkYKrfSK3fUsgbmmAzmgAI7S/xxk28c8uEshXVtFj2LgX1JWkz+Ios3diB
 NrFQcEYt4Ff1NGev25EDOUn3+jAeIsnUBtUFcgmFB3fleGX8Sz+UZe1NQ6B+dSaTyV97
 Sra3hjKth5bkq5jABwzlSTtn86kUa6wFYApuUHONdU7MRs6Ed6Dga+tKeuf17KBMC+AK
 iTBQ==
X-Gm-Message-State: AOAM533Nzc1aMaql1RtTs0cZ072v1gsvBMAsW+P1EkY7UDKnPWb/xqo5
 XL6kGhE06eFDEHY4FjCZ5XtFRrXIsgzN2lJ2/wEZpaP1cagAap+4/nAsoOAaDgAK6uGxqp0dnpd
 qB/LKHKiSSrNVOwC8rs0PRhV8lyztSlYiDdKBsP/BVAaCVlgCTh3WpIVzP18gT449
X-Received: by 2002:a1c:1d52:: with SMTP id d79mr391949wmd.123.1642579779816; 
 Wed, 19 Jan 2022 00:09:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxKvl/sn6QSD040JMU5HzD+0wnRvH+HIWDa2JDWvpLWvtlMdWBCC02XTX3LAkU1WWwzXELk/w==
X-Received: by 2002:a1c:1d52:: with SMTP id d79mr391913wmd.123.1642579779135; 
 Wed, 19 Jan 2022 00:09:39 -0800 (PST)
Received: from localhost.localdomain ([85.203.46.175])
 by smtp.gmail.com with ESMTPSA id a20sm4351606wmb.27.2022.01.19.00.09.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 19 Jan 2022 00:09:38 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 00/15] migration: Postcopy Preemption
Date: Wed, 19 Jan 2022 16:09:14 +0800
Message-Id: <20220119080929.39485-1-peterx@redhat.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Based-on: <20211224065000.97572-1-peterx@redhat.com>

Human version - This patchset is based on:
  https://lore.kernel.org/qemu-devel/20211224065000.97572-1-peterx@redhat.com/

This series can also be found here:
  https://github.com/xzpeter/qemu/tree/postcopy-preempt

Abstract
========

This series added a new migration capability called "postcopy-preempt".  It can
be enabled when postcopy is enabled, and it'll simply (but greatly) speed up
postcopy page requests handling process.

Some quick tests below measuring postcopy page request latency:

  - Guest config: 20G guest, 40 vcpus
  - Host config: 10Gbps host NIC attached between src/dst
  - Workload: one busy dirty thread, writting to 18G memory (pre-faulted).
    (refers to "2M/4K huge page, 1 dirty thread" tests below)
  - Script: see [1]

  |----------------+--------------+-----------------------|
  | Host page size | Vanilla (ms) | Postcopy Preempt (ms) |
  |----------------+--------------+-----------------------|
  | 2M             |        10.58 |                  4.96 |
  | 4K             |        10.68 |                  0.57 |
  |----------------+--------------+-----------------------|

For 2M page, we got 1x speedup.  For 4K page, 18x speedup.

For more information on the testing, please refer to "Test Results" below.

Design
======

The postcopy-preempt feature contains two major reworks on postcopy page fault
handlings:

    (1) Postcopy requests are now sent via a different socket from precopy
        background migration stream, so as to be isolated from very high page
        request delays

    (2) For huge page enabled hosts: when there's postcopy requests, they can
        now intercept a partial sending of huge host pages on src QEMU.

The design is relatively straightforward, however there're trivial
implementation details that the patchset needs to address.  Many of them are
addressed as separate patches.  The rest is handled majorly in the big patch to
enable the whole feature.

Postcopy recovery is not yet supported, it'll be done after some initial review
on the solution first.

Patch layout
============

The initial 10 (out of 15) patches are mostly even suitable to be merged
without the new feature, so they can be looked at even earlier.

Patch 11-14 implements the new feature, in which patches 11-13 are mostly still
small and doing preparations, and the major change is done in patch 14.

Patch 15 is an unit test.

Tests Results
==================

When measuring the page request latency, I did that via trapping userfaultfd
kernel faults using the bpf script [1]. I ignored kvm fast page faults, because
when it happened it means no major/real page fault is even needed, IOW, no
query to src QEMU.

The numbers (and histogram) I captured below are based on a whole procedure of
postcopy migration that I sampled with different configurations, and the
average page request latency was calculated.  I also captured the latency
distribution, it's also interesting too to look at them here.

One thing to mention is I didn't even test 1G pages.  It doesn't mean that this
series won't help 1G - actually it'll help no less than what I've tested I
believe, it's just that for 1G huge pages the latency will be >1sec on 10Gbps
nic so it's not really a usable scenario for any sensible customer.

~~~~~~~~~~~~~~~~~~~~~~~~~~~~
2M huge page, 1 dirty thread
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

With vanilla postcopy:

Average: 10582 (us)

@delay_us:
[1K, 2K)               7 |                                                    |
[2K, 4K)               1 |                                                    |
[4K, 8K)               9 |                                                    |
[8K, 16K)           1983 |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|

With postcopy-preempt:

Average: 4960 (us)

@delay_us:
[1K, 2K)               5 |                                                    |
[2K, 4K)              44 |                                                    |
[4K, 8K)            3495 |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|
[8K, 16K)            154 |@@                                                  |
[16K, 32K)             1 |                                                    |

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
4K small page, 1 dirty thread
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

With vanilla postcopy:

Average: 10676 (us)

@delay_us:
[4, 8)                 1 |                                                    |
[8, 16)                3 |                                                    |
[16, 32)               5 |                                                    |
[32, 64)               3 |                                                    |
[64, 128)             12 |                                                    |
[128, 256)            10 |                                                    |
[256, 512)            27 |                                                    |
[512, 1K)              5 |                                                    |
[1K, 2K)              11 |                                                    |
[2K, 4K)              17 |                                                    |
[4K, 8K)              10 |                                                    |
[8K, 16K)           2681 |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|
[16K, 32K)             6 |                                                    |

With postcopy preempt:

Average: 570 (us)

@delay_us:
[16, 32)               5 |                                                    |
[32, 64)               6 |                                                    |
[64, 128)           8340 |@@@@@@@@@@@@@@@@@@                                  |
[128, 256)         23052 |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|
[256, 512)          8119 |@@@@@@@@@@@@@@@@@@                                  |
[512, 1K)            148 |                                                    |
[1K, 2K)             759 |@                                                   |
[2K, 4K)            6729 |@@@@@@@@@@@@@@@                                     |
[4K, 8K)              80 |                                                    |
[8K, 16K)            115 |                                                    |
[16K, 32K)            32 |                                                    |

So one thing funny about 4K small pages is that with vanilla postcopy I didn't
even get a speedup comparing to 2M pages, probably because the major overhead
is not sending the page itself, but other things (e.g. waiting for precopy to
flush the existing pages).

The other thing is in postcopy preempt test, I can still see a bunch of 2ms-4ms
latency page requests.  That's probably what we would like to dig into next.
One possibility is since we shared the same sending thread on src QEMU, we
could have yield ourselves because precopy socket is full.  But that's TBD.

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
4K small page, 16 dirty threads
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

What I did test in extra was using 16 concurrent faulting threads, in this case
the postcopy queue can be relatively longer.  It's done via:

  $ stress -m 16 --vm-bytes 1073741824 --vm-keep

With vanilla postcopy:

Average: 2244 (us)

@delay_us:
[0]                  556 |                                                    |
[1]                11251 |@@@@@@@@@@@@                                        |
[2, 4)             12094 |@@@@@@@@@@@@@                                       |
[4, 8)             12234 |@@@@@@@@@@@@@                                       |
[8, 16)            47144 |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|
[16, 32)           42281 |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@      |
[32, 64)           17676 |@@@@@@@@@@@@@@@@@@@                                 |
[64, 128)            952 |@                                                   |
[128, 256)           405 |                                                    |
[256, 512)           779 |                                                    |
[512, 1K)           1003 |@                                                   |
[1K, 2K)            1976 |@@                                                  |
[2K, 4K)            4865 |@@@@@                                               |
[4K, 8K)            5892 |@@@@@@                                              |
[8K, 16K)          26941 |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                       |
[16K, 32K)           844 |                                                    |
[32K, 64K)            17 |                                                    |

With postcopy preempt:

Average: 1064 (us)

@delay_us:
[0]                 1341 |                                                    |
[1]                30211 |@@@@@@@@@@@@                                        |
[2, 4)             32934 |@@@@@@@@@@@@@                                       |
[4, 8)             21295 |@@@@@@@@                                            |
[8, 16)           130774 |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|
[16, 32)           95128 |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@               |
[32, 64)           49591 |@@@@@@@@@@@@@@@@@@@                                 |
[64, 128)           3921 |@                                                   |
[128, 256)          1066 |                                                    |
[256, 512)          2730 |@                                                   |
[512, 1K)           1849 |                                                    |
[1K, 2K)             512 |                                                    |
[2K, 4K)            2355 |                                                    |
[4K, 8K)           48812 |@@@@@@@@@@@@@@@@@@@                                 |
[8K, 16K)          10026 |@@@                                                 |
[16K, 32K)           810 |                                                    |
[32K, 64K)            68 |                                                    |

In this specific case, a funny thing is when there're tons of postcopy
requests, the vanilla postcopy page requests are handled even faster (2ms
average) than when there's only 1 dirty thread.  It's probably because
unqueue_page() will always hit anyway so precopy streaming has a less effect on
postcopy.  However that'll be still slower than having a standalone postcopy
stream as preempt version has (1ms).

Any comment welcomed.

[1] https://github.com/xzpeter/small-stuffs/blob/master/tools/huge_vm/uffd-latency.bpf

Peter Xu (15):
  migration: No off-by-one for pss->page update in host page size
  migration: Allow pss->page jump over clean pages
  migration: Enable UFFD_FEATURE_THREAD_ID even without blocktime feat
  migration: Add postcopy_has_request()
  migration: Simplify unqueue_page()
  migration: Move temp page setup and cleanup into separate functions
  migration: Introduce postcopy channels on dest node
  migration: Dump ramblock and offset too when non-same-page detected
  migration: Add postcopy_thread_create()
  migration: Move static var in ram_block_from_stream() into global
  migration: Add pss.postcopy_requested status
  migration: Move migrate_allow_multifd and helpers into migration.c
  migration: Add postcopy-preempt capability
  migration: Postcopy preemption on separate channel
  tests: Add postcopy preempt test

 migration/migration.c        | 107 +++++++--
 migration/migration.h        |  55 ++++-
 migration/multifd.c          |  19 +-
 migration/multifd.h          |   2 -
 migration/postcopy-ram.c     | 192 ++++++++++++----
 migration/postcopy-ram.h     |  14 ++
 migration/ram.c              | 417 ++++++++++++++++++++++++++++-------
 migration/ram.h              |   2 +
 migration/savevm.c           |  12 +-
 migration/socket.c           |  18 ++
 migration/socket.h           |   1 +
 migration/trace-events       |  12 +-
 qapi/migration.json          |   8 +-
 tests/qtest/migration-test.c |  21 ++
 14 files changed, 716 insertions(+), 164 deletions(-)

-- 
2.32.0



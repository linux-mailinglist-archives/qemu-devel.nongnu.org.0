Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4956E6601
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 15:32:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1polQf-0004TY-Ls; Tue, 18 Apr 2023 09:31:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1polQJ-0004NV-JF
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 09:31:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1polQH-0000u1-Hu
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 09:31:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681824664;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=mjQdJSwK99tB0vU0yaFWhzgjpXAMXJ/Gleutsla1AcQ=;
 b=PtFa8zF3WafQEHPXRAqaHx7YstVqYqM2R8TRNVFEgoyLGnuKjxmBdy0tWrOXyv6o6LfAOn
 EWNtiXPlqjKpIenVSfM4w1li7o5i1MyusZfw0/qx8I/I5YZ26q2vUrRpJMghOrFt7MDqr8
 eDYtM7L3Z1MBIsuf+R1eAfT6C4rnU/I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-75-GFKVH1XiP_GdwkZLGebJPQ-1; Tue, 18 Apr 2023 09:31:03 -0400
X-MC-Unique: GFKVH1XiP_GdwkZLGebJPQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DD03B10DD0A8
 for <qemu-devel@nongnu.org>; Tue, 18 Apr 2023 13:31:02 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.42.28.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1B84D40C6E6F;
 Tue, 18 Apr 2023 13:31:01 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 0/2] tests/qtest: make migraton-test faster
Date: Tue, 18 Apr 2023 14:30:58 +0100
Message-Id: <20230418133100.48799-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This makes migration-test faster by observing that most of the pre-copy
tests don't need to be doing a live migration. They get sufficient code
coverage with the guest CPUs paused.

On my machine this cuts the overall execution time of migration-test
by 50% from 15 minutes, down to 8 minutes, without sacrificing any
noticeable code coverage.

This is still quite slow though.

The following are the test timings sorted by speed:

/x86_64/migration/auto_converge  68.85
/x86_64/migration/precopy/unix/xbzrle  68.29
/x86_64/migration/postcopy/preempt/tls/psk  36.57
/x86_64/migration/dirty_ring  35.58
/x86_64/migration/precopy/unix/plain  35.56
/x86_64/migration/postcopy/preempt/plain  34.71
/x86_64/migration/postcopy/recovery/plain  34.56
/x86_64/migration/postcopy/tls/psk  34.45
/x86_64/migration/postcopy/preempt/recovery/tls/psk  33.99
/x86_64/migration/postcopy/preempt/recovery/plain  33.99
/x86_64/migration/postcopy/plain  33.78
/x86_64/migration/postcopy/recovery/tls/psk  33.30
/x86_64/migration/multifd/tcp/plain/none  21.12
/x86_64/migration/vcpu_dirty_limit  12.28
/x86_64/migration/multifd/tcp/tls/x509/default-host  2.95
/x86_64/migration/multifd/tcp/tls/x509/allow-anon-client  2.68
/x86_64/migration/multifd/tcp/tls/x509/override-host  2.51
/x86_64/migration/precopy/tcp/tls/x509/default-host  1.52
/x86_64/migration/precopy/unix/tls/x509/override-host  1.49
/x86_64/migration/precopy/unix/tls/psk  1.48
/x86_64/migration/precopy/tcp/tls/psk/match  1.47
/x86_64/migration/multifd/tcp/tls/psk/match  1.35
/x86_64/migration/precopy/tcp/tls/x509/allow-anon-client  1.32
/x86_64/migration/precopy/tcp/tls/x509/override-host  1.27
/x86_64/migration/precopy/tcp/tls/x509/friendly-client  1.27
/x86_64/migration/multifd/tcp/plain/zlib  1.08
/x86_64/migration/precopy/tcp/plain  1.05
/x86_64/migration/fd_proto  1.04
/x86_64/migration/multifd/tcp/tls/psk/mismatch  1.00
/x86_64/migration/multifd/tcp/plain/zstd  0.98
/x86_64/migration/precopy/tcp/tls/x509/hostile-client  0.85
/x86_64/migration/multifd/tcp/tls/x509/mismatch-host  0.79
/x86_64/migration/precopy/tcp/tls/x509/mismatch-host  0.75
/x86_64/migration/precopy/unix/tls/x509/default-host  0.74
/x86_64/migration/precopy/tcp/tls/x509/reject-anon-client  0.71
/x86_64/migration/multifd/tcp/tls/x509/reject-anon-client  0.68
/x86_64/migration/precopy/tcp/tls/psk/mismatch  0.63
/x86_64/migration/validate_uuid_src_not_set  0.59
/x86_64/migration/validate_uuid  0.54
/x86_64/migration/validate_uuid_dst_not_set  0.53
/x86_64/migration/bad_dest  0.41
/x86_64/migration/validate_uuid_error  0.31

The auto-converge and xbzrle tests are top because they both inherantly
*need* todo multiple interations in order to exercise the desired
code paths.

The post-copy tests are all up there because we always do one iteration
of pre-copy before switching to post-copy and we need to ensure that we
don't complete before getting to the post-copy bit.

I think we can optimize the post-copy bit though. Only 1 of the
post-copy tests really needs to go through a full pre-copy iteration
to get good code coverage.  For the other post-copy tests we can change
to let it copy 10 MBs of data in pre-copy mode and then switch to
post-copy.

Also in

  commit 1bfc8dde505f1e6a92697c52aa9b09e81b54c78f
  Author: Dr. David Alan Gilbert <dgilbert@redhat.com>
  Date:   Mon Mar 6 15:26:12 2023 +0000

    tests/migration: Tweek auto converge limits check

we cut the bandwidth by factor of x10 to ensure reliability. I think
that was perhaps too aggressive. If we bump it back up to say 10 MB/sec
that's still better than the original 30 MB/sec, perhaps enough to give
us reliability, while cutting time of other tests by 70%

Daniel P. Berrangé (2):
  tests/qtest: capture RESUME events during migration
  tests/qtest: make more migration pre-copy scenarios run non-live

 tests/qtest/migration-helpers.c | 12 +++++++++---
 tests/qtest/migration-helpers.h |  1 +
 tests/qtest/migration-test.c    | 34 ++++++++++++++++++++++++++-------
 3 files changed, 37 insertions(+), 10 deletions(-)

-- 
2.40.0



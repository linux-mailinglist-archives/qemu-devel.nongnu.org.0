Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 475C26A9B5F
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 17:08:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY7wc-0007cF-0m; Fri, 03 Mar 2023 11:07:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pY7wU-0007U9-Kz
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 11:07:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pY7wS-0005ih-Tc
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 11:07:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677859652;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=OTxxcHbPcMWUrGnM5PTttyg5j6WOVmM+gNTTwJyKof0=;
 b=XM2HZN45M2qkN9D3Ox9dIUtQBjo+i4I6NtpO6wCr4YOx0PZkjjJcEEMUpNdsY4fIUJCgKt
 4nUlzDvFe0w07BHR65hF1b7iy5WlvN6bfC0L02aIHtkfBwzClgTqZebI20La7D7Vek2eY2
 U/wxyHu1E4/QpfsmV+VuWtEisYl3mFQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-119-3UDNicEwOVKRx403WLw3iQ-1; Fri, 03 Mar 2023 11:07:30 -0500
X-MC-Unique: 3UDNicEwOVKRx403WLw3iQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6C21318E0A62;
 Fri,  3 Mar 2023 16:07:30 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 21F7E492C14;
 Fri,  3 Mar 2023 16:07:29 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 0/8] iotests: make meson aware of individual I/O tests
Date: Fri,  3 Mar 2023 16:07:19 +0000
Message-Id: <20230303160727.3977246-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

To just repeat the patch 5 description...

Currently meson registers a single test that invokes an entire group of
I/O tests, hiding the test granularity from meson. There are various
downsides of doing this

 * You cannot ask 'meson test' to invoke a single I/O test
 * The meson test timeout can't be applied to the individual
   tests
 * Meson only gets a pass/fail for the overall I/O test group
   not individual tests
 * Meson can't show the time of individual I/O tests, so we
   can't see why 4-5 are consuming the bulk of the time
   and ripe for optimization
 * If a CI job gets killed by the GitLab timeout, we don't
   get visibility into how far through the I/O tests
   execution got.

This is not really specific to the I/O tests, the problem is common
to any case of us running a test which is in fact another test
harness which runs many tests. It would be nice to have meson have
the full view of all tests run. Adapting the I/O tests is as easy
win in this respect.

This switches meson to perform test discovery by invoking 'check' in
dry-run mode. It then registers one meson test case for each I/O
test. Parallel execution remains disabled since the I/O tests do not
use self contained execution environments and thus conflict with
each other.

Compare contrast output from a current job:

  https://gitlab.com/qemu-project/qemu/-/jobs/3863603546

[quote]
204/224 qemu:block / qemu-iotests qcow2   OK 329.94s   119 subtests passed
[/quote]

Vs what is seen with this series:

  https://gitlab.com/berrange/qemu/-/jobs/3865975463

[quote]
204/350 qemu:block / qemu-iotests-qcow2-001   OK    2.16s   1 subtests passed
205/350 qemu:block / qemu-iotests-qcow2-002   OK    2.77s   1 subtests passed

...snip...

329/350 qemu:block / qemu-iotests-qcow2-qemu-img-close-errors       OK    6.19s   1 subtests passed
330/350 qemu:block / qemu-iotests-qcow2-qsd-jobs          OK    0.55s   1 subtests passed
[/quote]

A few tweaks were needed to the iotests runner because it had a few
assumptions about it always running in a tree that has already been
built, which is obviously not the case at the time meson does test
discovery.

In v2:

New example pipeline job

   https://gitlab.com/berrange/qemu/-/jobs/3871446106

 * Set build/source dir defaults in CLI option parser
   instead of testenv.py (Alex)
 * Fix messed up termios settings with parallel execution
   by connecting stdin to /dev/null (Thomas)
 * Remove the obsolete check-block.sh script (Thomas)
 * Use a unique sub-directory per test to allow parallelization (Thomas)
 * Enable parallel execution by meson (Thomas)
 * Remove leftover debugging message (Thomas)
 * Use a shorter meson test name 'io-qcow2-012' instead of
   'qemu-iotests-qcow2-012'

Daniel P. Berrangé (8):
  iotests: explicitly pass source/build dir to 'check' command
  iotests: allow test discovery before building
  iotests: strip subdir path when listing tests
  iotests: print TAP protocol version when reporting tests
  iotests: connect stdin to /dev/null when running tests
  iotests: always use a unique sub-directory per test
  iotests: register each I/O test separately with meson
  iotests: remove the check-block.sh script

 tests/check-block.sh             | 43 --------------------------------
 tests/qemu-iotests/check         | 30 +++++++++++++++++++---
 tests/qemu-iotests/meson.build   | 35 +++++++++++++++++++++-----
 tests/qemu-iotests/testenv.py    | 20 +++++++--------
 tests/qemu-iotests/testrunner.py | 43 ++++++++++----------------------
 5 files changed, 78 insertions(+), 93 deletions(-)
 delete mode 100755 tests/check-block.sh

-- 
2.39.2



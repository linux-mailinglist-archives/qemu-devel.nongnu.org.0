Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B521F6A88B4
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 19:47:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXnwW-0000wg-Le; Thu, 02 Mar 2023 13:46:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pXnwU-0000la-HF
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 13:46:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pXnwS-00058v-O4
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 13:46:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677782771;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Qwt6xuBBYuMmbr0vlloK3QxsL+wY2wjinZWwZHcl/rA=;
 b=haqSzYJ2BUseo93ipGrrk1sqFgDFximK3fsfAf1L3z4tGCjIPHCkJDUSWDlR8NfWLAF8De
 ooSbcyHFNgZ7lAmcj1L0A7+vnI5i0+9YuMm+D64KRN/IUmuTylOlSDwifNCbopgZdhYt6b
 WbEFnyRdqPlx+NIhaVT6F6bibi13xNA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-390-trlhsFmBMGKY2HjdSIPrcQ-1; Thu, 02 Mar 2023 13:46:10 -0500
X-MC-Unique: trlhsFmBMGKY2HjdSIPrcQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 21AC23C14850;
 Thu,  2 Mar 2023 18:46:10 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D3265C16027;
 Thu,  2 Mar 2023 18:46:08 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 0/5] iotests: make meson aware of individual I/O tests
Date: Thu,  2 Mar 2023 18:46:01 +0000
Message-Id: <20230302184606.418541-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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

Daniel P. Berrangé (5):
  iotests: explicitly pass source/build dir to 'check' command
  iotests: allow test discovery before building
  iotests: strip subdir path when listing tests
  iotests: print TAP protocol version when reporting tests
  iotests: register each I/O test separately with meson

 tests/qemu-iotests/check         | 11 +++++++++--
 tests/qemu-iotests/meson.build   | 33 ++++++++++++++++++++++++++------
 tests/qemu-iotests/testenv.py    | 22 +++++++++++++++++----
 tests/qemu-iotests/testrunner.py |  1 +
 4 files changed, 55 insertions(+), 12 deletions(-)

-- 
2.39.2



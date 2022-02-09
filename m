Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A984AEF45
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 11:28:13 +0100 (CET)
Received: from localhost ([::1]:33320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHkCq-0003kq-99
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 05:28:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nHk15-0003An-F6
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 05:16:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nHk10-0004tP-7b
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 05:16:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644401756;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=CsYIoqvzWfeWY428MK8u08ro5f6pUFb0GLMPXSzAmdY=;
 b=B5K8rEF7WRPuxIMlWqrrffhZU/xGbVWjAeafSGIxlaF4j2IXOoEi53z9SmumhLn5zflcaJ
 6QG9hVtk9mEUEOM82XW55Qe/RuHwr9PyAKpomrLD0hqdl54XySwCE8woLxSXFJ1nqBSIhv
 JKEJguGIQe7x9t/HbWazoJrsLZ/cYAU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-362-cUergvCEPtygkGn6qFvHIg-1; Wed, 09 Feb 2022 05:15:51 -0500
X-MC-Unique: cUergvCEPtygkGn6qFvHIg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 695F184B9AA;
 Wed,  9 Feb 2022 10:15:50 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 89F8029996;
 Wed,  9 Feb 2022 10:15:48 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 0/8] Improve integration of iotests in the meson test
 harness
Date: Wed,  9 Feb 2022 11:15:22 +0100
Message-Id: <20220209101530.3442837-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Though "make check-block" is currently already run via the meson test
runner, it still looks like an oddball in the output of "make check" since
the tests are still run separately via the check-block.sh script. It would
be nicer if the iotests would show up like the other tests suites. For this
we have to tweak the tests/qemu-iotests/check script so that it can already
be run with "-g auto -n" during the configuration step [*], then we can
directly add the individual tests in the tests/qemu-iotests/meson.build file
already and finally get rid of the check-block.sh script.

[*] Alternatively, we could also get rid of the "auto" group and add
the test list to the tests/qemu-iotests/meson.build file directly ... 

Note: There's still something really weird that happens sometimes after
running "make check-block" with this patch set: Sometimes the terminal
is in non-echo mode, so that you have to run "reset" to get the terminal
back to normal ... I currently don't have clue what's causing that
issue ... Paolo, did you ever experience something like that with the
meson test runner?

v2:
 - Add new 1st patch to fix "make check-block SPEED=thorough"
 - Improve bash version check
 - Rewrite the 'Allow to run "./check -n"' patch to be less ugly
 - Add patch to print the "diff" of the iotests to stderr, so that
   it shows up in TAP mode, too

Thomas Huth (8):
  tests/qemu-iotests/testrunner: Allow parallel test invocations
  tests/qemu-iotests: Improve the check for GNU sed
  tests/qemu-iotests/meson.build: Improve the indentation
  tests/qemu-iotests: Allow to run "./check -n" from the source
    directory, too
  tests/qemu-iotests/meson.build: Call the 'check' script directly
  tests: Do not treat the iotests as separate meson test target anymore
  tests/qemu-iotests/testrunner: Print diff to stderr in TAP mode
  tests: Remove check-block.sh

 meson.build                      |  6 +--
 scripts/mtest2make.py            |  4 --
 tests/Makefile.include           |  9 +---
 tests/check-block.sh             | 85 --------------------------------
 tests/qemu-iotests/check         |  2 +-
 tests/qemu-iotests/common.rc     | 26 +++++-----
 tests/qemu-iotests/meson.build   | 83 +++++++++++++++++++++----------
 tests/qemu-iotests/testenv.py    |  9 +++-
 tests/qemu-iotests/testrunner.py |  7 ++-
 9 files changed, 88 insertions(+), 143 deletions(-)
 delete mode 100755 tests/check-block.sh

-- 
2.27.0



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C994AD5BF
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 11:47:52 +0100 (CET)
Received: from localhost ([::1]:60742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHO2I-0006d6-UR
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 05:47:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nHNUy-0006YJ-1l
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 05:13:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32191)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nHNUv-0003V0-Tt
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 05:13:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644315201;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=nij32i+24FpxNjeqDJkTsBJNhbrX8Ilr3uNXesaMUyY=;
 b=ETwLK6ww+NnjpqI9W99rpdfABW2a9KRggeKz5DhXVqz406q5KX8CEovqhCmWngXXGKCdGI
 7CxiDj8Eu53TQFKmegxydkgXQkFq9D6AAHC79nKfyDGFNbdOW61DQKmcdd2saa8EZYv3yo
 6CMnGsJeCXG4plol9KpfllYuh/X0dbM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-503-pixaWeWPMO2X_1dr5R2v8A-1; Tue, 08 Feb 2022 05:13:16 -0500
X-MC-Unique: pixaWeWPMO2X_1dr5R2v8A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 602A7100CCC0;
 Tue,  8 Feb 2022 10:13:15 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.143])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CB2122A179;
 Tue,  8 Feb 2022 10:13:13 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
Subject: [PATCH 0/6] Improve integration of iotests in the meson test harness
Date: Tue,  8 Feb 2022 11:13:05 +0100
Message-Id: <20220208101311.1511083-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
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

[*] Alternatively, I think we could also get rid of the "auto" group
and add the test list to the tests/qemu-iotests/meson.build file
directly ... not sure whether that's so much nicer, though.

Thomas Huth (6):
  tests/qemu-iotests: Improve the check for GNU sed
  tests/qemu-iotests/meson.build: Improve the indentation
  tests/qemu-iotests: Allow to run "./check -n" from the source
    directory, too
  tests/qemu-iotests/meson.build: Call the 'check' script directly
  tests: Do not treat the iotests as separate meson test target anymore
  tests: Remove check-block.sh

 meson.build                    |  6 +--
 scripts/mtest2make.py          |  4 --
 tests/Makefile.include         |  9 +---
 tests/check-block.sh           | 85 ----------------------------------
 tests/qemu-iotests/check       | 52 ++++++++++++---------
 tests/qemu-iotests/common.rc   | 26 +++++------
 tests/qemu-iotests/meson.build | 84 ++++++++++++++++++++++-----------
 7 files changed, 104 insertions(+), 162 deletions(-)
 delete mode 100755 tests/check-block.sh

-- 
2.27.0



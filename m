Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F234C1003
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 11:16:23 +0100 (CET)
Received: from localhost ([::1]:48164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMoh4-0007K1-Jz
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 05:16:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nMo6r-0003eo-W2
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 04:38:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nMo6n-0006rU-SC
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 04:38:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645609133;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ClKv5aI1185sOcUapStoqDQ0OM8XIkzzqJvY2T3NcoY=;
 b=YDnqJYP1cckpaCFk/rOYGBAWUshJHFvd+3vqkMdUnYLR0F8q4bdYiEeX9rdxuRyBqtO1kH
 8LF45gi1OGN8QspvXmaoWMtydzgdBZuz6943oqb+bYbfA5HzdAMtgyKAeVw9ligPLx4S5K
 +XP9Jn+1rbZpV/7AhU4+jvomj9r35aI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433-kyYt_YR-PTqiReVTb6KgWg-1; Wed, 23 Feb 2022 04:38:45 -0500
X-MC-Unique: kyYt_YR-PTqiReVTb6KgWg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B29A8801AAD;
 Wed, 23 Feb 2022 09:38:44 +0000 (UTC)
Received: from thuth.com (dhcp-192-232.str.redhat.com [10.33.192.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EC7217A3EE;
 Wed, 23 Feb 2022 09:38:41 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
Subject: [PATCH v3 0/4] Improve integration of iotests in the meson test
 harness
Date: Wed, 23 Feb 2022 10:38:36 +0100
Message-Id: <20220223093840.2515281-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
runner, it still looks like an oddball in the output of "make check". It
would be nicer if the iotests would show up like the other tests suites.

My original plan was to add each iotests individually from meson.build,
but I did not get that done reliably yet [*], so here's now a cut-down
version to improve the situation at least a little bit: The first three
patches are preparation for the clean-up (long-term goal is to get rid
of check-block.sh, though we're not quite there yet), and the final
patch adds the iotests not as separate test target in the meson test
harness anymore. This way, we can now finally get the output of failed
tests on the console again (unless you're running meson test in verbose
mode, where meson only puts this to the log file - for incomprehensible
reasons), so this should hopefully help to diagnose problems with the
iotests in most cases more easily.

[*] See v2 here:
    https://lists.gnu.org/archive/html/qemu-devel/2022-02/msg01942.html

Thomas Huth (4):
  tests/qemu-iotests: Rework the checks and spots using GNU sed
  tests/qemu-iotests/meson.build: Improve the indentation
  tests/qemu-iotests: Move the bash and sanitizer checks to meson.build
  tests: Do not treat the iotests as separate meson test target anymore

 meson.build                      |  6 +--
 scripts/mtest2make.py            |  4 --
 tests/Makefile.include           |  9 +---
 tests/check-block.sh             | 38 -----------------
 tests/qemu-iotests/271           |  2 +-
 tests/qemu-iotests/common.filter | 65 ++++++++++++++--------------
 tests/qemu-iotests/common.rc     | 45 ++++++++++----------
 tests/qemu-iotests/meson.build   | 73 ++++++++++++++++++++------------
 8 files changed, 106 insertions(+), 136 deletions(-)

-- 
2.27.0



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A43FB47B274
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 19:00:00 +0100 (CET)
Received: from localhost ([::1]:57866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzMx5-0005nL-7R
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 12:59:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mzKjG-0003i1-JW
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:37:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mzKjA-0006fM-Ek
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:37:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640014647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=O3NTwjDu4rYOi0qEi4EN1W2/HvnoaTcB907UiTiHi0U=;
 b=XpuJvD59Xttm950a5wYkfd2v80NJpwd9PTOtSQ+YVW6NalaIOVg024MZHSvudrrsYIz9ag
 hj/aeFPjPPRj+gOIRAdyQ6Lc0YbuEAic/EZS9F0cjArP5M37MiET/FFFJ0fXuanxieosWU
 JrHz6CL1W8LQ13opD9vIaU3iPGh54Lo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-513-93RgAarxO2i7xRkBbwB-WQ-1; Mon, 20 Dec 2021 03:11:05 -0500
X-MC-Unique: 93RgAarxO2i7xRkBbwB-WQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1429C1006AA0
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 08:11:04 +0000 (UTC)
Received: from thuth.com (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3249B5BD0B;
 Mon, 20 Dec 2021 08:10:55 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH 0/4] tests/qtest: Check for devices and machines before adding
 tests
Date: Mon, 20 Dec 2021 09:10:50 +0100
Message-Id: <20211220081054.151515-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.209,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Miroslav Rezanina <mrezanin@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Devices might not always be compiled into the QEMU target binaries.
We already have the libqos framework that is good for handling such
situations, but some of the qtests are not a real good fit for the
libqos framework. This patch series adds a new function to check
whether a device is available in the target binary or not, so that
tests can be run or skipped accordingly (also adding some additional
checks for the availability of machines in the target binaries).

Thomas Huth (4):
  tests/qtest: Add a function that checks whether a device is available
  tests/qtest: Improve endianness-test to work with missing machines and
    devices
  tests/qtest/cdrom-test: Check whether devices are available before
    using them
  tests/qtest/boot-order-test: Check whether machines are available

 tests/qtest/boot-order-test.c |  5 +++
 tests/qtest/cdrom-test.c      | 60 +++++++++++++++++++++++------------
 tests/qtest/endianness-test.c |  5 ++-
 tests/qtest/libqos/libqtest.h |  8 +++++
 tests/qtest/libqtest.c        | 44 +++++++++++++++++++++++++
 5 files changed, 100 insertions(+), 22 deletions(-)

-- 
2.27.0



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8F35FCAA8
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 20:30:27 +0200 (CEST)
Received: from localhost ([::1]:41506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oigUr-0005Le-U9
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 14:30:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oigSb-00026V-4e
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 14:28:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oigSZ-0002wH-NI
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 14:28:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665599282;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=JsCauZHrBHKeSt33sNjcLUyo0PNNLHo6Z1nOKT2o+zo=;
 b=bAmGBBe3uVx1gIrp6XOjVroJxRnyF0KBEX4jzMSze9bizwCBnWE0JSGllmGkYrNZEeOJ00
 TdIkBfJvyYgCgukYgg84ZheZuLR4xqBVuiX2c9WpV4VJ7mY6/ew5Vcaqhplt6yOy7l97p+
 siNdTq8nMP6ARpikRsFdq5VLZd3NnI4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-653-_F1jbny-PJumPhh-ydkAfA-1; Wed, 12 Oct 2022 14:27:59 -0400
X-MC-Unique: _F1jbny-PJumPhh-ydkAfA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DA43F3806704;
 Wed, 12 Oct 2022 18:27:58 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8BFDB40449D8;
 Wed, 12 Oct 2022 18:27:57 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-s390x@nongnu.org, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: [PATCH 0/3] s390x: Fix for vistr instruction & addition to TCG tests
Date: Wed, 12 Oct 2022 20:27:52 +0200
Message-Id: <20221012182755.1014853-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

1) Improve tests/tcg/s390x/Makefile.target to look for -march flags only once
2) Fix a problem with the vistr instruction
3) Add a test for the vistr instruction

Thomas Huth (3):
  tests/tcg/s390x: Test compiler flags only once, not every time
  target/s390x: Fix emulation of the VISTR instruction
  tests/tcg/s390x: Add a test for the vistr instruction

 tests/tcg/s390x/vistr.c             | 45 +++++++++++++++++++++++++++++
 target/s390x/tcg/translate_vx.c.inc |  2 +-
 tests/tcg/s390x/Makefile.target     | 31 +++++++++++++-------
 3 files changed, 67 insertions(+), 11 deletions(-)
 create mode 100644 tests/tcg/s390x/vistr.c

-- 
2.31.1



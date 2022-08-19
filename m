Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3955994D1
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 07:48:12 +0200 (CEST)
Received: from localhost ([::1]:39086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOurb-0000ow-7l
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 01:48:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oOui1-0003Lw-8v
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 01:38:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35302)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oOuhv-0002mt-Rq
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 01:38:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660887491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UxQS7HFhQiZ0G2nyAw1XtT6rSAC4kVjZXOTbDVPWOvM=;
 b=D1+8K1sPwvRM6bk2Ih0546KiIArHAOAgP/NwKM/ya32EbGHh737WzMN9jUn3D5gXy8eHoM
 4gm9ASdWerOZk5txAoSLNCVsaB99H95ELS+pkjzteln60V1tKbI1YPSx9I4vEq2D9+gm5W
 C+iAdKI53N6LA5fReM7Oao/YZHSiHfc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-215-t1WU5UEvOtGhOwsm9ex0Yg-1; Fri, 19 Aug 2022 01:38:09 -0400
X-MC-Unique: t1WU5UEvOtGhOwsm9ex0Yg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5049B29324A3;
 Fri, 19 Aug 2022 05:38:09 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.107])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BEC5440D2827;
 Fri, 19 Aug 2022 05:38:07 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Xu <peterx@redhat.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH 2/4] tests/migration/aarch64: Speed up the aarch64 migration
 test
Date: Fri, 19 Aug 2022 07:38:00 +0200
Message-Id: <20220819053802.296584-3-thuth@redhat.com>
In-Reply-To: <20220819053802.296584-1-thuth@redhat.com>
References: <20220819053802.296584-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The migration tests spend a lot of time waiting for a sign of live
of the guest on the serial console. The aarch64 migration code only
outputs "B"s every couple of seconds (at least it takes more than 4
seconds between each characeter on my x86 laptop). There are a lot
of migration tests, and if each test that checks for a successful
migration waits for these characters before and after migration, the
wait time sums up to multiple minutes! Let's use a shorter delay to
speed things up.

While we're at it, also remove a superfluous masking with 0xff - we're
reading and storing bytes, so the upper bits of the register do not
matter anyway.

With these changes, the test runs twice as fast on my laptop, decreasing
the total run time from approx. 8 minutes to only 4 minutes!

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/migration/aarch64/a-b-kernel.h | 10 +++++-----
 tests/migration/aarch64/a-b-kernel.S |  3 +--
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/tests/migration/aarch64/a-b-kernel.h b/tests/migration/aarch64/a-b-kernel.h
index 0a9b01137e..34e518d061 100644
--- a/tests/migration/aarch64/a-b-kernel.h
+++ b/tests/migration/aarch64/a-b-kernel.h
@@ -10,9 +10,9 @@ unsigned char aarch64_kernel[] = {
   0x03, 0x00, 0x80, 0x52, 0xe4, 0x03, 0x00, 0xaa, 0x83, 0x00, 0x00, 0x39,
   0x84, 0x04, 0x40, 0x91, 0x9f, 0x00, 0x01, 0xeb, 0xad, 0xff, 0xff, 0x54,
   0x05, 0x00, 0x80, 0x52, 0xe4, 0x03, 0x00, 0xaa, 0x83, 0x00, 0x40, 0x39,
-  0x63, 0x04, 0x00, 0x11, 0x63, 0x1c, 0x00, 0x12, 0x83, 0x00, 0x00, 0x39,
-  0x24, 0x7e, 0x0b, 0xd5, 0x84, 0x04, 0x40, 0x91, 0x9f, 0x00, 0x01, 0xeb,
-  0x2b, 0xff, 0xff, 0x54, 0xa5, 0x04, 0x00, 0x11, 0xa5, 0x1c, 0x00, 0x12,
-  0xbf, 0x00, 0x00, 0x71, 0x81, 0xfe, 0xff, 0x54, 0x43, 0x08, 0x80, 0x52,
-  0x43, 0x00, 0x00, 0x39, 0xf1, 0xff, 0xff, 0x17
+  0x63, 0x04, 0x00, 0x11, 0x83, 0x00, 0x00, 0x39, 0x24, 0x7e, 0x0b, 0xd5,
+  0x84, 0x04, 0x40, 0x91, 0x9f, 0x00, 0x01, 0xeb, 0x4b, 0xff, 0xff, 0x54,
+  0xa5, 0x04, 0x00, 0x11, 0xa5, 0x10, 0x00, 0x12, 0xbf, 0x00, 0x00, 0x71,
+  0xa1, 0xfe, 0xff, 0x54, 0x43, 0x08, 0x80, 0x52, 0x43, 0x00, 0x00, 0x39,
+  0xf2, 0xff, 0xff, 0x17
 };
diff --git a/tests/migration/aarch64/a-b-kernel.S b/tests/migration/aarch64/a-b-kernel.S
index 0225945348..a4103ecb71 100644
--- a/tests/migration/aarch64/a-b-kernel.S
+++ b/tests/migration/aarch64/a-b-kernel.S
@@ -53,7 +53,6 @@ innerloop:
         /* increment the first byte of each page by 1 */
         ldrb    w3, [x4]
         add     w3, w3, #1
-        and     w3, w3, #0xff
         strb    w3, [x4]
 
         /* make sure QEMU user space can see consistent data as MMU is off */
@@ -64,7 +63,7 @@ innerloop:
         blt     innerloop
 
         add     w5, w5, #1
-        and     w5, w5, #0xff
+        and     w5, w5, #0x1f
         cmp     w5, #0
         bne     mainloop
 
-- 
2.31.1



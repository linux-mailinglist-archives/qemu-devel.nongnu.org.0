Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD99957D8
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Aug 2019 09:07:00 +0200 (CEST)
Received: from localhost ([::1]:33816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hzyEN-000330-Ce
	for lists+qemu-devel@lfdr.de; Tue, 20 Aug 2019 03:06:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42547)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1hzy8I-0005WO-FB
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 03:00:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1hzy8H-00039d-Gq
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 03:00:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45086)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hzy8H-00038l-Ba
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 03:00:41 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9A4391918640;
 Tue, 20 Aug 2019 07:00:40 +0000 (UTC)
Received: from 640k.localdomain.com (ovpn-112-20.ams2.redhat.com
 [10.36.112.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 68D7311E537;
 Tue, 20 Aug 2019 07:00:39 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 20 Aug 2019 08:59:30 +0200
Message-Id: <1566284395-30287-12-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1566284395-30287-1-git-send-email-pbonzini@redhat.com>
References: <1566284395-30287-1-git-send-email-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.70]); Tue, 20 Aug 2019 07:00:40 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 11/36] test-throttle: Fix uninitialized use of
 burst_length
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>

ThrottleState::cfg of the static variable 'ts' is reassigned with the
local one in the do_test_accounting() and then is passed to the
throttle_account() with uninitialized member LeakyBucket::burst_length.

Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
Message-Id: <1564502498-805893-2-git-send-email-andrey.shinkevich@virtuozzo.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/test-throttle.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/test-throttle.c b/tests/test-throttle.c
index a288122..ebf3aeb 100644
--- a/tests/test-throttle.c
+++ b/tests/test-throttle.c
@@ -557,6 +557,8 @@ static bool do_test_accounting(bool is_ops, /* are we testing bps or ops */
     BucketType index;
     int i;
 
+    throttle_config_init(&cfg);
+
     for (i = 0; i < 3; i++) {
         BucketType index = to_test[is_ops][i];
         cfg.buckets[index].avg = avg;
-- 
1.8.3.1




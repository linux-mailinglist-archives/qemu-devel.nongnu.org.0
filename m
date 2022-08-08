Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92AF458C2B7
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 07:10:33 +0200 (CEST)
Received: from localhost ([::1]:55374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oKv28-0002Bl-KC
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 01:10:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oKuxJ-0003gb-JH
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 01:05:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oKuxG-0001Lq-AR
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 01:05:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659935129;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f+jhOkq3hrSIhvRLwA/PWHMbkUUOtTouzbkSy+8rsMc=;
 b=L7X8xU4HpZQFdz3h/bUKiFHL2WvROctVYkWgoY8z8laStjTb2LIy2rdZXYJPZTqQ3SqRwE
 WJ+zo1PoiZyZ/8A7Y4FKjNQyKlqzCtz2kO6IaYdc6cjEPI76t+/4kxPaSfLEHlUC5jRv2E
 +WZ8RfjeXWeZ/gw5cT7ZGols63aTlpw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-118-yaHeOcriORyXacv-8HjP3A-1; Mon, 08 Aug 2022 01:05:24 -0400
X-MC-Unique: yaHeOcriORyXacv-8HjP3A-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D0EDD1019C8D;
 Mon,  8 Aug 2022 05:05:23 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D5AB3492C3B;
 Mon,  8 Aug 2022 05:05:22 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>,
	qemu-devel@nongnu.org
Cc: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Subject: [PULL 4/4] tests/qemu-iotests/264: Allow up to 5s for the
 BLOCK_JOB_CANCEL event to arrive
Date: Mon,  8 Aug 2022 07:05:15 +0200
Message-Id: <20220808050515.1283174-5-thuth@redhat.com>
In-Reply-To: <20220808050515.1283174-1-thuth@redhat.com>
References: <20220808050515.1283174-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

It is possible to hit the assertTrue(delta_t < 2.0) on very loaded
systems. Increase the value to 5.0 to ease the situation a little bit.

Message-Id: <20220802123101.430757-1-thuth@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qemu-iotests/264 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/264 b/tests/qemu-iotests/264
index bc431d1a19..289381e315 100755
--- a/tests/qemu-iotests/264
+++ b/tests/qemu-iotests/264
@@ -101,7 +101,7 @@ class TestNbdReconnect(iotests.QMPTestCase):
         start_t = time.time()
         self.vm.event_wait('BLOCK_JOB_CANCELLED')
         delta_t = time.time() - start_t
-        self.assertTrue(delta_t < 2.0)
+        self.assertTrue(delta_t < 5.0)
 
     def test_mirror_cancel(self):
         # Mirror speed limit doesn't work well enough, it seems that mirror
-- 
2.31.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EED144A6048
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 16:39:29 +0100 (CET)
Received: from localhost ([::1]:33274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEvFg-00025U-HX
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 10:39:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nEuQT-0002aJ-VU
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 09:46:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nEuP9-0002zW-NH
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 09:45:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643726621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BxTg8+Zl5VwK6DHgyv6b9D4ZtUAc9Q6t6tamv9d5U68=;
 b=StUUlqrKnLeau37LwL3YpqBR+hwyJnMw37u+MhVZCdNZ47SyoVBSHsEhIp84OHFRed3m2z
 IB771oMznluT5WGdDzY0Db3heto7dyH3HQue2k9ZwxGF9+ssMEYL3lbA1LnqOSh7sutUyG
 sTUvc10MHKBwc234rTYVzvrM+tYpRaA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-482-xcC7Lm6aMOO4kODi0bHBeg-1; Tue, 01 Feb 2022 09:43:33 -0500
X-MC-Unique: xcC7Lm6aMOO4kODi0bHBeg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2CC141018720;
 Tue,  1 Feb 2022 14:43:32 +0000 (UTC)
Received: from localhost (unknown [10.39.193.129])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C31205DBB7;
 Tue,  1 Feb 2022 14:43:31 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 10/24] iotest 065: explicit compression type
Date: Tue,  1 Feb 2022 15:42:19 +0100
Message-Id: <20220201144233.617021-11-hreitz@redhat.com>
In-Reply-To: <20220201144233.617021-1-hreitz@redhat.com>
References: <20220201144233.617021-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

The test checks different options. It of course fails if set
IMGOPTS='compression_type=zstd'. So, let's be explicit in what
compression type we want and independent of IMGOPTS. Test both existing
compression types.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20211223160144.1097696-9-vsementsov@virtuozzo.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/065 | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/tests/qemu-iotests/065 b/tests/qemu-iotests/065
index dc7716275f..f7c1b68dad 100755
--- a/tests/qemu-iotests/065
+++ b/tests/qemu-iotests/065
@@ -88,7 +88,7 @@ class TestQMP(TestImageInfoSpecific):
 
 class TestQCow2(TestQemuImgInfo):
     '''Testing a qcow2 version 2 image'''
-    img_options = 'compat=0.10'
+    img_options = 'compat=0.10,compression_type=zlib'
     json_compare = { 'compat': '0.10', 'refcount-bits': 16,
                      'compression-type': 'zlib' }
     human_compare = [ 'compat: 0.10', 'compression type: zlib',
@@ -96,17 +96,17 @@ class TestQCow2(TestQemuImgInfo):
 
 class TestQCow3NotLazy(TestQemuImgInfo):
     '''Testing a qcow2 version 3 image with lazy refcounts disabled'''
-    img_options = 'compat=1.1,lazy_refcounts=off'
+    img_options = 'compat=1.1,lazy_refcounts=off,compression_type=zstd'
     json_compare = { 'compat': '1.1', 'lazy-refcounts': False,
                      'refcount-bits': 16, 'corrupt': False,
-                     'compression-type': 'zlib', 'extended-l2': False }
-    human_compare = [ 'compat: 1.1', 'compression type: zlib',
+                     'compression-type': 'zstd', 'extended-l2': False }
+    human_compare = [ 'compat: 1.1', 'compression type: zstd',
                       'lazy refcounts: false', 'refcount bits: 16',
                       'corrupt: false', 'extended l2: false' ]
 
 class TestQCow3Lazy(TestQemuImgInfo):
     '''Testing a qcow2 version 3 image with lazy refcounts enabled'''
-    img_options = 'compat=1.1,lazy_refcounts=on'
+    img_options = 'compat=1.1,lazy_refcounts=on,compression_type=zlib'
     json_compare = { 'compat': '1.1', 'lazy-refcounts': True,
                      'refcount-bits': 16, 'corrupt': False,
                      'compression-type': 'zlib', 'extended-l2': False }
@@ -117,7 +117,7 @@ class TestQCow3Lazy(TestQemuImgInfo):
 class TestQCow3NotLazyQMP(TestQMP):
     '''Testing a qcow2 version 3 image with lazy refcounts disabled, opening
        with lazy refcounts enabled'''
-    img_options = 'compat=1.1,lazy_refcounts=off'
+    img_options = 'compat=1.1,lazy_refcounts=off,compression_type=zlib'
     qemu_options = 'lazy-refcounts=on'
     compare = { 'compat': '1.1', 'lazy-refcounts': False,
                 'refcount-bits': 16, 'corrupt': False,
@@ -127,11 +127,11 @@ class TestQCow3NotLazyQMP(TestQMP):
 class TestQCow3LazyQMP(TestQMP):
     '''Testing a qcow2 version 3 image with lazy refcounts enabled, opening
        with lazy refcounts disabled'''
-    img_options = 'compat=1.1,lazy_refcounts=on'
+    img_options = 'compat=1.1,lazy_refcounts=on,compression_type=zstd'
     qemu_options = 'lazy-refcounts=off'
     compare = { 'compat': '1.1', 'lazy-refcounts': True,
                 'refcount-bits': 16, 'corrupt': False,
-                'compression-type': 'zlib', 'extended-l2': False }
+                'compression-type': 'zstd', 'extended-l2': False }
 
 TestImageInfoSpecific = None
 TestQemuImgInfo = None
-- 
2.34.1



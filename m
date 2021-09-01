Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A60C3FDF7C
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 18:12:59 +0200 (CEST)
Received: from localhost ([::1]:45294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLSrC-0006Ay-Dt
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 12:12:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mLS0A-00070M-Ff
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 11:18:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mLS07-0004RH-9Y
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 11:18:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630509486;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uD19X4KylGOOEHcT5gxt0dZFmQ8ovL2twM2Pj9f3dsY=;
 b=fKntldfCQfddi3CnPLc/nO6aiGZQcqpZwvx5B59jSHMvRweWinkX/kM9CWLrYrEnbGM0dm
 UQ/MZXUrM5fhRMCpsBe6LENrBmFlKrjMd90u6sote/9rg1BRdgAkG5wjrJB+LEjghFlCPr
 BZrWdEbGPul4NkZco4v0/cdW4DGvUv8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-R1tGuWhRMKG0X6LvZXOW1g-1; Wed, 01 Sep 2021 11:18:05 -0400
X-MC-Unique: R1tGuWhRMKG0X6LvZXOW1g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5B953107ACC7;
 Wed,  1 Sep 2021 15:18:04 +0000 (UTC)
Received: from localhost (unknown [10.39.193.250])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0540960C05;
 Wed,  1 Sep 2021 15:18:03 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 48/56] iotests: move 222 to tests/image-fleecing
Date: Wed,  1 Sep 2021 17:16:11 +0200
Message-Id: <20210901151619.689075-49-hreitz@redhat.com>
In-Reply-To: <20210901151619.689075-1-hreitz@redhat.com>
References: <20210901151619.689075-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Give a good name to test file.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20210824083856.17408-29-vsementsov@virtuozzo.com>
[hreitz: Adjust .gitlab-ci.d/buildtest.yml]
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 .gitlab-ci.d/buildtest.yml                               | 6 +++---
 tests/qemu-iotests/{222 => tests/image-fleecing}         | 0
 tests/qemu-iotests/{222.out => tests/image-fleecing.out} | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename tests/qemu-iotests/{222 => tests/image-fleecing} (100%)
 rename tests/qemu-iotests/{222.out => tests/image-fleecing.out} (100%)

diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index 903ee65f32..e74998efb9 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -305,11 +305,11 @@ build-tcg-disabled:
     - cd tests/qemu-iotests/
     - ./check -raw 001 002 003 004 005 008 009 010 011 012 021 025 032 033 048
             052 063 077 086 101 104 106 113 148 150 151 152 157 159 160 163
-            170 171 183 184 192 194 208 221 222 226 227 236 253 277
+            170 171 183 184 192 194 208 221 226 227 236 253 277 image-fleecing
     - ./check -qcow2 028 051 056 057 058 065 068 082 085 091 095 096 102 122
             124 132 139 142 144 145 151 152 155 157 165 194 196 200 202
-            208 209 216 218 222 227 234 246 247 248 250 254 255 257 258
-            260 261 262 263 264 270 272 273 277 279
+            208 209 216 218 227 234 246 247 248 250 254 255 257 258
+            260 261 262 263 264 270 272 273 277 279 image-fleecing
 
 build-user:
   extends: .native_build_job_template
diff --git a/tests/qemu-iotests/222 b/tests/qemu-iotests/tests/image-fleecing
similarity index 100%
rename from tests/qemu-iotests/222
rename to tests/qemu-iotests/tests/image-fleecing
diff --git a/tests/qemu-iotests/222.out b/tests/qemu-iotests/tests/image-fleecing.out
similarity index 100%
rename from tests/qemu-iotests/222.out
rename to tests/qemu-iotests/tests/image-fleecing.out
-- 
2.31.1



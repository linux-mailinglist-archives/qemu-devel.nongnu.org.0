Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58EA22F51B0
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 19:08:52 +0100 (CET)
Received: from localhost ([::1]:37294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzkZf-0002E4-At
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 13:08:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kzkPR-000206-Nh
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 12:58:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37113)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kzkPP-00010w-Ga
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 12:58:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610560694;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bU+AGmGeqHFzTcyXBp/no/OR5o6fbi0ENmf3b/ZaRlQ=;
 b=FAIR5fiMLInlLJNoezW8ksO+2P3/1LwNaU+zd/hKYhXJK89SaIGlZB+17fbvHV5ckuMx/G
 Hmvb+85ijomQsA//OqJy8UXfb3wNxv4y3LOKapxIeT24ERZpWe5YgFY8q/tOj5APAOG3Hz
 9fC1FPtLSFUFXCRlzXNRCUdtkWt0Bq4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-65-TARGPk3bPqyXJ4EMnkkEOA-1; Wed, 13 Jan 2021 12:58:12 -0500
X-MC-Unique: TARGPk3bPqyXJ4EMnkkEOA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D656018C89C4;
 Wed, 13 Jan 2021 17:58:11 +0000 (UTC)
Received: from localhost (ovpn-113-103.ams2.redhat.com [10.36.113.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7216660C0F;
 Wed, 13 Jan 2021 17:58:11 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 7/8] iotests/129: Limit mirror job's buffer size
Date: Wed, 13 Jan 2021 18:57:51 +0100
Message-Id: <20210113175752.403022-8-mreitz@redhat.com>
In-Reply-To: <20210113175752.403022-1-mreitz@redhat.com>
References: <20210113175752.403022-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Issuing 'stop' on the VM drains all nodes.  If the mirror job has many
large requests in flight, this may lead to significant I/O that looks a
bit like 'stop' would make the job try to complete (which is what 129
should verify not to happen).

We can limit the I/O in flight by limiting the buffer size, so mirror
will make very little progress during the 'stop' drain.

(We do not need to do anything about commit, which has a buffer size of
512 kB by default; or backup, which goes cluster by cluster.  Once we
have asynchronous requests for backup, that will change, but then we can
fine-tune the backup job to only perform a single request on a very
small chunk, too.)

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/129 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/129 b/tests/qemu-iotests/129
index 7b4b6649f0..6d21470cd7 100755
--- a/tests/qemu-iotests/129
+++ b/tests/qemu-iotests/129
@@ -67,7 +67,7 @@ class TestStopWithBlockJob(iotests.QMPTestCase):
     def test_drive_mirror(self):
         self.do_test_stop("drive-mirror", device="drive0",
                           target=self.target_img, format=iotests.imgfmt,
-                          sync="full")
+                          sync="full", buf_size=65536)
 
     def test_drive_backup(self):
         self.do_test_stop("drive-backup", device="drive0",
-- 
2.29.2



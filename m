Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7C53C1752
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 18:46:22 +0200 (CEST)
Received: from localhost ([::1]:46172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1XAL-0003ks-JO
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 12:46:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m1WKZ-0005sf-HC
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:52:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m1WKX-0002Kg-Mx
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:52:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625759569;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XgLMDfnWC5chqFkmxXx4lOFlV08fc4F6BXe5X8u2xSY=;
 b=Mq6cy6gWYdIPmnZHRm7AjfX0aLLzImNnMY64CD8vvVfwpCxZ93DeK+lGVef/8UzXghYGpP
 zzoj8MSxIEXq19GcGPs3O4XNzbLRHq13UKRw1UWnAUM/Zxs0RfsxBNSQlU/WNuPuqhneH6
 qtIb4n1C511WimLNBJDuvnST4SX8pmk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-122-KL1vK6RgNqGxO2g_KTe0nQ-1; Thu, 08 Jul 2021 11:52:35 -0400
X-MC-Unique: KL1vK6RgNqGxO2g_KTe0nQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7B11B362F8;
 Thu,  8 Jul 2021 15:52:34 +0000 (UTC)
Received: from blue.redhat.com (ovpn-112-103.phx2.redhat.com [10.3.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 521F860CCC;
 Thu,  8 Jul 2021 15:52:30 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/2] qemu-img: Improve error for rebase without backing format
Date: Thu,  8 Jul 2021 10:52:28 -0500
Message-Id: <20210708155228.2666172-1-eblake@redhat.com>
In-Reply-To: <20210503213600.569128-1-eblake@redhat.com>
References: <20210503213600.569128-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: libvir-list@redhat.com, kwolf@redhat.com, qemu-block@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When removeing support for qemu-img being able to create backing
chains without embedded backing formats, we caused a poor error
message as caught by iotest 114.  Improve the situation to inform the
user what went wrong.

Suggested-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 qemu-img.c                 | 3 +++
 tests/qemu-iotests/114.out | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/qemu-img.c b/qemu-img.c
index 7c0e73882dd4..b017734c255a 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -3786,6 +3786,9 @@ static int img_rebase(int argc, char **argv)
     if (ret == -ENOSPC) {
         error_report("Could not change the backing file to '%s': No "
                      "space left in the file header", out_baseimg);
+    } else if (ret == -EINVAL && out_baseimg && !out_basefmt) {
+        error_report("Could not change the backing file to '%s': backing "
+                     "format must be specified", out_baseimg);
     } else if (ret < 0) {
         error_report("Could not change the backing file to '%s': %s",
             out_baseimg, strerror(-ret));
diff --git a/tests/qemu-iotests/114.out b/tests/qemu-iotests/114.out
index 172454401257..016e9ce3ecfb 100644
--- a/tests/qemu-iotests/114.out
+++ b/tests/qemu-iotests/114.out
@@ -14,7 +14,7 @@ qemu-io: can't open device TEST_DIR/t.qcow2: Could not open backing file: Unknow
 no file open, try 'help open'
 read 4096/4096 bytes at offset 0
 4 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
-qemu-img: Could not change the backing file to '/home/eblake/qemu/build/tests/qemu-iotests/scratch/t.qcow2.base': Invalid argument
+qemu-img: Could not change the backing file to '/home/eblake/qemu/build/tests/qemu-iotests/scratch/t.qcow2.base': backing format must be specified
 read 4096/4096 bytes at offset 0
 4 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 *** done
-- 
2.31.1



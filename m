Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F36DB3C240C
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 15:11:49 +0200 (CEST)
Received: from localhost ([::1]:36646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1qIG-0004aD-UT
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 09:11:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m1pzH-00052k-F2
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 08:52:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45207)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m1pzD-0003ix-Dq
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 08:52:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625835126;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BdFFddYBoGMJdGxFbAc52tLyH54RbjJn5r3VQH97fEA=;
 b=dhyAcdS7P39H5cEIXGOUBIeGXxVUZ2eBIqHLjvRkecf4NmEdn1Dy7HpN8HPUqDmBzIfmVv
 6uc/WBJNtIAxyoJkoQ+o5kJMKVO++pXEc4zWuSc0a1PoddcLRH9HxsqtDgwRxkp4mAa4KX
 rPuxxs5RveB3SZpj5C7qwq4c59wNa4Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-873O5ItuMoaf7_6Bv5vHYQ-1; Fri, 09 Jul 2021 08:52:05 -0400
X-MC-Unique: 873O5ItuMoaf7_6Bv5vHYQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 69D20188CBE0;
 Fri,  9 Jul 2021 12:52:04 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-113-203.ams2.redhat.com [10.36.113.203])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 01BEC60843;
 Fri,  9 Jul 2021 12:52:01 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 22/28] qemu-img: Improve error for rebase without backing format
Date: Fri,  9 Jul 2021 14:50:29 +0200
Message-Id: <20210709125035.191321-23-kwolf@redhat.com>
In-Reply-To: <20210709125035.191321-1-kwolf@redhat.com>
References: <20210709125035.191321-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eric Blake <eblake@redhat.com>

When removeing support for qemu-img being able to create backing
chains without embedded backing formats, we caused a poor error
message as caught by iotest 114.  Improve the situation to inform the
user what went wrong.

Suggested-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
Message-Id: <20210708155228.2666172-1-eblake@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 qemu-img.c                 | 3 +++
 tests/qemu-iotests/114.out | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/qemu-img.c b/qemu-img.c
index ec0e2fabe5..7c4fc60312 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -3767,6 +3767,9 @@ static int img_rebase(int argc, char **argv)
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
index 6d638da266..f51dd9d20a 100644
--- a/tests/qemu-iotests/114.out
+++ b/tests/qemu-iotests/114.out
@@ -14,7 +14,7 @@ qemu-io: can't open device TEST_DIR/t.qcow2: Could not open backing file: Unknow
 no file open, try 'help open'
 read 4096/4096 bytes at offset 0
 4 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
-qemu-img: Could not change the backing file to 'TEST_DIR/t.qcow2.base': Invalid argument
+qemu-img: Could not change the backing file to 'TEST_DIR/t.qcow2.base': backing format must be specified
 read 4096/4096 bytes at offset 0
 4 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 *** done
-- 
2.31.1



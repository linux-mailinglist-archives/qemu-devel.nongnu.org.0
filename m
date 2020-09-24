Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1864327763D
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Sep 2020 18:08:28 +0200 (CEST)
Received: from localhost ([::1]:42956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kLTnH-00045A-32
	for lists+qemu-devel@lfdr.de; Thu, 24 Sep 2020 12:08:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kLTAl-000231-Rr
 for qemu-devel@nongnu.org; Thu, 24 Sep 2020 11:28:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kLTAi-0005d5-HW
 for qemu-devel@nongnu.org; Thu, 24 Sep 2020 11:28:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600961307;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g6w9rA09as+W32QxuJIiH72sIIX0MnoKDndmS+8uX+s=;
 b=e0r5YP1eEi9Cjxo6Bxg7zwOc9qeyjhG9r0r9K66Jx8TiiL2iFQVwWN4dd5xf62BqFohNSa
 2XhqE1sTm4qb2M2KJmxye2cMLSKBpCRvu9i7m/r7EMLPZtXD5R0236ZmtgTWSXEjsc+Xec
 qmk2dMx99PQiGZH0Jln8bvSeqmVdzkE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-572-9bEcIVpOMQSdXMXVCMEMzA-1; Thu, 24 Sep 2020 11:28:22 -0400
X-MC-Unique: 9bEcIVpOMQSdXMXVCMEMzA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3B097104FCA0;
 Thu, 24 Sep 2020 15:28:21 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-114-72.ams2.redhat.com [10.36.114.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E960460C04;
 Thu, 24 Sep 2020 15:28:19 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 30/31] iotests: Allow supported and unsupported formats at
 the same time
Date: Thu, 24 Sep 2020 17:27:16 +0200
Message-Id: <20200924152717.287415-31-kwolf@redhat.com>
In-Reply-To: <20200924152717.287415-1-kwolf@redhat.com>
References: <20200924152717.287415-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/24 01:10:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org, stefanha@redhat.com,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is useful for specifying 'generic' as supported (which includes
only writable image formats), but still excluding some incompatible
writable formats.

It also removes more lines than it adds.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/iotests.py | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index cb9f90f737..9c33689cba 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -1064,16 +1064,12 @@ def case_notrun(reason):
 
 def _verify_image_format(supported_fmts: Sequence[str] = (),
                          unsupported_fmts: Sequence[str] = ()) -> None:
-    assert not (supported_fmts and unsupported_fmts)
-
     if 'generic' in supported_fmts and \
             os.environ.get('IMGFMT_GENERIC', 'true') == 'true':
         # similar to
         #   _supported_fmt generic
         # for bash tests
-        if imgfmt == 'luks':
-            verify_working_luks()
-        return
+        supported_fmts = ()
 
     not_sup = supported_fmts and (imgfmt not in supported_fmts)
     if not_sup or (imgfmt in unsupported_fmts):
-- 
2.25.4



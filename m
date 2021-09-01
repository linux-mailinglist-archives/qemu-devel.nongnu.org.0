Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3008F3FDED1
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 17:39:19 +0200 (CEST)
Received: from localhost ([::1]:47118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLSKa-0007JX-Ji
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 11:39:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mLRzD-0004dQ-5z
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 11:17:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57221)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mLRzB-0003cW-Cz
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 11:17:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630509428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F8AaHfQRnn/TzuyV/qk/3Rp5lhp+NGLCu5i6cugLt1A=;
 b=RdB/vOk501OXDuDgHK1gs6NPWLma5H9MDXUbW0vCCKJFd4aaYdROng7Tnz6p9xbg8BHin6
 daQ3tz4hndUbqZ/m5Vf02Olo7kUcCDqy3qbjAm7a5C8Qvtz/XEf+662u/EIYwtVzZWsDHR
 TNSB+es3pzgSE880oNX6OhK8IGbP5Uc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-onRFq3psP_Kbi0hw9U9lmg-1; Wed, 01 Sep 2021 11:17:04 -0400
X-MC-Unique: onRFq3psP_Kbi0hw9U9lmg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA48E1B2C980;
 Wed,  1 Sep 2021 15:17:03 +0000 (UTC)
Received: from localhost (unknown [10.39.193.250])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 83E0D6608B;
 Wed,  1 Sep 2021 15:17:03 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 20/56] iotests: use subprocess.DEVNULL instead of
 open("/dev/null")
Date: Wed,  1 Sep 2021 17:15:43 +0200
Message-Id: <20210901151619.689075-21-hreitz@redhat.com>
In-Reply-To: <20210901151619.689075-1-hreitz@redhat.com>
References: <20210901151619.689075-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

From: John Snow <jsnow@redhat.com>

Avoids a warning from pylint not to use open() outside of a
with-statement, and is ... probably more portable anyway. Not that I
think we care too much about running tests *on* Windows, but... eh.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-Id: <20210720173336.1876937-3-jsnow@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/iotests.py | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 2ad7a15c8b..4c8971d946 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -237,18 +237,18 @@ def qemu_io_silent(*args):
         default_args = qemu_io_args
 
     args = default_args + list(args)
-    exitcode = subprocess.call(args, stdout=open('/dev/null', 'w'))
-    if exitcode < 0:
+    result = subprocess.run(args, stdout=subprocess.DEVNULL, check=False)
+    if result.returncode < 0:
         sys.stderr.write('qemu-io received signal %i: %s\n' %
-                         (-exitcode, ' '.join(args)))
-    return exitcode
+                         (-result.returncode, ' '.join(args)))
+    return result.returncode
 
 def qemu_io_silent_check(*args):
     '''Run qemu-io and return the true if subprocess returned 0'''
     args = qemu_io_args + list(args)
-    exitcode = subprocess.call(args, stdout=open('/dev/null', 'w'),
-                               stderr=subprocess.STDOUT)
-    return exitcode == 0
+    result = subprocess.run(args, stdout=subprocess.DEVNULL,
+                            stderr=subprocess.STDOUT, check=False)
+    return result.returncode == 0
 
 class QemuIoInteractive:
     def __init__(self, *args):
-- 
2.31.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 709C63D005E
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 19:37:52 +0200 (CEST)
Received: from localhost ([::1]:60078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5tgl-00076m-Gw
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 13:37:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1m5tcq-0005T4-Su
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 13:33:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1m5tco-0005Z2-HC
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 13:33:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626802426;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wm+w/Q7w1N/7b7PVF5TuJJNEZKONVEp1ktCTYUmc+m0=;
 b=YSrvhW1+gSFMIBBW0x1a/9udUM4bKDjH86lA4Fds7urw2uwR1E9znvbilR3OY1q0+nnl/Q
 4ToEsKv1FWIaG8QR6cZdXDTzbA0yMPiaWW0rmq4M1A/eSUPwRrki48Gz4zgUK4iq4hEJnL
 P7GMkAveFR+emVYvGuSdMgJUf+GLGpE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-WvtN4DlKN5Sy88PNE665uQ-1; Tue, 20 Jul 2021 13:33:42 -0400
X-MC-Unique: WvtN4DlKN5Sy88PNE665uQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7F52D10C1ADC;
 Tue, 20 Jul 2021 17:33:41 +0000 (UTC)
Received: from scv.redhat.com (ovpn-119-193.rdu2.redhat.com [10.10.119.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8233A69CB4;
 Tue, 20 Jul 2021 17:33:40 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/17] iotests: use subprocess.DEVNULL instead of
 open("/dev/null")
Date: Tue, 20 Jul 2021 13:33:21 -0400
Message-Id: <20210720173336.1876937-3-jsnow@redhat.com>
In-Reply-To: <20210720173336.1876937-1-jsnow@redhat.com>
References: <20210720173336.1876937-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) DKIMWL_WL_HIGH=-1.474, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Avoids a warning from pylint not to use open() outside of a
with-statement, and is ... probably more portable anyway. Not that I
think we care too much about running tests *on* Windows, but... eh.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/iotests.py | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index beadf5c821c..64f9b688f55 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -219,18 +219,18 @@ def qemu_io_silent(*args):
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



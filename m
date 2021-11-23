Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B6A459A30
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 03:44:48 +0100 (CET)
Received: from localhost ([::1]:42278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpLnb-0005ZX-8E
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 21:44:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mpLhm-00064t-LG
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 21:38:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54322)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mpLhl-0006Dm-4x
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 21:38:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637635124;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8+GTZSvctCBccGSoZcytnr/ai9XcAGGv85l+9WkFHIw=;
 b=N2Q3t46JGwjII/wUwL5lQEnV/VtJPCB3s2Rap8lPimjoPivDsYdLWwQ/JM8+tPmi8lj42O
 GhnzF3ebmjOnpOunZHFIrOlutQP4StglsL3ychNiqpZP7VRiHjYyBBPh0tzvq2YArcInAg
 MfUF0gjQWuDXS4QZWhWBlG+n+E7oAF0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-479-qmcuTuPbPca-cOUl1_ujOw-1; Mon, 22 Nov 2021 21:38:41 -0500
X-MC-Unique: qmcuTuPbPca-cOUl1_ujOw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 19337425C8;
 Tue, 23 Nov 2021 02:38:40 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.32.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 46B3756A8B;
 Tue, 23 Nov 2021 02:38:38 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 6/7] scripts/device-crash-test: Use a QMP timeout
Date: Mon, 22 Nov 2021 21:38:04 -0500
Message-Id: <20211123023805.2745382-7-jsnow@redhat.com>
In-Reply-To: <20211123023805.2745382-1-jsnow@redhat.com>
References: <20211123023805.2745382-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.709,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel Berrange <berrange@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Willian Rampazzo <willianr@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Despite all the previous fixes, it's still possible for
device-crash-test to wedge itself in the case that QEMU terminates *so
quickly* that it doesn't even begin a connection attempt to our QMP
client. Python will just joyfully wait ad infinitum for a connection
that will now never arrive.

The real fix is to use asyncio to simultaneously poll both the health of
the launched process AND the connection attempt. That's quite a bit more
invasive than just setting a connection timeout, though.

Do the very simplest thing for now.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-id: 20211118204620.1897674-7-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/device-crash-test | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/device-crash-test b/scripts/device-crash-test
index 1c73dac93e..7fbd99158b 100755
--- a/scripts/device-crash-test
+++ b/scripts/device-crash-test
@@ -353,7 +353,7 @@ def checkOneCase(args, testcase):
             '-device', qemuOptsEscape(device)]
     cmdline = ' '.join([binary] + args)
     dbg("will launch QEMU: %s", cmdline)
-    vm = QEMUMachine(binary=binary, args=args)
+    vm = QEMUMachine(binary=binary, args=args, qmp_timer=15)
 
     exc = None
     exc_traceback = None
-- 
2.31.1



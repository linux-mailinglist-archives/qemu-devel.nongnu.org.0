Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3441740F1CF
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 07:59:41 +0200 (CEST)
Received: from localhost ([::1]:41910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mR6uS-00064k-AD
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 01:59:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mR6d1-0005Tz-2d
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 01:41:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mR6cu-0003kW-RH
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 01:41:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631857292;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9jCyR/xCKfjQQeBsjS5y4/tYPLeBcVRFK1FtN6PZxro=;
 b=OMOino5yQxqSyG8RUmuO1pq3EhsEhJqGD8aleXuhXFJvtst6k4oyJt/AeV4HrbFm3ykXsj
 sKmre0G/mEouWH9jc5HPBZfwTL0EILOoSgggIMJlbajDfv3WCqMhT7Ln6DrDAq4TQnXQZQ
 +pH0K3G7jkjdxXhj6nSlF2i1Mpw3WQk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-39-zAShy2RFO9aQ4a0pUXVj2Q-1; Fri, 17 Sep 2021 01:41:29 -0400
X-MC-Unique: zAShy2RFO9aQ4a0pUXVj2Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB8731006AA7;
 Fri, 17 Sep 2021 05:41:27 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.11.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 923D360843;
 Fri, 17 Sep 2021 05:41:26 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 15/15] python, iotests: replace qmp with aqmp
Date: Fri, 17 Sep 2021 01:40:47 -0400
Message-Id: <20210917054047.2042843-16-jsnow@redhat.com>
In-Reply-To: <20210917054047.2042843-1-jsnow@redhat.com>
References: <20210917054047.2042843-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Swap out the synchronous QEMUMonitorProtocol from qemu.qmp with the sync
wrapper from qemu.aqmp instead.

Add an escape hatch in the form of the environment variable
QEMU_PYTHON_LEGACY_QMP which allows you to cajole QEMUMachine into using
the old interface, proving that both implementations work concurrently.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/machine/machine.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
index 8f5a6649e5..6b005dd5d1 100644
--- a/python/qemu/machine/machine.py
+++ b/python/qemu/machine/machine.py
@@ -41,7 +41,6 @@
 )
 
 from qemu.qmp import (  # pylint: disable=import-error
-    QEMUMonitorProtocol,
     QMPMessage,
     QMPReturnValue,
     SocketAddrT,
@@ -50,6 +49,12 @@
 from . import console_socket
 
 
+if os.environ.get('QEMU_PYTHON_LEGACY_QMP'):
+    from qemu.qmp import QEMUMonitorProtocol
+else:
+    from qemu.aqmp.legacy import QEMUMonitorProtocol
+
+
 LOG = logging.getLogger(__name__)
 
 
-- 
2.31.1



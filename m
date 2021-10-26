Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A87943B902
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 20:07:25 +0200 (CEST)
Received: from localhost ([::1]:52844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfQr6-0006oB-Fs
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 14:07:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mfQgX-0003cf-67
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 13:56:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mfQgS-0004Ya-Mx
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 13:56:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635270983;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7bs1uEySQ3f1s/c22vKBVNLQv/ngA339gcy2wgPm8eE=;
 b=P0tyv1Li66onn4NTLOnWSUb8KoZ1fIOdPxIX15HbWUTMdRj7VthEzzD0abUxZqNxYNTxKo
 JmWe+uBmVcdyf+LHJ3k5z9as9Q0XN5LYno4kCnye6R8V0AkbnbNDJpVxtSWIeaH5Z0Lz53
 7HykbBB8Akp8PIW8jOonpJirIpEgtS4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-yxULgMXINuGz4Eb3Flw9IQ-1; Tue, 26 Oct 2021 13:56:22 -0400
X-MC-Unique: yxULgMXINuGz4Eb3Flw9IQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 806951023F4D;
 Tue, 26 Oct 2021 17:56:21 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.17.51])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B41475DF21;
 Tue, 26 Oct 2021 17:56:20 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 8/8] python, iotests: replace qmp with aqmp
Date: Tue, 26 Oct 2021 13:56:12 -0400
Message-Id: <20211026175612.4127598-9-jsnow@redhat.com>
In-Reply-To: <20211026175612.4127598-1-jsnow@redhat.com>
References: <20211026175612.4127598-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
the old implementation, proving that both implementations work
concurrently.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/machine/machine.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
index a0cf69786b4..a487c397459 100644
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



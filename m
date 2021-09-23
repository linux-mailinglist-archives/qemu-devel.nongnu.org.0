Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 640584154FA
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 03:04:55 +0200 (CEST)
Received: from localhost ([::1]:45110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTDAU-0006Y6-Dl
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 21:04:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mTCwL-0001q7-Ei
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 20:50:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mTCwI-0006aJ-6q
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 20:50:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632358213;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rhvx6sUQzndXcFI4jrnLkWb3ULoLpEBvD5i7UMzUPTU=;
 b=MruLKE6dCFc95H9AXY2JeIEZ0VvITzNeV2hNzh2a2rRvU/hx3Ub1ZFbtGvMGeMN1W9U4eW
 7ibsiOtB/lrON783OM4Z78OSZo+X7u8w9Wz01may9jmlqtnAqRBVF6+WromgLYlQImn0cS
 uxms4iY/UYi7MJVN3JJWhhwiEAo1tFY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-PFGBv19wMZK39IIwDraYCQ-1; Wed, 22 Sep 2021 20:50:12 -0400
X-MC-Unique: PFGBv19wMZK39IIwDraYCQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A6BB1006AA4;
 Thu, 23 Sep 2021 00:50:11 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.9.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5EB9A60BF1;
 Thu, 23 Sep 2021 00:50:10 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 17/17] python, iotests: replace qmp with aqmp
Date: Wed, 22 Sep 2021 20:49:38 -0400
Message-Id: <20210923004938.3999963-18-jsnow@redhat.com>
In-Reply-To: <20210923004938.3999963-1-jsnow@redhat.com>
References: <20210923004938.3999963-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
X-Spam_report: (-2.4 / 5.0 requ) DKIMWL_WL_HIGH=-1.472, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
the old implementatin, proving that both implementations work
concurrently.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Tested-by: Hanna Reitz <hreitz@redhat.com>
---
 python/qemu/machine/machine.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
index c33a78a2d9f..32879faeb40 100644
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



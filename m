Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E4F45CD82
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 20:47:36 +0100 (CET)
Received: from localhost ([::1]:50776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpyEy-0006du-3B
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 14:47:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mpxvE-0003dv-I4
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 14:27:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28218)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mpxvA-0007do-TZ
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 14:27:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637782028;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ln1iF3R/Saap+dvmbiTu+4xhne6Gp5Lto4kYEgUfVpY=;
 b=XVljtLctT+slkdavGKJSr6lI1A3OD1IyQpo7uPm8KvoTa6VaKu0S3/5ibrAr7Q06Gygt1N
 RkbWYDYfVyLiY2U5mk1oCNzxL8m7TPOTzJsEF/jXqKd4uy8Kp0LDuIsGU2U+e7Qa6AkinD
 jttRnLs8uQGHm6ZxlwSVngzxUrgIlvo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-432-IB0G3q3mNLeDvLyEwadwKA-1; Wed, 24 Nov 2021 14:27:07 -0500
X-MC-Unique: IB0G3q3mNLeDvLyEwadwKA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D3DE8042E1;
 Wed, 24 Nov 2021 19:27:03 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.9.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7CA986C336;
 Wed, 24 Nov 2021 19:27:02 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 14/23] scripts/render-block-graph: switch to AQMP
Date: Wed, 24 Nov 2021 14:26:08 -0500
Message-Id: <20211124192617.3396403-15-jsnow@redhat.com>
In-Reply-To: <20211124192617.3396403-1-jsnow@redhat.com>
References: <20211124192617.3396403-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Creating an instance of qemu.aqmp.ExecuteError is too involved here, so
just drop the specificity down to a generic AQMPError.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/render_block_graph.py | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/scripts/render_block_graph.py b/scripts/render_block_graph.py
index da6acf050d..d2f3a72348 100755
--- a/scripts/render_block_graph.py
+++ b/scripts/render_block_graph.py
@@ -25,10 +25,8 @@
 from graphviz import Digraph
 
 sys.path.append(os.path.join(os.path.dirname(__file__), '..', 'python'))
-from qemu.qmp import (
-    QEMUMonitorProtocol,
-    QMPResponseError,
-)
+from qemu.aqmp import AQMPError
+from qemu.aqmp.legacy import QEMUMonitorProtocol
 
 
 def perm(arr):
@@ -105,7 +103,7 @@ def command(self, cmd):
         reply = json.loads(subprocess.check_output(ar))
 
         if 'error' in reply:
-            raise QMPResponseError(reply)
+            raise AQMPError(reply)
 
         return reply['return']
 
-- 
2.31.1



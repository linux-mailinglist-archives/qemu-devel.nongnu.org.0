Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D524968AC
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Jan 2022 01:24:35 +0100 (CET)
Received: from localhost ([::1]:56028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nB4Cp-0003uN-2o
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 19:24:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nB3yu-0000xY-VU
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 19:10:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39077)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nB3yt-0005Qw-Cz
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 19:10:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642810210;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G3Si8WcTdAO8B3/OIKqcvxSkiZilPW9PdfSrSFPyr+A=;
 b=TdXOgUmNkhnYRUcWh5V2zRJt0ni+0G6hArMIw5YfnWv+Y0aZgmbSYNfoqi0F7HX7mIRmqP
 5ADzuOcPQs8aUxVNbndrI4bmFGTPqx6NnuZ/JIel/SX6Yqu7XjMMXgg/tOs4ZNidfLDfiw
 02Wh6G9Z1qzXj9HwGDVZPHrGzbYqJDU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-260-y7uo-hiRPLGikqfaF8sa2A-1; Fri, 21 Jan 2022 19:10:07 -0500
X-MC-Unique: y7uo-hiRPLGikqfaF8sa2A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A6E3A802925;
 Sat, 22 Jan 2022 00:10:06 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.19.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AD9B066E1B;
 Sat, 22 Jan 2022 00:10:00 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 17/17] scripts/render-block-graph: switch to AQMP
Date: Fri, 21 Jan 2022 19:09:31 -0500
Message-Id: <20220122000931.536322-18-jsnow@redhat.com>
In-Reply-To: <20220122000931.536322-1-jsnow@redhat.com>
References: <20220122000931.536322-1-jsnow@redhat.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Beraldo Leal <bleal@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Creating an instance of qemu.aqmp.ExecuteError is too involved here, so
just drop the specificity down to a generic QMPError.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Beraldo Leal <bleal@redhat.com>
---
 scripts/render_block_graph.py | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/scripts/render_block_graph.py b/scripts/render_block_graph.py
index 42288a3cfb..b33fb70d5e 100755
--- a/scripts/render_block_graph.py
+++ b/scripts/render_block_graph.py
@@ -25,10 +25,8 @@
 from graphviz import Digraph
 
 sys.path.append(os.path.join(os.path.dirname(__file__), '..', 'python'))
-from qemu.qmp import (
-    QEMUMonitorProtocol,
-    QMPResponseError,
-)
+from qemu.aqmp import QMPError
+from qemu.aqmp.legacy import QEMUMonitorProtocol
 
 
 def perm(arr):
@@ -104,7 +102,7 @@ def command(self, cmd):
         reply = json.loads(subprocess.check_output(ar))
 
         if 'error' in reply:
-            raise QMPResponseError(reply)
+            raise QMPError(reply)
 
         return reply['return']
 
-- 
2.31.1



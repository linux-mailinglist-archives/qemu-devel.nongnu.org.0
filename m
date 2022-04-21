Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A5D50A3ED
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 17:23:10 +0200 (CEST)
Received: from localhost ([::1]:52284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhYeD-00055L-Br
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 11:23:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nhYXV-0003Nm-C9
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:16:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nhYXQ-0005mm-76
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:16:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650554167;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9T6RxU05PzWWHlYrTypQG8S9sQZPor2x5IVdefW8PgA=;
 b=YzDjmFQqMByWBLOn0qyk0+b0rcxkpFCuL1ZTjs9lKUkklRiBPaYR/8ntLrHUKoTnreSZSg
 jgA+RPaWb7T60yTIv4BGibXiP+EG4Oksk7y1cmtDUVc4b7su8ZhAzZVAiTfid/8YRShZFS
 dunK7RK5q+wrIPkPz7ueGaEnOdt3DA4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-549-9ij-Fm30OgudwNSnoOE7hw-1; Thu, 21 Apr 2022 11:16:04 -0400
X-MC-Unique: 9ij-Fm30OgudwNSnoOE7hw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CCD033C1E8EA;
 Thu, 21 Apr 2022 15:16:03 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.34.80])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5966C40D016A;
 Thu, 21 Apr 2022 15:16:03 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/17] iotests: switch to AQMP
Date: Thu, 21 Apr 2022 11:15:47 -0400
Message-Id: <20220421151600.984189-5-jsnow@redhat.com>
In-Reply-To: <20220421151600.984189-1-jsnow@redhat.com>
References: <20220421151600.984189-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Beraldo Leal <bleal@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

iotests is already using async QMP, but to finalize the switchover we
only need to update any remaining import paths to rely solely on the new
library instead.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Beraldo Leal <bleal@redhat.com>
Acked-by: Hanna Reitz <hreitz@redhat.com>
Message-id: 20220321203315.909411-5-jsnow@redhat.com
[Fixed minor rebase conflict. --js]
Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/iotests.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index fe10a6cf05a..6f9aa38e0e8 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -37,9 +37,8 @@
 
 from contextlib import contextmanager
 
-from qemu.aqmp.legacy import QEMUMonitorProtocol
+from qemu.aqmp.legacy import QMPMessage, QEMUMonitorProtocol
 from qemu.machine import qtest
-from qemu.qmp import QMPMessage
 from qemu.utils import VerboseProcessError
 
 # Use this logger for logging messages directly from the iotests module
-- 
2.34.1



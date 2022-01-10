Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE34748A41A
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 01:00:31 +0100 (CET)
Received: from localhost ([::1]:57678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n74aU-0002gS-Qz
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 19:00:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n749b-0005u4-5D
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 18:32:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n749Q-0000Nu-QW
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 18:32:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641857552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1ZbXx0DMSG5+n5Usj99Ag9g43p0HtSVAkSo7Yl70EG8=;
 b=NnAWDqR/48zgplKITZfVlhE/nxKJ4kgYzScuawgD3iMtD/HrtG60XkJ8fI7z+j/+Gh0cbs
 xdGYbJT+6y1JooaUzLx5ZlG7gcALnj9k03Fsx9CJf0LMqpVDDwtjdxFcK0NtRF2k75sPwi
 1hwm6Z/0Nkmo94K6kbEJ0jArX2ujRiY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-572-tWOvoUUKPMuJDye_GB9RRQ-1; Mon, 10 Jan 2022 18:32:24 -0500
X-MC-Unique: tWOvoUUKPMuJDye_GB9RRQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2928F192CC40;
 Mon, 10 Jan 2022 23:32:23 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.219])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D76407B9C5;
 Mon, 10 Jan 2022 23:32:11 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 23/31] iotests: switch to AQMP
Date: Mon, 10 Jan 2022 18:29:02 -0500
Message-Id: <20220110232910.1923864-24-jsnow@redhat.com>
In-Reply-To: <20220110232910.1923864-1-jsnow@redhat.com>
References: <20220110232910.1923864-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Wainer Moschetta <wainersm@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Simply import the type defition from the new location.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Beraldo Leal <bleal@redhat.com>
---
 tests/qemu-iotests/iotests.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 1e2f2391d1..98bc50cb3a 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -37,7 +37,7 @@
 from contextlib import contextmanager
 
 from qemu.machine import qtest
-from qemu.qmp import QMPMessage
+from qemu.aqmp.legacy import QMPMessage
 
 # Use this logger for logging messages directly from the iotests module
 logger = logging.getLogger('qemu.iotests')
-- 
2.31.1



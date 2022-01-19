Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB828494111
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 20:44:18 +0100 (CET)
Received: from localhost ([::1]:37742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAGsT-0004Pf-Tn
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 14:44:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nAGo1-000288-3v
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 14:39:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nAGnz-00074V-1l
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 14:39:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642621178;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bU7q3hfL9crGkc1gjBTLbGF+FYGtHblRLHgIzlMwFZ4=;
 b=X/e46v2zLb3OMBDXvbw43zB14Vh7vBqHf8y1zMisLz1d0ILIjlcpumXujEPyvu4duOLr19
 gYsfNSf0ueT8293XXwYU1RTdBVmWxuVbc3FIV5/1FiBI8Vi6q2BNTDzdDHr9pdNCt/A3mV
 uI2snmHMGkp9JYszISeyB4JxWbSgkJo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-252-UqHz4P6PMWW17tyxgLR8dw-1; Wed, 19 Jan 2022 14:39:35 -0500
X-MC-Unique: UqHz4P6PMWW17tyxgLR8dw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 400181083F60;
 Wed, 19 Jan 2022 19:39:34 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.19.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E5CBF196AE;
 Wed, 19 Jan 2022 19:39:31 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/5] python/aqmp: Fix negotiation with pre-"oob" QEMU
Date: Wed, 19 Jan 2022 14:39:12 -0500
Message-Id: <20220119193916.4138217-2-jsnow@redhat.com>
In-Reply-To: <20220119193916.4138217-1-jsnow@redhat.com>
References: <20220119193916.4138217-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Beraldo Leal <bleal@redhat.com>, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QEMU versions prior to the "oob" capability *also* can't accept the
"enable" keyword argument at all. Fix the handshake process with older
QEMU versions.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/aqmp/qmp_client.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/python/qemu/aqmp/qmp_client.py b/python/qemu/aqmp/qmp_client.py
index 8105e29fa8..6b43e1dbbe 100644
--- a/python/qemu/aqmp/qmp_client.py
+++ b/python/qemu/aqmp/qmp_client.py
@@ -292,9 +292,9 @@ async def _negotiate(self) -> None:
         """
         self.logger.debug("Negotiating capabilities ...")
 
-        arguments: Dict[str, List[str]] = {'enable': []}
+        arguments: Dict[str, List[str]] = {}
         if self._greeting and 'oob' in self._greeting.QMP.capabilities:
-            arguments['enable'].append('oob')
+            arguments.setdefault('enable', []).append('oob')
         msg = self.make_execute_msg('qmp_capabilities', arguments=arguments)
 
         # It's not safe to use execute() here, because the reader/writers
-- 
2.31.1



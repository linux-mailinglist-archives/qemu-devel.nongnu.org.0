Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C960A4154E0
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 02:56:24 +0200 (CEST)
Received: from localhost ([::1]:56200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTD2F-0002w0-GV
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 20:56:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mTCw1-0001Ef-RQ
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 20:49:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mTCvy-0006Li-3z
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 20:49:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632358193;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4Qf7jdTA8aQiiAXyNaikq5zI/DuPDtB2KmPLuA5ap3I=;
 b=P1Lb+YM3RtcVOMHg5pz546xQnKVtsnTIz7Mn57CmxJQ04bEP40/swkPxveUtHylNxomm1Q
 dmfNG6qJVz+bzvXDMCe8hiD9G01TyGJAhlHULSMwLtTJo/ZTNpeVxAVRkWQ5eITMLZMr8+
 q85162fth3EI9EcOigAl6GVC9uK0c+A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-450-4PCxw6EzNBa-FS5ivPv54A-1; Wed, 22 Sep 2021 20:49:51 -0400
X-MC-Unique: 4PCxw6EzNBa-FS5ivPv54A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E27DC9126B;
 Thu, 23 Sep 2021 00:49:50 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.9.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2ED1060BF1;
 Thu, 23 Sep 2021 00:49:49 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/17] python/aqmp: Add dict conversion method to Greeting
 object
Date: Wed, 22 Sep 2021 20:49:26 -0400
Message-Id: <20210923004938.3999963-6-jsnow@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

The iotests interface expects to return the greeting as a dict; AQMP
offers it as a rich object.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/aqmp/models.py | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/python/qemu/aqmp/models.py b/python/qemu/aqmp/models.py
index 24c94123ac0..de87f878047 100644
--- a/python/qemu/aqmp/models.py
+++ b/python/qemu/aqmp/models.py
@@ -8,8 +8,10 @@
 # pylint: disable=too-few-public-methods
 
 from collections import abc
+import copy
 from typing import (
     Any,
+    Dict,
     Mapping,
     Optional,
     Sequence,
@@ -66,6 +68,17 @@ def __init__(self, raw: Mapping[str, Any]):
         self._check_member('QMP', abc.Mapping, "JSON object")
         self.QMP = QMPGreeting(self._raw['QMP'])
 
+    def _asdict(self) -> Dict[str, object]:
+        """
+        For compatibility with the iotests sync QMP wrapper.
+
+        The legacy QMP interface needs Greetings as a garden-variety Dict.
+
+        This interface is private in the hopes that it will be able to
+        be dropped again in the near-future. Caller beware!
+        """
+        return dict(copy.deepcopy(self._raw))
+
 
 class QMPGreeting(Model):
     """
-- 
2.31.1



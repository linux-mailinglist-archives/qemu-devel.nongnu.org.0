Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4FD42AF3F
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 23:47:00 +0200 (CEST)
Received: from localhost ([::1]:54948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maPbv-0000GI-So
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 17:46:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1maPYN-0005Mr-98
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 17:43:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1maPYK-0000FU-Cw
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 17:43:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634074995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dI6iI5UgpxVhuCMO3m8cMQyqyjH7mWWgQtWgcanBtAI=;
 b=d2CSZSoTpTWBXVi5nW8XDW/iEYaVq3wiY4OCrtuihiaCX/n/VWjGbWQ3iH1Ex7bQOeJcgN
 0fi/oLKusM1kMdouMP5XPILnP1n5uXxKtadoc8/g6x7BGrVSD+uchonEPqC+pS19EH4cao
 BfR21ay5PqF9qA4hHGZmIh71IaQXgpc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-445-yGd4QAvcNsq63JXVrhVKxw-1; Tue, 12 Oct 2021 17:43:11 -0400
X-MC-Unique: yGd4QAvcNsq63JXVrhVKxw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 71518362FA;
 Tue, 12 Oct 2021 21:43:10 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6FF445D6A8;
 Tue, 12 Oct 2021 21:43:04 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/10] python/aqmp: Add dict conversion method to Greeting
 object
Date: Tue, 12 Oct 2021 17:41:47 -0400
Message-Id: <20211012214152.802483-6-jsnow@redhat.com>
In-Reply-To: <20211012214152.802483-1-jsnow@redhat.com>
References: <20211012214152.802483-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Willian Rampazzo <willianr@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The iotests interface expects to return the greeting as a dict; AQMP
offers it as a rich object.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-id: 20210923004938.3999963-6-jsnow@redhat.com
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



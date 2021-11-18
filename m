Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B02D456471
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 21:49:00 +0100 (CET)
Received: from localhost ([::1]:47094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnoL5-0004Wq-0N
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 15:48:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mnoIh-0001ni-0f
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 15:46:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mnoIe-0000Ln-43
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 15:46:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637268387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jTQfIyuS37HzgltknYvlF9196x/vDU6R5jL5EMLI21s=;
 b=FTTNyjgwrZtqvv5F4UmAyLDKUnvRqQ6VOvWRuMZ+36jfPzu8kVGJl89Nhz9nYNKkEuJbjE
 UnMpOnIHTEUhTdKbc43KZxMJAoXNd9otmvvT64mFpRQKrG9Ty/SOeDyQjOUq0ohWgtM+cN
 L4uypb+N+U8V6DQaRp2tIsNLqoVQfig=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-545-pJAC2Q10M166kQO7DFup1g-1; Thu, 18 Nov 2021 15:46:25 -0500
X-MC-Unique: pJAC2Q10M166kQO7DFup1g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CE2BA804141
 for <qemu-devel@nongnu.org>; Thu, 18 Nov 2021 20:46:24 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.18.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 22284604CC;
 Thu, 18 Nov 2021 20:46:24 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/7] python/machine: add instance disambiguator to default
 nickname
Date: Thu, 18 Nov 2021 15:46:16 -0500
Message-Id: <20211118204620.1897674-4-jsnow@redhat.com>
In-Reply-To: <20211118204620.1897674-1-jsnow@redhat.com>
References: <20211118204620.1897674-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If you create two instances of QEMUMachine(), they'll both create the
same nickname by default -- which is not that helpful.

Luckily, they'll both create unique temporary directories ... but due to
user configuration, they may share logging and sockfile directories,
meaning two instances can collide. The Python logging will also be quite
confusing, with no differentiation between the two instances.

Add an instance disambiguator (The memory address of the instance) to
the default nickname to foolproof this in all cases.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/machine/machine.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
index ea9e07805d..ad529fd92a 100644
--- a/python/qemu/machine/machine.py
+++ b/python/qemu/machine/machine.py
@@ -133,7 +133,7 @@ def __init__(self,
         self._wrapper = wrapper
         self._qmp_timer = qmp_timer
 
-        self._name = name or "qemu-%d" % os.getpid()
+        self._name = name or f"qemu-{os.getpid()}-{id(self):02x}"
         self._temp_dir: Optional[str] = None
         self._base_temp_dir = base_temp_dir
         self._sock_dir = sock_dir
-- 
2.31.1



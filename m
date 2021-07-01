Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6738B3B8BFE
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 04:14:34 +0200 (CEST)
Received: from localhost ([::1]:43502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lymDp-0008Us-Ar
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 22:14:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lym9E-0008ES-V3
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 22:09:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43220)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lym96-00066d-O8
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 22:09:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625105378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mMUKkExFcy5aKkgVaZzZWoIubxTcAoEwc89H4FwOTyY=;
 b=fv1Hlo/LEDPKvkIur2cIf5RmovGmRau9ihrGrOc0EFlGT1dAe0+2cRerMw7qDbjRgtD4zQ
 Ts4GDjhQ8mgNd0YjkDze9UyXcrqitbM5t3OOmzGSGyrviCeg7gHfKJghcyui7HcFFfa+Yq
 0kG9YwLXg05tVxIpMcF8x1G2TTFKbkU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-LhrnYIStNmmLvD8xACYxTQ-1; Wed, 30 Jun 2021 22:09:34 -0400
X-MC-Unique: LhrnYIStNmmLvD8xACYxTQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA6501084F5B;
 Thu,  1 Jul 2021 02:09:33 +0000 (UTC)
Received: from scv.redhat.com (ovpn-118-71.rdu2.redhat.com [10.10.118.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2C19F5C25D;
 Thu,  1 Jul 2021 02:09:31 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/15] python: expose typing information via PEP 561
Date: Wed, 30 Jun 2021 22:09:08 -0400
Message-Id: <20210701020921.1679468-3-jsnow@redhat.com>
In-Reply-To: <20210701020921.1679468-1-jsnow@redhat.com>
References: <20210701020921.1679468-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

https://www.python.org/dev/peps/pep-0561/#specification

Create 'py.typed' files in each subpackage that indicate to mypy that
this is a typed module, so that users of any of these packages can use
mypy to check their code as well.

Note: Theoretically it's possible to ditch MANIFEST.in in favor of using
package_data in setup.cfg, but I genuinely could not figure out how to
get it to include things from the *source root* into the *package root*;
only how to include things from each subpackage. I tried!

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-id: 20210629214323.1329806-3-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/machine/py.typed | 0
 python/qemu/qmp/py.typed     | 0
 python/qemu/utils/py.typed   | 0
 python/setup.cfg             | 4 ++++
 4 files changed, 4 insertions(+)
 create mode 100644 python/qemu/machine/py.typed
 create mode 100644 python/qemu/qmp/py.typed
 create mode 100644 python/qemu/utils/py.typed

diff --git a/python/qemu/machine/py.typed b/python/qemu/machine/py.typed
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/python/qemu/qmp/py.typed b/python/qemu/qmp/py.typed
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/python/qemu/utils/py.typed b/python/qemu/utils/py.typed
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/python/setup.cfg b/python/setup.cfg
index 85cecbb41b..db1639c1f2 100644
--- a/python/setup.cfg
+++ b/python/setup.cfg
@@ -19,6 +19,7 @@ classifiers =
     Programming Language :: Python :: 3.8
     Programming Language :: Python :: 3.9
     Programming Language :: Python :: 3.10
+    Typing :: Typed
 
 [options]
 python_requires = >= 3.6
@@ -27,6 +28,9 @@ packages =
     qemu.machine
     qemu.utils
 
+[options.package_data]
+* = py.typed
+
 [options.extras_require]
 # Run `pipenv lock --dev` when changing these requirements.
 devel =
-- 
2.31.1



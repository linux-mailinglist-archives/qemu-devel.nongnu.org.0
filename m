Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F673B7A05
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 23:45:29 +0200 (CEST)
Received: from localhost ([::1]:54132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyLXs-0002MS-IV
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 17:45:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lyLW8-0000Ft-C0
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 17:43:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lyLW6-0005gB-Bm
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 17:43:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625003017;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mO6cT9DWGn6AvlSVpHL+QcqqeDXyFMM6BsbjivjrK0U=;
 b=MgmYER+bnjZbIfLFPY5RcSSCr3F3+pAIDHrhozyWFXvpQfdEoM//JIt8rDpFsAwYzup8wt
 xkTq61rVBkIRj4vDZzMEiN+3n2IcjTKT+sKeANYg/gRGZkDkcFFkkmkFwj52P0X6xlAhgx
 oXDYO97oNiURClqbV7aR6Nm6wDZjyHM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-440-b7plPcyoOXem5mXm0YgUBQ-1; Tue, 29 Jun 2021 17:43:34 -0400
X-MC-Unique: b7plPcyoOXem5mXm0YgUBQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA26A1084F53;
 Tue, 29 Jun 2021 21:43:33 +0000 (UTC)
Received: from scv.redhat.com (ovpn-118-71.rdu2.redhat.com [10.10.118.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E4D5760C13;
 Tue, 29 Jun 2021 21:43:32 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 02/15] python: expose typing information via PEP 561
Date: Tue, 29 Jun 2021 17:43:10 -0400
Message-Id: <20210629214323.1329806-3-jsnow@redhat.com>
In-Reply-To: <20210629214323.1329806-1-jsnow@redhat.com>
References: <20210629214323.1329806-1-jsnow@redhat.com>
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
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



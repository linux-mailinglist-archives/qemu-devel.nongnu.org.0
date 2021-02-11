Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7253192D2
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 20:09:44 +0100 (CET)
Received: from localhost ([::1]:34732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAHLT-00035U-4V
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 14:09:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lAHC4-0004HJ-JM
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 14:00:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34220)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lAHC2-0005XO-3B
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 14:00:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613069997;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4FgdZjCB9nYrp0l5ZQGbvbLznuS3D9WfVvGAi7egSBc=;
 b=WH2aLhAYHLWUc6+HvVkLhebmPWBnYw+nwyQAB3jE91ZZb98NvLxdl9JQ1vhEz1vW2Y/We5
 Fgue3NkXkQMUNJrPwSF9JQKPH1Z0zBuFtSFZ0KVYdcCImcrrTaSqDTdrX0ku9OCskbjCbH
 1M63fGbkmVqjqRLsNEMwVpFxpNCQH7U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-A3wdKkYoMXiNg8F9S6Nhuw-1; Thu, 11 Feb 2021 13:59:53 -0500
X-MC-Unique: A3wdKkYoMXiNg8F9S6Nhuw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 58D2A192CC77;
 Thu, 11 Feb 2021 18:59:40 +0000 (UTC)
Received: from scv.redhat.com (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D859B6B8DF;
 Thu, 11 Feb 2021 18:59:38 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 08/24] python: Add pipenv support
Date: Thu, 11 Feb 2021 13:58:40 -0500
Message-Id: <20210211185856.3975616-9-jsnow@redhat.com>
In-Reply-To: <20210211185856.3975616-1-jsnow@redhat.com>
References: <20210211185856.3975616-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

pipenv is a tool used for managing virtual environments with pinned,
explicit dependencies. It is used for precisely recreating python
virtual environments.

pipenv uses two files to do this:

(1) Pipfile, which is similar in purpose and scope to what setup.py
lists. It specifies the requisite minimum to get a functional
environment for using this package.

(2) Pipfile.lock, which is similar in purpose to `pip freeze >
requirements.txt`. It specifies a canonical virtual environment used for
deployment or testing. This ensures that all users have repeatable
results.

The primary benefit of using this tool is to ensure repeatable CI
results with a known set of packages. Although I endeavor to support as
many versions as I can, the fluid nature of the Python toolchain often
means tailoring code for fairly specific versions.

Note that pipenv is *not* required to install or use this module; this is
purely for the sake of repeatable testing by CI or developers.

Here, a "blank" pipfile is added with no dependencies, but specifies
Python 3.6 for the virtual environment.

Pipfile will specify our version minimums, while Pipfile.lock specifies
an exact loudout of packages that were known to operate correctly. This
latter file provides the real value for easy setup of container images
and CI environments.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/Pipfile | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 python/Pipfile

diff --git a/python/Pipfile b/python/Pipfile
new file mode 100644
index 00000000000..9534830b5eb
--- /dev/null
+++ b/python/Pipfile
@@ -0,0 +1,11 @@
+[[source]]
+name = "pypi"
+url = "https://pypi.org/simple"
+verify_ssl = true
+
+[dev-packages]
+
+[packages]
+
+[requires]
+python_version = "3.6"
-- 
2.29.2



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 706074AA383
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 23:48:50 +0100 (CET)
Received: from localhost ([::1]:51310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG7Np-0004Qm-9Z
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 17:48:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nG7IL-0000HR-7N
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 17:43:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nG7IH-000150-V8
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 17:43:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644014585;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fYSWsl1f3IWoJN4z1mH6BCn4zhh7RxF/ia1GCVj/qG0=;
 b=F2I/DcUj1sqpSBEUqmApVf92/+yi9Cse8d5f7asA/R1uHrOOqEFkyyn+g6wy8n7o/InvQR
 Ri6vZZ8bUb3+F1fspwvToaVUguMqoyBMEXeQGr56ePyDJEihKwYgORVuYQVN27sAXFSNGw
 63YbTPrn+a3mGbiHoEHmr9jT9ZMuOqc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-332-UeKRew8-MwO_KgheaxeGqg-1; Fri, 04 Feb 2022 17:43:03 -0500
X-MC-Unique: UeKRew8-MwO_KgheaxeGqg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EFBA81091DA0
 for <qemu-devel@nongnu.org>; Fri,  4 Feb 2022 22:43:02 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 559F91042A48;
 Fri,  4 Feb 2022 22:43:02 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/2] [DO-NOT-MERGE]: Add some ad-hoc linting helpers.
Date: Fri,  4 Feb 2022 17:42:56 -0500
Message-Id: <20220204224256.2110500-3-jsnow@redhat.com>
In-Reply-To: <20220204224256.2110500-1-jsnow@redhat.com>
References: <20220204224256.2110500-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.092,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These aren't ready for upstream inclusion, because they do not properly
manage version dependencies, execution environment and so on. These are
just the tools I use in my Own Special Environment :tm: for testing and
debugging.

I *think*, but can't exhaustively guarantee, that these should
work:

Python >= 3.6
isort >= 5.7.0  (But possibly earlier)
mypy >= 0.770   (Currently using 0.800)
pylint >= 2.6.0 (Currently using 2.7.4)

My python packaging series does a more exhaustive treatment and
exploration of minimum package requirements; eventually these two series
will converge and these dependencies will be handled in one place.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi-lint.sh  | 29 +++++++++++++++++++++++++++++
 scripts/qapi/Makefile |  5 +++++
 2 files changed, 34 insertions(+)
 create mode 100755 scripts/qapi-lint.sh
 create mode 100644 scripts/qapi/Makefile

diff --git a/scripts/qapi-lint.sh b/scripts/qapi-lint.sh
new file mode 100755
index 0000000000..2c2f2808ca
--- /dev/null
+++ b/scripts/qapi-lint.sh
@@ -0,0 +1,29 @@
+#!/usr/bin/env bash
+set -e
+
+if [[ -f qapi/.flake8 ]]; then
+    echo "flake8 --config=qapi/.flake8 qapi/"
+    flake8 --config=qapi/.flake8 qapi/
+fi
+if [[ -f qapi/pylintrc ]]; then
+    echo "pylint --rcfile=qapi/pylintrc qapi/"
+    pylint --rcfile=qapi/pylintrc qapi/
+fi
+if [[ -f qapi/mypy.ini ]]; then
+    echo "mypy --config-file=qapi/mypy.ini qapi/"
+    mypy --config-file=qapi/mypy.ini qapi/
+fi
+
+if [[ -f qapi/.isort.cfg ]]; then
+    pushd qapi
+    echo "isort -c ."
+    isort -c .
+    popd
+fi
+
+pushd ../bin/git
+make -j9
+make check-qapi-schema
+make docs
+make sphinxdocs
+popd
diff --git a/scripts/qapi/Makefile b/scripts/qapi/Makefile
new file mode 100644
index 0000000000..314e8a5505
--- /dev/null
+++ b/scripts/qapi/Makefile
@@ -0,0 +1,5 @@
+check:
+	isort -c .
+	flake8 .
+	cd .. && pylint --rcfile=qapi/pylintrc qapi
+	cd .. && mypy -p qapi --config-file=qapi/mypy.ini
-- 
2.34.1



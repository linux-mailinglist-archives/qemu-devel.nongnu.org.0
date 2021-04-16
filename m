Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FB23628A7
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 21:29:51 +0200 (CEST)
Received: from localhost ([::1]:37372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXUA2-0007pT-3V
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 15:29:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lXU8q-0006hP-HL
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 15:28:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lXU8l-0003P8-90
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 15:28:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618601310;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DsbzNOehjco8iyDIl0NkBWztj8jPzptsvkz3Pr0Iy7A=;
 b=NrW/Jz4hnV9IvGBnsEi7wz4Sc6cX4OTjs29z4OsS0kBlq+M5wRyJx6jwu0dAjy3riMwcyq
 InaACpkM+C4IsnvpbtUHKpN6KhzmGmiGm2yr6CrRenpIAsyUaV2kPOsOYm40JeP+HjaZAD
 YFTTRkl/jutaS6+0bpN1WwOckWYkJUc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-371-BRWUAmG5PRKVAuNOEsXOjQ-1; Fri, 16 Apr 2021 15:28:29 -0400
X-MC-Unique: BRWUAmG5PRKVAuNOEsXOjQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 23F2283DD21
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 19:28:28 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-61.rdu2.redhat.com [10.10.117.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6A365107D5C6;
 Fri, 16 Apr 2021 19:28:27 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/4] [DO-NOT-MERGE]: Add some ad-hoc linting helpers.
Date: Fri, 16 Apr 2021 15:28:19 -0400
Message-Id: <20210416192819.2958482-5-jsnow@redhat.com>
In-Reply-To: <20210416192819.2958482-1-jsnow@redhat.com>
References: <20210416192819.2958482-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Cleber Rosa <crosa@redhat.com>
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
index 00000000000..2c2f2808ca6
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
index 00000000000..314e8a5505e
--- /dev/null
+++ b/scripts/qapi/Makefile
@@ -0,0 +1,5 @@
+check:
+	isort -c .
+	flake8 .
+	cd .. && pylint --rcfile=qapi/pylintrc qapi
+	cd .. && mypy -p qapi --config-file=qapi/mypy.ini
-- 
2.30.2



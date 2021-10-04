Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B9C421906
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 23:11:27 +0200 (CEST)
Received: from localhost ([::1]:42256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXVF8-0001Wg-LR
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 17:11:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mXV9P-0008Vm-A3
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 17:05:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mXV9N-0007TF-3r
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 17:05:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633381528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m9ID7D1gHySIgtuzkpEuGv444ZZtkg9aOm+C1oYsvTU=;
 b=FpRYt8boTvyDibPPx8gvWE5JFuxsfqyzfstzfWQCTn37lS9xHm4O3j0ur67nIFVvDCoAeM
 oIpf6+X7ZlBnEUcu6nunguwgRcdvstyruTCj3iECxlu2JF7aoFDt4z1DP9JEglV+59l4Y1
 XD/TroCFJtBpXp7ejDI9AhVQSRpfaKI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-Sa75VHZcPCaeIAXRCIp5hQ-1; Mon, 04 Oct 2021 17:05:27 -0400
X-MC-Unique: Sa75VHZcPCaeIAXRCIp5hQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A6514835DE0;
 Mon,  4 Oct 2021 21:05:26 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.9.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B0BBC19C59;
 Mon,  4 Oct 2021 21:05:24 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/13] iotests/297: Create main() function
Date: Mon,  4 Oct 2021 17:04:55 -0400
Message-Id: <20211004210503.1455391-6-jsnow@redhat.com>
In-Reply-To: <20211004210503.1455391-1-jsnow@redhat.com>
References: <20211004210503.1455391-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of running "run_linters" directly, create a main() function that
will be responsible for environment setup, leaving run_linters()
responsible only for execution of the linters.

(That environment setup will be moved over in forthcoming commits.)

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/297 | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
index 65b1e7058c2..f9fcb039e27 100755
--- a/tests/qemu-iotests/297
+++ b/tests/qemu-iotests/297
@@ -89,8 +89,12 @@ def run_linters():
         print(p.stdout)
 
 
-for linter in ('pylint-3', 'mypy'):
-    if shutil.which(linter) is None:
-        iotests.notrun(f'{linter} not found')
+def main() -> None:
+    for linter in ('pylint-3', 'mypy'):
+        if shutil.which(linter) is None:
+            iotests.notrun(f'{linter} not found')
 
-iotests.script_main(run_linters)
+    run_linters()
+
+
+iotests.script_main(main)
-- 
2.31.1



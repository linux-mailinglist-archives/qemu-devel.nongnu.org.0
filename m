Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5783B48B8
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 20:23:45 +0200 (CEST)
Received: from localhost ([::1]:57220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwqUS-0007Uy-Hp
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 14:23:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lwqRe-0003xc-59
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 14:20:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lwqRT-0005ha-9r
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 14:20:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624645238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oDs5v73CsCtSj2btPaaa4wMqzX5hjh/DRcfmw1iqoD8=;
 b=LJgZXvKI13yBecGsOhUQXVhXAk8Nr7n3PM2pOXIRMvJBmf/NaGajjweIMxSkD8FSf6E9ST
 BEMR5Gwb4vdU/XSgDmsatzQHRdrZYDutqmx60NvWaClus0NpBcRujGF4CGw3AxMPUnu32q
 Om04VNRdls81VBk9mbrwROvt1s/4PGs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-598-8sIwZ6GNPyiTQ4Ga3g7uDg-1; Fri, 25 Jun 2021 14:20:37 -0400
X-MC-Unique: 8sIwZ6GNPyiTQ4Ga3g7uDg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 53DCE804140;
 Fri, 25 Jun 2021 18:20:36 +0000 (UTC)
Received: from scv.redhat.com (ovpn-118-71.rdu2.redhat.com [10.10.118.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C0CDE5D9C6;
 Fri, 25 Jun 2021 18:20:34 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/10] iotests/297: Add 'directory' argument to run_linters
Date: Fri, 25 Jun 2021 14:20:17 -0400
Message-Id: <20210625182021.803227-7-jsnow@redhat.com>
In-Reply-To: <20210625182021.803227-1-jsnow@redhat.com>
References: <20210625182021.803227-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Allow run_linters to work well if it's executed from a different
directory.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/297 | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
index c7428af901..1e8334d1d4 100755
--- a/tests/qemu-iotests/297
+++ b/tests/qemu-iotests/297
@@ -66,6 +66,7 @@ def get_test_files(directory: str = '.') -> List[str]:
 
 def run_linters(
     files: List[str],
+    directory: str = '.',
     env: Optional[Mapping[str, str]] = None,
 ) -> None:
 
@@ -76,6 +77,7 @@ def run_linters(
     # fixed (in tests, at least)
     subprocess.run(
         ('python3', '-m', 'pylint', '--score=n', '--notes=FIXME,XXX', *files),
+        cwd=directory,
         env=env,
         check=False,
     )
@@ -103,6 +105,7 @@ def run_linters(
                 '--namespace-packages',
                 filename,
             ),
+            cwd=directory,
             env=env,
             check=False,
             stdout=subprocess.PIPE,
-- 
2.31.1



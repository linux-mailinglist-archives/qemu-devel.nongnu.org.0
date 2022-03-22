Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DDB4E3E27
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 13:10:44 +0100 (CET)
Received: from localhost ([::1]:37666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWdLX-00018A-KP
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 08:10:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWd8g-0003GB-V9
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 07:57:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWd8f-0006VB-5Q
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 07:57:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647950244;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/z84npdETHiGGDFh2NME+P3IwgPAl3Hi7h0aFNjt9gE=;
 b=CtsOZB/0gARZTudotsjqHruR6QMMAcxWjRaC9/f1IGzOU2M0gRmZBnTSwajkiQloQCRQsz
 +nPdhSPQoRoZHRTEeZxYy/N+8k/hU0gMz7xbm9IkQJyBjmGfi4A4eMeNZb7mVgyjBFyKcI
 HOHFCSaYqqEMtvpOr7rSBSY58KZ4UbQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-173-Sxz9VhdoMWia8mOxquzf-w-1; Tue, 22 Mar 2022 07:57:23 -0400
X-MC-Unique: Sxz9VhdoMWia8mOxquzf-w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 14FBD85A5BC;
 Tue, 22 Mar 2022 11:57:23 +0000 (UTC)
Received: from localhost (unknown [10.39.194.233])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C5F84778B;
 Tue, 22 Mar 2022 11:57:22 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 20/25] iotests: use qemu_img() in has_working_luks()
Date: Tue, 22 Mar 2022 12:56:42 +0100
Message-Id: <20220322115647.726044-21-hreitz@redhat.com>
In-Reply-To: <20220322115647.726044-1-hreitz@redhat.com>
References: <20220322115647.726044-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Snow <jsnow@redhat.com>

Admittedly a mostly lateral move, but qemu_img() is essentially the
replacement for qemu_img_pipe_and_status(). It will give slightly better
diagnostics on crash.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20220321201618.903471-16-jsnow@redhat.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/iotests.py | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index aaf4da8be4..d006f56127 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -1445,20 +1445,20 @@ def has_working_luks() -> Tuple[bool, str]:
     """
 
     img_file = f'{test_dir}/luks-test.luks'
-    (output, status) = \
-        qemu_img_pipe_and_status('create', '-f', 'luks',
-                                 '--object', luks_default_secret_object,
-                                 '-o', luks_default_key_secret_opt,
-                                 '-o', 'iter-time=10',
-                                 img_file, '1G')
+    res = qemu_img('create', '-f', 'luks',
+                   '--object', luks_default_secret_object,
+                   '-o', luks_default_key_secret_opt,
+                   '-o', 'iter-time=10',
+                   img_file, '1G',
+                   check=False)
     try:
         os.remove(img_file)
     except OSError:
         pass
 
-    if status != 0:
-        reason = output
-        for line in output.splitlines():
+    if res.returncode:
+        reason = res.stdout
+        for line in res.stdout.splitlines():
             if img_file + ':' in line:
                 reason = line.split(img_file + ':', 1)[1].strip()
                 break
-- 
2.35.1



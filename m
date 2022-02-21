Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B658D4BED6B
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 23:51:47 +0100 (CET)
Received: from localhost ([::1]:60048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMHX0-00017Z-J0
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 17:51:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nMHGc-0000sa-5f
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 17:34:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37252)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nMHGa-0008E5-MG
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 17:34:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645482888;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CKXx9B9XibhZVZIdHJUuZ1uhLEI+0o/fmcLq2uQiJCI=;
 b=EM+F3cl35JtZYqJbwk0sU4IjTwZifzcT0Bt3r4VxmX/4gBCI8d6I2Kezk6ZjtuEN8wqWIF
 /Yg2FX+q5Gj1jBR9AenyeXP+K6Ycp734QurzkDi7gI4P28UnbKc+TRYs2+YgagkN4PHW5U
 PNhJCHnxEuyex8qrn163w5d4CFFkBeo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-472-tb_CEF9wMCK_qedKXNj11w-1; Mon, 21 Feb 2022 17:34:45 -0500
X-MC-Unique: tb_CEF9wMCK_qedKXNj11w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 07E2E1091DA1;
 Mon, 21 Feb 2022 22:34:44 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D655E1038AAF;
 Mon, 21 Feb 2022 22:34:42 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 14/18] iotests: move has_working_luks onto qemu_img()
Date: Mon, 21 Feb 2022 17:34:09 -0500
Message-Id: <20220221223413.2123003-15-jsnow@redhat.com>
In-Reply-To: <20220221223413.2123003-1-jsnow@redhat.com>
References: <20220221223413.2123003-1-jsnow@redhat.com>
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-block@nongnu.org, Eric Blake <eblake@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Admittedly a mostly lateral move; the diagnostics are slightly better on
program crash.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/iotests.py | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 882d3e0214a..16bac5df969 100644
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
2.34.1



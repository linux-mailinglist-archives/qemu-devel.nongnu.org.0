Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99EF74D2652
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 05:02:14 +0100 (CET)
Received: from localhost ([::1]:40310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRnWf-0001IZ-L6
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 23:02:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nRnPI-0002gg-Ji
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 22:54:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nRnPG-0002w5-SA
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 22:54:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646798074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QOPH7Li9PuXqw8RH5o/slidpTv02H4wzLrFYbYKKJYo=;
 b=dQ02vAKfFXupuAn61dJHTUfJCwpsyF8TQWv1Ys3NT3nXqRK9T7oqd4tHmY+rQBkl89JZa+
 Shl0izj3E7cGN6WkIWcBP6/MzF4GerMbFlkAefW+95sU3IhV1F4Q76k6JHfNRTKpXct3Mi
 XBtGCbnBDSU2Eg+KiOdnLgoGLbgkrQQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-444-QLw_F_wtPs630agNIFNivg-1; Tue, 08 Mar 2022 22:54:31 -0500
X-MC-Unique: QLw_F_wtPs630agNIFNivg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2D1718031E1;
 Wed,  9 Mar 2022 03:54:30 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.34.233])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 75D9B6C180;
 Wed,  9 Mar 2022 03:54:29 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/14] iotests: use qemu_img() in has_working_luks()
Date: Tue,  8 Mar 2022 22:54:03 -0500
Message-Id: <20220309035407.1848654-11-jsnow@redhat.com>
In-Reply-To: <20220309035407.1848654-1-jsnow@redhat.com>
References: <20220309035407.1848654-1-jsnow@redhat.com>
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
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Admittedly a mostly lateral move, but qemu_img() is essentially the
replacement for qemu_img_pipe_and_status(). It will give slightly better
diagnostics on crash.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/iotests.py | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 698d5a7fdc..1b6e28ba64 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -1450,20 +1450,20 @@ def has_working_luks() -> Tuple[bool, str]:
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



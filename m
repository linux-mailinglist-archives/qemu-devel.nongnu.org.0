Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 871124E31C0
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 21:29:23 +0100 (CET)
Received: from localhost ([::1]:35336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWOeY-00027C-LB
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 16:29:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nWOS8-00069V-2i
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 16:16:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53277)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nWOS4-0001kU-K6
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 16:16:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647893788;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C2jh5ZJFqJqX8+Xw3hsJVjPEKeug9errvLF/hyI7/k4=;
 b=PnTAq7R9Ip+ehk8dUIiLPmFhHb27jjkxoy1HlWaGxNcZa0Rhav5T1CciYx9YOMsNXV0gV2
 CH4LX4zHWPeXNZ05j6lJQH+p46D0Bua8tgIukrB4CvvQ/dPGJ61qnWgnNj3ma0Jk0qNzrv
 h0pqqFvivS/MgRYXVtmXjDP/PrH2ov0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-43-8puxcBwTNZa3GCqSQYsc5w-1; Mon, 21 Mar 2022 16:16:26 -0400
X-MC-Unique: 8puxcBwTNZa3GCqSQYsc5w-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 886061044561;
 Mon, 21 Mar 2022 20:16:26 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 36DD3454D60;
 Mon, 21 Mar 2022 20:16:26 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 15/18] iotests: use qemu_img() in has_working_luks()
Date: Mon, 21 Mar 2022 16:16:15 -0400
Message-Id: <20220321201618.903471-16-jsnow@redhat.com>
In-Reply-To: <20220321201618.903471-1-jsnow@redhat.com>
References: <20220321201618.903471-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Admittedly a mostly lateral move, but qemu_img() is essentially the
replacement for qemu_img_pipe_and_status(). It will give slightly better
diagnostics on crash.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
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
2.34.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 290094A6183
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 17:43:33 +0100 (CET)
Received: from localhost ([::1]:51840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEwFf-0007OR-NV
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 11:43:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nEuRg-0002ok-76
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 09:47:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nEuRL-0002yp-5T
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 09:47:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643726613;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fobN2Vn9sIHwol0up3FOToSfSuyL9Kuhf30VLmu3x4k=;
 b=WeBEHNa7DVethIDabAW7tKwnK5YNAZUi3PfDCzN8JxbVgpm+3pPXbwDbbbdwPKd5Vwz5Rf
 9SL2Ny+mu8S6v944/zXP17lat4KZ9eAOYfmZMpY1wSldr6rkuPGKhURE7qrUtBEW0Q68eY
 e+mynxWGHExVFVcXlZF5r5qQfXxcYxc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-657-i5P3Pye4Ncu60BGOON4Jpg-1; Tue, 01 Feb 2022 09:43:29 -0500
X-MC-Unique: i5P3Pye4Ncu60BGOON4Jpg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EFC951018725;
 Tue,  1 Feb 2022 14:43:27 +0000 (UTC)
Received: from localhost (unknown [10.39.193.129])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 952A85DBB7;
 Tue,  1 Feb 2022 14:43:27 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 08/24] iotests.py: rewrite default luks support in qemu_img
Date: Tue,  1 Feb 2022 15:42:17 +0100
Message-Id: <20220201144233.617021-9-hreitz@redhat.com>
In-Reply-To: <20220201144233.617021-1-hreitz@redhat.com>
References: <20220201144233.617021-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Move the logic to more generic qemu_img_pipe_and_status(). Also behave
better when we have several -o options. And reuse argument parser of
course.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20211223160144.1097696-7-vsementsov@virtuozzo.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/iotests.py | 36 +++++++++++++++++------------------
 1 file changed, 17 insertions(+), 19 deletions(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index cc4bbbcf7b..c382c527c8 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -168,9 +168,13 @@ def qemu_img_create_prepare_args(args: List[str]) -> List[str]:
     args = args[1:]
 
     p = argparse.ArgumentParser(allow_abbrev=False)
+    # -o option may be specified several times
+    p.add_argument('-o', action='append', default=[])
     p.add_argument('-f')
     parsed, remaining = p.parse_known_args(args)
 
+    opts_list = parsed.o
+
     result = ['create']
     if parsed.f is not None:
         result += ['-f', parsed.f]
@@ -179,8 +183,18 @@ def qemu_img_create_prepare_args(args: List[str]) -> List[str]:
     # like extended_l2 or compression_type for qcow2. Test may want to create
     # additional images in other formats that doesn't support these options.
     # So, use IMGOPTS only for images created in imgfmt format.
-    if parsed.f == imgfmt and 'IMGOPTS' in os.environ:
-        result += ['-o', os.environ['IMGOPTS']]
+    imgopts = os.environ.get('IMGOPTS')
+    if imgopts and parsed.f == imgfmt:
+        opts_list.insert(0, imgopts)
+
+    # default luks support
+    if parsed.f == 'luks' and \
+            all('key-secret' not in opts for opts in opts_list):
+        result += ['--object', luks_default_secret_object]
+        opts_list.append(luks_default_key_secret_opt)
+
+    for opts in opts_list:
+        result += ['-o', opts]
 
     result += remaining
 
@@ -211,23 +225,7 @@ def ordered_qmp(qmsg, conv_keys=True):
     return qmsg
 
 def qemu_img_create(*args):
-    args = list(args)
-
-    # default luks support
-    if '-f' in args and args[args.index('-f') + 1] == 'luks':
-        if '-o' in args:
-            i = args.index('-o')
-            if 'key-secret' not in args[i + 1]:
-                args[i + 1].append(luks_default_key_secret_opt)
-                args.insert(i + 2, '--object')
-                args.insert(i + 3, luks_default_secret_object)
-        else:
-            args = ['-o', luks_default_key_secret_opt,
-                    '--object', luks_default_secret_object] + args
-
-    args.insert(0, 'create')
-
-    return qemu_img(*args)
+    return qemu_img('create', *args)
 
 def qemu_img_measure(*args):
     return json.loads(qemu_img_pipe("measure", "--output", "json", *args))
-- 
2.34.1



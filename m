Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 852284A60CE
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 16:55:44 +0100 (CET)
Received: from localhost ([::1]:35020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEvVP-0006Xy-D3
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 10:55:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nEuQf-0002c2-1R
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 09:47:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26174)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nEuQW-0002yJ-SD
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 09:46:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643726607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8Kss8h+9VrUutorL5C6yWFFX32sptd0KaVTKo+1NjYM=;
 b=cpd3qKiGmf1kXFZoquGtvmqttavV42gDS3L6+rD/SXlEM8X7ne8wljYOl4NUsZxdexrjvk
 9f1QxDj6aohMmah7OLaU40jBzLin+/6vconvkecOoOCkowIboKyktUVQxXcsLK8Kpd+RqG
 aPK//+NaRhCXNauijeGIV3/QO9KmOkM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-281-ieowD49gPdePAHlZepOR0Q-1; Tue, 01 Feb 2022 09:43:24 -0500
X-MC-Unique: ieowD49gPdePAHlZepOR0Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 78D1C8519E9;
 Tue,  1 Feb 2022 14:43:23 +0000 (UTC)
Received: from localhost (unknown [10.39.193.129])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B14F7B9E1;
 Tue,  1 Feb 2022 14:43:22 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 06/24] iotests.py: qemu_img*("create"): support
 IMGOPTS='compression_type=zstd'
Date: Tue,  1 Feb 2022 15:42:15 +0100
Message-Id: <20220201144233.617021-7-hreitz@redhat.com>
In-Reply-To: <20220201144233.617021-1-hreitz@redhat.com>
References: <20220201144233.617021-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Adding support of IMGOPTS (like in bash tests) allows user to pass a
lot of different options. Still, some may require additional logic.

Now we want compression_type option, so add some smart logic around it:
ignore compression_type=zstd in IMGOPTS, if test want qcow2 in
compatibility mode. As well, ignore compression_type for non-qcow2
formats.

Note that we may instead add support only to qemu_img_create(), but
that works bad:

1. We'll have to update a lot of tests to use qemu_img_create instead
   of qemu_img('create'). (still, we may want do it anyway, but no
   reason to create a dependancy between task of supporting IMGOPTS and
   updating a lot of tests)

2. Some tests use qemu_img_pipe('create', ..) - even more work on
   updating

3. Even if we update all tests to go through qemu_img_create, we'll
   need a way to avoid creating new tests using qemu_img*('create') -
   add assertions.. That doesn't seem good.

So, let's add support of IMGOPTS to most generic
qemu_img_pipe_and_status().

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20211223160144.1097696-5-vsementsov@virtuozzo.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/iotests.py | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 2fa5dcba76..740f8be36b 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -16,6 +16,7 @@
 # along with this program.  If not, see <http://www.gnu.org/licenses/>.
 #
 
+import argparse
 import atexit
 import bz2
 from collections import OrderedDict
@@ -161,11 +162,35 @@ def qemu_tool_pipe_and_status(tool: str, args: Sequence[str],
                                {-subp.returncode}: {cmd}\n')
         return (output, subp.returncode)
 
+def qemu_img_create_prepare_args(args: List[str]) -> List[str]:
+    if not args or args[0] != 'create':
+        return list(args)
+    args = args[1:]
+
+    p = argparse.ArgumentParser(allow_abbrev=False)
+    p.add_argument('-f')
+    parsed, remaining = p.parse_known_args(args)
+
+    result = ['create']
+    if parsed.f is not None:
+        result += ['-f', parsed.f]
+
+    # IMGOPTS most probably contain options specific for the selected format,
+    # like extended_l2 or compression_type for qcow2. Test may want to create
+    # additional images in other formats that doesn't support these options.
+    # So, use IMGOPTS only for images created in imgfmt format.
+    if parsed.f == imgfmt and 'IMGOPTS' in os.environ:
+        result += ['-o', os.environ['IMGOPTS']]
+
+    result += remaining
+
+    return result
+
 def qemu_img_pipe_and_status(*args: str) -> Tuple[str, int]:
     """
     Run qemu-img and return both its output and its exit code
     """
-    full_args = qemu_img_args + list(args)
+    full_args = qemu_img_args + qemu_img_create_prepare_args(list(args))
     return qemu_tool_pipe_and_status('qemu-img', full_args)
 
 def qemu_img(*args: str) -> int:
-- 
2.34.1



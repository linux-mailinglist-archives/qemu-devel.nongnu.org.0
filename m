Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC67F0206
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Nov 2019 16:59:56 +0100 (CET)
Received: from localhost ([::1]:45576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iS1FM-00034T-0i
	for lists+qemu-devel@lfdr.de; Tue, 05 Nov 2019 10:59:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42740)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1iS11N-00062J-Dp
 for qemu-devel@nongnu.org; Tue, 05 Nov 2019 10:45:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1iS11L-0003gP-Ak
 for qemu-devel@nongnu.org; Tue, 05 Nov 2019 10:45:29 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:57461
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1iS11J-0003f7-Bc
 for qemu-devel@nongnu.org; Tue, 05 Nov 2019 10:45:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572968724;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AKM8W1QDhe+Ko7FQWFoET2okeRRcRxdf0Ap8y4ZAO3M=;
 b=Ql2/y39KE+OWVJXUiKpA9oz9l9XTtKeFH8c4AP9Tho/iakky1n8FY3DScLts1LXMP8pfEA
 PCNcU6i0etg/isiwRUMr58b/uLpq0ePfv/DHMAaHNZyRBbYvjt3pB95FPlx7L4v8fVsfZO
 pkJHHDc8t54EnyZEHHPq4qBzXEdizyI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-BVsuxyaEPd2lYgZ2pWlSdA-1; Tue, 05 Nov 2019 10:45:22 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BB8A8107ACC4;
 Tue,  5 Nov 2019 15:45:21 +0000 (UTC)
Received: from localhost (ovpn-116-232.ams2.redhat.com [10.36.116.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9B251600C6;
 Tue,  5 Nov 2019 15:45:15 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/11] image-fuzzer: Use OSerror.strerror instead of tuple
 subscript
Date: Tue,  5 Nov 2019 16:43:32 +0100
Message-Id: <20191105154332.181417-12-stefanha@redhat.com>
In-Reply-To: <20191105154332.181417-1-stefanha@redhat.com>
References: <20191105154332.181417-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: BVsuxyaEPd2lYgZ2pWlSdA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eduardo Habkost <ehabkost@redhat.com>

OSError can't be used like a tuple on Python 3, so change the
code to use `e.sterror` instead of `e[1]`.

Reported-by: John Snow <jsnow@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Message-id: 20191021214117.18091-1-ehabkost@redhat.com
Message-Id: <20191021214117.18091-1-ehabkost@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 tests/image-fuzzer/runner.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/image-fuzzer/runner.py b/tests/image-fuzzer/runner.py
index 4ba5c79e13..2fc010fd9d 100755
--- a/tests/image-fuzzer/runner.py
+++ b/tests/image-fuzzer/runner.py
@@ -159,7 +159,7 @@ class TestEnv(object):
             os.makedirs(self.current_dir)
         except OSError as e:
             print("Error: The working directory '%s' cannot be used. Reaso=
n: %s"\
-                % (self.work_dir, e[1]), file=3Dsys.stderr)
+                % (self.work_dir, e.strerror), file=3Dsys.stderr)
             raise TestException
         self.log =3D open(os.path.join(self.current_dir, "test.log"), "w")
         self.parent_log =3D open(run_log, "a")
@@ -246,7 +246,7 @@ class TestEnv(object):
             except OSError as e:
                 multilog("%sError: Start of '%s' failed. Reason: %s\n\n"
                          % (test_summary, os.path.basename(current_cmd[0])=
,
-                            e[1]),
+                            e.strerror),
                          sys.stderr, self.log, self.parent_log)
                 raise TestException
=20
--=20
2.23.0



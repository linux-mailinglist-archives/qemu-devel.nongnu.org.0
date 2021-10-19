Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3C9433BE3
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 18:17:50 +0200 (CEST)
Received: from localhost ([::1]:39154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcroD-00007b-3G
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 12:17:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mcqQq-0001j9-Mj
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 10:49:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51279)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mcqQo-0008AD-Qx
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 10:49:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634654974;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/U3/3OVl7a1y6D0eRK3j95NvD8mHtj55kju4dXIHFb4=;
 b=OWuVY2ZshvmgMbqTF/MRUqjm1ABJjuGs0odwqbEiq8FfXId8iYA8FxihiHLVn1+OtuUrD7
 11DiQLzChZi0YUjapVS+PK4IfoFFQDBqDfMKVhM4/I8+Hy73vpyfPgHClI1Vkhp+OkUmvj
 CkMLZsL/GGhKCKKhQ1QEhDzqvApgXkk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-593-wSI72nSJMHarpf2TiJWx-g-1; Tue, 19 Oct 2021 10:49:31 -0400
X-MC-Unique: wSI72nSJMHarpf2TiJWx-g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 24118343CF;
 Tue, 19 Oct 2021 14:49:30 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.11.97])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 35E805D6D7;
 Tue, 19 Oct 2021 14:49:29 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/15] iotests/297: Change run_linter() to raise an
 exception on failure
Date: Tue, 19 Oct 2021 10:49:11 -0400
Message-Id: <20211019144918.3159078-9-jsnow@redhat.com>
In-Reply-To: <20211019144918.3159078-1-jsnow@redhat.com>
References: <20211019144918.3159078-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of using a process return code as the python function return
value (or just not returning anything at all), allow run_linter() to
raise an exception instead.

The responsibility for printing output on error shifts from the function
itself to the caller, who will know best how to present/format that
information. (Also, "suppress_output" is now a lot more accurate of a
parameter name.)

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/297 | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
index d21673a2929..76d6a23f531 100755
--- a/tests/qemu-iotests/297
+++ b/tests/qemu-iotests/297
@@ -70,22 +70,18 @@ def run_linter(
     """
     Run a python-based linting tool.
 
-    If suppress_output is True, capture stdout/stderr of the child
-    process and only print that information back to stdout if the child
-    process's return code was non-zero.
+    :param suppress_output: If True, suppress all stdout/stderr output.
+    :raise CalledProcessError: If the linter process exits with failure.
     """
-    p = subprocess.run(
+    subprocess.run(
         ('python3', '-m', tool, *args),
         env=env,
-        check=False,
+        check=True,
         stdout=subprocess.PIPE if suppress_output else None,
         stderr=subprocess.STDOUT if suppress_output else None,
         universal_newlines=True,
     )
 
-    if suppress_output and p.returncode != 0:
-        print(p.stdout)
-
 
 def main() -> None:
     for linter in ('pylint-3', 'mypy'):
@@ -102,11 +98,19 @@ def main() -> None:
 
     print('=== pylint ===')
     sys.stdout.flush()
-    run_linter('pylint', files, env=env)
+    try:
+        run_linter('pylint', files, env=env)
+    except subprocess.CalledProcessError:
+        # pylint failure will be caught by diffing the IO.
+        pass
 
     print('=== mypy ===')
     sys.stdout.flush()
-    run_linter('mypy', files, env=env, suppress_output=True)
+    try:
+        run_linter('mypy', files, env=env, suppress_output=True)
+    except subprocess.CalledProcessError as exc:
+        if exc.output:
+            print(exc.output)
 
 
 iotests.script_main(main)
-- 
2.31.1



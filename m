Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 388F440D240
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 06:16:16 +0200 (CEST)
Received: from localhost ([::1]:49804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQiop-0005aU-9n
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 00:16:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mQijG-0007Y0-Lk
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 00:10:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mQijF-0000lx-0F
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 00:10:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631765428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EXSMN2cISA4KkMPi9qx2K1SzmOnDUsccxCFDZczj9FU=;
 b=SHmdimpeVMwiB3nU0wI9El3R7/qYWwmuTDuYfUzCwbuvJnFU0NxmfmXzxCt+XhNQqZ0LmR
 peZk3pv/VXFthvMs4gmZJFoVRMwl67rk0XKsgTQh2ecSfwzFaa6RHH5v4US62GYuwa26pS
 Cbox0OleDKaZ6p/ShfhLtJxcz9JapK8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-292-EzWfdtZEOUWlKr3F3evKwg-1; Thu, 16 Sep 2021 00:10:26 -0400
X-MC-Unique: EzWfdtZEOUWlKr3F3evKwg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79C09362F8;
 Thu, 16 Sep 2021 04:10:25 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.11.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 07E511972E;
 Thu, 16 Sep 2021 04:10:23 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 11/16] iotests/297: return error code from run_linters()
Date: Thu, 16 Sep 2021 00:09:50 -0400
Message-Id: <20210916040955.628560-12-jsnow@redhat.com>
In-Reply-To: <20210916040955.628560-1-jsnow@redhat.com>
References: <20210916040955.628560-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This turns run_linters() into a bit of a hybrid test; returning non-zero
on failed execution while also printing diffable information. This is
done for the benefit of the avocado simple test runner, which will soon
be attempting to execute this test from a different environment.

(Note: universal_newlines is added to the pylint invocation for type
consistency with the mypy run -- it's not strictly necessary, but it
avoids some typing errors caused by our re-use of the 'p' variable.)

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/297 | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
index e05c99972e..f9ddfb53a0 100755
--- a/tests/qemu-iotests/297
+++ b/tests/qemu-iotests/297
@@ -68,19 +68,22 @@ def run_linters(
     files: List[str],
     directory: str = '.',
     env: Optional[Mapping[str, str]] = None,
-) -> None:
+) -> int:
+    ret = 0
 
     print('=== pylint ===')
     sys.stdout.flush()
 
     # Todo notes are fine, but fixme's or xxx's should probably just be
     # fixed (in tests, at least)
-    subprocess.run(
+    p = subprocess.run(
         ('python3', '-m', 'pylint', '--score=n', '--notes=FIXME,XXX', *files),
         cwd=directory,
         env=env,
         check=False,
+        universal_newlines=True,
     )
+    ret += p.returncode
 
     print('=== mypy ===')
     sys.stdout.flush()
@@ -113,9 +116,12 @@ def run_linters(
             universal_newlines=True
         )
 
+        ret += p.returncode
         if p.returncode != 0:
             print(p.stdout)
 
+    return ret
+
 
 def main() -> None:
     for linter in ('pylint-3', 'mypy'):
-- 
2.31.1



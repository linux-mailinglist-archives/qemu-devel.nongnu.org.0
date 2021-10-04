Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6028B421912
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 23:14:02 +0200 (CEST)
Received: from localhost ([::1]:50524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXVHd-00079d-EM
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 17:14:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mXV9R-00008I-PS
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 17:05:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55122)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mXV9Q-0007Vp-29
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 17:05:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633381531;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YzdHDfL7FHfkEvQau1bQvqvNCryY6Q6DkvfYCYWYzOc=;
 b=G9JzGE4bT5LeTaoOon6yADk4gdA6bqdByAMWUKPthQUJNnYNMkSRkTIb2y3LvOAh0o0WTi
 A0m3ozO/mq6D4b3qyLZInqhSZa7Hm1Q10oQ2bIa6pQVWxueljzA3hvoYU1aXk912bFe0Dt
 aEq/UEro5OTZ2hTR40TuQAAffqbncKo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-542-JIJf9JuSPGuTQs4rJLerKA-1; Mon, 04 Oct 2021 17:05:30 -0400
X-MC-Unique: JIJf9JuSPGuTQs4rJLerKA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7B596835DE3;
 Mon,  4 Oct 2021 21:05:29 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.9.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2D50C19C59;
 Mon,  4 Oct 2021 21:05:27 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/13] iotests/297: Split run_linters apart into run_pylint
 and run_mypy
Date: Mon,  4 Oct 2021 17:04:57 -0400
Message-Id: <20211004210503.1455391-8-jsnow@redhat.com>
In-Reply-To: <20211004210503.1455391-1-jsnow@redhat.com>
References: <20211004210503.1455391-1-jsnow@redhat.com>
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
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
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

Signed-off-by: John Snow <jsnow@redhat.com>

---

Note, this patch really ought to be squashed with the next one, but I am
performing a move known as "Hedging my bets."
It's easier to squash than de-squash :)

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/297 | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
index fcbab0631be..91029dbb34e 100755
--- a/tests/qemu-iotests/297
+++ b/tests/qemu-iotests/297
@@ -61,20 +61,19 @@ def get_test_files() -> List[str]:
     return list(filter(is_python_file, check_tests))
 
 
-def run_linters(
+def run_pylint(
     files: List[str],
     env: Optional[Mapping[str, str]] = None,
 ) -> None:
 
-    print('=== pylint ===')
-    sys.stdout.flush()
-
     subprocess.run(('python3', '-m', 'pylint', *files),
                    env=env, check=False)
 
-    print('=== mypy ===')
-    sys.stdout.flush()
 
+def run_mypy(
+    files: List[str],
+    env: Optional[Mapping[str, str]] = None,
+) -> None:
     p = subprocess.run((('python3', '-m', 'mypy', *files),
                        env=env,
                        check=False,
@@ -99,7 +98,13 @@ def main() -> None:
     env = os.environ.copy()
     env['MYPYPATH'] = env['PYTHONPATH']
 
-    run_linters(files, env=env)
+    print('=== pylint ===')
+    sys.stdout.flush()
+    run_pylint(files, env=env)
+
+    print('=== mypy ===')
+    sys.stdout.flush()
+    run_mypy(files, env=env)
 
 
 iotests.script_main(main)
-- 
2.31.1



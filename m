Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F19E421900
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 23:08:23 +0200 (CEST)
Received: from localhost ([::1]:33956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXVCA-00044m-I8
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 17:08:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mXV9O-0008V8-6k
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 17:05:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mXV9M-0007SJ-K0
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 17:05:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633381528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OlAQ+TxXMwW6h5k/qwDi1B2jR4wj7YOWFlYlb0set7g=;
 b=HlAV8IhwLGLen1nl70DlY+fh+E6lHoXLhb/i8MtA870Kh3YAXb1mRSe4ZMVLQx1dqT64s2
 tlc45JWgF+P8KUZAO6q7piypp3MmAS6NkV8Ws/uNLyvSQai6gncm9rR35FNaX8H/eI4zjI
 qVAQaRTxI1CguRJXPQYr3NDLg/RRZN8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-Vc0sjflCPsiTLJ9-Jk6GuQ-1; Mon, 04 Oct 2021 17:05:25 -0400
X-MC-Unique: Vc0sjflCPsiTLJ9-Jk6GuQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 04ECD9126B;
 Mon,  4 Oct 2021 21:05:24 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.9.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 183D619C59;
 Mon,  4 Oct 2021 21:05:19 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/13] iotests/297: Don't rely on distro-specific linter
 binaries
Date: Mon,  4 Oct 2021 17:04:54 -0400
Message-Id: <20211004210503.1455391-5-jsnow@redhat.com>
In-Reply-To: <20211004210503.1455391-1-jsnow@redhat.com>
References: <20211004210503.1455391-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

'pylint-3' is another Fedora-ism. Use "python3 -m pylint" or "python3 -m
mypy" to access these scripts instead. This style of invocation will
prefer the "correct" tool when run in a virtual environment.

Note that we still check for "pylint-3" before the test begins -- this
check is now "overly strict", but shouldn't cause anything that was
already running correctly to start failing.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/297 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
index 15b54594c11..65b1e7058c2 100755
--- a/tests/qemu-iotests/297
+++ b/tests/qemu-iotests/297
@@ -71,14 +71,14 @@ def run_linters():
     sys.stdout.flush()
 
     env = os.environ.copy()
-    subprocess.run(('pylint-3', *files),
+    subprocess.run(('python3', '-m', 'pylint', *files),
                    env=env, check=False)
 
     print('=== mypy ===')
     sys.stdout.flush()
 
     env['MYPYPATH'] = env['PYTHONPATH']
-    p = subprocess.run(('mypy', *files),
+    p = subprocess.run((('python3', '-m', 'mypy', *files),
                        env=env,
                        check=False,
                        stdout=subprocess.PIPE,
-- 
2.31.1



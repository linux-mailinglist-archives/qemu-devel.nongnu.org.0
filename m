Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 549E925AB9C
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Sep 2020 15:01:13 +0200 (CEST)
Received: from localhost ([::1]:49306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDSO0-0007o8-9A
	for lists+qemu-devel@lfdr.de; Wed, 02 Sep 2020 09:01:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kDSMM-0005sc-O3
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 08:59:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kDSMK-00074Q-IT
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 08:59:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599051567;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/9kMc9+jF8y1oa6oa9FhwzamoYL7mMegG8SjpygQ5/Q=;
 b=dzmb5api9S55Wg8hhrUTpTAjfayKz8HN7XpT9h3CY1XTiP9rOLNRvSGkK/iOYEaQ7oFtdW
 AdfK3FQk2hMF+80ORIUoa2jpb1AgNHvvPjXcEeMBmSo/O7NMcmqHOKKMyG6bcLQ00lmcMM
 9cl/b4HGWewt/NAZUq39vB0ZlVUL52E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-528-_aHFBcV5OFSX2-ebmZ4IPw-1; Wed, 02 Sep 2020 08:59:25 -0400
X-MC-Unique: _aHFBcV5OFSX2-ebmZ4IPw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE257107466C
 for <qemu-devel@nongnu.org>; Wed,  2 Sep 2020 12:59:19 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A32E25D9CC
 for <qemu-devel@nongnu.org>; Wed,  2 Sep 2020 12:59:19 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/39] mtest2make: split working directory from test command
Date: Wed,  2 Sep 2020 08:58:41 -0400
Message-Id: <20200902125917.26021-4-pbonzini@redhat.com>
In-Reply-To: <20200902125917.26021-1-pbonzini@redhat.com>
References: <20200902125917.26021-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/02 02:42:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Pass the working directory and test command in separate macro arguments,
so that we will be able to insert a test driver in the next patch.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/mtest2make.py | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/scripts/mtest2make.py b/scripts/mtest2make.py
index f4ee4d3994..c709b37f28 100644
--- a/scripts/mtest2make.py
+++ b/scripts/mtest2make.py
@@ -19,16 +19,16 @@ class Suite(object):
 print('''
 SPEED = quick
 
-# $1 = environment, $2 = test command, $3 = test name
-.test-human-tap = $1 $2 < /dev/null | ./scripts/tap-driver.pl --test-name="$3" $(if $(V),,--show-failures-only)
-.test-human-exitcode = $1 $2 < /dev/null
-.test-tap-tap = $1 $2 < /dev/null | sed "s/^[a-z][a-z]* [0-9]*/& $3/" || true
-.test-tap-exitcode = printf "%s\\n" 1..1 "`$1 $2 < /dev/null > /dev/null || echo "not "`ok 1 $3"
+# $1 = environment, $2 = test command, $3 = test name, $4 = dir
+.test-human-tap = $1 $(if $4,(cd $4 && $2),$2) < /dev/null | ./scripts/tap-driver.pl --test-name="$3" $(if $(V),,--show-failures-only)
+.test-human-exitcode = $1 $(if $4,(cd $4 && $2),$2) < /dev/null
+.test-tap-tap = $1 $(if $4,(cd $4 && $2),$2) < /dev/null | sed "s/^[a-z][a-z]* [0-9]*/& $3/" || true
+.test-tap-exitcode = printf "%s\\n" 1..1 "`$1 $(if $4,(cd $4 && $2),$2) < /dev/null > /dev/null || echo "not "`ok 1 $3"
 .test.print = echo $(if $(V),'$1 $2','Running test $3') >&3
 .test.env = MALLOC_PERTURB_=$${MALLOC_PERTURB_:-$$(( $${RANDOM:-0} % 255 + 1))}
 
 # $1 = test name, $2 = test target (human or tap)
-.test.run = $(call .test.print,$(.test.env.$1),$(.test.cmd.$1),$(.test.name.$1)) && $(call .test-$2-$(.test.driver.$1),$(.test.env.$1),$(.test.cmd.$1),$(.test.name.$1))
+.test.run = $(call .test.print,$(.test.env.$1),$(.test.cmd.$1),$(.test.name.$1)) && $(call .test-$2-$(.test.driver.$1),$(.test.env.$1),$(.test.cmd.$1),$(.test.name.$1),$(.test.dir.$1))
 
 define .test.human_k
         @exec 3>&1; rc=0; $(foreach TEST, $1, $(call .test.run,$(TEST),human) || rc=$$?;) \\
@@ -66,11 +66,11 @@ for test in json.load(sys.stdin):
     else:
         test['cmd'][0] = executable
     cmd = ' '.join((shlex.quote(x) for x in test['cmd']))
-    if test['workdir'] is not None:
-        cmd = '(cd %s && %s)' % (shlex.quote(test['workdir']), cmd)
     driver = test['protocol'] if 'protocol' in test else 'exitcode'
 
     i += 1
+    if test['workdir'] is not None:
+        print('.test.dir.%d := %s' % (i, shlex.quote(test['workdir'])))
     print('.test.name.%d := %s' % (i, test['name']))
     print('.test.driver.%d := %s' % (i, driver))
     print('.test.env.%d := $(.test.env) %s' % (i, env))
-- 
2.26.2




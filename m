Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F7925D7BB
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Sep 2020 13:47:03 +0200 (CEST)
Received: from localhost ([::1]:50506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kEABK-0008OO-Bd
	for lists+qemu-devel@lfdr.de; Fri, 04 Sep 2020 07:47:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kEA65-0008C6-L2
 for qemu-devel@nongnu.org; Fri, 04 Sep 2020 07:41:38 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:21412
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kEA5z-0005Cb-PZ
 for qemu-devel@nongnu.org; Fri, 04 Sep 2020 07:41:37 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-283-9HY5JvPyNiWVnoYQgM0sZQ-1; Fri, 04 Sep 2020 07:41:30 -0400
X-MC-Unique: 9HY5JvPyNiWVnoYQgM0sZQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2367518BA296
 for <qemu-devel@nongnu.org>; Fri,  4 Sep 2020 11:41:29 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 84D897E41A
 for <qemu-devel@nongnu.org>; Fri,  4 Sep 2020 11:41:28 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/46] ninjatool: use constant names for stamp files
Date: Fri,  4 Sep 2020 07:40:47 -0400
Message-Id: <20200904114122.31307-12-pbonzini@redhat.com>
In-Reply-To: <20200904114122.31307-1-pbonzini@redhat.com>
References: <20200904114122.31307-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/04 03:57:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Numbering files according to rules causes confusion, because
CUSTOM_COMMAND3.stamp from a previous build might represent
completely different targets after Makefile.ninja is regenerated.
As a result, the new targets are not rebuilt and compilation
fails.

Use the targets to build a SHA1 hash; the chances for collision
are one in 2^24 even with a 12-character prefix of the hash.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/ninjatool.py | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/scripts/ninjatool.py b/scripts/ninjatool.py
index ba6bd9a2a6..627a1cab45 100755
--- a/scripts/ninjatool.py
+++ b/scripts/ninjatool.py
@@ -34,6 +34,7 @@ import os
 import re
 import json
 import argparse
+import hashlib
 import shutil
 
 
@@ -51,6 +52,9 @@ else:
     normpath = os.path.normpath
 
 
+def sha1_text(text):
+    return hashlib.sha1(text.encode()).hexdigest()
+
 # ---- lexer and parser ----
 
 PATH_RE = r"[^$\s:|]+|\$[$ :]|\$[a-zA-Z0-9_-]+|\$\{[a-zA-Z0-9_.-]+\}"
@@ -767,7 +771,6 @@ class Ninja2Make(NinjaParserEventsWithVars):
         self.build_vars = defaultdict(lambda: dict())
         self.rule_targets = defaultdict(lambda: list())
         self.stamp_targets = defaultdict(lambda: list())
-        self.num_stamp = defaultdict(lambda: 0)
         self.all_outs = set()
         self.all_ins = set()
         self.all_phony = set()
@@ -903,8 +906,7 @@ class Ninja2Make(NinjaParserEventsWithVars):
             if len(out) == 1:
                 stamp = out[0] + '.stamp'
             else:
-                stamp = '%s%d.stamp' %(rule, self.num_stamp[rule])
-                self.num_stamp[rule] += 1
+                stamp = '%s@%s.stamp' % (rule, sha1_text(targets)[0:11])
             self.print('%s: %s; @:' % (targets, stamp))
             self.print('%s: %s | %s; ${ninja-command-restat}' % (stamp, inputs, orderonly))
             self.rule_targets[rule].append(stamp)
-- 
2.26.2




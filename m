Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82BB2283FE7
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Oct 2020 21:55:46 +0200 (CEST)
Received: from localhost ([::1]:43028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kPWaH-0003ag-Hk
	for lists+qemu-devel@lfdr.de; Mon, 05 Oct 2020 15:55:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kPWWm-00084x-FJ
 for qemu-devel@nongnu.org; Mon, 05 Oct 2020 15:52:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kPWWj-00075K-4F
 for qemu-devel@nongnu.org; Mon, 05 Oct 2020 15:52:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601927524;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4/O84PWYLLuI/xt2I7AU38zfB1DOWfjhmkXSpIHNkgQ=;
 b=N8tuqOGwOHOUD1uNqMpYdxzIXcXpOPQGRUONOtLnC4bGt9y5+BzNMXjmQo3Gm+ky/ItWju
 MUzic9q6soRSMNqEXIrkiRaU4n4CBOcAgxLgAcEIerLHmeeVuJPybvwMMm9EhalMZ68wjS
 rzmOxy7ZTwjs/eE+KCmkHpB/lfFvbUQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-hhT5BOeyPDmdqfh8WB4h_g-1; Mon, 05 Oct 2020 15:52:02 -0400
X-MC-Unique: hhT5BOeyPDmdqfh8WB4h_g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9D279873085
 for <qemu-devel@nongnu.org>; Mon,  5 Oct 2020 19:52:01 +0000 (UTC)
Received: from scv.redhat.com (ovpn-120-38.rdu2.redhat.com [10.10.120.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 123C65C1BD;
 Mon,  5 Oct 2020 19:52:00 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 03/36] qapi-gen: Separate arg-parsing from generation
Date: Mon,  5 Oct 2020 15:51:25 -0400
Message-Id: <20201005195158.2348217-4-jsnow@redhat.com>
In-Reply-To: <20201005195158.2348217-1-jsnow@redhat.com>
References: <20201005195158.2348217-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/05 02:11:31
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.733,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a minor re-work of the entrypoint script. It isolates a
generate() method from the actual command-line mechanism.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Cleber Rosa <crosa@redhat.com>
Tested-by: Cleber Rosa <crosa@redhat.com>
---
 scripts/qapi-gen.py | 85 +++++++++++++++++++++++++++++++++------------
 1 file changed, 62 insertions(+), 23 deletions(-)

diff --git a/scripts/qapi-gen.py b/scripts/qapi-gen.py
index 541e8c1f55d..117b396a595 100644
--- a/scripts/qapi-gen.py
+++ b/scripts/qapi-gen.py
@@ -1,30 +1,77 @@
 #!/usr/bin/env python3
-# QAPI generator
-#
+
 # This work is licensed under the terms of the GNU GPL, version 2 or later.
 # See the COPYING file in the top-level directory.
 
+"""
+QAPI Generator
+
+This script is the main entry point for generating C code from the QAPI schema.
+"""
 
 import argparse
 import re
 import sys
 
 from qapi.commands import gen_commands
+from qapi.error import QAPIError
 from qapi.events import gen_events
 from qapi.introspect import gen_introspect
-from qapi.schema import QAPIError, QAPISchema
+from qapi.schema import QAPISchema
 from qapi.types import gen_types
 from qapi.visit import gen_visit
 
 
-def main(argv):
+DEFAULT_OUTPUT_DIR = ''
+DEFAULT_PREFIX = ''
+
+
+def generate(schema_file: str,
+             output_dir: str,
+             prefix: str,
+             unmask: bool = False,
+             builtins: bool = False) -> None:
+    """
+    generate uses a given schema to produce C code in the target directory.
+
+    :param schema_file: The primary QAPI schema file.
+    :param output_dir: The output directory to store generated code.
+    :param prefix: Optional C-code prefix for symbol names.
+    :param unmask: Expose non-ABI names through introspection?
+    :param builtins: Generate code for built-in types?
+
+    :raise QAPIError: On failures.
+    """
+    match = re.match(r'([A-Za-z_.-][A-Za-z0-9_.-]*)?', prefix)
+    if match.end() != len(prefix):
+        msg = "funny character '{:s}' in prefix '{:s}'".format(
+            prefix[match.end()], prefix)
+        raise QAPIError('', None, msg)
+
+    schema = QAPISchema(schema_file)
+    gen_types(schema, output_dir, prefix, builtins)
+    gen_visit(schema, output_dir, prefix, builtins)
+    gen_commands(schema, output_dir, prefix)
+    gen_events(schema, output_dir, prefix)
+    gen_introspect(schema, output_dir, prefix, unmask)
+
+
+def main() -> int:
+    """
+    gapi-gen shell script entrypoint.
+    Expects arguments via sys.argv, see --help for details.
+
+    :return: int, 0 on success, 1 on failure.
+    """
     parser = argparse.ArgumentParser(
         description='Generate code from a QAPI schema')
     parser.add_argument('-b', '--builtins', action='store_true',
                         help="generate code for built-in types")
-    parser.add_argument('-o', '--output-dir', action='store', default='',
+    parser.add_argument('-o', '--output-dir', action='store',
+                        default=DEFAULT_OUTPUT_DIR,
                         help="write output to directory OUTPUT_DIR")
-    parser.add_argument('-p', '--prefix', action='store', default='',
+    parser.add_argument('-p', '--prefix', action='store',
+                        default=DEFAULT_PREFIX,
                         help="prefix for symbols")
     parser.add_argument('-u', '--unmask-non-abi-names', action='store_true',
                         dest='unmask',
@@ -32,25 +79,17 @@ def main(argv):
     parser.add_argument('schema', action='store')
     args = parser.parse_args()
 
-    match = re.match(r'([A-Za-z_.-][A-Za-z0-9_.-]*)?', args.prefix)
-    if match.end() != len(args.prefix):
-        print("%s: 'funny character '%s' in argument of --prefix"
-              % (sys.argv[0], args.prefix[match.end()]),
-              file=sys.stderr)
-        sys.exit(1)
-
     try:
-        schema = QAPISchema(args.schema)
+        generate(args.schema,
+                 output_dir=args.output_dir,
+                 prefix=args.prefix,
+                 unmask=args.unmask,
+                 builtins=args.builtins)
     except QAPIError as err:
-        print(err, file=sys.stderr)
-        exit(1)
-
-    gen_types(schema, args.output_dir, args.prefix, args.builtins)
-    gen_visit(schema, args.output_dir, args.prefix, args.builtins)
-    gen_commands(schema, args.output_dir, args.prefix)
-    gen_events(schema, args.output_dir, args.prefix)
-    gen_introspect(schema, args.output_dir, args.prefix, args.unmask)
+        print(f"{sys.argv[0]}: {str(err)}", file=sys.stderr)
+        return 1
+    return 0
 
 
 if __name__ == '__main__':
-    main(sys.argv)
+    sys.exit(main())
-- 
2.26.2



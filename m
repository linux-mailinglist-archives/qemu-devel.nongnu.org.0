Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51567277CF5
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Sep 2020 02:33:54 +0200 (CEST)
Received: from localhost ([::1]:40864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kLbgP-0002vt-BQ
	for lists+qemu-devel@lfdr.de; Thu, 24 Sep 2020 20:33:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kLbbu-0000kc-Tl
 for qemu-devel@nongnu.org; Thu, 24 Sep 2020 20:29:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kLbbr-00008v-Ia
 for qemu-devel@nongnu.org; Thu, 24 Sep 2020 20:29:14 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600993751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t8U8C4CXg32323bNC83EyuM3sRWhcXArgZlCoK1zzr8=;
 b=KnNphjWadWlLna3bBY0oGbLuoJM/xxcKeP+fM7pCqrLaR13wc53tbAugKc5OdYudxpaXG9
 C7q5NiftZTdtWmA0TNCTMka+stla0T6xozWWJ5t85FUSgXEOBFyiSkFqKOrVqEKjQPp8P2
 TB1YC6PRtgh6ANApWQ52Z8dt401wj40=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-91-hiqPrKsIMXaAUdb7oP80Hw-1; Thu, 24 Sep 2020 20:29:08 -0400
X-MC-Unique: hiqPrKsIMXaAUdb7oP80Hw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1A9DA81F007
 for <qemu-devel@nongnu.org>; Fri, 25 Sep 2020 00:29:07 +0000 (UTC)
Received: from scv.redhat.com (ovpn-119-140.rdu2.redhat.com [10.10.119.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 740CC5D9DD;
 Fri, 25 Sep 2020 00:29:06 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 07/47] qapi-gen: Separate arg-parsing from generation
Date: Thu, 24 Sep 2020 20:28:20 -0400
Message-Id: <20200925002900.465855-8-jsnow@redhat.com>
In-Reply-To: <20200925002900.465855-1-jsnow@redhat.com>
References: <20200925002900.465855-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/22 23:02:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.199,
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
Cc: John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a minor re-work of the entrypoint script. It isolates a
generate() method from the actual command-line mechanism.

The regex match error checking was modified slightly to check that we
actually got a regex match.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
---
 scripts/qapi-gen.py | 87 ++++++++++++++++++++++++++++++++-------------
 1 file changed, 63 insertions(+), 24 deletions(-)

diff --git a/scripts/qapi-gen.py b/scripts/qapi-gen.py
index 4b03f7d53b..59becba3e1 100644
--- a/scripts/qapi-gen.py
+++ b/scripts/qapi-gen.py
@@ -1,9 +1,13 @@
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
@@ -11,21 +15,65 @@
 
 from qapi.commands import gen_commands
 from qapi.doc import gen_doc
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
+    if match and match.end() != len(prefix):
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
+    gen_doc(schema, output_dir, prefix)
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
@@ -33,26 +81,17 @@ def main(argv):
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
-    gen_doc(schema, args.output_dir, args.prefix)
+        print(f"{sys.argv[0]}: {str(err)}", file=sys.stderr)
+        return 1
+    return 0
 
 
 if __name__ == '__main__':
-    main(sys.argv)
+    sys.exit(main())
-- 
2.26.2



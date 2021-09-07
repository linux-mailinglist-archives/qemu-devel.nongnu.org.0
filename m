Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DAB940292F
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 14:50:00 +0200 (CEST)
Received: from localhost ([::1]:58836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNaY3-0003AD-Gq
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 08:49:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mNa8Y-0004k2-LY
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:23:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mNa8L-0007ti-GL
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:23:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631017404;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8TzOn+P9Hh5f2yl0uOc582fZprACT7UpapXov530jGA=;
 b=EvLUx8AaGmfNREYpTSlpZA0yXzbsgewhmI8aQDlgTmMlveQSQtYmq3/C7moEBdL6SorJwe
 n5hfxfNNRgJjgn+0cOabLxGu8UXka6Hx0VMlNmh+CzFQWRHt5fjUs6M1IGGsKlVomrUs35
 8nH63jm3yMwS3ogPTrFemW9ZM8s+lNM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-NGMCS6RJMnqDFWAmf3rvpw-1; Tue, 07 Sep 2021 08:23:23 -0400
X-MC-Unique: NGMCS6RJMnqDFWAmf3rvpw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 88342835DE1
 for <qemu-devel@nongnu.org>; Tue,  7 Sep 2021 12:23:22 +0000 (UTC)
Received: from localhost (unknown [10.39.208.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 51B9019733;
 Tue,  7 Sep 2021 12:23:13 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [RFC v3 16/32] scripts/qapi: add Rust FFI bindings generation
Date: Tue,  7 Sep 2021 16:19:27 +0400
Message-Id: <20210907121943.3498701-17-marcandre.lureau@redhat.com>
In-Reply-To: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
References: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: pbonzini@redhat.com, berrange@redhat.com, armbru@redhat.com,
 stefanha@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Generate the C QAPI types in Rust, with a few common niceties to
Debug/Clone/Copy the Rust type.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 meson.build            |   4 +-
 scripts/qapi/main.py   |  23 ++-
 scripts/qapi/rs.py     | 170 ++++++++++++++++
 scripts/qapi/rs_ffi.py | 446 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 635 insertions(+), 8 deletions(-)
 create mode 100644 scripts/qapi/rs.py
 create mode 100644 scripts/qapi/rs_ffi.py

diff --git a/meson.build b/meson.build
index 29d218d35a..b45f409eb4 100644
--- a/meson.build
+++ b/meson.build
@@ -2012,7 +2012,9 @@ qapi_gen_depends = [ meson.source_root() / 'scripts/qapi/__init__.py',
                      meson.source_root() / 'scripts/qapi/types.py',
                      meson.source_root() / 'scripts/qapi/visit.py',
                      meson.source_root() / 'scripts/qapi/common.py',
-                     meson.source_root() / 'scripts/qapi-gen.py'
+                     meson.source_root() / 'scripts/qapi/rs.py',
+                     meson.source_root() / 'scripts/qapi/rs_ffi.py',
+                     meson.source_root() / 'scripts/qapi-gen.py',
 ]
 
 tracetool = [
diff --git a/scripts/qapi/main.py b/scripts/qapi/main.py
index f2ea6e0ce4..deba72ee4e 100644
--- a/scripts/qapi/main.py
+++ b/scripts/qapi/main.py
@@ -16,6 +16,7 @@
 from .error import QAPIError
 from .events import gen_events
 from .introspect import gen_introspect
+from .rs_ffi import gen_rs_ffitypes
 from .schema import QAPISchema
 from .types import gen_types
 from .visit import gen_visit
@@ -32,7 +33,8 @@ def generate(schema_file: str,
              output_dir: str,
              prefix: str,
              unmask: bool = False,
-             builtins: bool = False) -> None:
+             builtins: bool = False,
+             rust: bool = False) -> None:
     """
     Generate C code for the given schema into the target directory.
 
@@ -41,17 +43,21 @@ def generate(schema_file: str,
     :param prefix: Optional C-code prefix for symbol names.
     :param unmask: Expose non-ABI names through introspection?
     :param builtins: Generate code for built-in types?
+    :param rust: Generate Rust binding code?
 
     :raise QAPIError: On failures.
     """
     assert invalid_prefix_char(prefix) is None
 
     schema = QAPISchema(schema_file)
-    gen_types(schema, output_dir, prefix, builtins)
-    gen_visit(schema, output_dir, prefix, builtins)
-    gen_commands(schema, output_dir, prefix)
-    gen_events(schema, output_dir, prefix)
-    gen_introspect(schema, output_dir, prefix, unmask)
+    if rust:
+        gen_rs_ffitypes(schema, output_dir, prefix)
+    else:
+        gen_types(schema, output_dir, prefix, builtins)
+        gen_visit(schema, output_dir, prefix, builtins)
+        gen_commands(schema, output_dir, prefix)
+        gen_events(schema, output_dir, prefix)
+        gen_introspect(schema, output_dir, prefix, unmask)
 
 
 def main() -> int:
@@ -74,6 +80,8 @@ def main() -> int:
     parser.add_argument('-u', '--unmask-non-abi-names', action='store_true',
                         dest='unmask',
                         help="expose non-ABI names in introspection")
+    parser.add_argument('-r', '--rust', action='store_true',
+                        help="generate Rust binding code")
     parser.add_argument('schema', action='store')
     args = parser.parse_args()
 
@@ -88,7 +96,8 @@ def main() -> int:
                  output_dir=args.output_dir,
                  prefix=args.prefix,
                  unmask=args.unmask,
-                 builtins=args.builtins)
+                 builtins=args.builtins,
+                 rust=args.rust)
     except QAPIError as err:
         print(f"{sys.argv[0]}: {str(err)}", file=sys.stderr)
         return 1
diff --git a/scripts/qapi/rs.py b/scripts/qapi/rs.py
new file mode 100644
index 0000000000..be42329fa4
--- /dev/null
+++ b/scripts/qapi/rs.py
@@ -0,0 +1,170 @@
+# This work is licensed under the terms of the GNU GPL, version 2.
+# See the COPYING file in the top-level directory.
+"""
+QAPI Rust generator
+"""
+
+import os
+import re
+import subprocess
+from typing import NamedTuple, Optional
+
+from .common import POINTER_SUFFIX
+from .gen import QAPIGen
+from .schema import QAPISchemaModule, QAPISchemaVisitor
+
+
+# see to_snake_case() below
+snake_case = re.compile(r'((?<=[a-z0-9])[A-Z]|(?!^)[A-Z](?=[a-z]))')
+
+
+rs_name_trans = str.maketrans('.-', '__')
+
+
+# Map @name to a valid Rust identifier.
+# If @protect, avoid returning certain ticklish identifiers (like
+# keywords) by prepending raw identifier prefix 'r#'.
+def rs_name(name: str, protect: bool = True) -> str:
+    name = name.translate(rs_name_trans)
+    if name[0].isnumeric():
+        name = '_' + name
+    if not protect:
+        return name
+    # based from the list:
+    # https://doc.rust-lang.org/reference/keywords.html
+    if name in ('Self', 'abstract', 'as', 'async',
+                'await', 'become', 'box', 'break',
+                'const', 'continue', 'crate', 'do',
+                'dyn', 'else', 'enum', 'extern',
+                'false', 'final', 'fn', 'for',
+                'if', 'impl', 'in', 'let',
+                'loop', 'macro', 'match', 'mod',
+                'move', 'mut', 'override', 'priv',
+                'pub', 'ref', 'return', 'self',
+                'static', 'struct', 'super', 'trait',
+                'true', 'try', 'type', 'typeof',
+                'union', 'unsafe', 'unsized', 'use',
+                'virtual', 'where', 'while', 'yield'):
+        name = 'r#' + name
+    # avoid some clashes with the standard library
+    if name in ('String',):
+        name = 'Qapi' + name
+
+    return name
+
+
+class CType(NamedTuple):
+    is_pointer: bool
+    is_const: bool
+    is_list: bool
+    c_type: str
+
+
+def rs_ctype_parse(c_type: str) -> CType:
+    is_pointer = False
+    if c_type.endswith(POINTER_SUFFIX):
+        is_pointer = True
+        c_type = c_type[:-len(POINTER_SUFFIX)]
+    is_list = c_type.endswith('List')
+    is_const = False
+    if c_type.startswith('const '):
+        is_const = True
+        c_type = c_type[6:]
+
+    c_type = rs_name(c_type)
+    return CType(is_pointer, is_const, is_list, c_type)
+
+
+def rs_ffitype(c_type: str, ffi_ns: str = 'qapi_ffi::',
+               list_as_newp: bool = False) -> str:
+    (is_pointer, is_const, is_list, c_type) = rs_ctype_parse(c_type)
+    c_type = rs_name(c_type)
+    to_rs = {
+        'bool': 'bool',
+        'char': 'libc::c_char',  # for clarity (i8)
+        'double': 'f64',
+        'int': 'i64',
+        'int16': 'i16',
+        'int16_t': 'i16',
+        'int32': 'i32',
+        'int32_t': 'i32',
+        'int64': 'i64',
+        'int64_t': 'i64',
+        'int8': 'i8',
+        'int8_t': 'i8',
+        'uint16': 'u16',
+        'uint16_t': 'u16',
+        'uint32': 'u32',
+        'uint32_t': 'u32',
+        'uint64': 'u64',
+        'uint64_t': 'u64',
+        'uint8': 'u8',
+        'uint8_t': 'u8',
+        'QObject': 'common::ffi::QObject',
+        'QNull': 'common::ffi::QNull',
+    }
+
+    ret = ''
+    if is_const and is_pointer:
+        ret += '*const '
+    elif is_pointer:
+        ret += '*mut '
+    if c_type in to_rs:
+        ret += to_rs[c_type]
+    else:
+        ret += ffi_ns + c_type
+
+    if is_list and list_as_newp:
+        ret = 'NewPtr<{}>'.format(ret)
+
+    return ret
+
+
+def to_camel_case(value: str) -> str:
+    # special case for last enum value
+    if value == '_MAX':
+        return value
+    raw_id = False
+    if value.startswith('r#'):
+        raw_id = True
+        value = value[2:]
+    value = ''.join('_' + word if word[0].isdigit()
+                    else word[:1].upper() + word[1:]
+                    for word in filter(None, re.split("[-_]+", value)))
+    if raw_id:
+        return 'r#' + value
+    return value
+
+
+def to_snake_case(value: str) -> str:
+    return snake_case.sub(r'_\1', value).lower()
+
+
+class QAPIGenRs(QAPIGen):
+    pass
+
+
+class QAPISchemaRsVisitor(QAPISchemaVisitor):
+
+    def __init__(self, prefix: str, what: str):
+        super().__init__()
+        self._prefix = prefix
+        self._what = what
+        self._gen = QAPIGenRs(self._prefix + self._what + '.rs')
+        self._main_module: Optional[str] = None
+
+    def visit_module(self, name: Optional[str]) -> None:
+        if name is None:
+            return
+        if QAPISchemaModule.is_user_module(name):
+            if self._main_module is None:
+                self._main_module = name
+
+    def write(self, output_dir: str) -> None:
+        self._gen.write(output_dir)
+
+        pathname = os.path.join(output_dir, self._gen.fname)
+        try:
+            subprocess.check_call(['rustfmt', pathname])
+        except FileNotFoundError:
+            pass
diff --git a/scripts/qapi/rs_ffi.py b/scripts/qapi/rs_ffi.py
new file mode 100644
index 0000000000..59e834b36a
--- /dev/null
+++ b/scripts/qapi/rs_ffi.py
@@ -0,0 +1,446 @@
+# This work is licensed under the terms of the GNU GPL, version 2.
+# See the COPYING file in the top-level directory.
+"""
+QAPI Rust sys/ffi generator
+"""
+
+from pathlib import Path
+from typing import (
+    Dict,
+    List,
+    Optional,
+    Set,
+)
+
+from .cabi import CABI, CABIEnum, gen_object_cabi
+from .common import mcgen
+from .rs import (
+    QAPISchemaRsVisitor,
+    rs_ffitype,
+    rs_name,
+    to_camel_case,
+    to_snake_case,
+)
+from .schema import (
+    QAPISchema,
+    QAPISchemaEnumMember,
+    QAPISchemaFeature,
+    QAPISchemaIfCond,
+    QAPISchemaModule,
+    QAPISchemaObjectType,
+    QAPISchemaObjectTypeMember,
+    QAPISchemaType,
+    QAPISchemaVariants,
+)
+from .source import QAPISourceInfo
+
+
+objects_seen = set()
+
+
+def gen_rs_ffi_enum(name: str,
+                    ifcond: QAPISchemaIfCond,
+                    members: List[QAPISchemaEnumMember]) -> str:
+    # append automatically generated _max value
+    enum_members = members + [QAPISchemaEnumMember('_MAX', None)]
+
+    ret = mcgen('''
+
+%(cfg)s
+#[derive(Copy, Clone, Debug, PartialEq, Eq)]
+#[repr(C)]
+pub enum %(rs_name)s {
+''',
+                cfg=ifcond.rsgen(),
+                rs_name=rs_name(name))
+
+    for member in enum_members:
+        ret += mcgen('''
+    %(cfg)s
+    %(c_enum)s,
+''',
+                     cfg=member.ifcond.rsgen(),
+                     c_enum=to_camel_case(rs_name(member.name)))
+    # picked the first, since that's what malloc0 does
+    # but arguably could use _MAX instead, or a qapi annotation
+    default = to_camel_case(rs_name(enum_members[0].name))
+    ret += mcgen('''
+}
+
+%(cfg)s
+impl Default for %(rs_name)s {
+    #[inline]
+    fn default() -> %(rs_name)s {
+        Self::%(default)s
+    }
+}
+''',
+                 cfg=ifcond.rsgen(),
+                 rs_name=rs_name(name),
+                 default=default)
+    return ret
+
+
+def gen_rs_ffi_struct_members(members:
+                              List[QAPISchemaObjectTypeMember]) -> str:
+    ret = ''
+    for memb in members:
+        if memb.optional:
+            ret += mcgen('''
+    %(cfg)s
+    pub has_%(rs_name)s: bool,
+''',
+                         cfg=memb.ifcond.rsgen(),
+                         rs_name=to_snake_case(rs_name(memb.name,
+                                                       protect=False)))
+        ret += mcgen('''
+    %(cfg)s
+    pub %(rs_name)s: %(rs_ffitype)s,
+''',
+                     cfg=memb.ifcond.rsgen(),
+                     rs_ffitype=rs_ffitype(memb.type.c_type(), ''),
+                     rs_name=to_snake_case(rs_name(memb.name)))
+    return ret
+
+
+def gen_rs_ffi_free(name: str, ifcond: QAPISchemaIfCond) -> str:
+    name = rs_name(name, protect=False)
+    typ = rs_name(name)
+    return mcgen('''
+
+%(cfg)s
+extern "C" {
+    pub fn qapi_free_%(name)s(obj: *mut %(ty)s);
+}
+''', cfg=ifcond.rsgen(), name=name, ty=typ)
+
+
+def gen_rs_ffi_variants(name: str,
+                        ifcond: QAPISchemaIfCond,
+                        variants: Optional[QAPISchemaVariants]) -> str:
+    ret = mcgen('''
+
+%(cfg)s
+#[repr(C)]
+#[derive(Copy, Clone)]
+pub union %(rs_name)s { /* union tag is @%(tag_name)s */
+''',
+                cfg=ifcond.rsgen(),
+                tag_name=rs_name(variants.tag_member.name),
+                rs_name=rs_name(name))
+
+    empty = True
+    for var in variants.variants:
+        if var.type.name == 'q_empty':
+            continue
+        empty = False
+        ret += mcgen('''
+    %(cfg)s
+    pub %(rs_name)s: %(rs_ffitype)s,
+''',
+                     cfg=var.ifcond.rsgen(),
+                     rs_ffitype=rs_ffitype(var.type.c_unboxed_type(), ''),
+                     rs_name=rs_name(var.name))
+
+    ret += mcgen('''
+    pub qapi_dummy: QapiDummy,
+''')
+
+    ret += mcgen('''
+}
+
+%(cfg)s
+impl ::std::fmt::Debug for %(rs_name)s {
+    fn fmt(&self, f: &mut ::std::fmt::Formatter) -> ::std::fmt::Result {
+        f.debug_struct(&format!("%(rs_name)s @ {:?}", self as *const _))
+            .finish()
+    }
+}
+''', cfg=ifcond.rsgen(), rs_name=rs_name(name))
+
+    if empty:
+        ret += mcgen('''
+
+%(cfg)s
+impl ::std::default::Default for %(rs_name)s {
+    fn default() -> Self {
+        Self { qapi_dummy: QapiDummy }
+    }
+}
+''', cfg=ifcond.rsgen(), rs_name=rs_name(name))
+    return ret
+
+
+def gen_rs_ffi_object(name: str,
+                      ifcond: QAPISchemaIfCond,
+                      base: Optional[QAPISchemaObjectType],
+                      members: List[QAPISchemaObjectTypeMember],
+                      variants: Optional[QAPISchemaVariants]) -> str:
+    if name in objects_seen:
+        return ''
+
+    ret = ''
+    objects_seen.add(name)
+    unionty = name + 'Union'
+    if variants:
+        for var in variants.variants:
+            if isinstance(var.type, QAPISchemaObjectType):
+                ret += gen_rs_ffi_object(var.type.name,
+                                         var.type.ifcond,
+                                         var.type.base,
+                                         var.type.local_members,
+                                         var.type.variants)
+        ret += gen_rs_ffi_variants(unionty, ifcond, variants)
+
+    ret += gen_rs_ffi_free(name, ifcond)
+    ret += mcgen('''
+
+%(cfg)s
+#[repr(C)]
+#[derive(Copy, Clone, Debug)]
+pub struct %(rs_name)s {
+''',
+                 cfg=ifcond.rsgen(),
+                 rs_name=rs_name(name))
+
+    if base:
+        if not base.is_implicit():
+            ret += mcgen('''
+    // Members inherited:
+''')
+        ret += gen_rs_ffi_struct_members(base.members)
+        if not base.is_implicit():
+            ret += mcgen('''
+    // Own members:
+''')
+
+    ret += gen_rs_ffi_struct_members(members)
+    if variants:
+        ret += mcgen('''
+        pub u: %(unionty)s
+''', unionty=rs_name(unionty))
+
+    empty = False
+    # for compatibility with C ABI
+    if (not base or base.is_empty()) and not members and not variants:
+        empty = True
+        ret += mcgen('''
+    pub qapi_dummy_for_empty_struct: u8,
+''')
+    ret += mcgen('''
+}
+''')
+
+    if empty:
+        ret += mcgen('''
+
+%(cfg)s
+impl Default for %(rs_name)s {
+    fn default() -> Self {
+        Self { qapi_dummy_for_empty_struct: 0 }
+    }
+}
+''',
+                     cfg=ifcond.rsgen(),
+                     rs_name=rs_name(name))
+
+    return ret
+
+
+def gen_rs_ffi_variant(name: str,
+                       ifcond: QAPISchemaIfCond,
+                       variants: Optional[QAPISchemaVariants]) -> str:
+    if name in objects_seen:
+        return ''
+
+    objects_seen.add(name)
+
+    ret = ''
+    gen_variants = ''
+    for var in variants.variants:
+        if var.type.name == 'q_empty':
+            continue
+        typ = rs_ffitype(var.type.c_unboxed_type(), '')
+        gen_variants += mcgen('''
+    %(cfg)s
+    pub %(mem_name)s: %(rs_ffitype)s,
+''',
+                              cfg=var.ifcond.rsgen(),
+                              rs_ffitype=typ,
+                              mem_name=rs_name(var.name))
+    if not gen_variants:
+        ret += mcgen('''
+   impl ::std::default::Default for %(rs_name)sUnion {
+       fn default() -> Self {
+           Self { qapi_dummy: QapiDummy }
+       }
+   }
+''')
+    gen_variants += mcgen('''
+    pub qapi_dummy: QapiDummy,
+''')
+
+    ret += gen_rs_ffi_free(name, ifcond)
+    ret += mcgen('''
+
+%(cfg)s
+#[repr(C)]
+#[derive(Copy,Clone)]
+pub union %(rs_name)sUnion {
+    %(variants)s
+}
+
+%(cfg)s
+impl ::std::fmt::Debug for %(rs_name)sUnion {
+    fn fmt(&self, f: &mut ::std::fmt::Formatter) -> ::std::fmt::Result {
+        f.debug_struct(&format!("%(rs_name)sUnion @ {:?}", self as *const _))
+            .finish()
+    }
+}
+
+%(cfg)s
+#[repr(C)]
+#[derive(Copy, Clone, Debug)]
+pub struct %(rs_name)s {
+    pub %(tag)s: QType,
+    pub u: %(rs_name)sUnion,
+}
+''',
+                 cfg=ifcond.rsgen(),
+                 rs_name=rs_name(name),
+                 tag=rs_name(variants.tag_member.name),
+                 variants=gen_variants)
+    return ret
+
+
+def gen_rs_ffi_array(name: str,
+                     ifcond: QAPISchemaIfCond,
+                     element_type: QAPISchemaType) -> str:
+    ret = mcgen('''
+
+%(cfg)s
+#[repr(C)]
+#[derive(Copy, Clone)]
+pub struct %(rs_name)s {
+    pub next: *mut %(rs_name)s,
+    pub value: %(rs_ffitype)s,
+}
+
+%(cfg)s
+impl ::std::fmt::Debug for %(rs_name)s {
+    fn fmt(&self, f: &mut ::std::fmt::Formatter) -> ::std::fmt::Result {
+        f.debug_struct(&format!("%(rs_name)s @ {:?}", self as *const _))
+            .finish()
+    }
+}
+''',
+                cfg=ifcond.rsgen(),
+                rs_name=rs_name(name),
+                rs_ffitype=rs_ffitype(element_type.c_type(), ''))
+    ret += gen_rs_ffi_free(name, ifcond)
+    return ret
+
+
+class QAPISchemaGenRsFFITypeVisitor(QAPISchemaRsVisitor):
+
+    def __init__(self, prefix: str):
+        super().__init__(prefix, 'qapi-ffi-types')
+        self._cabi: Dict[str, CABI] = {}
+        self._cabi_functions: List[str] = []
+        self._cabi_functions_called: Set[str] = set()
+
+    def _cabi_add(self, cabis: List[CABI]) -> None:
+        for cabi in cabis:
+            self._cabi.setdefault(cabi.name, cabi)
+
+    def visit_begin(self, schema: QAPISchema) -> None:
+        # gen_object() is recursive, ensure it doesn't visit the empty type
+        objects_seen.add(schema.the_empty_object_type.name)
+        self._gen.preamble_add(
+            mcgen('''
+// generated by qapi-gen, DO NOT EDIT
+
+#[repr(C)]
+#[derive(Copy, Clone, Debug)]
+pub struct QapiDummy;
+'''))
+
+    def _get_qapi_cabi_fn(self, name: str) -> str:
+        fn_name = 'cabi'
+        if QAPISchemaModule.is_builtin_module(name):
+            fn_name += '_builtin'
+        elif name != self._main_module:
+            name = Path(name).stem
+            fn_name += '_' + rs_name(name, False)
+        return fn_name
+
+    def visit_include(self, name: str, info: Optional[QAPISourceInfo]) -> None:
+        super().visit_include(name, info)
+        cabi_fn = self._get_qapi_cabi_fn(name)
+        if cabi_fn not in self._cabi_functions_called:
+            self._cabi_functions.append(cabi_fn)
+
+    def visit_module_end(self, name: str) -> None:
+        cabi_gen = "".join(f'    {fn}();\n' for fn in self._cabi_functions)
+        self._cabi_functions_called |= set(self._cabi_functions)
+        self._cabi_functions = []
+        cabi_gen += "".join(
+            [c.gen_rs() for _, c in sorted(self._cabi.items())]
+        )
+        self._cabi = {}
+        fn_name = self._get_qapi_cabi_fn(name)
+        self._gen.add(mcgen('''
+#[cfg(QAPI_CABI)]
+pub(crate) fn %(fn_name)s() {
+%(cabi_gen)s
+}
+''', fn_name=fn_name, cabi_gen=cabi_gen))
+
+    def visit_enum_type(self,
+                        name: str,
+                        info: Optional[QAPISourceInfo],
+                        ifcond: QAPISchemaIfCond,
+                        features: List[QAPISchemaFeature],
+                        members: List[QAPISchemaEnumMember],
+                        prefix: Optional[str]) -> None:
+        self._gen.add(gen_rs_ffi_enum(name, ifcond, members))
+        self._cabi_add([CABIEnum(name, ifcond, members, prefix)])
+
+    def visit_array_type(self,
+                         name: str,
+                         info: Optional[QAPISourceInfo],
+                         ifcond: QAPISchemaIfCond,
+                         element_type: QAPISchemaType) -> None:
+        self._gen.add(gen_rs_ffi_array(name, ifcond, element_type))
+
+    def visit_object_type(self,
+                          name: str,
+                          info: Optional[QAPISourceInfo],
+                          ifcond: QAPISchemaIfCond,
+                          features: List[QAPISchemaFeature],
+                          base: Optional[QAPISchemaObjectType],
+                          members: List[QAPISchemaObjectTypeMember],
+                          variants: Optional[QAPISchemaVariants]) -> None:
+        # Nothing to do for the special empty builtin
+        if name == 'q_empty':
+            return
+        self._gen.add(gen_rs_ffi_object(name, ifcond, base, members, variants))
+        self._cabi_add(gen_object_cabi(name, ifcond, base, members, variants))
+
+    def visit_alternate_type(self,
+                             name: str,
+                             info: QAPISourceInfo,
+                             ifcond: QAPISchemaIfCond,
+                             features: List[QAPISchemaFeature],
+                             variants: QAPISchemaVariants) -> None:
+        self._gen.add(gen_rs_ffi_variant(name, ifcond, variants))
+        self._cabi_add(gen_object_cabi(name, ifcond, None,
+                                       [variants.tag_member], variants))
+
+
+def gen_rs_ffitypes(schema: QAPISchema,
+                    output_dir: str,
+                    prefix: str) -> None:
+    vis = QAPISchemaGenRsFFITypeVisitor(prefix)
+    schema.visit(vis)
+    vis.write(output_dir)
-- 
2.33.0.113.g6c40894d24



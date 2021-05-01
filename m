Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5865A3708AC
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 21:07:26 +0200 (CEST)
Received: from localhost ([::1]:50634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcuxZ-00046E-E2
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 15:07:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcui4-0006Vf-KY
 for qemu-devel@nongnu.org; Sat, 01 May 2021 14:51:25 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:35447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcui2-0003mo-8Z
 for qemu-devel@nongnu.org; Sat, 01 May 2021 14:51:24 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 h14-20020a17090aea8eb02901553e1cc649so3490484pjz.0
 for <qemu-devel@nongnu.org>; Sat, 01 May 2021 11:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R/1WAzyuseBP9GbYXdpEWnL72IgMjHrQD+B+K1Ph/uk=;
 b=pJA3V8F2rPLHHbx8f3/7AxDF6BvlNE41+Ix+Sy7ORAqkpwrGpf6HiCtvimGcF+dkn9
 KYx+dM4d6w0FuEohB4z8/xX1Cx3TDYmae7B+sf4wwEJGq9ZglcIkwvB9+zKlqHHjGLLq
 8zg207W8c+WD5E1hp5FTrmhA6AF3mQlqVdF65ydW+wiqTHIq+e1+mL+bWrb+6raKjaD9
 adGGQtUJXqt0UfmjM58tFwHgfzKOxF1vx+XEIvtci+fkr9qBTsM0xcsYzMMfQ268wSnD
 KQ/Z/VfmiQZYsq1OXaNt5FPgOk9D7ovf4LesveFlVpKrkqBvzmenzubAZAm40i43EZ0x
 QzUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R/1WAzyuseBP9GbYXdpEWnL72IgMjHrQD+B+K1Ph/uk=;
 b=tLQUfmYjALO0aFwmzUiqpaKTh1QlWhin8JbTzXRyUxbascNKCNhfK+FZVmzLvq/ozm
 ZIwPiRQ7bHhLNLWaFPylXARenf0CkoWUuFwDN3xR1cZaLEI9ZuxWtbITncdos8goSBW7
 L+B46tVNAS7nVv63C9AwhiCYL6JEmMN9SLSv15AfZzuWO/dCTDkBX+bh7Ah2b4nuQHI+
 KDVPoyVMkbGvat7hzuWGrE/1Dp58GB7ASgslaDeDbQtsrU4GomVkeiR3qv8KkCU/2hdh
 0j7Yt0cXjXHiQbbtT2BLNF7FYfGGU7KKt0RWfU+UxbhhR0ehOBZwUiql7jQb7L5ZGO6h
 CVLA==
X-Gm-Message-State: AOAM532Tl+DOLjuK1rjjUnVScgnSxUquDEbeNEfDdkQvRwqcMIICJrLI
 6TlSlmD24YTcLECsT7ol1CEqWlMQNtdYTw==
X-Google-Smtp-Source: ABdhPJyFsu9BIBLWGIZ6J/YEs5xduLANF1U50kk77a+KyKgIb3saBL3E26xREQwJ8DPQYXgfXQl8qA==
X-Received: by 2002:a17:902:9693:b029:ee:851f:22e1 with SMTP id
 n19-20020a1709029693b02900ee851f22e1mr11348011plp.79.1619895080945; 
 Sat, 01 May 2021 11:51:20 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id k17sm4971360pfa.68.2021.05.01.11.51.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 May 2021 11:51:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 5/5] decodetree: Extend argument set syntax to allow types
Date: Sat,  1 May 2021 11:51:16 -0700
Message-Id: <20210501185116.1338875-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210501185116.1338875-1-richard.henderson@linaro.org>
References: <20210501185116.1338875-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, Luis Pires <luis.pires@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rather than force all structure members to be 'int',
allow the type of the member to be specified.

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 docs/devel/decodetree.rst             | 11 ++++---
 tests/decode/succ_argset_type1.decode |  1 +
 scripts/decodetree.py                 | 45 +++++++++++++++++----------
 3 files changed, 36 insertions(+), 21 deletions(-)
 create mode 100644 tests/decode/succ_argset_type1.decode

diff --git a/docs/devel/decodetree.rst b/docs/devel/decodetree.rst
index 74f66bf46e..49ea50c2a7 100644
--- a/docs/devel/decodetree.rst
+++ b/docs/devel/decodetree.rst
@@ -40,9 +40,6 @@ and returns an integral value extracted from there.
 
 A field with no ``unnamed_fields`` and no ``!function`` is in error.
 
-FIXME: the fields of the structure into which this result will be stored
-is restricted to ``int``.  Which means that we cannot expand 64-bit items.
-
 Field examples:
 
 +---------------------------+---------------------------------------------+
@@ -66,9 +63,14 @@ Argument Sets
 Syntax::
 
   args_def    := '&' identifier ( args_elt )+ ( !extern )?
-  args_elt    := identifier
+  args_elt    := identifier (':' identifier)?
 
 Each *args_elt* defines an argument within the argument set.
+If the form of the *args_elt* contains a colon, the first
+identifier is the argument name and the second identifier is
+the argument type.  If the colon is missing, the argument
+type will be ``int``.
+
 Each argument set will be rendered as a C structure "arg_$name"
 with each of the fields being one of the member arguments.
 
@@ -86,6 +88,7 @@ Argument set examples::
 
   &reg3       ra rb rc
   &loadstore  reg base offset
+  &longldst   reg base offset:int64_t
 
 
 Formats
diff --git a/tests/decode/succ_argset_type1.decode b/tests/decode/succ_argset_type1.decode
new file mode 100644
index 0000000000..ed946b420d
--- /dev/null
+++ b/tests/decode/succ_argset_type1.decode
@@ -0,0 +1 @@
+&asdf b:bool c:uint64_t a
diff --git a/scripts/decodetree.py b/scripts/decodetree.py
index f85da45ee3..a03dc6b5e3 100644
--- a/scripts/decodetree.py
+++ b/scripts/decodetree.py
@@ -165,11 +165,15 @@ def is_contiguous(bits):
         return -1
 
 
-def eq_fields_for_args(flds_a, flds_b):
-    if len(flds_a) != len(flds_b):
+def eq_fields_for_args(flds_a, arg):
+    if len(flds_a) != len(arg.fields):
         return False
+    # Only allow inference on default types
+    for t in arg.types:
+        if t != 'int':
+            return False
     for k, a in flds_a.items():
-        if k not in flds_b:
+        if k not in arg.fields:
             return False
     return True
 
@@ -313,10 +317,11 @@ def __ne__(self, other):
 
 class Arguments:
     """Class representing the extracted fields of a format"""
-    def __init__(self, nm, flds, extern):
+    def __init__(self, nm, flds, types, extern):
         self.name = nm
         self.extern = extern
-        self.fields = sorted(flds)
+        self.fields = flds
+        self.types = types
 
     def __str__(self):
         return self.name + ' ' + str(self.fields)
@@ -327,8 +332,8 @@ def struct_name(self):
     def output_def(self):
         if not self.extern:
             output('typedef struct {\n')
-            for n in self.fields:
-                output('    int ', n, ';\n')
+            for (n, t) in zip(self.fields, self.types):
+                output(f'    {t} {n};\n')
             output('} ', self.struct_name(), ';\n\n')
 # end Arguments
 
@@ -719,21 +724,27 @@ def parse_arguments(lineno, name, toks):
     global anyextern
 
     flds = []
+    types = []
     extern = False
-    for t in toks:
-        if re.fullmatch('!extern', t):
+    for n in toks:
+        if re.fullmatch('!extern', n):
             extern = True
             anyextern = True
             continue
-        if not re.fullmatch(re_C_ident, t):
-            error(lineno, f'invalid argument set token "{t}"')
-        if t in flds:
-            error(lineno, f'duplicate argument "{t}"')
-        flds.append(t)
+        if re.fullmatch(re_C_ident + ':' + re_C_ident, n):
+            (n, t) = n.split(':')
+        elif re.fullmatch(re_C_ident, n):
+            t = 'int'
+        else:
+            error(lineno, f'invalid argument set token "{n}"')
+        if n in flds:
+            error(lineno, f'duplicate argument "{n}"')
+        flds.append(n)
+        types.append(t)
 
     if name in arguments:
         error(lineno, 'duplicate argument set', name)
-    arguments[name] = Arguments(name, flds, extern)
+    arguments[name] = Arguments(name, flds, types, extern)
 # end parse_arguments
 
 
@@ -760,11 +771,11 @@ def infer_argument_set(flds):
     global decode_function
 
     for arg in arguments.values():
-        if eq_fields_for_args(flds, arg.fields):
+        if eq_fields_for_args(flds, arg):
             return arg
 
     name = decode_function + str(len(arguments))
-    arg = Arguments(name, flds.keys(), False)
+    arg = Arguments(name, flds.keys(), ['int'] * len(flds), False)
     arguments[name] = arg
     return arg
 
-- 
2.25.1



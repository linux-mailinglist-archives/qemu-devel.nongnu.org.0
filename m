Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E3636F371
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 03:21:57 +0200 (CEST)
Received: from localhost ([::1]:45162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcHqu-0008DZ-Hb
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 21:21:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcHlB-0002kG-Eh
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 21:16:01 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:34551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcHkz-0007UJ-Ie
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 21:16:01 -0400
Received: by mail-pg1-x530.google.com with SMTP id z16so7445554pga.1
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 18:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZTuVGlYcdxM3KgVRg58NcnxnAH+jbo2FXAOFg2CqtP8=;
 b=uc9wU/hflZreY4W8cmTmrHyN+EQyjySLC1PeGjOZa0mXDoZBfVp299UdtqGj67dFdU
 YhdV2VHn4BTQRdCCbsRdX+f7SigcYH26HQxWpgbfJVBk44S4cv9OsgVMw0k/3v6rqUyT
 LJXndzlGV2pmA6oT3iveJvhsHOwuT3b9tPBBcxpGwXJgYFYJZhiigqd95O5INFKcUPk/
 mMHAuD5j0RXvWwla5jPcSDbDnxAjAVjrvILcO6s4fsICbOZdnUawBqSg1Xzhg8u40/jN
 FXm1IY1bSvxFA85SvfdS8o5n/9shVAS80hLVumxkJoqGpnd5Zi/dWpMuXbctQeEHf8bY
 5LWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZTuVGlYcdxM3KgVRg58NcnxnAH+jbo2FXAOFg2CqtP8=;
 b=KYDX0gbKcfYbEcYEI9MjoXCzHlFr8mPw3+NTEI08dZzBTnouPge45eGG6PrkcJWirM
 FflONmQwhq4HCjwYrrJwHoSgQXJO/AmBOutGhhTcYB+EDn0EUOlJqt9jgX59NfS5T4NJ
 /wsU6zcWJYhQevG/BXu+qDiyRoFgwN93HQIc3lJVaPRL+XIuEP6PbUig97RRravt1kek
 oI+m77FvRY5se3h6iqFi2HeuvJ5mKcK9SrB3cSsxKYNJPkWcw+uYjY1Oq17asYSDegqY
 0GOFi0tTzUAJAD3T7TrU1EN3M5/sWnrXV2cxMnc5ZuVRXOcqttRQQ62roSrGqR9HyuRj
 P6YQ==
X-Gm-Message-State: AOAM530GztYSTbIh/aMCnB1zjSuNhTV4SYx/xdtnT1OoqfXgB/lA3X9j
 7+G9SWZD9XXkpdDp/nRAkYZtt0cxTR81xw==
X-Google-Smtp-Source: ABdhPJwJZIuiYhmfulqJCjnUCpbgIySU/4pGRhTAnGo51i2ZMNsvylhIwasu6iaYjhg+ybxnHNg9TQ==
X-Received: by 2002:a65:40c7:: with SMTP id u7mr2333083pgp.29.1619745347251;
 Thu, 29 Apr 2021 18:15:47 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id 1sm161277pjx.46.2021.04.29.18.15.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 18:15:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 04/30] decodetree: Extend argument set syntax to allow types
Date: Thu, 29 Apr 2021 18:15:17 -0700
Message-Id: <20210430011543.1017113-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430011543.1017113-1-richard.henderson@linaro.org>
References: <20210430011543.1017113-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
Cc: f4bug@amsat.org, luis.pires@eldorado.org.br, qemu-ppc@nongnu.org,
 lagarcia@br.ibm.com, bruno.larsen@eldorado.org.br,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rather than force all structure members to be 'int',
allow the type of the member to be specified.

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



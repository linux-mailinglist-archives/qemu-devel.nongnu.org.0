Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0387B488C5F
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jan 2022 21:59:28 +0100 (CET)
Received: from localhost ([::1]:54494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6fHi-0006Bm-RZ
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 15:59:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1n6fFD-0003xe-Id
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 15:56:51 -0500
Received: from [2a00:1450:4864:20::135] (port=44949
 helo=mail-lf1-x135.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1n6fFB-0004Ha-8V
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 15:56:51 -0500
Received: by mail-lf1-x135.google.com with SMTP id g26so37414054lfv.11
 for <qemu-devel@nongnu.org>; Sun, 09 Jan 2022 12:56:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SIVsgPr2pVucCiXYaVxhwdkF7wWo1qSsxlMZtQUmVGI=;
 b=DSFc6onMIJCLd3GLBiGAlv9pMO80EhCD7aKgwWuk0nohQ1VSttAjqtW4wf2G56rX/T
 kJ2k143wZZ3EehLD7SEDYo65Y3ZC40PNyjD1Xav5iyyAGpb6d1MRHm3Olh58+ftSt1ss
 lvYRNzjLCXsXWAZMLFGcMMmkEeYLv363XwsIZEflcJKyQo2HxhyvKppoaFqDHKwl3m1k
 v0sXcwcAanhZnuvALLp3aeJ6hITtmNMU2Y9L1aIU/5RGPZKeDdPXcyEvht24p9QaDb0U
 /VV/F5l0fcD0G2fl8WNEle/UMu8NlOKAG6kbPkySiYD4LmPdhZP+8UXK16Nl3Mvsq0+T
 8LeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SIVsgPr2pVucCiXYaVxhwdkF7wWo1qSsxlMZtQUmVGI=;
 b=7gNBGo70u2IIVD3BbbM4l2rvcVwfCwWh446tixnz77ymNusZb4VWXNfAC7yJ2mFIQo
 ZbncZgetIXcTxw+Rjh7sonbWbmTjJSUQe9bsMJik4cR3B9pcFS4Iz0hdDqyzG3LeHR8+
 MfdSwdRe9GHPx5c3MXIInBYGSI0SWMIqxG6j4cvrrzx2LvK4XRP6DJvToQZ4WDqoLYlv
 WiOZHSUrkFR2XbCxIPlFvTV9LZLd11X/cysNpMgau2XSfemlWuVmVnQMXAx7lgfc/XQc
 flxPmkRQ0WeFhJYnJdi5foTivzDUoV+MJ0AOlUBA2hBwy3CO31MxjZa7AMdUiVrySCAr
 rrpQ==
X-Gm-Message-State: AOAM533GrWF+yCtr/YSLDSqCMezOsD/rmEktv7AjAnEdk19xLh6yJAO1
 FvybfkK5ewHSMD3sY4ApmXbSYF4c89FBQanw
X-Google-Smtp-Source: ABdhPJyN9pfNpHHDQOLAfTCATYj+hfq6Aduhq76GU2zSf49688iXXXDvyr3cS5bM/V/n4KqO4YJ2Ww==
X-Received: by 2002:a05:6512:3f7:: with SMTP id
 n23mr3310682lfq.596.1641761803463; 
 Sun, 09 Jan 2022 12:56:43 -0800 (PST)
Received: from ubuntu-focal.. ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id n20sm408526lfu.306.2022.01.09.12.56.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 12:56:43 -0800 (PST)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 1/2] decodetree: Add an optional predicate-function for
 decoding
Date: Sun,  9 Jan 2022 21:56:39 +0100
Message-Id: <20220109205640.4126817-1-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::135
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lf1-x135.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Luis Pires <luis.pires@eldorado.org.br>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Greg Favor <gfavor@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Kito Cheng <kito.cheng@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This adds the possibility to specify a predicate-function that is
called as part of decoding in multi-patterns; it is intended for
use-cases (such as vendor-defined instructions in RISC-V) where the
same bitpattern may decode into different functions depending on the
overall configuration of the emulation target.

At this time, we only support predicates for multi-patterns.

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>

---

 docs/devel/decodetree.rst |  7 ++++++-
 scripts/decodetree.py     | 24 +++++++++++++++++++++---
 2 files changed, 27 insertions(+), 4 deletions(-)

diff --git a/docs/devel/decodetree.rst b/docs/devel/decodetree.rst
index 49ea50c2a7..241aaec8bb 100644
--- a/docs/devel/decodetree.rst
+++ b/docs/devel/decodetree.rst
@@ -144,9 +144,10 @@ Patterns
 Syntax::
 
   pat_def      := identifier ( pat_elt )+
-  pat_elt      := fixedbit_elt | field_elt | field_ref | args_ref | fmt_ref | const_elt
+  pat_elt      := fixedbit_elt | field_elt | field_ref | args_ref | fmt_ref | const_elt | predicate
   fmt_ref      := '@' identifier
   const_elt    := identifier '=' number
+  predicate    := '|' identifier
 
 The *fixedbit_elt* and *field_elt* specifiers are unchanged from formats.
 A pattern that does not specify a named format will have one inferred
@@ -156,6 +157,10 @@ A *const_elt* allows a argument to be set to a constant value.  This may
 come in handy when fields overlap between patterns and one has to
 include the values in the *fixedbit_elt* instead.
 
+A *predicate* allows to specify a predicate function (returing true or
+false) to determine the applicability of the pattern.  Currently, this
+will change the decode-behaviour  for overlapping multi-patterns only.
+
 The decoder will call a translator function for each pattern matched.
 
 Pattern examples::
diff --git a/scripts/decodetree.py b/scripts/decodetree.py
index a03dc6b5e3..7da2282411 100644
--- a/scripts/decodetree.py
+++ b/scripts/decodetree.py
@@ -52,6 +52,7 @@
 re_fld_ident = '%[a-zA-Z0-9_]*'
 re_fmt_ident = '@[a-zA-Z0-9_]*'
 re_pat_ident = '[a-zA-Z0-9_]*'
+re_predicate_ident = '\|[a-zA-Z_][a-zA-Z0-9_]*'
 
 def error_with_file(file, lineno, *args):
     """Print an error message from file:line and args and exit."""
@@ -119,6 +120,14 @@ def whexC(val):
         suffix = 'u'
     return whex(val) + suffix
 
+def predicate(val):
+    """Return a string for calling a predicate function
+       (if specified, accepting 'None' as an indication
+       that no predicate is to be emitted) with the ctx
+       as a parameter."""
+    if (val == None):
+        return ''
+    return ' && ' + val + '(ctx)'
 
 def str_match_bits(bits, mask):
     """Return a string pretty-printing BITS/MASK"""
@@ -340,7 +349,7 @@ def output_def(self):
 
 class General:
     """Common code between instruction formats and instruction patterns"""
-    def __init__(self, name, lineno, base, fixb, fixm, udfm, fldm, flds, w):
+    def __init__(self, name, lineno, base, fixb, fixm, udfm, fldm, flds, w, p = None):
         self.name = name
         self.file = input_file
         self.lineno = lineno
@@ -351,6 +360,7 @@ def __init__(self, name, lineno, base, fixb, fixm, udfm, fldm, flds, w):
         self.fieldmask = fldm
         self.fields = flds
         self.width = w
+        self.predicate = p
 
     def __str__(self):
         return self.name + ' ' + str_match_bits(self.fixedbits, self.fixedmask)
@@ -499,7 +509,7 @@ def output_code(self, i, extracted, outerbits, outermask):
             if outermask != p.fixedmask:
                 innermask = p.fixedmask & ~outermask
                 innerbits = p.fixedbits & ~outermask
-                output(ind, f'if ((insn & {whexC(innermask)}) == {whexC(innerbits)}) {{\n')
+                output(ind, f'if ((insn & {whexC(innermask)}) == {whexC(innerbits)}{predicate(p.predicate)}) {{\n')
                 output(ind, f'    /* {str_match_bits(p.fixedbits, p.fixedmask)} */\n')
                 p.output_code(i + 4, extracted, p.fixedbits, p.fixedmask)
                 output(ind, '}\n')
@@ -826,6 +836,7 @@ def parse_generic(lineno, parent_pat, name, toks):
     global re_fld_ident
     global re_fmt_ident
     global re_C_ident
+    global re_predicate_ident
     global insnwidth
     global insnmask
     global variablewidth
@@ -839,6 +850,7 @@ def parse_generic(lineno, parent_pat, name, toks):
     flds = {}
     arg = None
     fmt = None
+    predicate = None
     for t in toks:
         # '&Foo' gives a format an explicit argument set.
         if re.fullmatch(re_arg_ident, t):
@@ -881,6 +893,12 @@ def parse_generic(lineno, parent_pat, name, toks):
             flds = add_field(lineno, flds, fname, ConstField(value))
             continue
 
+        # '|predicate' sets a predicate function to be called.
+        if re.fullmatch(re_predicate_ident, t):
+            tt = t[1:]
+            predicate = tt;
+            continue
+
         # Pattern of 0s, 1s, dots and dashes indicate required zeros,
         # required ones, or dont-cares.
         if re.fullmatch('[01.-]+', t):
@@ -979,7 +997,7 @@ def parse_generic(lineno, parent_pat, name, toks):
             if f not in flds.keys() and f not in fmt.fields.keys():
                 error(lineno, f'field {f} not initialized')
         pat = Pattern(name, lineno, fmt, fixedbits, fixedmask,
-                      undefmask, fieldmask, flds, width)
+                      undefmask, fieldmask, flds, width, predicate)
         parent_pat.pats.append(pat)
         allpatterns.append(pat)
 
-- 
2.33.1



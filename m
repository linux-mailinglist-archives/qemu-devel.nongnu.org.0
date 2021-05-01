Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC5C3708BE
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 21:17:23 +0200 (CEST)
Received: from localhost ([::1]:47930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcv7C-0006DG-Qn
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 15:17:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcui3-0006Tq-Lk
 for qemu-devel@nongnu.org; Sat, 01 May 2021 14:51:24 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:42986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcui0-0003lI-Ds
 for qemu-devel@nongnu.org; Sat, 01 May 2021 14:51:23 -0400
Received: by mail-pl1-x633.google.com with SMTP id v13so671130ple.9
 for <qemu-devel@nongnu.org>; Sat, 01 May 2021 11:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cDkTlWjDspe7eeKU7hYAA5ZhW5FnQSaWorntDqhx4CU=;
 b=ADrejI6v+/LH78RZi+37vKZoI4xdjFwPpXiijvuMPxPYr0TvArxci/aY5P45JkNjnA
 rSB9RCi6GV3TnxliGwWb8CKTFDiNDIa59mxnA53K/agWc6w5jPPZZEb2mwmYci8Neaxv
 1sFCOhwa9f5XW81qTyw66mqvXEsVZGowRQbQkeMMmCHJwnjT2iZ09/TtyB82kqzpUr0G
 5R+6BSuIU/9iqN7/HC3RwWuRZjT+KVyNA3Esuzi6F0Xowi5uLv3dFlY6Ksy9As2Yy0xg
 vEwknsn1zGvlEA3wfXac1Vo/3QtxZwG1bs+pjc5AD5KSnugvfwA5vVGMUILzkwD413HO
 49qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cDkTlWjDspe7eeKU7hYAA5ZhW5FnQSaWorntDqhx4CU=;
 b=LbOjpFxnnAmzAwIAqkar9gTvZGuFycMMq7Me51ec3Gdf8GN3PxoCztjtAohkxrLtSB
 p6TSXo0MbXSAFNizgcXNDEqs11pDsuRiEjEFcR4RtU0P0ulfEj4JbX8nQIWQ5yg8/piM
 mHN/WXTFZU+7XVeuXi3NA07hNN0lA30bhWzUAmFINoMQejDBXo1eQsrl/OcaPdDHD3hu
 4C5vn4AuIrRbgiUNNrM+4ucwT4qA4WhrgdfZH1a4J8lC2Rz7AJovNwcMSl2ug9xX+uBK
 JvfhPnVhAfPI0J4/GhZmiyeq6hGsShEZsefcH/dbb9By0abFFzK4Oh/28NWyknfDpc+7
 iZLg==
X-Gm-Message-State: AOAM530m9os3/9lLILbFHX0YuKP8+dSYW3/KrL/pSx6eXKB/hEG7Fmwr
 yKLDphCnLrL591XjYZc0WQ8BNL885vQ5WQ==
X-Google-Smtp-Source: ABdhPJwkXmEvRteLKlqnjCj8xjljJOLN+qwtY2Rb+hxgRQyXGGVkyVEjm/L2QFttsYaNyhVOFLc5sg==
X-Received: by 2002:a17:90a:cc0b:: with SMTP id
 b11mr12026989pju.190.1619895078822; 
 Sat, 01 May 2021 11:51:18 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id k17sm4971360pfa.68.2021.05.01.11.51.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 May 2021 11:51:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 2/5] decodetree: Introduce whex and whexC helpers
Date: Sat,  1 May 2021 11:51:13 -0700
Message-Id: <20210501185116.1338875-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210501185116.1338875-1-richard.henderson@linaro.org>
References: <20210501185116.1338875-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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

Form a hex constant of the appropriate insnwidth.
Begin using f-strings on changed lines.

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 scripts/decodetree.py | 66 +++++++++++++++++++++++++------------------
 1 file changed, 38 insertions(+), 28 deletions(-)

diff --git a/scripts/decodetree.py b/scripts/decodetree.py
index 4637b633e7..0861e5d503 100644
--- a/scripts/decodetree.py
+++ b/scripts/decodetree.py
@@ -102,6 +102,21 @@ def str_fields(fields):
     return r[1:]
 
 
+def whex(val):
+    """Return a hex string for val padded for insnwidth"""
+    global insnwidth
+    return f'0x{val:0{insnwidth // 4}x}'
+
+
+def whexC(val):
+    """Return a hex string for val padded for insnwidth,
+       and with the proper suffix for a C constant."""
+    suffix = ''
+    if val >= 0x80000000:
+        suffix = 'u'
+    return whex(val) + suffix
+
+
 def str_match_bits(bits, mask):
     """Return a string pretty-printing BITS/MASK"""
     global insnwidth
@@ -477,11 +492,8 @@ def output_code(self, i, extracted, outerbits, outermask):
             if outermask != p.fixedmask:
                 innermask = p.fixedmask & ~outermask
                 innerbits = p.fixedbits & ~outermask
-                output(ind, 'if ((insn & ',
-                       '0x{0:08x}) == 0x{1:08x}'.format(innermask, innerbits),
-                       ') {\n')
-                output(ind, '    /* ',
-                       str_match_bits(p.fixedbits, p.fixedmask), ' */\n')
+                output(ind, f'if ((insn & {whexC(innermask)}) == {whexC(innerbits)}) {{\n')
+                output(ind, f'    /* {str_match_bits(p.fixedbits, p.fixedmask)} */\n')
                 p.output_code(i + 4, extracted, p.fixedbits, p.fixedmask)
                 output(ind, '}\n')
             else:
@@ -500,12 +512,12 @@ def __init__(self, fm, tm):
 
     def str1(self, i):
         ind = str_indent(i)
-        r = '{0}{1:08x}'.format(ind, self.fixedmask)
+        r = ind + whex(self.fixedmask)
         if self.format:
             r += ' ' + self.format.name
         r += ' [\n'
         for (b, s) in self.subs:
-            r += '{0}  {1:08x}:\n'.format(ind, b)
+            r += ind + f'  {whex(b)}:\n'
             r += s.str1(i + 4) + '\n'
         r += ind + ']'
         return r
@@ -529,16 +541,16 @@ def output_code(self, i, extracted, outerbits, outermask):
         if sh > 0:
             # Propagate SH down into the local functions.
             def str_switch(b, sh=sh):
-                return '(insn >> {0}) & 0x{1:x}'.format(sh, b >> sh)
+                return f'(insn >> {sh}) & {b >> sh:#x}'
 
             def str_case(b, sh=sh):
-                return '0x{0:x}'.format(b >> sh)
+                return hex(b >> sh)
         else:
             def str_switch(b):
-                return 'insn & 0x{0:08x}'.format(b)
+                return f'insn & {whexC(b)}'
 
             def str_case(b):
-                return '0x{0:08x}'.format(b)
+                return whexC(b)
 
         output(ind, 'switch (', str_switch(self.thismask), ') {\n')
         for b, s in sorted(self.subs):
@@ -962,19 +974,19 @@ def parse_generic(lineno, parent_pat, name, toks):
 
     # Validate the masks that we have assembled.
     if fieldmask & fixedmask:
-        error(lineno, 'fieldmask overlaps fixedmask (0x{0:08x} & 0x{1:08x})'
-                      .format(fieldmask, fixedmask))
+        error(lineno, 'fieldmask overlaps fixedmask ',
+              f'({whex(fieldmask)} & {whex(fixedmask)})')
     if fieldmask & undefmask:
-        error(lineno, 'fieldmask overlaps undefmask (0x{0:08x} & 0x{1:08x})'
-                      .format(fieldmask, undefmask))
+        error(lineno, 'fieldmask overlaps undefmask ',
+              f'({whex(fieldmask)} & {whex(undefmask)})')
     if fixedmask & undefmask:
-        error(lineno, 'fixedmask overlaps undefmask (0x{0:08x} & 0x{1:08x})'
-                      .format(fixedmask, undefmask))
+        error(lineno, 'fixedmask overlaps undefmask ',
+              f'({whex(fixedmask)} & {whex(undefmask)})')
     if not is_format:
         allbits = fieldmask | fixedmask | undefmask
         if allbits != insnmask:
-            error(lineno, 'bits left unspecified (0x{0:08x})'
-                          .format(allbits ^ insnmask))
+            error(lineno, 'bits left unspecified ',
+                  f'({whex(allbits ^ insnmask)})')
 # end parse_general
 
 
@@ -1104,10 +1116,9 @@ def __init__(self, m, w):
 
     def str1(self, i):
         ind = str_indent(i)
-        r = '{0}{1:08x}'.format(ind, self.mask)
-        r += ' [\n'
+        r = ind + whex(self.mask) + ' [\n'
         for (b, s) in self.subs:
-            r += '{0}  {1:08x}:\n'.format(ind, b)
+            r += ind + f'  {whex(b)}:\n'
             r += s.str1(i + 4) + '\n'
         r += ind + ']'
         return r
@@ -1131,16 +1142,16 @@ def output_code(self, i, extracted, outerbits, outermask):
         if sh > 0:
             # Propagate SH down into the local functions.
             def str_switch(b, sh=sh):
-                return '(insn >> {0}) & 0x{1:x}'.format(sh, b >> sh)
+                return f'(insn >> {sh}) & {b >> sh:#x}'
 
             def str_case(b, sh=sh):
-                return '0x{0:x}'.format(b >> sh)
+                return hex(b >> sh)
         else:
             def str_switch(b):
-                return 'insn & 0x{0:08x}'.format(b)
+                return f'insn & {whexC(b)}'
 
             def str_case(b):
-                return '0x{0:08x}'.format(b)
+                return whexC(b)
 
         output(ind, 'switch (', str_switch(self.mask), ') {\n')
         for b, s in sorted(self.subs):
@@ -1162,8 +1173,7 @@ def __init__(self, m, w):
         self.width = w
 
     def str1(self, i):
-        ind = str_indent(i)
-        return '{0}{1:08x}'.format(ind, self.mask)
+        return str_indent(i) + whex(self.mask)
 
     def __str__(self):
         return self.str1(0)
-- 
2.25.1



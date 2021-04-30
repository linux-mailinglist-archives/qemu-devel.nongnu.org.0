Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 847A936F36D
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 03:18:27 +0200 (CEST)
Received: from localhost ([::1]:37550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcHnW-00057m-IA
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 21:18:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcHlB-0002kL-FL
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 21:16:01 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:36472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcHky-0007TD-20
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 21:16:01 -0400
Received: by mail-pg1-x532.google.com with SMTP id j7so38953057pgi.3
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 18:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lUjIcZ7tDPA2pVLJ4XGtPvwfZ6yYWNyletjpFzr8LcY=;
 b=bHd7WOgF8e3a/qYhevor+lNwrYd6d4mRLm+nj7jY8y68/zbWVnp6l6KDbUCB0H/865
 jZscwS+vO6PnDIsQiv0jBtpPF6QSlB30cJq/sQ4HQdFYy+fRpJwK342D4hfse5MgNQrZ
 nSpyGuhcWB2Js6UjqnQ3oTyx3WaonhVYczxh2hrnv4tf7sAlNxahYVmvzbH9UUBZK2BR
 CdAutvYQwPi/Qy2fuYC4Qjy/8t+C5UeocmmMkolN3m1icz1Lq4QyyYofE7zx9uL+Qf2W
 O2HQmDHYVsU2B3O/kevAfR0X75vkVqm0CmlHo1mPpDqJUOLCfLHinCgr6E5ZYBg1XLvT
 S1fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lUjIcZ7tDPA2pVLJ4XGtPvwfZ6yYWNyletjpFzr8LcY=;
 b=SGShHWVabup2/iFckDxILte//ZeEgbw/TzVjfPpYc2tSKnTe75tfEsRAdRaLeG+1I+
 G3aQycMlzISAbfdpt67LDMJOuBP7IwJryMee1e3EvNz5MfIzurxlTsfUWqD+QumEdECO
 +5KYlPR8qAUJP3/8O/tetzKTLSd2SNocS5NV2EAweGlhJcgvblJYUyblI6R/1ECAbB4Y
 fwh+2bUL6VSjjLIBYzdNEIwJNwOiVjCyomI3zXf/WwmZwc36yJ0mHxYjuDHrxW+aENz+
 0cm1207SKF0HYRGgYWG5KROup1YM+uxmiYdqiqxKkVAZEYBJ0yK6yEW6US4FvXbSY3O2
 KIKQ==
X-Gm-Message-State: AOAM533FeshQIgOpLVcCGFK/Q12ME0jOTYkbDRR+mPQj5JFzOyonYhQN
 NeqGnR7huwIr1qZGMnylFaI4Y0aUSKUM2g==
X-Google-Smtp-Source: ABdhPJx0wIKMjbDC4ZU3+xLFkq9xOc+ubl2J8sof5GDtSmZJYaos9V9uTRu7sjnSqW3YzKnDQjeX3w==
X-Received: by 2002:a62:dd50:0:b029:27a:69c8:55b6 with SMTP id
 w77-20020a62dd500000b029027a69c855b6mr2451954pff.6.1619745345439; 
 Thu, 29 Apr 2021 18:15:45 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id 1sm161277pjx.46.2021.04.29.18.15.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 18:15:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 01/30] decodetree: Introduce whex and whexC helpers
Date: Thu, 29 Apr 2021 18:15:14 -0700
Message-Id: <20210430011543.1017113-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430011543.1017113-1-richard.henderson@linaro.org>
References: <20210430011543.1017113-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Form a hex constant of the appropriate insnwidth.
Begin using f-strings on changed lines.

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



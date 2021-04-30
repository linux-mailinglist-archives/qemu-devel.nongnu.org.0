Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C75236F3A0
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 03:27:49 +0200 (CEST)
Received: from localhost ([::1]:57534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcHwa-000582-Mv
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 21:27:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcHlF-0002r1-Dr
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 21:16:05 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:45844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcHkz-0007UG-KI
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 21:16:04 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 gc22-20020a17090b3116b02901558435aec1so881250pjb.4
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 18:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F3do9fOW6bZifHO74UJfwOcPcNtNFJadWBeu2w1t6Fk=;
 b=whQKnCJ9oeFcUmkkYtcBfXvPn8GQ3+Va1bKg8tYs7FE8U8eY5P+BEdOH7SBDIazLGn
 bkDVQXBPnLQg7Uhc7NL7WYsB7RBroAfaZVVUEa3SwWPd5zWH73FK2WaCEGcL+0Rjb8se
 +XBKlTPrPAnJsjnWvpcjRp14ANEV/C9Pzbn7aQ/ZA19EYIPO5BRP920COQ15gkU5duhd
 Gq6AkJcO9sEMliHdLjCnlBQ909Ev7MeS2JuF2lLkXgqNNYVmIU0BSgEWeC6qYuOZpdoM
 nGbUlU8pn4t361lLUIK2fOLW+0yWQAlCcuazbyXjEPsP17+gHsN0rWL2WbEqY5d8jz2Q
 PGlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F3do9fOW6bZifHO74UJfwOcPcNtNFJadWBeu2w1t6Fk=;
 b=LEq9234jtV+am4bfOVYRiWl73bSiKyPZTzhvZZa9BwGo3qLWoWug09oVUWgoIAh2rw
 Sd63d/WRhgan4P9G8w3dijtsCnRA3CWUXF7clE1Q2dtGOyyNK7W9dbZ7q6wf3RcYiGm9
 XQlHxfVbPM59RBL0esYSfw0yW2s/f9U4gwIBiBxqRQXHLa9lRhiNOP5jNFAklEFPZvjx
 YGYidNtdAQFCURmi4aIuwt1dTLFmQNs9Xa6U0UuVsZQi8FLflTVJY/QinL0pRAXq3ZPc
 jHrxwYQGv3bN7PXApbbImcyaD8I10nTlco5RcGYs+V38flm8HtbiwWJXMciBCJdSuy7q
 jFQQ==
X-Gm-Message-State: AOAM533cAgx8BNTGktwng9rxJDPKl6xBu1ezCORmZc25ginI+S/q1lPc
 +a+qLoK/39cR0AmoriROf0PzZIEr2fPi+Q==
X-Google-Smtp-Source: ABdhPJzUWxFsYW0bh7KlM8hX50eyDR/QXukEXy/j6gOOPIDXllB1+7ReFNRdTCDaWhxfP6gSTYd1WA==
X-Received: by 2002:a17:902:b406:b029:ec:fbf2:4114 with SMTP id
 x6-20020a170902b406b02900ecfbf24114mr2611906plr.32.1619745346061; 
 Thu, 29 Apr 2021 18:15:46 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id 1sm161277pjx.46.2021.04.29.18.15.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 18:15:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 02/30] decodetree: More use of f-strings
Date: Thu, 29 Apr 2021 18:15:15 -0700
Message-Id: <20210430011543.1017113-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430011543.1017113-1-richard.henderson@linaro.org>
References: <20210430011543.1017113-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 scripts/decodetree.py | 50 ++++++++++++++++++++-----------------------
 1 file changed, 23 insertions(+), 27 deletions(-)

diff --git a/scripts/decodetree.py b/scripts/decodetree.py
index 0861e5d503..d5da101167 100644
--- a/scripts/decodetree.py
+++ b/scripts/decodetree.py
@@ -59,9 +59,9 @@ def error_with_file(file, lineno, *args):
 
     prefix = ''
     if file:
-        prefix += '{0}:'.format(file)
+        prefix += f'{file}:'
     if lineno:
-        prefix += '{0}:'.format(lineno)
+        prefix += f'{lineno}:'
     if prefix:
         prefix += ' '
     print(prefix, end='error: ', file=sys.stderr)
@@ -203,7 +203,7 @@ def str_extract(self):
             extr = 'sextract32'
         else:
             extr = 'extract32'
-        return '{0}(insn, {1}, {2})'.format(extr, self.pos, self.len)
+        return f'{extr}(insn, {self.pos}, {self.len})'
 
     def __eq__(self, other):
         return self.sign == other.sign and self.mask == other.mask
@@ -227,11 +227,11 @@ def str_extract(self):
         ret = '0'
         pos = 0
         for f in reversed(self.subs):
+            ext = f.str_extract()
             if pos == 0:
-                ret = f.str_extract()
+                ret = ext
             else:
-                ret = 'deposit32({0}, {1}, {2}, {3})' \
-                      .format(ret, pos, 32 - pos, f.str_extract())
+                ret = f'deposit32({ret}, {pos}, {32 - pos}, {ext})'
             pos += f.len
         return ret
 
@@ -675,11 +675,11 @@ def parse_field(lineno, name, toks):
             subtoks = t.split(':')
             sign = False
         else:
-            error(lineno, 'invalid field token "{0}"'.format(t))
+            error(lineno, f'invalid field token "{t}"')
         po = int(subtoks[0])
         le = int(subtoks[1])
         if po + le > insnwidth:
-            error(lineno, 'field {0} too large'.format(t))
+            error(lineno, f'field {t} too large')
         f = Field(sign, po, le)
         subs.append(f)
         width += le
@@ -724,9 +724,9 @@ def parse_arguments(lineno, name, toks):
             anyextern = True
             continue
         if not re.fullmatch(re_C_ident, t):
-            error(lineno, 'invalid argument set token "{0}"'.format(t))
+            error(lineno, f'invalid argument set token "{t}"')
         if t in flds:
-            error(lineno, 'duplicate argument "{0}"'.format(t))
+            error(lineno, f'duplicate argument "{t}"')
         flds.append(t)
 
     if name in arguments:
@@ -895,14 +895,14 @@ def parse_generic(lineno, parent_pat, name, toks):
                 flen = flen[1:]
             shift = int(flen, 10)
             if shift + width > insnwidth:
-                error(lineno, 'field {0} exceeds insnwidth'.format(fname))
+                error(lineno, f'field {fname} exceeds insnwidth')
             f = Field(sign, insnwidth - width - shift, shift)
             flds = add_field(lineno, flds, fname, f)
             fixedbits <<= shift
             fixedmask <<= shift
             undefmask <<= shift
         else:
-            error(lineno, 'invalid token "{0}"'.format(t))
+            error(lineno, f'invalid token "{t}"')
         width += shift
 
     if variablewidth and width < insnwidth and width % 8 == 0:
@@ -914,7 +914,7 @@ def parse_generic(lineno, parent_pat, name, toks):
 
     # We should have filled in all of the bits of the instruction.
     elif not (is_format and width == 0) and width != insnwidth:
-        error(lineno, 'definition has {0} bits'.format(width))
+        error(lineno, f'definition has {width} bits')
 
     # Do not check for fields overlapping fields; one valid usage
     # is to be able to duplicate fields via import.
@@ -932,8 +932,7 @@ def parse_generic(lineno, parent_pat, name, toks):
         if arg:
             for f in flds.keys():
                 if f not in arg.fields:
-                    error(lineno, 'field {0} not in argument set {1}'
-                                  .format(f, arg.name))
+                    error(lineno, f'field {f} not in argument set {arg.name}')
         else:
             arg = infer_argument_set(flds)
         if name in formats:
@@ -960,13 +959,12 @@ def parse_generic(lineno, parent_pat, name, toks):
         arg = fmt.base
         for f in flds.keys():
             if f not in arg.fields:
-                error(lineno, 'field {0} not in argument set {1}'
-                              .format(f, arg.name))
+                error(lineno, f'field {f} not in argument set {arg.name}')
             if f in fmt.fields.keys():
-                error(lineno, 'field {0} set by format and pattern'.format(f))
+                error(lineno, f'field {f} set by format and pattern')
         for f in arg.fields:
             if f not in flds.keys() and f not in fmt.fields.keys():
-                error(lineno, 'field {0} not initialized'.format(f))
+                error(lineno, f'field {f} not initialized')
         pat = Pattern(name, lineno, fmt, fixedbits, fixedmask,
                       undefmask, fieldmask, flds, width)
         parent_pat.pats.append(pat)
@@ -1097,7 +1095,7 @@ def parse_file(f, parent_pat):
         elif re.fullmatch(re_pat_ident, name):
             parse_generic(start_lineno, parent_pat, name, toks)
         else:
-            error(lineno, 'invalid token "{0}"'.format(name))
+            error(lineno, f'invalid token "{name}"')
         toks = []
 
     if nesting != 0:
@@ -1131,9 +1129,8 @@ def output_code(self, i, extracted, outerbits, outermask):
 
         # If we need to load more bytes to test, do so now.
         if extracted < self.width:
-            output(ind, 'insn = ', decode_function,
-                   '_load_bytes(ctx, insn, {0}, {1});\n'
-                   .format(extracted // 8, self.width // 8));
+            output(ind, f'insn = {decode_function}_load_bytes',
+                   f'(ctx, insn, {extracted // 8}, {self.width // 8});\n')
             extracted = self.width
 
         # Attempt to aid the compiler in producing compact switch statements.
@@ -1184,9 +1181,8 @@ def output_code(self, i, extracted, outerbits, outermask):
 
         # If we need to load more bytes, do so now.
         if extracted < self.width:
-            output(ind, 'insn = ', decode_function,
-                   '_load_bytes(ctx, insn, {0}, {1});\n'
-                   .format(extracted // 8, self.width // 8));
+            output(ind, f'insn = {decode_function}_load_bytes',
+                   f'(ctx, insn, {extracted // 8}, {self.width // 8});\n')
             extracted = self.width
         output(ind, 'return insn;\n')
 # end SizeLeaf
@@ -1220,7 +1216,7 @@ def build_size_tree(pats, width, outerbits, outermask):
         for p in pats:
             pnames.append(p.name + ':' + p.file + ':' + str(p.lineno))
         error_with_file(pats[0].file, pats[0].lineno,
-                        'overlapping patterns size {0}:'.format(width), pnames)
+                        f'overlapping patterns size {width}:', pnames)
 
     bins = {}
     for i in pats:
-- 
2.25.1



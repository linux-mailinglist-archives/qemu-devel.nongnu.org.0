Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FED36F373
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 03:22:37 +0200 (CEST)
Received: from localhost ([::1]:46758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcHrY-0000Su-1y
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 21:22:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcHlD-0002mK-3I
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 21:16:03 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:38901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcHky-0007U5-20
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 21:16:02 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 f11-20020a17090a638bb02901524d3a3d48so827974pjj.3
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 18:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XDA7d3QjWWFtV2qtFhcmd5DNvHMTMh2+SFPB7dy5cBY=;
 b=AEFId7+IGe3+y2uGgLt5bTbhVM3Tfl47D6lroUbNEdXDn8eFyGEXo84Dv+a6Dx64BO
 lh8o0H4blkdQXVS4oY9OBIPedzHhPl0cUwiIcM+DncBNQCXgDMapgoIfme5Ju7BoYitk
 AR/TTUFLPttsjCt0ntp784jDCsSIbU++vM80w5f4IdSyU4C/TPw0lctlLY2dpgxbq3+B
 QWPoyvpIz7NqtVjiezVu+NQtq4DIWZcldOI/hFp+L3CINxZ9wDjJqk2atHwzJew4gk36
 boghk08zoqR+iW1aotluHIJ5G3YQ4oDqiJ8ub8VBtKCJhTyg/dHXOL5aE8lJSH7QEokq
 EjLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XDA7d3QjWWFtV2qtFhcmd5DNvHMTMh2+SFPB7dy5cBY=;
 b=GHKAAJfihA3JH+SkJl3yYUMHmSkT2qBqxm6D2M5X2BOIY4hlCAiD4+elxIutbaDTYG
 rBI7oJtlXO1DmjiHl133qU8CnXMRVSRaBBY7aPJvOaLETEW3no2ulIdh+jFLCLiBPhkK
 frSwW8o44u56po0jbd69j6NwhEZxIheMVcPe3y+nIS0SkuV5VKTto1E15bGMvTBzZHlD
 sYbd1gCfDZHuVLKAiw1MK9zLQsEvqolOkUSB0Pz0tksxdxeXVU5lWgat2iHrfwfbcvZN
 yQhHiK4iB/qm6y/2irZiBEw6dpT3TNXO9JEH7hNBH1Yc4dIuLszq5lg/ieK+AjdNcPor
 f1Lg==
X-Gm-Message-State: AOAM533qHyLQUrUnUn1VDjvn32G5W7t0Zq9wDzooswRyQCpBYUN2TqAr
 5kKYBEu2IEhXG9MD4agCGLdBtDfU8IiF7Q==
X-Google-Smtp-Source: ABdhPJzVWj195awrtpIEdyH5GtefpchxUuET5R+QXuuGUez+aRAX4uwxUllNp4CoTOWcMRZyd2GN+w==
X-Received: by 2002:a17:90b:4a4e:: with SMTP id
 lb14mr11979641pjb.115.1619745346670; 
 Thu, 29 Apr 2021 18:15:46 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id 1sm161277pjx.46.2021.04.29.18.15.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 18:15:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 03/30] decodetree: Add support for 64-bit instructions
Date: Thu, 29 Apr 2021 18:15:16 -0700
Message-Id: <20210430011543.1017113-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430011543.1017113-1-richard.henderson@linaro.org>
References: <20210430011543.1017113-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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

From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>

Allow '64' to be specified for the instruction width command line params
and use the appropriate extract and deposit functions in that case.

This will be used to implement the new 64-bit Power ISA 3.1 instructions.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
Message-Id: <CP2PR80MB3668E123E2EFDB0ACD3A46F1DA759@CP2PR80MB3668.lamprd80.prod.outlook.com>
[rth: Drop the change to the field type; use bitop_width instead of separate
variables for extract/deposit; use "ull" for 64-bit constants.]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 scripts/decodetree.py | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/scripts/decodetree.py b/scripts/decodetree.py
index d5da101167..f85da45ee3 100644
--- a/scripts/decodetree.py
+++ b/scripts/decodetree.py
@@ -27,6 +27,7 @@
 import getopt
 
 insnwidth = 32
+bitop_width = 32
 insnmask = 0xffffffff
 variablewidth = False
 fields = {}
@@ -112,7 +113,9 @@ def whexC(val):
     """Return a hex string for val padded for insnwidth,
        and with the proper suffix for a C constant."""
     suffix = ''
-    if val >= 0x80000000:
+    if val >= 0x100000000:
+        suffix = 'ull'
+    elif val >= 0x80000000:
         suffix = 'u'
     return whex(val) + suffix
 
@@ -199,11 +202,9 @@ def __str__(self):
         return str(self.pos) + ':' + s + str(self.len)
 
     def str_extract(self):
-        if self.sign:
-            extr = 'sextract32'
-        else:
-            extr = 'extract32'
-        return f'{extr}(insn, {self.pos}, {self.len})'
+        global bitop_width
+        s = 's' if self.sign else ''
+        return f'{s}extract{bitop_width}(insn, {self.pos}, {self.len})'
 
     def __eq__(self, other):
         return self.sign == other.sign and self.mask == other.mask
@@ -224,6 +225,7 @@ def __str__(self):
         return str(self.subs)
 
     def str_extract(self):
+        global bitop_width
         ret = '0'
         pos = 0
         for f in reversed(self.subs):
@@ -231,7 +233,7 @@ def str_extract(self):
             if pos == 0:
                 ret = ext
             else:
-                ret = f'deposit32({ret}, {pos}, {32 - pos}, {ext})'
+                ret = f'deposit{bitop_width}({ret}, {pos}, {bitop_width - pos}, {ext})'
             pos += f.len
         return ret
 
@@ -1270,6 +1272,7 @@ def main():
     global insntype
     global insnmask
     global decode_function
+    global bitop_width
     global variablewidth
     global anyextern
 
@@ -1299,6 +1302,10 @@ def main():
             if insnwidth == 16:
                 insntype = 'uint16_t'
                 insnmask = 0xffff
+            elif insnwidth == 64:
+                insntype = 'uint64_t'
+                insnmask = 0xffffffffffffffff
+                bitop_width = 64
             elif insnwidth != 32:
                 error(0, 'cannot handle insns of width', insnwidth)
         else:
-- 
2.25.1



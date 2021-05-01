Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1003708C6
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 21:24:29 +0200 (CEST)
Received: from localhost ([::1]:37546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcvE5-00054j-0f
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 15:24:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcui6-0006Wx-Jb
 for qemu-devel@nongnu.org; Sat, 01 May 2021 14:51:27 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:39726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcui1-0003m7-Gu
 for qemu-devel@nongnu.org; Sat, 01 May 2021 14:51:26 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 z6-20020a17090a1706b0290155e8a752d8so3452664pjd.4
 for <qemu-devel@nongnu.org>; Sat, 01 May 2021 11:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cUnlPrvK75q4XSJyyRAV3mEtaJHVxQptn5uL4uV7YhQ=;
 b=MXhKWAJv6ScpVXCZUwqOpLDSMRt0VxxPRuL1iGTYbjf+y4D+O2KkzaI77J+4xzAWgy
 0oy4+wmTKEqZIefKkJxUIqcppol69Vs8I9rtUca3wl65H04+oVzjNt/Ym2BQ6b7FHvMi
 czYJAI2DF6Q/Aa2DjeRn3qcoi3PM4rtuY1Er+hUb2It67fNx7A2IOEd2lpagN4VI94nG
 M1LeZhsw0ZvpMnYZKBEgnD/D97pj8LXo8xpm5zVssgUTfFmyRJa8M2aUAXxSNwldJ+xK
 D62C2jpeZHFT+BVXw5VfI3nVvssc1Rq1miUgcwzcXOwYlAUWD3aD+YfStv3yHfiy0kce
 zC7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cUnlPrvK75q4XSJyyRAV3mEtaJHVxQptn5uL4uV7YhQ=;
 b=SjJMkWh8jDhPf/aebC7NDiNNeL9tH4vcijsFnQO5AvOB0RZ8aH2ZXC5BLrxZbLxV8t
 z2oBe8iFmbLTfaTjGbYGFtcCv3eDeGi+ZCy0xiIMb+Mu9oF+SLbi4d+Niqw2StBIIYrK
 jp2IJayjZHVAuBEOrQZHxhu2gL6kaVyjEPYC3bveV6JU9vqhUVH6bGNtquwshuLl2Tkg
 A6zs40oeXlGi/iuvy10qtLhR2c4iqiBwwXqus3bJeykhshmMvaPhGHlrtdu0MtlW8aFi
 Wn4sS7RWdn0wggV86DAHaEkFE62D8d2+yU4XNMobrp2+Qfa0zGAEuX2se/fRR7d3j1VY
 FEug==
X-Gm-Message-State: AOAM530FaDSuAT9jZ3EzjPLvoA/fdxAHuWmCB3IWWjU7G1FxrDhBVrZt
 /qvRDgFfPITOZyv+rJNfuIFX2B091aXC9A==
X-Google-Smtp-Source: ABdhPJwnj8MSQ+9PHUkPmPxdm2CnwQphwerow8iENYUUOjkzsORLKqCG8spYMca04DNgJmAFFvTw2w==
X-Received: by 2002:a17:90a:a4c7:: with SMTP id
 l7mr11726643pjw.147.1619895080274; 
 Sat, 01 May 2021 11:51:20 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id k17sm4971360pfa.68.2021.05.01.11.51.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 May 2021 11:51:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 4/5] decodetree: Add support for 64-bit instructions
Date: Sat,  1 May 2021 11:51:15 -0700
Message-Id: <20210501185116.1338875-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210501185116.1338875-1-richard.henderson@linaro.org>
References: <20210501185116.1338875-1-richard.henderson@linaro.org>
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
Cc: peter.maydell@linaro.org,
 Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
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
Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
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



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6D95BD43A
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 19:55:35 +0200 (CEST)
Received: from localhost ([::1]:47350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaKzW-0001AT-Hf
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 13:55:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oaKg6-0003IW-85
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 13:35:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oaKfs-00035u-8c
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 13:35:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663608915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=60ZCEpPNxCwMjWmNStrObBA/6q5Os6NikAkMLpEdLr4=;
 b=EdQ/vjo3gYjPNCNSrYg8oJqt/ewHb18JaWLG0/SNI3nQdbXJhVDTLtqJsoVEURwi05rqav
 E/EEXTPlPIbQCFHJlSWD9CDAQoFI5e9KJHJe6WwkFHTc/dx5+y/gDJ4UXu5S/RZYLmmupj
 tv3nhOjfYFvtstB33kR3LS5ml1WQOos=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-147-rL_fqVsMMqOtI9KQa1Gk_Q-1; Mon, 19 Sep 2022 13:35:14 -0400
X-MC-Unique: rL_fqVsMMqOtI9KQa1Gk_Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 5-20020a05600c028500b003b4d2247d3eso1416506wmk.0
 for <qemu-devel@nongnu.org>; Mon, 19 Sep 2022 10:35:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=60ZCEpPNxCwMjWmNStrObBA/6q5Os6NikAkMLpEdLr4=;
 b=fXhYrCNKGMmLDm8FzGSDtJyZHWvff/txWKMyiwMPnbR6RRfAXOXNCTns8shzl2ZYW3
 32clXxmD1R9F5k9ylEk/AKj4tESGoK1gLRd24CASZ1FuH04UC3dWCuBfN+CTrvwrGU/1
 Bo3Z5GupsId/ZZxjwg0of02gBgFDR3dIw1e+ZPxwyWwkHcrna2U8dV8WM2Z2UPGCp9xh
 IGzLrhdf0M/g5n401INyRY1eS9wUO0yu8dcCwV0mi++N5NLjqCPGRYhSNyQ753d26eYb
 IK/W17IvFqp+nSWPvycDjtcHmx7TkULW5SmPNi1NE/1Q/ZO6PIayWYujckzlsuuDgrEJ
 kWvg==
X-Gm-Message-State: ACgBeo05VJZkr5n8ME6VoEk/llQjEefRk3k1r3oJdPGODgeKzQlf3LhH
 9r5laF03wG7DcBPbJqUlTC8ZtIjITNyAuS6klJsf7L2WjZYzRRAh4Rv77nNvuTJMCfh1gjy9M6z
 Y+UgX2jq/4gMehHeGJIGleC+vLGnaz4/aSFUpjAoZ1VznEgbMNPXUCAJZEn4/8EJjnz4=
X-Received: by 2002:a05:600c:2747:b0:3b4:708a:f66a with SMTP id
 7-20020a05600c274700b003b4708af66amr19095651wmw.146.1663608912876; 
 Mon, 19 Sep 2022 10:35:12 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5fPA2CNizkR9uiE8UVQseJuQs0nbtBxt1CT8aCxENN2h2XIxpeueiwtg4OLnHhGNaHbZ0foA==
X-Received: by 2002:a05:600c:2747:b0:3b4:708a:f66a with SMTP id
 7-20020a05600c274700b003b4708af66amr19095633wmw.146.1663608912492; 
 Mon, 19 Sep 2022 10:35:12 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 u5-20020a5d4345000000b002287d99b455sm13988169wrr.15.2022.09.19.10.35.11
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Sep 2022 10:35:12 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/21] tests/tcg: refine MMX support in SSE tests
Date: Mon, 19 Sep 2022 19:34:41 +0200
Message-Id: <20220919173449.5864-14-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220919173449.5864-1-pbonzini@redhat.com>
References: <20220919173449.5864-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Extend the support to memory operands, and skip MMX instructions that
were introduced in SSE times, because they are now covered in test-mmx.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/tcg/i386/test-avx.py | 32 ++++++++++++++++++++++++++------
 1 file changed, 26 insertions(+), 6 deletions(-)

diff --git a/tests/tcg/i386/test-avx.py b/tests/tcg/i386/test-avx.py
index 2516c66445..e16a3d8bee 100755
--- a/tests/tcg/i386/test-avx.py
+++ b/tests/tcg/i386/test-avx.py
@@ -103,7 +103,11 @@ def regstr(self, n):
 
 class MMArg():
     isxmm = True
-    ismem = False # TODO
+    def __init__(self, mw):
+        if mw not in [0, 32, 64]:
+            raise Exception("Bad mem width: %s" % mw)
+        self.mw = mw
+        self.ismem = mw != 0
     def regstr(self, n):
         return "mm%d" % (n & 7)
 
@@ -169,6 +173,9 @@ def __init__(self, w):
     def regstr(self, n):
         return mem_w(self.w)
 
+class SkipInstruction(Exception):
+    pass
+
 def ArgGenerator(arg, op):
     if arg[:3] == 'xmm' or arg[:3] == "ymm":
         if "/" in arg:
@@ -179,7 +186,13 @@ def ArgGenerator(arg, op):
         else:
             return XMMArg(arg[0], 0);
     elif arg[:2] == 'mm':
-        return MMArg();
+        if "/" in arg:
+            r, m = arg.split('/')
+            if (m[0] != 'm'):
+                raise Exception("Expected /m: %s", arg)
+            return MMArg(int(m[1:]));
+        else:
+            return MMArg(0);
     elif arg[:4] == 'imm8':
         return ArgImm8u(op);
     elif arg == '<XMM0>':
@@ -217,8 +230,12 @@ def __init__(self, op, args):
 
         try:
             self.args = list(ArgGenerator(a, op) for a in args)
+            if not any((x.isxmm for x in self.args)):
+                raise SkipInstruction
             if len(self.args) > 0 and self.args[-1] is None:
                 self.args = self.args[:-1]
+        except SkipInstruction:
+            raise
         except Exception as e:
             raise Exception("Bad arg %s: %s" % (op, e))
 
@@ -339,10 +356,13 @@ def main():
                 continue
             cpuid = row[6]
             if cpuid in archs:
-                g = InsnGenerator(insn[0], insn[1:])
-                for insn in g.gen():
-                    outf.write('TEST(%d, "%s", %s)\n' % (n, insn, g.optype))
-                    n += 1
+                try:
+                    g = InsnGenerator(insn[0], insn[1:])
+                    for insn in g.gen():
+                        outf.write('TEST(%d, "%s", %s)\n' % (n, insn, g.optype))
+                        n += 1
+                except SkipInstruction:
+                    pass
         outf.write("#undef TEST\n")
         csvfile.close()
 
-- 
2.37.2



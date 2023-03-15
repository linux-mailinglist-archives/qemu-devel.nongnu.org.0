Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C756BAEF7
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 12:14:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcP4V-0006vb-W3; Wed, 15 Mar 2023 07:13:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pcP4O-0006un-4x
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 07:13:28 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pcP4K-0005s1-OU
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 07:13:23 -0400
Received: by mail-wr1-x42b.google.com with SMTP id v16so16990468wrn.0
 for <qemu-devel@nongnu.org>; Wed, 15 Mar 2023 04:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678878798;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hTQgFcYrB1xCmGiqUBDxS+gQ3e4QTFB6UCIQEY/7TGM=;
 b=B/IdBUaJFH2GrzCYKuva8pLi6YQp173FpK3QzJ56V+A+3N3NTLOrU/68w5K0w1M7kq
 N/6ai59pjs8M4aevGkGwcGIx0pNTPCQ1sONa68hVEYaPWfMIFI8jRzyECTCGN3qukwtg
 yIaB32/Vf2aXkWc2aaqdts8WbMkKA9UE80RStCtFWsnjU2QZhOHSngXRE43O1iYUCMHL
 rSOnk8X8q5+ckYxNH8K1+Rd7xHRmcEWKzJZ4P7tWm8ZSp5IjG4TDHTG1wFOhT9wHW7dE
 GIKEQ16zYf+0gz8sXdRG1mkp5m+nshaXjJ6SlP1y29githcrk2xBpAiXQJ5GilUPqBEF
 up6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678878798;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hTQgFcYrB1xCmGiqUBDxS+gQ3e4QTFB6UCIQEY/7TGM=;
 b=AdCizg7iKtzJFewfTqyx8ouCUbTiHODoQL3q/TK+mwe2xUwp8Xv+hRdsQCefpYcsHE
 +kuF742cyX9Qkrl7qoJTWQOwtkG7GzvLUb4M8SfrPGUgidVFUAZZptNixN/ph7yEH6X8
 XadAqidVk6F61j4ecGWXPhGJt2Jm90Gy0fR5Bfg2Nkx37908zhEAxuUEAqta8ntTcbNf
 xRu0M0NODROpyZ8LZL+PO6e18aLnmmFUwobrrSEzWVCvotnkA9gEzj2cEKVNLqPHdjjL
 SSyCo7r0BUMfeC5HpvYW7IDM7+hHm7AulK75iddvjSEQb8OA06kXt2VSnZvu9hW3v8Uy
 euEg==
X-Gm-Message-State: AO0yUKXR4uwKE9olfJ2ASxJmmISY8k16hyCmvLSQB9fAlKc/3QI+kS5I
 sxQv6w38BAtsF3JDA9mmrlOIlgV57ZzmEOzf4sLfig==
X-Google-Smtp-Source: AK7set9jUqvSPcxdMEfse1S2hQ7WXvWodIrR2QFKiMCXYE4sxdC79oGR0tX7e7SccrbWv2LSGP/w9Q==
X-Received: by 2002:adf:d845:0:b0:2cf:e132:bfbb with SMTP id
 k5-20020adfd845000000b002cfe132bfbbmr1634015wrl.38.1678878797756; 
 Wed, 15 Mar 2023 04:13:17 -0700 (PDT)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 y7-20020adfd087000000b002c57475c375sm4392066wrh.110.2023.03.15.04.13.15
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Mar 2023 04:13:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Markus Armbruster <armbru@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 2/3] qapi: Do not generate empty enum
Date: Wed, 15 Mar 2023 12:13:03 +0100
Message-Id: <20230315111304.21692-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230315111304.21692-1-philmd@linaro.org>
References: <20230315111304.21692-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Per the C++ standard, empty enum are ill-formed. Do not generate
them in order to avoid:

  In file included from qga/qga-qapi-emit-events.c:14:
  qga/qga-qapi-emit-events.h:20:1: error: empty enum is invalid
     20 | } qga_QAPIEvent;
        | ^

Reported-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 docs/devel/qapi-code-gen.rst | 6 +++---
 scripts/qapi/schema.py       | 5 ++++-
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/docs/devel/qapi-code-gen.rst b/docs/devel/qapi-code-gen.rst
index 23e7f2fb1c..d684c7c24d 100644
--- a/docs/devel/qapi-code-gen.rst
+++ b/docs/devel/qapi-code-gen.rst
@@ -206,6 +206,9 @@ Syntax::
 
 Member 'enum' names the enum type.
 
+Empty enumeration (no member) does not generate anything (not even
+constant PREFIX__MAX).
+
 Each member of the 'data' array defines a value of the enumeration
 type.  The form STRING is shorthand for :code:`{ 'name': STRING }`.  The
 'name' values must be be distinct.
@@ -214,9 +217,6 @@ Example::
 
  { 'enum': 'MyEnum', 'data': [ 'value1', 'value2', 'value3' ] }
 
-Nothing prevents an empty enumeration, although it is probably not
-useful.
-
 On the wire, an enumeration type's value is represented by its
 (string) name.  In C, it's represented by an enumeration constant.
 These are of the form PREFIX_NAME, where PREFIX is derived from the
diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index 207e4d71f3..28045dbe93 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -309,6 +309,7 @@ class QAPISchemaEnumType(QAPISchemaType):
 
     def __init__(self, name, info, doc, ifcond, features, members, prefix):
         super().__init__(name, info, doc, ifcond, features)
+        assert members
         for m in members:
             assert isinstance(m, QAPISchemaEnumMember)
             m.set_defined_in(name)
@@ -1047,8 +1048,10 @@ def _make_implicit_object_type(self, name, info, ifcond, role, members):
         return name
 
     def _def_enum_type(self, expr: QAPIExpression):
-        name = expr['enum']
         data = expr['data']
+        if not data:
+            return
+        name = expr['enum']
         prefix = expr.get('prefix')
         ifcond = QAPISchemaIfCond(expr.get('if'))
         info = expr.info
-- 
2.38.1



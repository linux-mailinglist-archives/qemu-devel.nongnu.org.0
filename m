Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D506BAF3B
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 12:29:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcPJ2-0004AE-QU; Wed, 15 Mar 2023 07:28:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pcPIx-00049e-Ma
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 07:28:29 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pcPIv-0000NL-Rs
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 07:28:27 -0400
Received: by mail-wm1-x335.google.com with SMTP id g18so619206wmk.0
 for <qemu-devel@nongnu.org>; Wed, 15 Mar 2023 04:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678879704;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E8HwEWwHZM0uFrNzoSs0AVfUP0jee2C/VsrgbYrX1W4=;
 b=ZlVqbr31D6glMEPlMcNPSvlC+8BSdDUQ5RoHbiqTogWAJpchlOtrcg/eMHYl9HzEqW
 g4EUwadQVVt99whlcbzjrEWLjx2mUY+9IFWh9RiAm57oSa6cD7DI13zL6TrYcXBQyUug
 TjrZsHoYSSiki3yf1/Du+1dWpJhfzK4IsUnlGdXVeTsyAL8nRYixQ24lLNYvdp5hgP+4
 RTmtoLNVxTsug2LboVX6RVeD9nsDeM3AlnpmZMCLapO8GSskfev57je4int5M4MsFQ4W
 MPERCDWOKEfV3W2B2E4ko2AA7fdFQzhj7/DphJH+ogYXuaiI/D56+8T8vyA2NWOwV3Re
 LJjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678879704;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E8HwEWwHZM0uFrNzoSs0AVfUP0jee2C/VsrgbYrX1W4=;
 b=BdXKwpMB4bxl9k1Vek+5TyAebbavRi+X/zzFiVwT7zCyO3y9SmOa6kzPZnni+UzAW/
 wSIyO2LRg/Knl0P8ppsIzRyYXci22JnvYoppxMwMUWpvSDVPvrzxvCmRLVPXPQ6InZ8n
 uO3WH1jKuyC4jb4LN7otqb/z9tyZ2PSOexCAWPB941YbhhYy3DBUR71aK46HDsYVIkRI
 TD+foKrDeaVeM/08qI41b36NsjuIeU5CDqfcZsFea8NHCFVtt3eqF74PUyHkJ1ZJLuXr
 sDtM9PiJpfZI3jQ7l1tGkPlM4xnu3K1tJdCyQMLLE/MFvEOnE9k2NGm69/IGCAUukuum
 vuKw==
X-Gm-Message-State: AO0yUKXSucy7tkmLtMIESbET8lrgGFrkhx00dEeutaPNkPpXtoBQNnaI
 hQd8kY9NDEJkw4/NFW/BUw4A43jlCeVLnYP7dDbf0g==
X-Google-Smtp-Source: AK7set+tuePGW8wX3CDwWfPF4oCqsH92dCsOz2w7IpK2vDdQ5Qc4LLMr5+eJBKSOcINxF6cPlBTNIA==
X-Received: by 2002:a1c:e913:0:b0:3eb:3912:5ae9 with SMTP id
 q19-20020a1ce913000000b003eb39125ae9mr17339261wmc.24.1678879704302; 
 Wed, 15 Mar 2023 04:28:24 -0700 (PDT)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 t8-20020a05600c450800b003daf6e3bc2fsm5473700wmo.1.2023.03.15.04.28.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Mar 2023 04:28:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 2/3] qapi: Do not generate empty enum
Date: Wed, 15 Mar 2023 12:28:10 +0100
Message-Id: <20230315112811.22355-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230315112811.22355-1-philmd@linaro.org>
References: <20230315112811.22355-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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
 scripts/qapi/events.py       | 2 ++
 scripts/qapi/schema.py       | 5 ++++-
 scripts/qapi/types.py        | 2 ++
 4 files changed, 11 insertions(+), 4 deletions(-)

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
diff --git a/scripts/qapi/events.py b/scripts/qapi/events.py
index 3cf01e96b6..48f4ca9613 100644
--- a/scripts/qapi/events.py
+++ b/scripts/qapi/events.py
@@ -207,6 +207,8 @@ def _begin_user_module(self, name: str) -> None:
 
     def visit_end(self) -> None:
         self._add_module('./emit', ' * QAPI Events emission')
+        if not self._event_enum_members:
+            return
         self._genc.preamble_add(mcgen('''
 #include "qemu/osdep.h"
 #include "%(prefix)sqapi-emit-events.h"
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
diff --git a/scripts/qapi/types.py b/scripts/qapi/types.py
index c39d054d2c..7a7be7315f 100644
--- a/scripts/qapi/types.py
+++ b/scripts/qapi/types.py
@@ -42,6 +42,7 @@
 def gen_enum_lookup(name: str,
                     members: List[QAPISchemaEnumMember],
                     prefix: Optional[str] = None) -> str:
+    assert members
     max_index = c_enum_const(name, '_MAX', prefix)
     feats = ''
     ret = mcgen('''
@@ -86,6 +87,7 @@ def gen_enum_lookup(name: str,
 def gen_enum(name: str,
              members: List[QAPISchemaEnumMember],
              prefix: Optional[str] = None) -> str:
+    assert members
     # append automatically generated _MAX value
     enum_members = members + [QAPISchemaEnumMember('_MAX', None)]
 
-- 
2.38.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A59C04E2E68
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 17:45:05 +0100 (CET)
Received: from localhost ([::1]:50904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWL9U-0000kb-4f
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 12:45:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nWL7K-00079r-Cr
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 12:42:50 -0400
Received: from [2a00:1450:4864:20::536] (port=46033
 helo=mail-ed1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nWL7I-0007ck-Ph
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 12:42:50 -0400
Received: by mail-ed1-x536.google.com with SMTP id u26so2997322eda.12
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 09:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gX6EOlTl67BBZkn2jdiMxQvQHOFK6dHd/5w2dropqn8=;
 b=EwcREvGlFelTn9dkea+ZzbdaWVA8oCS2hxEkWjVj6GnOiz6yczi0uTvmiRZPnmqSww
 0rXRi4VwEm0zKpYBpbpttiPCKA76pRG0RcTV9goO2w0v4S1LR1fx/o2ivfI7Pv/75mLv
 wmhC2EAON767Mo8V30pyH9QX+jVh3KgJ5D3+NCMPrI2yqLAVH+aHR1wFj6b2uTnsaKCe
 jwA81bb1Vu3guEUIddMS6LEpO2XD9R0DULfr9/VdvfWm93SzRfyo8MSUt2oVGpuYLLzG
 po+XGwJXz1GrkxDNmG9P3404y+tSUgC88MHjUyvleoPkxMWX5Z6TVd8N+ZUx6JHdVStQ
 jFEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=gX6EOlTl67BBZkn2jdiMxQvQHOFK6dHd/5w2dropqn8=;
 b=lsXyYXRxvqMBQmpdZNYkyVnVUullDSw7GkNJHm+u2zdCVhyBzt4SFLFaUMozn4ZQ9t
 UCEbFZWvKkzahkzAHDVs0DYAwdbnDFL5mwNzlVP8tejGJyaEjvnQYOpSRvVCO12vVyK6
 pynmC4C+TRy6K1ipanQ5mDl05/k7sDD9MpK+x0Nre00eoE991begMCrcL77C/+L9mqIN
 x6P0tQ0OUguJugrL5uU281eAxCfmXxgCNWWtP4VxlsyX4fheavW+vqWW3Yk/hmmFC7W7
 EqsQ3mo4hDOoNbVlVNJfCse1sqTvVilPqbYcX/J9qxp/pHiRZjDFmJWZeVHXP0sJXod5
 PFSA==
X-Gm-Message-State: AOAM533ConSqG6NY75wVroiFB513sUFQ/deaK4vVkY/GYDiTpTfJAcRY
 kJFrEmmbCtFn+F2u3igWmfmZ4GZZBEU=
X-Google-Smtp-Source: ABdhPJxG8LqouPsUMoWcJvKas/E9QPwnnatmov2zneTKXWKH0Pd8m/u0YJyv2BcD+Ds8HsenBV0JPQ==
X-Received: by 2002:a05:6402:1909:b0:418:d876:3119 with SMTP id
 e9-20020a056402190900b00418d8763119mr24473825edz.266.1647880967344; 
 Mon, 21 Mar 2022 09:42:47 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a50d802000000b00410d7f0c52csm8289385edj.8.2022.03.21.09.42.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 09:42:46 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] qapi-schema: support alternates with array type
Date: Mon, 21 Mar 2022 17:42:41 +0100
Message-Id: <20220321164243.200569-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220321164243.200569-1-pbonzini@redhat.com>
References: <20220321164243.200569-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::536
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Detect array types as alternate branches, and turn the JSON list into
a QAPISchemaArrayType.  Array types in an alternate are represented with
QTYPE_QLIST in the type field.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/qapi/expr.py                   |  2 +-
 scripts/qapi/schema.py                 |  4 ++++
 tests/qapi-schema/alternate-array.err  |  2 --
 tests/qapi-schema/alternate-array.json |  2 --
 tests/qapi-schema/alternate-array.out  | 18 ++++++++++++++++++
 5 files changed, 23 insertions(+), 5 deletions(-)

diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index 3cb389e875..48578e1698 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -554,7 +554,7 @@ def check_alternate(expr: _JSONObject, info: QAPISourceInfo) -> None:
         check_name_lower(key, info, source)
         check_keys(value, info, source, ['type'], ['if'])
         check_if(value, info, source)
-        check_type(value['type'], info, source)
+        check_type(value['type'], info, source, allow_array=True)
 
 
 def check_command(expr: _JSONObject, info: QAPISourceInfo) -> None:
diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index b7b3fc0ce4..3728340c37 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -243,6 +243,7 @@ def alternate_qtype(self):
             'number':  'QTYPE_QNUM',
             'int':     'QTYPE_QNUM',
             'boolean': 'QTYPE_QBOOL',
+            'array':   'QTYPE_QLIST',
             'object':  'QTYPE_QDICT'
         }
         return json2qtype.get(self.json_type())
@@ -1069,6 +1070,9 @@ def _def_struct_type(self, expr, info, doc):
             None))
 
     def _make_variant(self, case, typ, ifcond, info):
+        if isinstance(typ, list):
+            assert len(typ) == 1
+            typ = self._make_array_type(typ[0], info)
         return QAPISchemaVariant(case, info, typ, ifcond)
 
     def _def_union_type(self, expr, info, doc):
diff --git a/tests/qapi-schema/alternate-array.err b/tests/qapi-schema/alternate-array.err
index b1aa1f4e8d..e69de29bb2 100644
--- a/tests/qapi-schema/alternate-array.err
+++ b/tests/qapi-schema/alternate-array.err
@@ -1,2 +0,0 @@
-alternate-array.json: In alternate 'Alt':
-alternate-array.json:5: 'data' member 'two' cannot be an array
diff --git a/tests/qapi-schema/alternate-array.json b/tests/qapi-schema/alternate-array.json
index f241aac122..b878a2db77 100644
--- a/tests/qapi-schema/alternate-array.json
+++ b/tests/qapi-schema/alternate-array.json
@@ -1,5 +1,3 @@
-# we do not allow array branches in alternates
-# TODO: should we support this?
 { 'struct': 'One',
   'data': { 'name': 'str' } }
 { 'alternate': 'Alt',
diff --git a/tests/qapi-schema/alternate-array.out b/tests/qapi-schema/alternate-array.out
index e69de29bb2..a657d85738 100644
--- a/tests/qapi-schema/alternate-array.out
+++ b/tests/qapi-schema/alternate-array.out
@@ -0,0 +1,18 @@
+module ./builtin
+object q_empty
+enum QType
+    prefix QTYPE
+    member none
+    member qnull
+    member qnum
+    member qstring
+    member qdict
+    member qlist
+    member qbool
+module alternate-array.json
+object One
+    member name: str optional=False
+alternate Alt
+    tag type
+    case one: One
+    case two: intList
-- 
2.35.1




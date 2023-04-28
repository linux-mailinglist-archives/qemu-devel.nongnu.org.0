Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D9F6F1632
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 12:57:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psLkT-0008PD-R1; Fri, 28 Apr 2023 06:54:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1psLkQ-0008N8-OJ
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 06:54:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1psLkK-0003xH-T4
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 06:54:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682679276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZGVBSSg55oCAbBmQe5n7vWHkiAdqmECBIg28pQzzL3s=;
 b=ZTHitOWj8Gayfi6fhpqk8jC1eGldV4E/8ElUukzj/CjswVKSRSgyZ+E87DJr3T2Ma9CQOg
 Yuv1E+UnWMKhjUy7CV20s3WjttTPoO0CV0tHBsFCm1uF9tJHo/GeqcW4dBLjQIQtHzewNW
 GVx3pkeB/XB+cTKS66jYRE5qxI2/Ys0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-459-9dWbj1pmO1yH5eUN9RFPYQ-1; Fri, 28 Apr 2023 06:54:33 -0400
X-MC-Unique: 9dWbj1pmO1yH5eUN9RFPYQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F1189885638;
 Fri, 28 Apr 2023 10:54:32 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AF85F400F4D;
 Fri, 28 Apr 2023 10:54:32 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A61E921D0D7D; Fri, 28 Apr 2023 12:54:29 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: michael.roth@amd.com, peter.maydell@linaro.org, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, thuth@redhat.com,
 philmd@linaro.org, mst@redhat.com, imammedo@redhat.com,
 anisinha@redhat.com, eblake@redhat.com, kraxel@redhat.com,
 kwolf@redhat.com, hreitz@redhat.com, arei.gonglei@huawei.com,
 pizhenwei@bytedance.com, jsnow@redhat.com, vsementsov@yandex-team.ru,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, wangyanan55@huawei.com,
 quintela@redhat.com, peterx@redhat.com, leobras@redhat.com,
 jasowang@redhat.com, yuval.shaia.ml@gmail.com, pavel.dovgaluk@ispras.ru,
 jiri@resnulli.us, stefanb@linux.vnet.ibm.com, stefanha@redhat.com,
 lukasstraub2@web.de, kkostiuk@redhat.com, qemu-block@nongnu.org,
 victortoso@redhat.com
Subject: [PATCH 14/17] qapi: Section parameter @indent is no longer used, drop
Date: Fri, 28 Apr 2023 12:54:26 +0200
Message-Id: <20230428105429.1687850-15-armbru@redhat.com>
In-Reply-To: <20230428105429.1687850-1-armbru@redhat.com>
References: <20230428105429.1687850-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/parser.py | 31 ++++++++++++++-----------------
 1 file changed, 14 insertions(+), 17 deletions(-)

diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
index 3e29b7bf48..22ee631198 100644
--- a/scripts/qapi/parser.py
+++ b/scripts/qapi/parser.py
@@ -468,8 +468,7 @@ class QAPIDoc:
     class Section:
         # pylint: disable=too-few-public-methods
         def __init__(self, parser: QAPISchemaParser,
-                     name: Optional[str] = None, indent: int = 0):
-
+                     name: Optional[str] = None):
             # parser, for error messages about indentation
             self._parser = parser
             # optional section name (argument/member or section name)
@@ -500,8 +499,8 @@ def append(self, line: str) -> None:
 
     class ArgSection(Section):
         def __init__(self, parser: QAPISchemaParser,
-                     name: str, indent: int = 0):
-            super().__init__(parser, name, indent)
+                     name: str):
+            super().__init__(parser, name)
             self.member: Optional['QAPISchemaMember'] = None
 
         def connect(self, member: 'QAPISchemaMember') -> None:
@@ -626,7 +625,7 @@ def _append_args_line(self, line: str) -> None:
         """
         if match := self._match_at_name_colon(line):
             line = line[match.end():]
-            self._start_args_section(match.group(1), 0)
+            self._start_args_section(match.group(1))
         elif self._match_section_tag(line):
             self._append_line = self._append_various_line
             self._append_various_line(line)
@@ -646,7 +645,7 @@ def _append_args_line(self, line: str) -> None:
     def _append_features_line(self, line: str) -> None:
         if match := self._match_at_name_colon(line):
             line = line[match.end():]
-            self._start_features_section(match.group(1), 0)
+            self._start_features_section(match.group(1))
         elif self._match_section_tag(line):
             self._append_line = self._append_various_line
             self._append_various_line(line)
@@ -677,15 +676,14 @@ def _append_various_line(self, line: str) -> None:
                                  % (match.group(1), self.sections[0].name))
         if match := self._match_section_tag(line):
             line = line[match.end():]
-            self._start_section(match.group(1), 0)
+            self._start_section(match.group(1))
 
         self._append_freeform(line)
 
     def _start_symbol_section(
             self,
             symbols_dict: Dict[str, 'QAPIDoc.ArgSection'],
-            name: str,
-            indent: int) -> None:
+            name: str) -> None:
         # FIXME invalid names other than the empty string aren't flagged
         if not name:
             raise QAPIParseError(self._parser, "invalid parameter name")
@@ -693,22 +691,21 @@ def _start_symbol_section(
             raise QAPIParseError(self._parser,
                                  "'%s' parameter name duplicated" % name)
         assert not self.sections
-        new_section = QAPIDoc.ArgSection(self._parser, name, indent)
+        new_section = QAPIDoc.ArgSection(self._parser, name)
         self._switch_section(new_section)
         symbols_dict[name] = new_section
 
-    def _start_args_section(self, name: str, indent: int) -> None:
-        self._start_symbol_section(self.args, name, indent)
+    def _start_args_section(self, name: str) -> None:
+        self._start_symbol_section(self.args, name)
 
-    def _start_features_section(self, name: str, indent: int) -> None:
-        self._start_symbol_section(self.features, name, indent)
+    def _start_features_section(self, name: str) -> None:
+        self._start_symbol_section(self.features, name)
 
-    def _start_section(self, name: Optional[str] = None,
-                       indent: int = 0) -> None:
+    def _start_section(self, name: Optional[str] = None) -> None:
         if name in ('Returns', 'Since') and self.has_section(name):
             raise QAPIParseError(self._parser,
                                  "duplicated '%s' section" % name)
-        new_section = QAPIDoc.Section(self._parser, name, indent)
+        new_section = QAPIDoc.Section(self._parser, name)
         self._switch_section(new_section)
         self.sections.append(new_section)
 
-- 
2.39.2



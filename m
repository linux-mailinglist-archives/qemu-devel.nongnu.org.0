Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 929886F162A
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 12:57:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psLkP-0008Ka-CY; Fri, 28 Apr 2023 06:54:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1psLkO-0008KH-7I
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 06:54:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1psLkL-0003xd-ID
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 06:54:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682679277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ARcKiIQS2pEIxM9PvTqEsUhTE2KwmBv18M4YtoCZV+k=;
 b=QoqY9RVnPWI3NdUydkjrycepNwpY/Q+Jp43KnoALabH7iu7HmKDJnC9MpFZ0PDRhvoXQM2
 1EqMCNaqqAoYY7s4f5yrxD97Zms5Tvw7kAwMKWBCpajfiZZLP4uUxxD3If5jfUApcZozsz
 3DpzWT2In249IZgcJKwuSrqPCaTFoJ4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-574-oRTP6FPwOsCYUFkOpBSj-Q-1; Fri, 28 Apr 2023 06:54:33 -0400
X-MC-Unique: oRTP6FPwOsCYUFkOpBSj-Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C693E1C0A593;
 Fri, 28 Apr 2023 10:54:32 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A22301410F20;
 Fri, 28 Apr 2023 10:54:32 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9B86121D1661; Fri, 28 Apr 2023 12:54:29 +0200 (CEST)
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
Subject: [PATCH 11/17] qapi: Fix argument description indentation stripping
Date: Fri, 28 Apr 2023 12:54:23 +0200
Message-Id: <20230428105429.1687850-12-armbru@redhat.com>
In-Reply-To: <20230428105429.1687850-1-armbru@redhat.com>
References: <20230428105429.1687850-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

When an argument's description starts on the line after the "#arg: "
line, indentation is stripped only from the description's first line,
as demonstrated by the previous commit.  Moreover, subsequent lines
with less indentation are not rejected.

Make the first line's indentation the expected indentation for the
remainder of the description.  This fixes indentation stripping, and
also requires at least that much indentation.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/parser.py         | 20 +++++++++++---------
 tests/qapi-schema/doc-good.out |  2 +-
 2 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
index 7b49d3ab05..ddc14ceaba 100644
--- a/scripts/qapi/parser.py
+++ b/scripts/qapi/parser.py
@@ -483,7 +483,9 @@ def append(self, line: str) -> None:
             # Blank lines are always OK.
             if line:
                 indent = must_match(r'\s*', line).end()
-                if indent < self._indent:
+                if self._indent < 0:
+                    self._indent = indent
+                elif indent < self._indent:
                     raise QAPIParseError(
                         self._parser,
                         "unexpected de-indent (expected at least %d spaces)" %
@@ -631,9 +633,9 @@ def _append_args_line(self, line: str) -> None:
             indent = must_match(r'@\S*:\s*', line).end()
             line = line[indent:]
             if not line:
-                # Line was just the "@arg:" header; following lines
-                # are not indented
-                indent = 0
+                # Line was just the "@arg:" header
+                # The next non-blank line determines expected indent
+                indent = -1
             else:
                 line = ' ' * indent + line
             self._start_args_section(name[1:-1], indent)
@@ -666,9 +668,9 @@ def _append_features_line(self, line: str) -> None:
             indent = must_match(r'@\S*:\s*', line).end()
             line = line[indent:]
             if not line:
-                # Line was just the "@arg:" header; following lines
-                # are not indented
-                indent = 0
+                # Line was just the "@arg:" header
+                # The next non-blank line determines expected indent
+                indent = -1
             else:
                 line = ' ' * indent + line
             self._start_features_section(name[1:-1], indent)
@@ -712,8 +714,8 @@ def _append_various_line(self, line: str) -> None:
             indent = must_match(r'\S*:\s*', line).end()
             line = line[indent:]
             if not line:
-                # Line was just the "Section:" header; following lines
-                # are not indented
+                # Line was just the "Section:" header
+                # The next non-blank line determines expected indent
                 indent = 0
             else:
                 line = ' ' * indent + line
diff --git a/tests/qapi-schema/doc-good.out b/tests/qapi-schema/doc-good.out
index 2ba72ae558..277371acc8 100644
--- a/tests/qapi-schema/doc-good.out
+++ b/tests/qapi-schema/doc-good.out
@@ -159,7 +159,7 @@ doc symbol=cmd
 
     arg=arg1
 description starts on a new line,
-    indented
+indented
     arg=arg2
 the second argument
     arg=arg3
-- 
2.39.2



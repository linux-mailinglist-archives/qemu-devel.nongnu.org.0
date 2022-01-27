Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D69F649E1A6
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 12:55:53 +0100 (CET)
Received: from localhost ([::1]:41960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD3NY-0005gv-Ib
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 06:55:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nD2xv-0005ql-FD
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 06:29:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nD2xr-0000Oy-Sl
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 06:29:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643282959;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EBVfk5Drnxa5r7L1W8s+nyKN/rrmSrs6fEweCFh6oSQ=;
 b=ggRJkROqdX5MdO/uaAuOJ/PxQvUpxudI+9SvVZAEx6srIwHe6QwNw7Vz2mQFggeYaOZg4n
 wVlic/oaaytigYRx+td7xSFxb8EV2TEtkKRGeX5+QUOmmVpeafsWoe7MiN5j3sxJNnvn0M
 9tmsqoQ0tI3TluBQOv9+KBpkInjV6f0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-668-JZByR8pkOUG8-OiBMls8DQ-1; Thu, 27 Jan 2022 06:29:17 -0500
X-MC-Unique: JZByR8pkOUG8-OiBMls8DQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ECA88196E6C0;
 Thu, 27 Jan 2022 11:29:16 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D06E36C1AC;
 Thu, 27 Jan 2022 11:29:00 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6312B1138220; Thu, 27 Jan 2022 12:28:59 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/8] qapi/gen: Add FOO.trace-events output module
Date: Thu, 27 Jan 2022 12:28:53 +0100
Message-Id: <20220127112859.222484-3-armbru@redhat.com>
In-Reply-To: <20220127112859.222484-1-armbru@redhat.com>
References: <20220127112859.222484-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.159,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

We are going to generate trace events for QMP commands. We should
generate both trace_*() function calls and trace-events files listing
events for trace generator.

So, add an output module FOO.trace-events for each FOO schema module.

Since we're going to add trace events only to command marshallers,
make the trace-events output optional, so we don't generate so many
useless empty files.

Currently nobody set add_trace_events to True, so new functionality is
disabled. It will be enabled for QAPISchemaGenCommandVisitor
in a further commit.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20220126161130.3240892-2-vsementsov@virtuozzo.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/gen.py | 31 +++++++++++++++++++++++++++----
 1 file changed, 27 insertions(+), 4 deletions(-)

diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
index 995a97d2b8..113b49134d 100644
--- a/scripts/qapi/gen.py
+++ b/scripts/qapi/gen.py
@@ -192,6 +192,11 @@ def _bottom(self) -> str:
         return guardend(self.fname)
 
 
+class QAPIGenTrace(QAPIGen):
+    def _top(self) -> str:
+        return super()._top() + '# AUTOMATICALLY GENERATED, DO NOT MODIFY\n\n'
+
+
 @contextmanager
 def ifcontext(ifcond: QAPISchemaIfCond, *args: QAPIGenCCode) -> Iterator[None]:
     """
@@ -244,15 +249,18 @@ def __init__(self,
                  what: str,
                  user_blurb: str,
                  builtin_blurb: Optional[str],
-                 pydoc: str):
+                 pydoc: str,
+                 gen_tracing: bool = False):
         self._prefix = prefix
         self._what = what
         self._user_blurb = user_blurb
         self._builtin_blurb = builtin_blurb
         self._pydoc = pydoc
         self._current_module: Optional[str] = None
-        self._module: Dict[str, Tuple[QAPIGenC, QAPIGenH]] = {}
+        self._module: Dict[str, Tuple[QAPIGenC, QAPIGenH,
+                                      Optional[QAPIGenTrace]]] = {}
         self._main_module: Optional[str] = None
+        self._gen_tracing = gen_tracing
 
     @property
     def _genc(self) -> QAPIGenC:
@@ -264,6 +272,14 @@ def _genh(self) -> QAPIGenH:
         assert self._current_module is not None
         return self._module[self._current_module][1]
 
+    @property
+    def _gen_trace_events(self) -> QAPIGenTrace:
+        assert self._gen_tracing
+        assert self._current_module is not None
+        gent = self._module[self._current_module][2]
+        assert gent is not None
+        return gent
+
     @staticmethod
     def _module_dirname(name: str) -> str:
         if QAPISchemaModule.is_user_module(name):
@@ -293,7 +309,12 @@ def _add_module(self, name: str, blurb: str) -> None:
         basename = self._module_filename(self._what, name)
         genc = QAPIGenC(basename + '.c', blurb, self._pydoc)
         genh = QAPIGenH(basename + '.h', blurb, self._pydoc)
-        self._module[name] = (genc, genh)
+
+        gent: Optional[QAPIGenTrace] = None
+        if self._gen_tracing:
+            gent = QAPIGenTrace(basename + '.trace-events')
+
+        self._module[name] = (genc, genh, gent)
         self._current_module = name
 
     @contextmanager
@@ -304,11 +325,13 @@ def _temp_module(self, name: str) -> Iterator[None]:
         self._current_module = old_module
 
     def write(self, output_dir: str, opt_builtins: bool = False) -> None:
-        for name, (genc, genh) in self._module.items():
+        for name, (genc, genh, gent) in self._module.items():
             if QAPISchemaModule.is_builtin_module(name) and not opt_builtins:
                 continue
             genc.write(output_dir)
             genh.write(output_dir)
+            if gent is not None:
+                gent.write(output_dir)
 
     def _begin_builtin_module(self) -> None:
         pass
-- 
2.31.1



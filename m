Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C86274A89
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Sep 2020 23:03:39 +0200 (CEST)
Received: from localhost ([::1]:36026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kKpRq-0003Xp-Iu
	for lists+qemu-devel@lfdr.de; Tue, 22 Sep 2020 17:03:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kKpPU-0001tA-8t
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 17:01:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kKpPR-0004XA-Co
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 17:01:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600808468;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mZWXq7GO5mx558feE0Kb1/8jgJE3wrTyvSY41kIzuWY=;
 b=Lkw5YVpfleKaQGP1FWIWle0zTMyxc+HWNaPKebszaF4Y1X+/IGWZcYg/IIqxXfGL/waW4p
 Mw1AswQrHNgvdNXPlzJlGZh8XAX9B6xMmoHQ07w2BVjj2Kv2GImSN8hujPTlhdkxJGfx2m
 PUsU5j2i7pVO2NLCzpU7zeS518SjOII=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-403-R-AA6rvxNWKnodzD_SpNSg-1; Tue, 22 Sep 2020 17:01:06 -0400
X-MC-Unique: R-AA6rvxNWKnodzD_SpNSg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 537C21007464;
 Tue, 22 Sep 2020 21:01:05 +0000 (UTC)
Received: from scv.redhat.com (ovpn-119-140.rdu2.redhat.com [10.10.119.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A33FE5577A;
 Tue, 22 Sep 2020 21:01:03 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v2 01/38] [DO-NOT-MERGE] qapi: add debugging tools
Date: Tue, 22 Sep 2020 17:00:24 -0400
Message-Id: <20200922210101.4081073-2-jsnow@redhat.com>
In-Reply-To: <20200922210101.4081073-1-jsnow@redhat.com>
References: <20200922210101.4081073-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/22 15:47:47
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.455,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This adds some really childishly simple debugging tools. Maybe they're
interesting for someone else, too?

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/debug.py | 78 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 78 insertions(+)
 create mode 100644 scripts/qapi/debug.py

diff --git a/scripts/qapi/debug.py b/scripts/qapi/debug.py
new file mode 100644
index 0000000000..bacf5ee180
--- /dev/null
+++ b/scripts/qapi/debug.py
@@ -0,0 +1,78 @@
+"""
+Small debugging facilities for mypy static analysis work.
+(C) 2020 John Snow, for Red Hat, Inc.
+"""
+
+import inspect
+import json
+from typing import Dict, List, Any
+from types import FrameType
+
+
+OBSERVED_TYPES: Dict[str, List[str]] = {}
+
+
+# You have no idea how long it took to find this return type...
+def caller_frame() -> FrameType:
+    """
+    Returns the stack frame of the caller's caller.
+    e.g. foo() -> caller() -> caller_frame() return's foo's stack frame.
+    """
+    stack = inspect.stack()
+    caller = stack[2].frame
+    if caller is None:
+        msg = "Python interpreter does not support stack frame inspection"
+        raise RuntimeError(msg)
+    return caller
+
+
+def _add_type_record(name: str, typestr: str) -> None:
+    seen = OBSERVED_TYPES.setdefault(name, [])
+    if typestr not in seen:
+        seen.append(typestr)
+
+
+def record_type(name: str, value: Any, dict_names: bool = False) -> None:
+    """
+    Record the type of a variable.
+
+    :param name: The name of the variable
+    :param value: The value of the variable
+    """
+    _add_type_record(name, str(type(value)))
+
+    try:
+        for key, subvalue in value.items():
+            subname = f"{name}.{key}" if dict_names else f"{name}.[dict_value]"
+            _add_type_record(subname, str(type(subvalue)))
+        return
+    except AttributeError:
+        # (Wasn't a dict or anything resembling one.)
+        pass
+
+    # str is iterable, but not in the way we want!
+    if isinstance(value, str):
+        return
+
+    try:
+        for elem in value:
+            _add_type_record(f"{name}.[list_elem]", str(type(elem)))
+    except TypeError:
+        # (Wasn't a list or anything else iterable.)
+        pass
+
+
+def show_types() -> None:
+    """
+    Print all of the currently known variable types to stdout.
+    """
+    print(json.dumps(OBSERVED_TYPES, indent=2))
+
+
+def record_locals(show: bool = False, dict_names: bool = False) -> None:
+    caller = caller_frame()
+    name = caller.f_code.co_name
+    for key, value in caller.f_locals.items():
+        record_type(f"{name}.{key}", value, dict_names=dict_names)
+    if show:
+        show_types()
-- 
2.26.2



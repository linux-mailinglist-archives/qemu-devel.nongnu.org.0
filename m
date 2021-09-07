Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E13764028D4
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 14:33:03 +0200 (CEST)
Received: from localhost ([::1]:55266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNaHe-00061m-W5
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 08:33:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mNa8n-0005Zk-MI
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:23:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mNa8Y-0007yH-R8
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:23:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631017418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zsnycfMms9ekn9IPgsoFbYxVec5TW2SQvovH+LP0zbA=;
 b=Gv/GVY6mrw92Gqd5C1JLgjkaJaxCB3Th2Fyej0aCIauEUKEWVOL2IycF2FuiHRvt6/Ko4B
 c/Hj1oLHHWUWSOZNzDj5aAGo4p0WcisN2Qa3fHbFOK0vIWvKuZYisSu8Tp/hLv/o2BWyPy
 xORCQtKiHR9uOw83ewGBysS3wntqmk0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-270-rSO8CBfZP_O4I4OtgAMvWg-1; Tue, 07 Sep 2021 08:23:36 -0400
X-MC-Unique: rSO8CBfZP_O4I4OtgAMvWg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3B7BA802934
 for <qemu-devel@nongnu.org>; Tue,  7 Sep 2021 12:23:36 +0000 (UTC)
Received: from localhost (unknown [10.39.208.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8054E781ED;
 Tue,  7 Sep 2021 12:23:26 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [RFC v3 17/32] scripts/qapi: learn to generate ABI dump for Rust FFI
Date: Tue,  7 Sep 2021 16:19:28 +0400
Message-Id: <20210907121943.3498701-18-marcandre.lureau@redhat.com>
In-Reply-To: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
References: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: pbonzini@redhat.com, berrange@redhat.com, armbru@redhat.com,
 stefanha@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 scripts/qapi/cabi.py | 50 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/scripts/qapi/cabi.py b/scripts/qapi/cabi.py
index f33680477f..29c6d5144d 100644
--- a/scripts/qapi/cabi.py
+++ b/scripts/qapi/cabi.py
@@ -7,6 +7,7 @@
 from typing import List, Optional
 
 from .common import c_enum_const, c_name, mcgen
+from .rs import rs_name, to_snake_case
 from .schema import (
     QAPISchemaEnumMember,
     QAPISchemaIfCond,
@@ -24,6 +25,9 @@ def __init__(self, name: str, ifcond: QAPISchemaIfCond):
     def gen_c(self) -> str:
         raise NotImplementedError()
 
+    def gen_rs(self) -> str:
+        raise NotImplementedError()
+
 
 class CABIEnum(CABI):
     def __init__(
@@ -48,6 +52,19 @@ def gen_c(self) -> str:
         ret += self.ifcond.gen_endif()
         return ret
 
+    def gen_rs(self) -> str:
+        return mcgen("""
+%(cfg)s
+{
+    println!("%(name)s enum: sizeof={}", ::std::mem::size_of::<%(rs_name)s>());
+    println!(" max={}", %(rs_name)s::_MAX as u32);
+    println!();
+}
+""",
+                     name=self.name,
+                     rs_name=rs_name(self.name),
+                     cfg=self.ifcond.rsgen())
+
 
 class CABIStruct(CABI):
     def __init__(self, name: str, ifcond: QAPISchemaIfCond):
@@ -84,6 +101,21 @@ def gen_c(self) -> str:
         ret += self.ifcond.gen_endif()
         return ret
 
+    def gen_rs(self) -> str:
+        ret = mcgen("""
+%(cfg)s
+{
+    println!("%(name)s struct: sizeof={}",
+        ::std::mem::size_of::<%(rs_name)s>());
+""", name=self.name, rs_name=rs_name(self.name), cfg=self.ifcond.rsgen())
+        for member in self.members:
+            ret += member.gen_rs()
+        ret += mcgen("""
+    println!();
+}
+""")
+        return ret
+
 
 class CABIStructMember:
     def __init__(self, struct: CABIStruct, name: str,
@@ -105,6 +137,24 @@ def gen_c(self) -> str:
         ret += self.ifcond.gen_endif()
         return ret
 
+    def gen_rs(self) -> str:
+        ret = ''
+        if self.ifcond:
+            ret += self.ifcond.rsgen()
+        protect = not self.prefix or self.prefix[-1] == '.'
+        rsmember = self.prefix + to_snake_case(rs_name(self.name, protect))
+        ret += mcgen("""
+unsafe {
+    println!(" %(member)s member: sizeof={} offset={}",
+        ::std::mem::size_of_val(
+            &(*::std::ptr::null::<%(sname)s>()).%(rsmember)s
+        ),
+        &(*(::std::ptr::null::<%(sname)s>())).%(rsmember)s as *const _ as usize
+    );
+}
+""", member=self.name, sname=rs_name(self.struct.name), rsmember=rsmember)
+        return ret
+
 
 def gen_object_cabi(
     name: str,
-- 
2.33.0.113.g6c40894d24



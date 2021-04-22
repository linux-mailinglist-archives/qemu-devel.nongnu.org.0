Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E75D3677CF
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 05:15:40 +0200 (CEST)
Received: from localhost ([::1]:58872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZPoZ-0006pf-Jy
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 23:15:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lZPgw-0006PT-BJ
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 23:07:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lZPgh-0006Ru-Jv
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 23:07:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619060847;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yO8sw/BnHE8AhkP8SqeYby/5a9XooTxfhl4rIp/cyk4=;
 b=fawAknjxqQTM9VwR7ZKQfrTW6npRFmrPF5og9kjRjM69PrLz6dgZO7Fg5H1EbWuW2d3Zuu
 85S79kT8Ie4Sc/BMbyDx3eJzNDhIDyisRZ/KDuUn/v7YvQpMtlthVpTa5QBMZyt/jflxXB
 fseFhQ2bDCOPtZp8SoZS5MalB/nRNWA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-yNM_zkLzNy6YG3-fwq3x2w-1; Wed, 21 Apr 2021 23:07:24 -0400
X-MC-Unique: yNM_zkLzNy6YG3-fwq3x2w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E1481006C80;
 Thu, 22 Apr 2021 03:07:23 +0000 (UTC)
Received: from scv.redhat.com (ovpn-118-152.rdu2.redhat.com [10.10.118.152])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6D60B607CB;
 Thu, 22 Apr 2021 03:07:22 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/22] qapi/source: [RFC] add "with_column" contextmanager
Date: Wed, 21 Apr 2021 23:07:00 -0400
Message-Id: <20210422030720.3685766-3-jsnow@redhat.com>
In-Reply-To: <20210422030720.3685766-1-jsnow@redhat.com>
References: <20210422030720.3685766-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a silly one, but... it's important to have fun.

This patch isn't *needed*, it's here as an RFC. In trying to experiment
with different ways to solve the problem addressed by the previous
commit, I kept getting confused at how the "source location" string with
line and column number was built across two different classes.

(i.e. QAPISourceError appends the column, but QAPISourceInfo does not
track column information natively.)

I was afraid to try and fully implement column number directly in
QAPISourceInfo on the chance that it might have undesirable effects, so
I came up with a quick "hack" to centralize the 'location' information
generation.

It's a little goofy, but it works :')

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/error.py  |  8 +++-----
 scripts/qapi/source.py | 23 ++++++++++++++++++++++-
 2 files changed, 25 insertions(+), 6 deletions(-)

diff --git a/scripts/qapi/error.py b/scripts/qapi/error.py
index e35e4ddb26a..6b04f56f8a2 100644
--- a/scripts/qapi/error.py
+++ b/scripts/qapi/error.py
@@ -39,11 +39,9 @@ def __init__(self,
 
     def __str__(self) -> str:
         assert self.info is not None
-        loc = str(self.info)
-        if self.col is not None:
-            assert self.info.line is not None
-            loc += ':%s' % self.col
-        return loc + ': ' + self.msg
+        with self.info.at_column(self.col):
+            loc = str(self.info)
+        return f"{loc}: {self.msg}"
 
 
 class QAPISemError(QAPISourceError):
diff --git a/scripts/qapi/source.py b/scripts/qapi/source.py
index 1ade864d7b9..21090b9fe78 100644
--- a/scripts/qapi/source.py
+++ b/scripts/qapi/source.py
@@ -9,8 +9,14 @@
 # This work is licensed under the terms of the GNU GPL, version 2.
 # See the COPYING file in the top-level directory.
 
+from contextlib import contextmanager
 import copy
-from typing import List, Optional, TypeVar
+from typing import (
+    Iterator,
+    List,
+    Optional,
+    TypeVar,
+)
 
 
 class QAPISchemaPragma:
@@ -35,6 +41,7 @@ def __init__(self, fname: str, line: int,
                  parent: Optional['QAPISourceInfo']):
         self.fname = fname
         self.line = line
+        self._column: Optional[int] = None
         self.parent = parent
         self.pragma: QAPISchemaPragma = (
             parent.pragma if parent else QAPISchemaPragma()
@@ -52,9 +59,14 @@ def next_line(self: T) -> T:
         return info
 
     def loc(self) -> str:
+        # column cannot be provided meaningfully when line is absent.
+        assert self.line or self._column is None
+
         ret = self.fname
         if self.line is not None:
             ret += ':%d' % self.line
+        if self._column is not None:
+            ret += ':%d' % self._column
         return ret
 
     def in_defn(self) -> str:
@@ -71,5 +83,14 @@ def include_path(self) -> str:
             parent = parent.parent
         return ret
 
+    @contextmanager
+    def at_column(self, column: Optional[int]) -> Iterator[None]:
+        current_column = self._column
+        try:
+            self._column = column
+            yield
+        finally:
+            self._column = current_column
+
     def __str__(self) -> str:
         return self.include_path() + self.in_defn() + self.loc()
-- 
2.30.2



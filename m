Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07621399735
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 02:48:29 +0200 (CEST)
Received: from localhost ([::1]:57728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lobX9-00047G-S1
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 20:48:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lobMj-0004mp-5w
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 20:37:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lobMh-0004jt-Ed
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 20:37:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622680658;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wYk+tC89xupiZDiKU257+k8TP9iVyVoJVE8zvCtYKr0=;
 b=Bgpb3msWm7V30eo0/2ZbCcLvd13f5KnEVdB/dl6UBimWOfi0x6Za5uvQvGZUR5cR2YgdSr
 TTD72bfLhqOv/7icdcJmNTBJfAfKeBW1my65T6lqS6sBhqDGdWni3xelLle2vIp8sFJZnY
 TVj1Or40gE1YN1zjy0d7NO3SMJ1eHzw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-37-bxdpnZAENXSdDw-JwXyjdA-1; Wed, 02 Jun 2021 20:37:37 -0400
X-MC-Unique: bxdpnZAENXSdDw-JwXyjdA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8AC46801107;
 Thu,  3 Jun 2021 00:37:36 +0000 (UTC)
Received: from scv.redhat.com (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CA4CA10013D6;
 Thu,  3 Jun 2021 00:37:35 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 13/19] scripts/qom-fuse: use QOMCommand.qom_list()
Date: Wed,  2 Jun 2021 20:37:13 -0400
Message-Id: <20210603003719.1321369-14-jsnow@redhat.com>
In-Reply-To: <20210603003719.1321369-1-jsnow@redhat.com>
References: <20210603003719.1321369-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>,
 "Niteesh G . S ." <niteesh.gs@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

the qom_list method provides a type-safe object that's easier to type
check, so switch to using it.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qmp/qom-fuse | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/scripts/qmp/qom-fuse b/scripts/qmp/qom-fuse
index 1676fb78d99..703a97e75ff 100755
--- a/scripts/qmp/qom-fuse
+++ b/scripts/qmp/qom-fuse
@@ -94,7 +94,7 @@ class QOMFuse(QOMCommand, Operations):
     def is_object(self, path):
         """Is the given QOM path an object?"""
         try:
-            self.qmp.command('qom-list', path=path)
+            self.qom_list(path)
             return True
         except QMPResponseError:
             return False
@@ -105,8 +105,8 @@ class QOMFuse(QOMCommand, Operations):
         if path == '':
             path = '/'
         try:
-            for item in self.qmp.command('qom-list', path=path):
-                if item['name'] == prop:
+            for item in self.qom_list(path):
+                if item.name == prop:
                     return True
             return False
         except QMPResponseError:
@@ -118,11 +118,9 @@ class QOMFuse(QOMCommand, Operations):
         if path == '':
             path = '/'
         try:
-            for item in self.qmp.command('qom-list', path=path):
-                if item['name'] == prop:
-                    if item['type'].startswith('link<'):
-                        return True
-                    return False
+            for item in self.qom_list(path):
+                if item.name == prop and item.link:
+                    return True
             return False
         except QMPResponseError:
             return False
@@ -200,8 +198,8 @@ class QOMFuse(QOMCommand, Operations):
     def readdir(self, path, fh):
         yield '.'
         yield '..'
-        for item in self.qmp.command('qom-list', path=path):
-            yield str(item['name'])
+        for item in self.qom_list(path):
+            yield item.name
 
 
 if __name__ == '__main__':
-- 
2.31.1



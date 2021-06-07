Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED3139E81E
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 22:11:27 +0200 (CEST)
Received: from localhost ([::1]:35260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqLao-0003dS-G1
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 16:11:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lqLWr-0003qv-CD
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 16:07:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lqLWo-0006Rc-2e
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 16:07:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623096437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fzogaGZiY6L5dMlPB022TbNiw/6llfUwVWUlRX8W6+A=;
 b=IzgdBaLG/SHYYDgNv5+aAF1mRu/4ECKJkAy7FmqacY5opUfNYmO6KG/8TJJI7Pw0NlQeT9
 wg2SyiC/43ZHpYinNzBw/8/Kh4Zh5BE4sVkNrx413AzARJWXi2372ILZ9BZRay4aU1eBXw
 C+M2E/J5coEgfUzMkl7rKiMpGn15Nyg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-508-1Skylt3TPoiReoG-hqYR1A-1; Mon, 07 Jun 2021 16:07:16 -0400
X-MC-Unique: 1Skylt3TPoiReoG-hqYR1A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE30D804028;
 Mon,  7 Jun 2021 20:06:58 +0000 (UTC)
Received: from scv.redhat.com (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2B5745C1C2;
 Mon,  7 Jun 2021 20:06:58 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/42] scripts/qmp-shell: use @classmethod where appropriate
Date: Mon,  7 Jun 2021 16:06:14 -0400
Message-Id: <20210607200649.1840382-8-jsnow@redhat.com>
In-Reply-To: <20210607200649.1840382-1-jsnow@redhat.com>
References: <20210607200649.1840382-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
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
Cc: "Niteesh G . S ." <niteesh.gs@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Methods with no self-use should belong to the class.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qmp/qmp-shell | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/qmp/qmp-shell b/scripts/qmp/qmp-shell
index ae3f04534a..f354549bf2 100755
--- a/scripts/qmp/qmp-shell
+++ b/scripts/qmp/qmp-shell
@@ -97,7 +97,8 @@ class FuzzyJSON(ast.NodeTransformer):
     '''This extension of ast.NodeTransformer filters literal "true/false/null"
     values in an AST and replaces them by proper "True/False/None" values that
     Python can properly evaluate.'''
-    def visit_Name(self, node):
+    @classmethod
+    def visit_Name(cls, node):
         if node.id == 'true':
             node.id = 'True'
         if node.id == 'false':
@@ -152,7 +153,8 @@ class QMPShell(qmp.QEMUMonitorProtocol):
         except Exception as e:
             print("Failed to save history file '%s'; %s" % (self._histfile, e))
 
-    def __parse_value(self, val):
+    @classmethod
+    def __parse_value(cls, val):
         try:
             return int(val)
         except ValueError:
-- 
2.31.1



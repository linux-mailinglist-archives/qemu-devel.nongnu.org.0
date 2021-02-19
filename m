Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D585831F944
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 13:17:12 +0100 (CET)
Received: from localhost ([::1]:55022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD4id-0002jc-O0
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 07:17:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lD4WR-0007OD-2Q
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 07:04:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51268)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lD4WN-00020B-80
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 07:04:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613736270;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d5aZXwJENFcekaM+T5aWVIFJFf0+ushP1LyNIzvHhik=;
 b=dVtEsF++QHMkv4IiJSMhxkcto8ykjJOrlo/2lKl6ywkhECWpqMyvdf9q//LnJkVYm6SO8N
 +yP2v/mDPzvBgzdqhmZqpalCPTKewiP8FTGJL8FiTrj1grAu6c9/twjHW+3dvuUAHq8gOO
 numHtl/3rJSNcDlvxPHN2JEhpu+AHm4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-ocHUdv2nNxeILEju-KOyYQ-1; Fri, 19 Feb 2021 07:04:27 -0500
X-MC-Unique: ocHUdv2nNxeILEju-KOyYQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6F550C291;
 Fri, 19 Feb 2021 12:04:26 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-79.ams2.redhat.com
 [10.36.115.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 292235D6AD;
 Fri, 19 Feb 2021 12:04:26 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1425A1132C29; Fri, 19 Feb 2021 13:04:23 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/18] qapi/introspect.py: guard against ifcond/comment misuse
Date: Fri, 19 Feb 2021 13:04:09 +0100
Message-Id: <20210219120422.600850-6-armbru@redhat.com>
In-Reply-To: <20210219120422.600850-1-armbru@redhat.com>
References: <20210219120422.600850-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Snow <jsnow@redhat.com>

_tree_to_qlit is called recursively on dict values (isolated from their
keys); at such a point in generating output it is too late to apply an
ifcond. Similarly, comments do not necessarily have a "tidy" place they
can be printed in such a circumstance.

Forbid this usage by renaming "suppress_first_indent" to "dict_value" to
emphasize that indents are suppressed only for the benefit of dict
values; then add an assertion assuring we do not pass ifcond/comments
in this case.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-Id: <20210216021809.134886-6-jsnow@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
[Comment wrapped to conform to PEP 8]
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/introspect.py | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
index 4749f65ea3..a111cec725 100644
--- a/scripts/qapi/introspect.py
+++ b/scripts/qapi/introspect.py
@@ -34,7 +34,7 @@ def _make_tree(obj, ifcond, extra=None):
     return obj
 
 
-def _tree_to_qlit(obj, level=0, suppress_first_indent=False):
+def _tree_to_qlit(obj, level=0, dict_value=False):
 
     def indent(level):
         return level * 4 * ' '
@@ -43,6 +43,13 @@ def indent(level):
         ifobj, extra = obj
         ifcond = extra.get('if')
         comment = extra.get('comment')
+
+        # NB: _tree_to_qlit is called recursively on the values of a
+        # key:value pair; those values can't be decorated with
+        # comments or conditionals.
+        msg = "dict values cannot have attached comments or if-conditionals."
+        assert not dict_value, msg
+
         ret = ''
         if comment:
             ret += indent(level) + '/* %s */\n' % comment
@@ -54,7 +61,7 @@ def indent(level):
         return ret
 
     ret = ''
-    if not suppress_first_indent:
+    if not dict_value:
         ret += indent(level)
     if obj is None:
         ret += 'QLIT_QNULL'
-- 
2.26.2



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FBC36FB5F
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 15:21:13 +0200 (CEST)
Received: from localhost ([::1]:42714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcT4y-0005CG-5m
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 09:21:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lcRdf-00032u-UN
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 07:48:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49341)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lcRdX-0007al-Ry
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 07:48:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619783323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o07Ko4c+6YGB5mkVzUKZPLsPwNfzYAk8soOZvFri+tk=;
 b=OhnrV3h+xJv/Pwbq5w5DWzjSSAAK8A6IJSdhWAb1sSz3Pze/wHo2o45hLr/tbvsG3BzjgH
 6ms+2eTbpCDSR/PdG4QpULgqhKSjtkeRjIRmKyrd9QOooW/AkwsLQVyiP8s4Qs8aAsKwz3
 F2wMMzrLZWd8HZD+Ps/9RR2y/aYEgi0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-593-YVPYvokQPAuF33NvuLWJNg-1; Fri, 30 Apr 2021 07:48:41 -0400
X-MC-Unique: YVPYvokQPAuF33NvuLWJNg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2954618B614F;
 Fri, 30 Apr 2021 11:48:40 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E92172AC86;
 Fri, 30 Apr 2021 11:48:39 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 71E19113525F; Fri, 30 Apr 2021 13:48:38 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/25] qapi/expr.py: Remove 'info' argument from nested
 check_if_str
Date: Fri, 30 Apr 2021 13:48:15 +0200
Message-Id: <20210430114838.2912740-3-armbru@redhat.com>
In-Reply-To: <20210430114838.2912740-1-armbru@redhat.com>
References: <20210430114838.2912740-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: peter.maydell@linaro.org, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Snow <jsnow@redhat.com>

The function can just use the argument from the scope above. Otherwise,
we get shadowed argument errors because the parameter name clashes with
the name of a variable already in-scope.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Cleber Rosa <crosa@redhat.com>
Message-Id: <20210421182032.3521476-3-jsnow@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/expr.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index c207481f7e..3fda5d5082 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -122,7 +122,7 @@ def check_flags(expr, info):
 
 def check_if(expr, info, source):
 
-    def check_if_str(ifcond, info):
+    def check_if_str(ifcond):
         if not isinstance(ifcond, str):
             raise QAPISemError(
                 info,
@@ -142,9 +142,9 @@ def check_if_str(ifcond, info):
             raise QAPISemError(
                 info, "'if' condition [] of %s is useless" % source)
         for elt in ifcond:
-            check_if_str(elt, info)
+            check_if_str(elt)
     else:
-        check_if_str(ifcond, info)
+        check_if_str(ifcond)
         expr['if'] = [ifcond]
 
 
-- 
2.26.3



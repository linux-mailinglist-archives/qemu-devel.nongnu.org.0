Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A3E36FB46
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 15:12:36 +0200 (CEST)
Received: from localhost ([::1]:46560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcSwd-0003DO-KW
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 09:12:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lcRdb-0002rO-1T
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 07:48:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40298)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lcRdX-0007cA-NN
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 07:48:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619783325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eymAHEgkCoZvQ1D+5sgN3VhJ4eH7mJzsbVWC1uQa1U8=;
 b=F08/c6UMoFSHVVLBmNaEd+9UFR4FgWSVzUhkdGKZYRL2EXjSAnkjKL5802rm7RSkOttdLU
 6LvpsLa10curRbQrmhzA7sE7cR1/4xI3wVFtEkvvfsm4NQ3fOJEoktTitKm39Lpt1DulhJ
 wQONssLS9uTuHjLXbnwm4ltslDQ+OwM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-235-CyeKmX5NMSuVbkWmasc_jg-1; Fri, 30 Apr 2021 07:48:42 -0400
X-MC-Unique: CyeKmX5NMSuVbkWmasc_jg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E51188015BA;
 Fri, 30 Apr 2021 11:48:41 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B79C82B431;
 Fri, 30 Apr 2021 11:48:41 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A248D1129C42; Fri, 30 Apr 2021 13:48:38 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/25] qapi/expr: Only explicitly prohibit 'Kind' nor 'List'
 for type names
Date: Fri, 30 Apr 2021 13:48:27 +0200
Message-Id: <20210430114838.2912740-15-armbru@redhat.com>
In-Reply-To: <20210430114838.2912740-1-armbru@redhat.com>
References: <20210430114838.2912740-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Cc: peter.maydell@linaro.org, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Snow <jsnow@redhat.com>

Per list review: qapi-code-gen.txt reserves suffixes Kind and
List only for type names, but the code rejects them for events and
commands, too.

It turns out we reject them earlier anyway: In check_name_upper() for
event names, and in check_name_lower() for command names.

Still, adjust the code for clarity over what precisely we are guarding
against.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-Id: <20210421182032.3521476-15-jsnow@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/expr.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index 5e4d5f80aa..c33caf00d9 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -95,9 +95,9 @@ def check_defn_name_str(name: str, info: QAPISourceInfo, meta: str) -> None:
             permit_underscore=name in info.pragma.command_name_exceptions)
     else:
         check_name_camel(name, info, meta)
-    if name.endswith('Kind') or name.endswith('List'):
-        raise QAPISemError(
-            info, "%s name should not end in '%s'" % (meta, name[-4:]))
+        if name.endswith('Kind') or name.endswith('List'):
+            raise QAPISemError(
+                info, "%s name should not end in '%s'" % (meta, name[-4:]))
 
 
 def check_keys(value: _JSONObject,
-- 
2.26.3



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3201400605
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 21:42:32 +0200 (CEST)
Received: from localhost ([::1]:59644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMF55-0003aa-QB
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 15:42:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mMEvF-0005m6-PQ
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 15:32:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mMEvE-0003ce-9Z
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 15:32:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630697539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cqzg3QShsv1X3+eJHDQvZpPcUHEcgUbT+6Jz1uoMu9w=;
 b=BnwWp5AIp7GO4LlyCkAlQtPyTtneZtpBTVD8vEQZuH/58S6m9HhINL/k3f47qcjXu6B7mE
 tBhjtYJUL3m+riQSsdVttZgP+E2WwOJOMEtWmOG5IqMJ+ysxRFvWY8In8/NlQdtRnhY/JX
 DCDJQB/dt+NGyPX+yQDMk1LNxY4+l1Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-515-d02UjkDLNv-E3TeMRNzOUw-1; Fri, 03 Sep 2021 15:32:18 -0400
X-MC-Unique: d02UjkDLNv-E3TeMRNzOUw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5DFED84A5E8;
 Fri,  3 Sep 2021 19:32:17 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-13.ams2.redhat.com
 [10.36.112.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D85A19C59;
 Fri,  3 Sep 2021 19:32:17 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id EC54311380C3; Fri,  3 Sep 2021 21:32:09 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/13] qapi: Use re.fullmatch() where appropriate
Date: Fri,  3 Sep 2021 21:32:06 +0200
Message-Id: <20210903193209.1426791-11-armbru@redhat.com>
In-Reply-To: <20210903193209.1426791-1-armbru@redhat.com>
References: <20210903193209.1426791-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20210831123809.1107782-10-armbru@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 scripts/qapi/expr.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index 019f4c97aa..9e2aa1d43a 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -275,7 +275,7 @@ def check_if(expr: _JSONObject, info: QAPISourceInfo, source: str) -> None:
 
     def _check_if(cond: Union[str, object]) -> None:
         if isinstance(cond, str):
-            if not re.match(r'^[A-Z][A-Z0-9_]*$', cond):
+            if not re.fullmatch(r'[A-Z][A-Z0-9_]*', cond):
                 raise QAPISemError(
                     info,
                     "'if' condition '%s' of %s is not a valid identifier"
-- 
2.31.1



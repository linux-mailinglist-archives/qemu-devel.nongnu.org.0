Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 094FF3FC7C6
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 15:02:13 +0200 (CEST)
Received: from localhost ([::1]:46928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL3P1-0004to-ON
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 09:02:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mL320-0006Bz-Lw
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 08:38:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mL31t-0005H8-SX
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 08:38:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630413497;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yFEDXDp0O25wsKpIqB8UamfFaX89vtmvEvtMEieyWZQ=;
 b=Vp/CRhdVpK20dUIw+ucnzgcjBXeESp/AmAtpKWn98qqCRaKe6oAKNW59i9629CfcQnS8C0
 /mlSPCE9FJPs+ILFzGNHIVI2rT3FvPXZzrawa+x8E/WC/Y2CR86pcGHeSpE+zTiw0Fm9d+
 I0hwFTGnw59MBe9Z8B/GXzujNsaKe88=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-57-Mk-k26aHO3GgDwHGvuvhZw-1; Tue, 31 Aug 2021 08:38:15 -0400
X-MC-Unique: Mk-k26aHO3GgDwHGvuvhZw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B9D4587D544;
 Tue, 31 Aug 2021 12:38:14 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-4.ams2.redhat.com [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C16C55C1A1;
 Tue, 31 Aug 2021 12:38:10 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5D3CD11380AB; Tue, 31 Aug 2021 14:38:09 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/12] qapi: Simplify how QAPISchemaIfCond represents "no
 condition"
Date: Tue, 31 Aug 2021 14:37:59 +0200
Message-Id: <20210831123809.1107782-3-armbru@redhat.com>
In-Reply-To: <20210831123809.1107782-1-armbru@redhat.com>
References: <20210831123809.1107782-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
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
Cc: marcandre.lureau@redhat.com, jsnow@redhat.com, michael.roth@amd.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

None works fine, there is no need to replace it by {} in .__init__().

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/common.py | 4 ++--
 scripts/qapi/schema.py | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
index 1724ac32db..1c1dc87ccb 100644
--- a/scripts/qapi/common.py
+++ b/scripts/qapi/common.py
@@ -200,7 +200,7 @@ def guardend(name: str) -> str:
                  name=c_fname(name).upper())
 
 
-def cgen_ifcond(ifcond: Union[str, Dict[str, Any]]) -> str:
+def cgen_ifcond(ifcond: Optional[Union[str, Dict[str, Any]]]) -> str:
     if not ifcond:
         return ''
     if isinstance(ifcond, str):
@@ -214,7 +214,7 @@ def cgen_ifcond(ifcond: Union[str, Dict[str, Any]]) -> str:
     return '(' + (') ' + oper + ' (').join(operands) + ')'
 
 
-def docgen_ifcond(ifcond: Union[str, Dict[str, Any]]) -> str:
+def docgen_ifcond(ifcond: Optional[Union[str, Dict[str, Any]]]) -> str:
     # TODO Doc generated for conditions needs polish
     if not ifcond:
         return ''
diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index 1451cdec81..3d72c7dfc9 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -34,7 +34,7 @@
 
 class QAPISchemaIfCond:
     def __init__(self, ifcond=None):
-        self.ifcond = ifcond or {}
+        self.ifcond = ifcond
 
     def _cgen(self):
         return cgen_ifcond(self.ifcond)
-- 
2.31.1



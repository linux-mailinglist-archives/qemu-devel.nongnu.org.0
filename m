Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9EC3FC800
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 15:16:45 +0200 (CEST)
Received: from localhost ([::1]:52564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL3d6-0004bE-Hc
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 09:16:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mL324-0006Kl-4g
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 08:38:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mL320-0005Id-1N
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 08:38:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630413501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ovxuR2ah9yPcxyn+fEI8RTgztaORi1wQSRvQawOSfFM=;
 b=I/HqateZgyzvAILzkOb3xC+XCgo5KgDLegWp2RcqFdVrLPGBZK/bEEfAeQXB1muGzWhUG1
 Ctlq7ZOoxp2TcpX5nzEz8JkNjKk4mQzqPCG/Z+L1ab6js+kM2caNyFFxaYPtwIntw6DL0m
 zGWel8lGSFZ/AxnsWLNmiGz9wefbdiw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-461-udoH1j5kM6CTX410LZhA6w-1; Tue, 31 Aug 2021 08:38:20 -0400
X-MC-Unique: udoH1j5kM6CTX410LZhA6w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 751F8101C8A8;
 Tue, 31 Aug 2021 12:38:19 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-4.ams2.redhat.com [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 839211001281;
 Tue, 31 Aug 2021 12:38:16 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7459811380C3; Tue, 31 Aug 2021 14:38:09 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/12] qapi: Use re.fullmatch() where appropriate
Date: Tue, 31 Aug 2021 14:38:06 +0200
Message-Id: <20210831123809.1107782-10-armbru@redhat.com>
In-Reply-To: <20210831123809.1107782-1-armbru@redhat.com>
References: <20210831123809.1107782-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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

Signed-off-by: Markus Armbruster <armbru@redhat.com>
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



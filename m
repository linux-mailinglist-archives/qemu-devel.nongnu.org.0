Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C1A36FAEC
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 14:51:43 +0200 (CEST)
Received: from localhost ([::1]:47896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcScP-000587-Vn
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 08:51:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lcRdj-0003BZ-Dv
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 07:48:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33391)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lcRda-0007f1-55
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 07:48:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619783329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dvzxiwWIiJfK3zjc8szVz6zobSb0IjOU8jD+7ZTfsCE=;
 b=ckMwK3ayMx8gTClgEYXzylLve/3u8/9roJyAmebcCX3Ii4rFYKtGRc6SMhSGzWUxTJonPh
 NPOJUnl/WSbcDD5FKA+JA4/cTyXcsX8JIsv97oPALZRptKCxLQw6JKXGxE9cvlCtjvRrDy
 dhokCh+JikznhUcnstFHXf7Rq605Gq4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-uFMdQoc2O7653-zGwOoU4w-1; Fri, 30 Apr 2021 07:48:44 -0400
X-MC-Unique: uFMdQoc2O7653-zGwOoU4w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6ABD68015D5;
 Fri, 30 Apr 2021 11:48:43 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3BAC013470;
 Fri, 30 Apr 2021 11:48:43 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C216C112683F; Fri, 30 Apr 2021 13:48:38 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 21/25] qapi/error: assert QAPISourceInfo is not None
Date: Fri, 30 Apr 2021 13:48:34 +0200
Message-Id: <20210430114838.2912740-22-armbru@redhat.com>
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

Built-in stuff is not parsed from a source file, and therefore have no
QAPISourceInfo. If such None info was used for reporting an error,
built-in stuff would be broken. Programming error. Instead of reporting
a confusing error with bogus source location then, we better crash.

We currently crash only if self.col was set. Assert that self.info is
not None in order to crash reliably.

We can not yet change the type of the initializer to prove this cannot
happen at static analysis time before the remainder of the code is fully
typed.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-Id: <20210421192233.3542904-5-jsnow@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/error.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/qapi/error.py b/scripts/qapi/error.py
index d179a3bd0c..d0bc7af6e7 100644
--- a/scripts/qapi/error.py
+++ b/scripts/qapi/error.py
@@ -25,6 +25,7 @@ def __init__(self, info, msg, col=None):
         self.col = col
 
     def __str__(self):
+        assert self.info is not None
         loc = str(self.info)
         if self.col is not None:
             assert self.info.line is not None
-- 
2.26.3



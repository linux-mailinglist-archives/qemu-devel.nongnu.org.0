Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 648B536FA8F
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 14:40:18 +0200 (CEST)
Received: from localhost ([::1]:41744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcSRN-0007di-FN
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 08:40:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lcRdh-00037X-Gy
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 07:48:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lcRdZ-0007ds-6r
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 07:48:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619783328;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wHf/VdPlxT2GIRzl59Pi/M0q/6maniPpxRB8d3ulxfI=;
 b=XQiz24QsoFAnL8Eigqf+PPl5ST9XTFk6rxRkxmjs/Z1x0fNVCne90Y4bvAVIE1wUu2z/FD
 /FawXFLAuzJGVjqQ2SEpcoqtpCEXo3Refu9EMi+lalvyFK/OEdqBVQmwJcUdwWn/o4849h
 /qo656ZC6ztE4dRO15rRAbGyvEk2d0w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-GIl8nf3zOuqTQY4AX8NfaQ-1; Fri, 30 Apr 2021 07:48:44 -0400
X-MC-Unique: GIl8nf3zOuqTQY4AX8NfaQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B238107ACCA;
 Fri, 30 Apr 2021 11:48:43 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C3901724C;
 Fri, 30 Apr 2021 11:48:43 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B707411268B9; Fri, 30 Apr 2021 13:48:38 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 19/25] qapi/error: Use Python3-style super()
Date: Fri, 30 Apr 2021 13:48:32 +0200
Message-Id: <20210430114838.2912740-20-armbru@redhat.com>
In-Reply-To: <20210430114838.2912740-1-armbru@redhat.com>
References: <20210430114838.2912740-1-armbru@redhat.com>
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

Missed in commit 2cae67bcb5 "qapi: Use super() now we have Python 3".

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20210421192233.3542904-3-jsnow@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/error.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/qapi/error.py b/scripts/qapi/error.py
index 126dda7c9b..38bd7c4dd6 100644
--- a/scripts/qapi/error.py
+++ b/scripts/qapi/error.py
@@ -19,7 +19,7 @@ class QAPIError(Exception):
 class QAPISourceError(QAPIError):
     """Error class for all exceptions identifying a source location."""
     def __init__(self, info, col, msg):
-        Exception.__init__(self)
+        super().__init__()
         self.info = info
         self.col = col
         self.msg = msg
-- 
2.26.3



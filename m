Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8E63140A4
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 21:39:21 +0100 (CET)
Received: from localhost ([::1]:34752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9DJY-00037S-KG
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 15:39:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l974K-0005Yo-8l
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:59:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32180)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l9741-0001ay-TP
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:59:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612792731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K+zZxFJBxSuX2L1RklS9OZOEZLEKu47kVzsHNkiWi1A=;
 b=BJK0onBBS2zx+D3PFWKgH3ZDX6LcnZWJLDui5kmkfWOEMOJMuLpu2oa76hF9EFs/vbNzL4
 vRDB9zstfdL+XplUpNH8ERqf3SxtFqdgh/OXLM6NeNyRL0kAnbcoUWRYMPy87ZkFefD9b9
 Z+uGFB+lKX8u25vfgiAEVTmSBtbyqdM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-372-Vtzb6BXuMJWTy1goZdToZw-1; Mon, 08 Feb 2021 08:58:49 -0500
X-MC-Unique: Vtzb6BXuMJWTy1goZdToZw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 123C979EC1;
 Mon,  8 Feb 2021 13:58:48 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-51.ams2.redhat.com
 [10.36.115.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C2B5060C5B;
 Mon,  8 Feb 2021 13:58:47 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 53CBF1138468; Mon,  8 Feb 2021 14:58:46 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/16] qapi/main: handle theoretical None-return from re.match()
Date: Mon,  8 Feb 2021 14:58:33 +0100
Message-Id: <20210208135846.3707170-4-armbru@redhat.com>
In-Reply-To: <20210208135846.3707170-1-armbru@redhat.com>
References: <20210208135846.3707170-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Mypy cannot understand that this match can never be None, so help it
along.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-Id: <20210201193747.2169670-4-jsnow@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/main.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/qapi/main.py b/scripts/qapi/main.py
index 42517210b8..703e7ed1ed 100644
--- a/scripts/qapi/main.py
+++ b/scripts/qapi/main.py
@@ -23,6 +23,8 @@ from .visit import gen_visit
 
 def invalid_prefix_char(prefix: str) -> Optional[str]:
     match = re.match(r'([A-Za-z_.-][A-Za-z0-9_.-]*)?', prefix)
+    # match cannot be None, but mypy cannot infer that.
+    assert match is not None
     if match.end() != len(prefix):
         return prefix[match.end()]
     return None
-- 
2.26.2



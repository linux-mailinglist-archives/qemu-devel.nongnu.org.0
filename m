Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECBE6314096
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 21:36:48 +0100 (CET)
Received: from localhost ([::1]:58066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9DH6-0000rR-0m
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 15:36:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l974P-0005aL-GG
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:59:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l9742-0001bg-O2
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:59:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612792732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=khCllIMP/ACv1T2pzzgNjXzZkeedFtC3A0NdwPR9SaU=;
 b=cDvigjDXCROgJ6w1neL6pXrk3tMMsRvbW674vFHMt9mp5uvyCKaQzABPCX0mjThf9bp9gE
 PHicEdZiuYoOG1eSGVank3GdrPH5CwfZQQVw6WE+Z5KD9w1thfnUzN2F2XDmMvXSuE+Z3y
 ijgTrwkLZdTt9GNKQuYYYoV5W2OX4Us=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-315-6ehSXJclO5C8WiiO50swbQ-1; Mon, 08 Feb 2021 08:58:50 -0500
X-MC-Unique: 6ehSXJclO5C8WiiO50swbQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B74C8801965;
 Mon,  8 Feb 2021 13:58:49 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-51.ams2.redhat.com
 [10.36.115.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 87F6660C05;
 Mon,  8 Feb 2021 13:58:49 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 86A5C11326AE; Mon,  8 Feb 2021 14:58:46 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/16] qapi/gen: Drop support for QAPIGen without a file name
Date: Mon,  8 Feb 2021 14:58:44 +0100
Message-Id: <20210208135846.3707170-15-armbru@redhat.com>
In-Reply-To: <20210208135846.3707170-1-armbru@redhat.com>
References: <20210208135846.3707170-1-armbru@redhat.com>
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
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

The previous commit removed the only user of QAPIGen(None).  Tighten
the type hint.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: John Snow <jsnow@redhat.com>
Message-Id: <20210201193747.2169670-15-jsnow@redhat.com>
---
 scripts/qapi/gen.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
index a0a5df333e..ac3d3e687e 100644
--- a/scripts/qapi/gen.py
+++ b/scripts/qapi/gen.py
@@ -40,7 +40,7 @@ from .source import QAPISourceInfo
 
 
 class QAPIGen:
-    def __init__(self, fname: Optional[str]):
+    def __init__(self, fname: str):
         self.fname = fname
         self._preamble = ''
         self._body = ''
@@ -125,7 +125,7 @@ def build_params(arg_type: Optional[QAPISchemaObjectType],
 
 
 class QAPIGenCCode(QAPIGen):
-    def __init__(self, fname: Optional[str]):
+    def __init__(self, fname: str):
         super().__init__(fname)
         self._start_if: Optional[Tuple[List[str], str, str]] = None
 
-- 
2.26.2



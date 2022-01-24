Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6D8498839
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 19:23:04 +0100 (CET)
Received: from localhost ([::1]:46860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC3zb-0001WJ-Jy
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 13:23:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nC3k0-0001fB-MF
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 13:06:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nC3jz-0006w9-4t
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 13:06:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643047614;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A/mTcAI+E9s1ILNVU06TWCJz0PZeCT3M7YC3ZqPyCj8=;
 b=T4IQPRM/f9xMgrcTf1RDjzjv8k0RhHyYqCTxEzwUQnaPibwqVAeeeQM4Z6D7bCEEbTR8Oi
 Cu63s9b5FL2KuEgRMI3bVFaQ8EZJ/V2AjPH0TT+nC3lSnty4R+RaF6WprrI8VyW9wkvtkX
 8Jajp2C/01PevpASsn7OJFQT50rL27s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-436-mJr6ICmgM4OKY9e7Z560pw-1; Mon, 24 Jan 2022 13:06:51 -0500
X-MC-Unique: mJr6ICmgM4OKY9e7Z560pw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F11EB1091DA1;
 Mon, 24 Jan 2022 18:06:49 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.35.175])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3AF38798D3;
 Mon, 24 Jan 2022 18:06:44 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/4] python/aqmp: Fix negotiation with pre-"oob" QEMU
Date: Mon, 24 Jan 2022 13:06:23 -0500
Message-Id: <20220124180626.627718-2-jsnow@redhat.com>
In-Reply-To: <20220124180626.627718-1-jsnow@redhat.com>
References: <20220124180626.627718-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, Beraldo Leal <bleal@redhat.com>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QEMU versions prior to the "oob" capability *also* can't accept the
"enable" keyword argument at all. Fix the handshake process with older
QEMU versions.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/aqmp/qmp_client.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/python/qemu/aqmp/qmp_client.py b/python/qemu/aqmp/qmp_client.py
index f1a845cc82..90a8737f03 100644
--- a/python/qemu/aqmp/qmp_client.py
+++ b/python/qemu/aqmp/qmp_client.py
@@ -292,9 +292,9 @@ async def _negotiate(self) -> None:
         """
         self.logger.debug("Negotiating capabilities ...")
 
-        arguments: Dict[str, List[str]] = {'enable': []}
+        arguments: Dict[str, List[str]] = {}
         if self._greeting and 'oob' in self._greeting.QMP.capabilities:
-            arguments['enable'].append('oob')
+            arguments.setdefault('enable', []).append('oob')
         msg = self.make_execute_msg('qmp_capabilities', arguments=arguments)
 
         # It's not safe to use execute() here, because the reader/writers
-- 
2.31.1



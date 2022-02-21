Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30EEE4BED54
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 23:43:28 +0100 (CET)
Received: from localhost ([::1]:38248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMHOx-0003Ef-9S
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 17:43:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nMHGK-0008C0-DS
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 17:34:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nMHGI-00089b-Mk
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 17:34:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645482870;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wLfz01wC3qkv7LcbmuJF6x6zBmJu3obwnjhJSdnK5+M=;
 b=ec4sRwK2vDNvL8rOD3TBoYQxmSsGC+no9h7qerCwZZXfZleQ81MDKcyBeDmnQYsh1hL7pQ
 88Lvielv39uDUGqg9svUi4EK/h7fozwRSMvR0qzjp6UpOjS/ZHLDARyLjt8y/BJzAJDWjx
 /7x2DZ1KvWcn+gCwz8kXl43aapVe3kk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-193-kALe-HRCMOWamuyyrLA1yw-1; Mon, 21 Feb 2022 17:34:27 -0500
X-MC-Unique: kALe-HRCMOWamuyyrLA1yw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EAA2E801ADB;
 Mon, 21 Feb 2022 22:34:25 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DC2051038AAF;
 Mon, 21 Feb 2022 22:34:24 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/18] iotests: use qemu_img_json() when applicable
Date: Mon, 21 Feb 2022 17:34:02 -0500
Message-Id: <20220221223413.2123003-8-jsnow@redhat.com>
In-Reply-To: <20220221223413.2123003-1-jsnow@redhat.com>
References: <20220221223413.2123003-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-block@nongnu.org, Eric Blake <eblake@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These functions should now give better crash information when something
unexpected happens.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/iotests.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 1e6947b893b..fc0d054e129 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -344,11 +344,11 @@ def qemu_img_json(*args: str) -> Any:
         json_data = json.loads(res.stdout)
     return json_data
 
-def qemu_img_measure(*args):
-    return json.loads(qemu_img_pipe("measure", "--output", "json", *args))
+def qemu_img_measure(*args: str) -> Any:
+    return qemu_img_json("measure", "--output", "json", *args)
 
-def qemu_img_check(*args):
-    return json.loads(qemu_img_pipe("check", "--output", "json", *args))
+def qemu_img_check(*args: str) -> Any:
+    return qemu_img_json("check", "--output", "json", *args)
 
 def qemu_img_pipe(*args: str) -> str:
     '''Run qemu-img and return its output'''
-- 
2.34.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 935E42DB69E
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 23:45:04 +0100 (CET)
Received: from localhost ([::1]:58998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpJ43-00014L-Fa
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 17:45:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kpJ1E-0007Qy-8Y
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 17:42:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kpJ0x-00073B-Gk
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 17:42:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608072110;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WRK3ASZJ9AJJN/7E7ETacVX5syK9T+YiSHqFgmKQQ2w=;
 b=K5pOD7zIlPinFihl/M2e42DLGJHHL3NxSwsyb6aTQqOU60pNmOjuNigkXhz9wk8LlLtIwz
 IJY6j8C+ARkGzBSa+8yUD51YX9dksmsAyHeh5vPSLtElygvp1TsETt+qpqxUU2bp6ZbVWc
 ffGVEdHZ2a+UM2y1X//MYeDG82raugk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-525-Hh5a_etnNAiknweNXFwPBg-1; Tue, 15 Dec 2020 17:41:49 -0500
X-MC-Unique: Hh5a_etnNAiknweNXFwPBg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2C5EA107ACF5;
 Tue, 15 Dec 2020 22:41:48 +0000 (UTC)
Received: from localhost (ovpn-115-226.rdu2.redhat.com [10.10.115.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AD68C704DA;
 Tue, 15 Dec 2020 22:41:44 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
Subject: [PATCH 2/2] qom: Assert that objects being destroyed have no parent
Date: Tue, 15 Dec 2020 17:41:33 -0500
Message-Id: <20201215224133.3545901-3-ehabkost@redhat.com>
In-Reply-To: <20201215224133.3545901-1-ehabkost@redhat.com>
References: <20201215224133.3545901-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QOM reference counting bugs are often hard to detect, but there's
one kind of bug that's easier: if we are freeing an object but is
still attached to a parent, it means the reference count is wrong
(because the parent always hold a reference to their children).

Add an assertion to make sure we detect those cases.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 qom/object.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/qom/object.c b/qom/object.c
index f2ae6e6b2a..5cfed6d7c6 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -685,6 +685,7 @@ static void object_finalize(void *data)
     object_deinit(obj, ti);
 
     g_assert(obj->ref == 0);
+    g_assert(obj->parent == NULL);
     if (obj->free) {
         obj->free(obj);
     }
-- 
2.28.0



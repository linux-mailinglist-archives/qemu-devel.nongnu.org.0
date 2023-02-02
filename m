Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D03466883AF
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 17:07:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNc7g-0007Fx-If; Thu, 02 Feb 2023 11:07:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNc7D-00073M-Uy
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 11:07:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNc78-0004zw-SJ
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 11:07:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675354026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4tyAthjyAJfKR2wxZiLS098ns/1BTHiWpLuviegbRVQ=;
 b=Y4sJ1Rv17oE47f80CAc/AiH298w1h823ueUlCMSxbxbeMAfijtSCPwIwdU+EaJowyQaa+O
 xk9nBHCkyjVNWqsCcFsACr+G2DCIwUGDRtz/9SsW/Ew9LXuPQIIIhB+7A8F9+A/D1pTkJz
 kgonpgVuo7Es2sX+wyB4XtklUFvsCQk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-549-L3xXIx-LNb2s_CSQm-VjVA-1; Thu, 02 Feb 2023 11:07:03 -0500
X-MC-Unique: L3xXIx-LNb2s_CSQm-VjVA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7AB593C4220D;
 Thu,  2 Feb 2023 16:06:51 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 94F6E51E5;
 Thu,  2 Feb 2023 16:06:46 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Coiby Xu <Coiby.Xu@gmail.com>, Eric Farman <farman@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, Eric Blake <eblake@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 John Snow <jsnow@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-s390x@nongnu.org, Peter Xu <peterx@redhat.com>, qemu-stable@nongnu.org
Subject: [PULL 01/26] migration: Fix migration crash when target psize larger
 than host
Date: Thu,  2 Feb 2023 17:06:15 +0100
Message-Id: <20230202160640.2300-2-quintela@redhat.com>
In-Reply-To: <20230202160640.2300-1-quintela@redhat.com>
References: <20230202160640.2300-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Peter Xu <peterx@redhat.com>

Commit d9e474ea56 overlooked the case where the target psize is even larger
than the host psize.  One example is Alpha has 8K page size and migration
will start to crash the source QEMU when running Alpha migration on x86.

Fix it by detecting that case and set host start/end just to cover the
single page to be migrated.

This will slightly optimize the common case where host psize equals to
guest psize so we don't even need to do the roundups, but that's trivial.

Cc: qemu-stable@nongnu.org
Reported-by: Thomas Huth <thuth@redhat.com>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1456
Fixes: d9e474ea56 ("migration: Teach PSS about host page")
Signed-off-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 334309f1c6..68a45338e3 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2319,8 +2319,25 @@ static void pss_host_page_prepare(PageSearchStatus *pss)
     size_t guest_pfns = qemu_ram_pagesize(pss->block) >> TARGET_PAGE_BITS;
 
     pss->host_page_sending = true;
-    pss->host_page_start = ROUND_DOWN(pss->page, guest_pfns);
-    pss->host_page_end = ROUND_UP(pss->page + 1, guest_pfns);
+    if (guest_pfns <= 1) {
+        /*
+         * This covers both when guest psize == host psize, or when guest
+         * has larger psize than the host (guest_pfns==0).
+         *
+         * For the latter, we always send one whole guest page per
+         * iteration of the host page (example: an Alpha VM on x86 host
+         * will have guest psize 8K while host psize 4K).
+         */
+        pss->host_page_start = pss->page;
+        pss->host_page_end = pss->page + 1;
+    } else {
+        /*
+         * The host page spans over multiple guest pages, we send them
+         * within the same host page iteration.
+         */
+        pss->host_page_start = ROUND_DOWN(pss->page, guest_pfns);
+        pss->host_page_end = ROUND_UP(pss->page + 1, guest_pfns);
+    }
 }
 
 /*
-- 
2.39.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39DB26F158B
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 12:31:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psLLs-0006LS-Np; Fri, 28 Apr 2023 06:29:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1psLLj-0006HZ-N5
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 06:29:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1psLLg-0007LK-8q
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 06:29:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682677747;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hZHRUEqzTNw+HNUW+TFEQEwsvtGzslWDD3mzh/REkFE=;
 b=OQPP0/Ilc04FL9CbVxeZlqwKt3QYXNbOffNZE1tmS+ndQu6skqWLT2vkhxp4U8e2K1aBYB
 amKIolsYXI06DUfNAVBGq43eDj9BConiqDSxY/oLby1V7hl+2Pq2V+cZIAjZ61+H60JOkc
 pmzehTV4x9SLZPHy9JEnB+6xEngi/IE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-xyfgVtxQPYyoVUIt9Xhfwg-1; Fri, 28 Apr 2023 06:29:03 -0400
X-MC-Unique: xyfgVtxQPYyoVUIt9Xhfwg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6A7361C04184;
 Fri, 28 Apr 2023 10:29:03 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 46F3640C6E68;
 Fri, 28 Apr 2023 10:29:03 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 45C4D21F983A; Fri, 28 Apr 2023 12:29:01 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>
Subject: [PULL 05/17] qapi/block-core: Clean up after removal of dirty bitmap
 @status
Date: Fri, 28 Apr 2023 12:28:49 +0200
Message-Id: <20230428102901.1685375-6-armbru@redhat.com>
In-Reply-To: <20230428102901.1685375-1-armbru@redhat.com>
References: <20230428102901.1685375-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Commit 81cbfd50886 (block: remove dirty bitmaps 'status' field)
removed deprecated BlockDirtyInfo member @status.  It neglected to
remove references to its enumeration values from the documentation of
its replacements.  Do that now.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Message-Id: <20230425064223.820979-6-armbru@redhat.com>
---
 qapi/block-core.json | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 75f7c62405..eeb2ed3f16 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -582,11 +582,11 @@
 # @granularity: granularity of the dirty bitmap in bytes (since 1.4)
 #
 # @recording: true if the bitmap is recording new writes from the guest.
-#             Replaces ``active`` and ``disabled`` statuses. (since 4.0)
+#             (since 4.0)
 #
 # @busy: true if the bitmap is in-use by some operation (NBD or jobs)
 #        and cannot be modified via QMP or used by another operation.
-#        Replaces ``locked`` and ``frozen`` statuses. (since 4.0)
+#        (since 4.0)
 #
 # @persistent: true if the bitmap was stored on disk, is scheduled to be stored
 #              on disk, or both. (since 4.0)
-- 
2.39.2



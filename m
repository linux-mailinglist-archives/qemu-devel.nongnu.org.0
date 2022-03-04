Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A25084CDD69
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 20:51:25 +0100 (CET)
Received: from localhost ([::1]:40438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQDxU-00021X-D1
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 14:51:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nQDjg-0003DI-Ly
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 14:37:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nQDjX-0004Mb-Tj
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 14:37:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646422607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hmo6bofpnbB1LDwhbwnYjXUrc1mcYteVpUtiJROqWgM=;
 b=dz+ANkBGSekaTYJrrnSDiuUcDEvpKi1aZ7dYUIGb+b1ZXHQPKvu5FidSLs+BnIdVwRuugv
 Zz7opJzVd5DD/+OEQpe3VAUAP6WQK2eLJ826/TPGKAZWdTL4qenGhWdvO+ySOwhgabLGYk
 FTC8aTjJJi4Gbv89F4vSYJVohQZOcjg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-417-ym17iIOTNyObApMRZJdnZw-1; Fri, 04 Mar 2022 14:36:45 -0500
X-MC-Unique: ym17iIOTNyObApMRZJdnZw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F0A061006AA6;
 Fri,  4 Mar 2022 19:36:43 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.194.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 01D135DF21;
 Fri,  4 Mar 2022 19:36:41 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/12] tests/qemu-iotests: expand _filter_nbd rules
Date: Fri,  4 Mar 2022 19:36:05 +0000
Message-Id: <20220304193610.3293146-8-berrange@redhat.com>
In-Reply-To: <20220304193610.3293146-1-berrange@redhat.com>
References: <20220304193610.3293146-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some tests will want to use 'localhost' instead of '127.0.0.1', and
some will use the image options syntax rather than the classic URI
syntax.

Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/qemu-iotests/common.filter | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/qemu-iotests/common.filter b/tests/qemu-iotests/common.filter
index 75cc241580..25d1d22929 100644
--- a/tests/qemu-iotests/common.filter
+++ b/tests/qemu-iotests/common.filter
@@ -300,6 +300,10 @@ _filter_nbd()
     # Filter out the TCP port number since this changes between runs.
     $SED -e '/nbd\/.*\.c:/d' \
         -e 's#127\.0\.0\.1:[0-9]*#127.0.0.1:PORT#g' \
+        -e 's#localhost:[0-9]*#localhost:PORT#g' \
+        -e 's#host=127\.0\.0\.1,port=[0-9]*#host=127.0.0.1,port=PORT#g' \
+        -e 's#host=localhost,port=[0-9]*#host=localhost,port=PORT#g' \
+        -e "s#path=$SOCK_DIR#path=SOCK_DIR#g" \
         -e "s#?socket=$SOCK_DIR#?socket=SOCK_DIR#g" \
         -e 's#\(foo\|PORT/\?\|.sock\): Failed to .*$#\1#'
 }
-- 
2.34.1



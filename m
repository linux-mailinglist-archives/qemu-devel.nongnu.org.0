Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2796748A1E8
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 22:26:44 +0100 (CET)
Received: from localhost ([::1]:50786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n72Bf-0003jy-8s
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 16:26:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1n725P-0004u1-N4
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 16:20:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1n725L-0006m6-HE
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 16:20:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641849610;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5jJdidEP/fFEVpqtDW9VatAuswRI3QIAPouxWvzaMrY=;
 b=Yq3rO5oTkqX/fQG/jEUmiyOHPyafbwuPRi+vuxk+2469aH+8vp3Lg4domxIy8YkBQLf55Z
 ZmJL5r8dZHER+3tqT2WGpI2umkgOYZj5sVfNze2HH3XewHrDt/Br/GhwX7v5GcwswCMt5S
 LnWwGlQKVYO+CfcM76AYTqjgHQXxpjU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-653-Ahaty1NLP227otoPpcdmhw-1; Mon, 10 Jan 2022 16:20:07 -0500
X-MC-Unique: Ahaty1NLP227otoPpcdmhw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C76B41023F53;
 Mon, 10 Jan 2022 21:20:03 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.194.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 62F482B178;
 Mon, 10 Jan 2022 21:19:44 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, thuth@redhat.com,
 pbonzini@redhat.com, lvivier@redhat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 david@gibson.dropbear.id.au, clg@kaod.org
Subject: [PATCH 1/6] tests/qtest/vhost-user-test.c: Use vhostforce=on
Date: Mon, 10 Jan 2022 22:19:10 +0100
Message-Id: <20220110211915.2749082-2-eric.auger@redhat.com>
In-Reply-To: <20220110211915.2749082-1-eric.auger@redhat.com>
References: <20220110211915.2749082-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
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
Cc: jean-philippe@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

-netdev vhost-user,vhostforce is deprecated and vhostforce=on
should be used instead.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 tests/qtest/vhost-user-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/vhost-user-test.c b/tests/qtest/vhost-user-test.c
index 3d6337fb5c5..6e79935c47e 100644
--- a/tests/qtest/vhost-user-test.c
+++ b/tests/qtest/vhost-user-test.c
@@ -42,7 +42,7 @@
 #define QEMU_CMD_MEMFD  " -m %d -object memory-backend-memfd,id=mem,size=%dM," \
                         " -numa node,memdev=mem"
 #define QEMU_CMD_CHR    " -chardev socket,id=%s,path=%s%s"
-#define QEMU_CMD_NETDEV " -netdev vhost-user,id=hs0,chardev=%s,vhostforce"
+#define QEMU_CMD_NETDEV " -netdev vhost-user,id=hs0,chardev=%s,vhostforce=on"
 
 #define HUGETLBFS_MAGIC       0x958458f6
 
-- 
2.26.3



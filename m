Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5D86982A9
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 18:49:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSLsP-00058g-Ob; Wed, 15 Feb 2023 12:47:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pSLsN-000563-DN
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 12:47:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pSLsL-0005Cv-Qa
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 12:47:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676483245;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EnLTdQW1YqznaNEhJmicdWjmAUdsZw1qkvHUetsxoAQ=;
 b=XcTIt1t+O2g+6LWHFv2ARuMrgu15WU2rgOAtD0JhPFk8GHLjE/0ToG29NF69FUlvT4KYrI
 8dioStaUoQGAYk0JYxEZ6cQ3HWHGWeu5F9C7TKvrrY+RE7fpQ7kew3E1jjX1B8Yv6zjcSy
 dlO9CmQpfsTY75MheODqcMRs6pDs/i0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-113-6nsTdQyVMviZUB7UU2V4PQ-1; Wed, 15 Feb 2023 12:47:23 -0500
X-MC-Unique: 6nsTdQyVMviZUB7UU2V4PQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4BFEA1C0755F;
 Wed, 15 Feb 2023 17:47:22 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 419CB40C10FA;
 Wed, 15 Feb 2023 17:47:20 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Kevin Wolf <kwolf@redhat.com>, libvir-list@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Lieven <pl@kamp.de>, Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Fabiano Rosas <farosas@suse.de>
Subject: [PULL 3/5] block: mention 'password-secret' option for -iscsi
Date: Wed, 15 Feb 2023 17:47:10 +0000
Message-Id: <20230215174712.1894516-4-berrange@redhat.com>
In-Reply-To: <20230215174712.1894516-1-berrange@redhat.com>
References: <20230215174712.1894516-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_FILL_THIS_FORM_SHORT=0.01 autolearn=ham autolearn_force=no
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

The 'password-secret' option was added

  commit b189346eb1784df95ed6fed610411dbf23d19e1f
  Author: Daniel P. Berrangé <berrange@redhat.com>
  Date:   Thu Jan 21 14:19:21 2016 +0000

    iscsi: add support for getting CHAP password via QCryptoSecret API

but was not mentioned in the command line docs

Reviewed-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Fabiano Rosas <farosas@suse.de>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 qemu-options.hx | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 88e93c6103..e79ff4d8fb 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1892,8 +1892,8 @@ SRST
 ERST
 
 DEF("iscsi", HAS_ARG, QEMU_OPTION_iscsi,
-    "-iscsi [user=user][,password=password]\n"
-    "       [,header-digest=CRC32C|CR32C-NONE|NONE-CRC32C|NONE\n"
+    "-iscsi [user=user][,password=password][,password-secret=secret-id]\n"
+    "       [,header-digest=CRC32C|CR32C-NONE|NONE-CRC32C|NONE]\n"
     "       [,initiator-name=initiator-iqn][,id=target-iqn]\n"
     "       [,timeout=timeout]\n"
     "                iSCSI session parameters\n", QEMU_ARCH_ALL)
-- 
2.39.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BDBC402508
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 10:21:59 +0200 (CEST)
Received: from localhost ([::1]:59148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNWMg-0000ba-L6
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 04:21:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mNWFO-0004pK-0V
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 04:14:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mNWFM-0005o4-H0
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 04:14:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631002463;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F4TSYJ6B2xP43vTwV5cv2ROnd8HH8ATBHprZ6uaO1XU=;
 b=evZHRuqR7eRSaf+9NrgdKlT17jPGRfrrOLWBgsjB0GOjoRzepq2kpix6Y1NLKmNd/ATxst
 K2KkZbTMloXgpbMenwuvCXpiNrwgX/rGT6kY+0KBqtYWsKZT3WCNvp+dK9GBMen51cYSGL
 hjjCYo1Y0pO6VxN7YWuC7JImQz5pQlw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-MhCyrZMxMbKp-Ejz21F9Ww-1; Tue, 07 Sep 2021 04:14:22 -0400
X-MC-Unique: MhCyrZMxMbKp-Ejz21F9Ww-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 95C04107B45C;
 Tue,  7 Sep 2021 08:14:12 +0000 (UTC)
Received: from localhost (unknown [10.39.194.246])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3C72B10074FD;
 Tue,  7 Sep 2021 08:14:11 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 04/11] util/vfio-helpers: Remove unreachable code in
 qemu_vfio_dma_map()
Date: Tue,  7 Sep 2021 09:13:56 +0100
Message-Id: <20210907081403.816404-5-stefanha@redhat.com>
In-Reply-To: <20210907081403.816404-1-stefanha@redhat.com>
References: <20210907081403.816404-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

qemu_vfio_add_mapping() returns a pointer to an indexed entry
in pre-allocated QEMUVFIOState::mappings[], thus can not be NULL.
Remove the pointless check.

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-id: 20210902070025.197072-5-philmd@redhat.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 util/vfio-helpers.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/util/vfio-helpers.c b/util/vfio-helpers.c
index d956866b4e..e7909222cf 100644
--- a/util/vfio-helpers.c
+++ b/util/vfio-helpers.c
@@ -751,10 +751,6 @@ int qemu_vfio_dma_map(QEMUVFIOState *s, void *host, size_t size,
             }
 
             mapping = qemu_vfio_add_mapping(s, host, size, index + 1, iova0);
-            if (!mapping) {
-                ret = -ENOMEM;
-                goto out;
-            }
             assert(qemu_vfio_verify_mappings(s));
             ret = qemu_vfio_do_mapping(s, host, size, iova0);
             if (ret) {
-- 
2.31.1



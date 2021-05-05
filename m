Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AEB73734A8
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 07:20:56 +0200 (CEST)
Received: from localhost ([::1]:48666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1le9xv-0004mh-71
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 01:20:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liq3ea@163.com>) id 1le9rb-00067K-HI
 for qemu-devel@nongnu.org; Wed, 05 May 2021 01:14:23 -0400
Received: from m12-16.163.com ([220.181.12.16]:58171)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <liq3ea@163.com>) id 1le9rX-00017J-L7
 for qemu-devel@nongnu.org; Wed, 05 May 2021 01:14:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=+GwqY
 ZPzmbVi5RTWr/I6FZUle2cqOpVXUMn+p8zEDDQ=; b=EwSpxJdRWcC2kob10pKoN
 xPiiPYyOhYp8d1O7OrslaaVketqH2kz9Wh8mwVBiSKPbMQdmu9ISyQL2QfJv3hAf
 1nRhkksWw6ooVSuDD2U6tSVJnx5OhnJmL1zrz8lYNixjyOAULqyNxsAv7yPtr60J
 dg01knTayMMpLF+RPS4I/o=
Received: from ubuntu.localdomain (unknown [36.22.237.185])
 by smtp12 (Coremail) with SMTP id EMCowACXET7zJZJg8VpupQ--.18216S8;
 Wed, 05 May 2021 12:58:33 +0800 (CST)
From: Li Qiang <liq3ea@163.com>
To: marcandre.lureau@redhat.com,
	kraxel@redhat.com,
	qemu-devel@nongnu.org
Subject: [PATCH 4/7] vhost-user-gpu: fix memory link while calling
 'vg_resource_unref'
Date: Tue,  4 May 2021 21:58:21 -0700
Message-Id: <20210505045824.33880-5-liq3ea@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210505045824.33880-1-liq3ea@163.com>
References: <20210505045824.33880-1-liq3ea@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: EMCowACXET7zJZJg8VpupQ--.18216S8
X-Coremail-Antispam: 1Uf129KBjvdXoWrtry3AF1rtw1rury7GFWUXFb_yoW3Krg_Za
 1rAF4kArsxWry09w4Utw13A3yayFW3Jr1xGF92kFy5KryrKwnYqw1Sqr97tryUZw4DuF1D
 CryUJw4rWr1Y9jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbPxhJUUUUU==
X-Originating-IP: [36.22.237.185]
X-CM-SenderInfo: 5oltjvrd6rljoofrz/1tbiTxmJbVsGYnBXkQAAs7
Received-SPF: pass client-ip=220.181.12.16; envelope-from=liq3ea@163.com;
 helo=m12-16.163.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Li Qiang <liq3ea@163.com>, liq3ea@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If the guest trigger following sequences, the attach_backing will be leaked:

	vg_resource_create_2d
	vg_resource_attach_backing
	vg_resource_unref

This patch fix this by freeing 'res->iov' in vg_resource_destroy.

Signed-off-by: Li Qiang <liq3ea@163.com>
---
 contrib/vhost-user-gpu/vhost-user-gpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/contrib/vhost-user-gpu/vhost-user-gpu.c b/contrib/vhost-user-gpu/vhost-user-gpu.c
index 0437e52b64..770dfad529 100644
--- a/contrib/vhost-user-gpu/vhost-user-gpu.c
+++ b/contrib/vhost-user-gpu/vhost-user-gpu.c
@@ -400,6 +400,7 @@ vg_resource_destroy(VuGpu *g,
     }
 
     vugbm_buffer_destroy(&res->buffer);
+    g_free(res->iov);
     pixman_image_unref(res->image);
     QTAILQ_REMOVE(&g->reslist, res, next);
     g_free(res);
-- 
2.25.1




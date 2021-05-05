Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F8E37349C
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 07:16:15 +0200 (CEST)
Received: from localhost ([::1]:34590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1le9tN-0007MI-LU
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 01:16:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liq3ea@163.com>) id 1le9rb-00067G-D5
 for qemu-devel@nongnu.org; Wed, 05 May 2021 01:14:23 -0400
Received: from m12-16.163.com ([220.181.12.16]:57537)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <liq3ea@163.com>) id 1le9rW-00010J-LM
 for qemu-devel@nongnu.org; Wed, 05 May 2021 01:14:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=yjGgd
 yEI4yFRIsPij/wQlBf/XfQxp/AuLx+xqGJnJNo=; b=nplPebjSgbqFz4QsZqWX0
 P3mDH9LUq7HCWpx+eqrKxlhnLyxM9Cm/0nbkxE0rDJcje0PsMyx0Mv6UsV8IoO4P
 gUzDkBmfaQ/WnrbKcLerIR13WKfTuayJQFXJ6xAnZZHEzFkbz4ybShvdoCV6lf/l
 UJ8MwC62AT8eqOY0C9Bg30=
Received: from ubuntu.localdomain (unknown [36.22.237.185])
 by smtp12 (Coremail) with SMTP id EMCowACXET7zJZJg8VpupQ--.18216S6;
 Wed, 05 May 2021 12:58:31 +0800 (CST)
From: Li Qiang <liq3ea@163.com>
To: marcandre.lureau@redhat.com,
	kraxel@redhat.com,
	qemu-devel@nongnu.org
Subject: [PATCH 2/7] vhost-user-gpu: fix resource leak in
 'vg_resource_create_2d'
Date: Tue,  4 May 2021 21:58:19 -0700
Message-Id: <20210505045824.33880-3-liq3ea@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210505045824.33880-1-liq3ea@163.com>
References: <20210505045824.33880-1-liq3ea@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: EMCowACXET7zJZJg8VpupQ--.18216S6
X-Coremail-Antispam: 1Uf129KBjvdXoWruFW5Ary7tFy3Xr4UKryDZFb_yoW3XFb_Za
 18AF4kCFsxWFy09w4Dtws8A3yayFW3Jr4xtFy0kF15CFyUtwnIqwn5tryktrW8Zw4DKFn8
 ArWUJw48ZF12vjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU84xR3UUUUU==
X-Originating-IP: [36.22.237.185]
X-CM-SenderInfo: 5oltjvrd6rljoofrz/xtbBZhaJbVaD7t4NYgABsf
Received-SPF: pass client-ip=220.181.12.16; envelope-from=liq3ea@163.com;
 helo=m12-16.163.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_20=-0.001, DKIM_SIGNED=0.1,
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

Call 'vugbm_buffer_destroy' in error path to avoid resource leak.

Signed-off-by: Li Qiang <liq3ea@163.com>
---
 contrib/vhost-user-gpu/vhost-user-gpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/contrib/vhost-user-gpu/vhost-user-gpu.c b/contrib/vhost-user-gpu/vhost-user-gpu.c
index f73f292c9f..b5e153d0d6 100644
--- a/contrib/vhost-user-gpu/vhost-user-gpu.c
+++ b/contrib/vhost-user-gpu/vhost-user-gpu.c
@@ -349,6 +349,7 @@ vg_resource_create_2d(VuGpu *g,
         g_critical("%s: resource creation failed %d %d %d",
                    __func__, c2d.resource_id, c2d.width, c2d.height);
         g_free(res);
+        vugbm_buffer_destroy(&res->buffer);
         cmd->error = VIRTIO_GPU_RESP_ERR_OUT_OF_MEMORY;
         return;
     }
-- 
2.25.1




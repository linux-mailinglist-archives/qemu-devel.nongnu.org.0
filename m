Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08469381C31
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 05:09:57 +0200 (CEST)
Received: from localhost ([::1]:40964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1li7AC-00047c-42
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 23:09:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liq3ea@163.com>) id 1li74q-0000pv-Nl
 for qemu-devel@nongnu.org; Sat, 15 May 2021 23:04:24 -0400
Received: from m12-13.163.com ([220.181.12.13]:52221)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <liq3ea@163.com>) id 1li74l-0002e7-E0
 for qemu-devel@nongnu.org; Sat, 15 May 2021 23:04:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=+cX1B
 0xZjC1BtX+cq5VAtM2rkQYVJVOu0vA64CpTbqI=; b=aj5/m/mfAt1Y3OTr52evb
 +WPWN84TkvjY1JxiTbNsNMlFd3Pcm8/28affbOie+Adf4rY7djTh9PT2Iem18ERg
 4tP0sObP8+zrhIUnoddkHV8jTPGsZ/7dOwijb/i45kGF+P63ncti3H043EUB+f41
 niSMvo8o6+72P6/v3p50q0=
Received: from ubuntu.localdomain (unknown [115.200.200.157])
 by smtp9 (Coremail) with SMTP id DcCowAC3evili6Bg85SBAw--.61303S6;
 Sun, 16 May 2021 11:04:10 +0800 (CST)
From: Li Qiang <liq3ea@163.com>
To: marcandre.lureau@redhat.com, kraxel@redhat.com, philmd@redhat.com,
 ppandit@redhat.com, mcascell@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH v2 2/8] vhost-user-gpu: fix resource leak in
 'vg_resource_create_2d' (CVE-2021-3544)
Date: Sat, 15 May 2021 20:03:57 -0700
Message-Id: <20210516030403.107723-3-liq3ea@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210516030403.107723-1-liq3ea@163.com>
References: <20210516030403.107723-1-liq3ea@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DcCowAC3evili6Bg85SBAw--.61303S6
X-Coremail-Antispam: 1Uf129KBjvdXoW7GFWDCr1UuryUtw1kur4fuFg_yoWfXFg_Za
 18XF4kCFs8WFy09w4DtwsxA3yayFWfJrs7tFy0kF45CFyUtwnIq3s5t3yvyry8Zw4DGF1D
 ArWUJw48AF12vjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8LXo7UUUUU==
X-Originating-IP: [115.200.200.157]
X-CM-SenderInfo: 5oltjvrd6rljoofrz/1tbiKQqUbVXl0i9ZBgAAsI
Received-SPF: pass client-ip=220.181.12.13; envelope-from=liq3ea@163.com;
 helo=m12-13.163.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Li Qiang <liq3ea@163.com>, liq3ea@gmail.com,
 Prasad J Pandit <pjp@fedoraproject.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Call 'vugbm_buffer_destroy' in error path to avoid resource leak.

Fixes: CVE-2021-3544
Reported-by: Li Qiang <liq3ea@163.com>
Reviewed-by: Prasad J Pandit <pjp@fedoraproject.org>
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




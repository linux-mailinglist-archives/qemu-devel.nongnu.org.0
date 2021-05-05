Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B1C3734A1
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 07:18:58 +0200 (CEST)
Received: from localhost ([::1]:42410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1le9vz-0002Fx-IP
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 01:18:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liq3ea@163.com>) id 1le9rc-00067t-On
 for qemu-devel@nongnu.org; Wed, 05 May 2021 01:14:24 -0400
Received: from m12-16.163.com ([220.181.12.16]:58178)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <liq3ea@163.com>) id 1le9rX-00017O-L7
 for qemu-devel@nongnu.org; Wed, 05 May 2021 01:14:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=QTmgs
 OcfkOmjLcbwZwmklrqfoD9/5A+DbgbSLcgxKAA=; b=jbEwGxjBlg+JeRWbJRAFT
 /CrhZHyuWNTD8S618/cwFADwy9gaPSsyDdvn10XuIy0d69H9xcdEEYLyO04VkKXC
 WFoCnhnljsRhwU7VD9UGutG4QNNrw6eYyuL6h0mbU1JuFXQEvgduLwrw6zTtou0h
 +G6L0Jm45dGYDv7Ce68vlY=
Received: from ubuntu.localdomain (unknown [36.22.237.185])
 by smtp12 (Coremail) with SMTP id EMCowACXET7zJZJg8VpupQ--.18216S11;
 Wed, 05 May 2021 12:58:36 +0800 (CST)
From: Li Qiang <liq3ea@163.com>
To: marcandre.lureau@redhat.com,
	kraxel@redhat.com,
	qemu-devel@nongnu.org
Subject: [PATCH 7/7] vhost-user-gpu: fix OOB write in 'virgl_cmd_get_capset'
Date: Tue,  4 May 2021 21:58:24 -0700
Message-Id: <20210505045824.33880-8-liq3ea@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210505045824.33880-1-liq3ea@163.com>
References: <20210505045824.33880-1-liq3ea@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: EMCowACXET7zJZJg8VpupQ--.18216S11
X-Coremail-Antispam: 1Uf129KBjvdXoWrtw43Ww1fXF1kAF1ktr17trb_yoW3Kwc_XF
 4Skrn3Ar4DXryq9Fs8Arn0vrW7ArWUA3Z2vFyfKw1fXFyak3WUXw1fG3s5GrW3Z3ykuF1D
 A340yw4rWF4q9jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUUOJ57UUUUU==
X-Originating-IP: [36.22.237.185]
X-CM-SenderInfo: 5oltjvrd6rljoofrz/1tbiTxyJbVsGYnBXtgAAsZ
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

If 'virgl_cmd_get_capset' set 'max_size' to 0,
the 'virgl_renderer_fill_caps' will write the data after the 'resp'.
This patch avoid this by checking the returned 'max_size'.

Signed-off-by: Li Qiang <liq3ea@163.com>
---
 contrib/vhost-user-gpu/virgl.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/contrib/vhost-user-gpu/virgl.c b/contrib/vhost-user-gpu/virgl.c
index a16a311d80..7172104b19 100644
--- a/contrib/vhost-user-gpu/virgl.c
+++ b/contrib/vhost-user-gpu/virgl.c
@@ -177,6 +177,10 @@ virgl_cmd_get_capset(VuGpu *g,
 
     virgl_renderer_get_cap_set(gc.capset_id, &max_ver,
                                &max_size);
+    if (!max_size) {
+        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_PARAMETER;
+        return;
+    }
     resp = g_malloc0(sizeof(*resp) + max_size);
 
     resp->hdr.type = VIRTIO_GPU_RESP_OK_CAPSET;
-- 
2.25.1




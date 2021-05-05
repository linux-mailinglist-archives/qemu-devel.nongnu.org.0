Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D49AC37349D
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 07:16:18 +0200 (CEST)
Received: from localhost ([::1]:34728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1le9tR-0007RM-Tz
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 01:16:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liq3ea@163.com>) id 1le9rc-00067n-Hq
 for qemu-devel@nongnu.org; Wed, 05 May 2021 01:14:24 -0400
Received: from m12-16.163.com ([220.181.12.16]:58169)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <liq3ea@163.com>) id 1le9rY-00017G-Fw
 for qemu-devel@nongnu.org; Wed, 05 May 2021 01:14:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=zlCFF
 1m7rXQZjXsw0wpx6URXzl2KvVLjDHEWjVRKgC4=; b=a6M5PbwU0Mk3EgYMM3QWG
 sDascPIvCFTIcjTOOaho7D6BdsGrd23PQ5ky9bFTZXOpk9MKr7Xp6QkFLI7vrcjZ
 DcIoEBzfQQM1pjg+ot0vBe/UNM/OfXzWkSd6HCZ+MJjIBXMyXMHzsfkXMaO+Ili7
 MV4N3ogf36QNiIRw+4mfbk=
Received: from ubuntu.localdomain (unknown [36.22.237.185])
 by smtp12 (Coremail) with SMTP id EMCowACXET7zJZJg8VpupQ--.18216S5;
 Wed, 05 May 2021 12:58:29 +0800 (CST)
From: Li Qiang <liq3ea@163.com>
To: marcandre.lureau@redhat.com,
	kraxel@redhat.com,
	qemu-devel@nongnu.org
Subject: [PATCH 1/7] vhost-user-gpu: fix memory disclosure in
 virgl_cmd_get_capset_info
Date: Tue,  4 May 2021 21:58:18 -0700
Message-Id: <20210505045824.33880-2-liq3ea@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210505045824.33880-1-liq3ea@163.com>
References: <20210505045824.33880-1-liq3ea@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: EMCowACXET7zJZJg8VpupQ--.18216S5
X-Coremail-Antispam: 1Uf129KBjvdXoW5Kry3Cw17Ar1DGF18Xr4fXwb_yoWxWFb_ZF
 1FyFn7AF4DWrW0krs8Zw4rJ3yavrWYyFsayFnakr1xXFyYkw15Xwn3t34kJ3yfuw43GF4D
 AFy0yw4rGa1j9jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUboGQPUUUUU==
X-Originating-IP: [36.22.237.185]
X-CM-SenderInfo: 5oltjvrd6rljoofrz/xtbB8QWJbV2MZ6UWWQAAsM
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

Otherwise some of the 'resp' will be leaked to guest.

Signed-off-by: Li Qiang <liq3ea@163.com>
---
 contrib/vhost-user-gpu/virgl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/contrib/vhost-user-gpu/virgl.c b/contrib/vhost-user-gpu/virgl.c
index 9e6660c7ab..6a332d601f 100644
--- a/contrib/vhost-user-gpu/virgl.c
+++ b/contrib/vhost-user-gpu/virgl.c
@@ -128,6 +128,7 @@ virgl_cmd_get_capset_info(VuGpu *g,
 
     VUGPU_FILL_CMD(info);
 
+    memset(&resp, 0, sizeof(resp));
     if (info.capset_index == 0) {
         resp.capset_id = VIRTIO_GPU_CAPSET_VIRGL;
         virgl_renderer_get_cap_set(resp.capset_id,
-- 
2.25.1




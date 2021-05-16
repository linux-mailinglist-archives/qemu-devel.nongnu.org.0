Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C22B381C2E
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 05:08:15 +0200 (CEST)
Received: from localhost ([::1]:35578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1li78Y-0000WX-AL
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 23:08:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liq3ea@163.com>) id 1li74o-0000om-Eb
 for qemu-devel@nongnu.org; Sat, 15 May 2021 23:04:22 -0400
Received: from m12-13.163.com ([220.181.12.13]:51847)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <liq3ea@163.com>) id 1li74i-0002Zj-VH
 for qemu-devel@nongnu.org; Sat, 15 May 2021 23:04:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=8RKfS
 0LKkqB2rg2p/FeSJzPg2FwjNOaF3v/+HsGrsW0=; b=kU/Xo7HCj2Lq5zlnWe72B
 7UHwCl9hVxr+f4c7/CXeU5ADfUPCuLrFGqk6vQQPbrzPaG1XYmip6jsUsVrZH5Ir
 tpI1JQiv9Kak8qIoYoMQ8O3movsb/5d6yzE4zb/LhmJlWiz8X3WJBY42y4vQ/xwI
 47qC2LNleh3IZSH5TMmnSk=
Received: from ubuntu.localdomain (unknown [115.200.200.157])
 by smtp9 (Coremail) with SMTP id DcCowAC3evili6Bg85SBAw--.61303S5;
 Sun, 16 May 2021 11:04:08 +0800 (CST)
From: Li Qiang <liq3ea@163.com>
To: marcandre.lureau@redhat.com, kraxel@redhat.com, philmd@redhat.com,
 ppandit@redhat.com, mcascell@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH v2 1/8] vhost-user-gpu: fix memory disclosure in
 virgl_cmd_get_capset_info (CVE-2021-3545)
Date: Sat, 15 May 2021 20:03:56 -0700
Message-Id: <20210516030403.107723-2-liq3ea@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210516030403.107723-1-liq3ea@163.com>
References: <20210516030403.107723-1-liq3ea@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DcCowAC3evili6Bg85SBAw--.61303S5
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gry5Kr47JrWUur4DurWxWFg_yoW3urg_ZF
 yFyrn7AF4DWFW0kr45Z3W5JrWay3yrAFsayFnakrn7ZFyF93W5Xwn3t3s7C34fuw43GF4D
 AFy0yw4rG3Z09jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8QAw7UUUUU==
X-Originating-IP: [115.200.200.157]
X-CM-SenderInfo: 5oltjvrd6rljoofrz/xtbByQiUbV1vkd6VCwAAsb
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
Cc: Li Qiang <liq3ea@163.com>, liq3ea@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Otherwise some of the 'resp' will be leaked to guest.

Fixes: CVE-2021-3545
Reported-by: Li Qiang <liq3ea@163.com>
virtio-gpu fix: 42a8dadc74 ("virtio-gpu: fix information leak
in getting capset info dispatch")

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




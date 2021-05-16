Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01367381C2F
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 05:08:16 +0200 (CEST)
Received: from localhost ([::1]:35628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1li78Z-0000YZ-1v
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 23:08:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liq3ea@163.com>) id 1li74p-0000pI-Jl
 for qemu-devel@nongnu.org; Sat, 15 May 2021 23:04:23 -0400
Received: from m12-13.163.com ([220.181.12.13]:51970)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <liq3ea@163.com>) id 1li74k-0002at-L6
 for qemu-devel@nongnu.org; Sat, 15 May 2021 23:04:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=C+paA
 DHADu8m1z5BBlUXuo5S79eASO5woW8DxjrqGN0=; b=PiQKMe2+DnafQYrGLKADR
 abjg0/J//Vqs6VZZrHtzKvRkdiD5P1qhEyaNRoFQSAokUZ/EEa7DpoayH41TG9PH
 7KHOvjPQK6Zc3v5SeCnOpMY7kCSafstlBn9pmYgpOwj4QULuapomkm3yNaopyuy9
 qGdNLqDKCLam8avzutDvBs=
Received: from ubuntu.localdomain (unknown [115.200.200.157])
 by smtp9 (Coremail) with SMTP id DcCowAC3evili6Bg85SBAw--.61303S7;
 Sun, 16 May 2021 11:04:11 +0800 (CST)
From: Li Qiang <liq3ea@163.com>
To: marcandre.lureau@redhat.com, kraxel@redhat.com, philmd@redhat.com,
 ppandit@redhat.com, mcascell@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH v2 3/8] vhost-user-gpu: fix memory leak in
 vg_resource_attach_backing (CVE-2021-3544)
Date: Sat, 15 May 2021 20:03:58 -0700
Message-Id: <20210516030403.107723-4-liq3ea@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210516030403.107723-1-liq3ea@163.com>
References: <20210516030403.107723-1-liq3ea@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DcCowAC3evili6Bg85SBAw--.61303S7
X-Coremail-Antispam: 1Uf129KBjvdXoWrKFyxCF1xGFWUWr4xJr1DJrb_yoWfAwb_ZF
 4rZFs7CrsxWFWq9F4jqw15ZryayFWfJr1fAFyIkr9xGryFqwnIqw1Fkr97Kr18Zw4DGF1D
 ArWUJr4xGw129jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0X4SUUUUUU==
X-Originating-IP: [115.200.200.157]
X-CM-SenderInfo: 5oltjvrd6rljoofrz/1tbiTwWUbVsGYxK8lgAAs1
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

Check whether the 'res' has already been attach_backing to avoid
memory leak.

Fixes: CVE-2021-3544
Reported-by: Li Qiang <liq3ea@163.com>
virtio-gpu fix: 204f01b309 ("virtio-gpu: fix memory leak
in resource attach backing")

Signed-off-by: Li Qiang <liq3ea@163.com>
---
 contrib/vhost-user-gpu/vhost-user-gpu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/contrib/vhost-user-gpu/vhost-user-gpu.c b/contrib/vhost-user-gpu/vhost-user-gpu.c
index b5e153d0d6..0437e52b64 100644
--- a/contrib/vhost-user-gpu/vhost-user-gpu.c
+++ b/contrib/vhost-user-gpu/vhost-user-gpu.c
@@ -489,6 +489,11 @@ vg_resource_attach_backing(VuGpu *g,
         return;
     }
 
+    if (res->iov) {
+        cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
+        return;
+    }
+
     ret = vg_create_mapping_iov(g, &ab, cmd, &res->iov);
     if (ret != 0) {
         cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
-- 
2.25.1




Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9A3381C32
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 05:09:57 +0200 (CEST)
Received: from localhost ([::1]:41026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1li7AC-0004A7-SC
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 23:09:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liq3ea@163.com>) id 1li74s-0000v0-6c
 for qemu-devel@nongnu.org; Sat, 15 May 2021 23:04:26 -0400
Received: from m12-13.163.com ([220.181.12.13]:52565)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <liq3ea@163.com>) id 1li74q-0002kN-6W
 for qemu-devel@nongnu.org; Sat, 15 May 2021 23:04:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=HfJ8S
 VRcOOM7xn8n/ZsrKk1pmtNvBma0xJJbdxFPmHg=; b=jjnX/jMri4ERphxLB29O9
 m4SU3AlRLvZF9MTsyYNvLMCV6ui1FupMtdyuQzCNckrPNnNQsXrXen0LkIqqsZOK
 Nbj70OOgdlJYg4s8KmXVKQGj2A5lAdLtAnwKQfax2sxDtEbX4V4nvZWlqKbOfnfM
 tisizpGx19mUIp0aWORKp4=
Received: from ubuntu.localdomain (unknown [115.200.200.157])
 by smtp9 (Coremail) with SMTP id DcCowAC3evili6Bg85SBAw--.61303S11;
 Sun, 16 May 2021 11:04:15 +0800 (CST)
From: Li Qiang <liq3ea@163.com>
To: marcandre.lureau@redhat.com, kraxel@redhat.com, philmd@redhat.com,
 ppandit@redhat.com, mcascell@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH v2 7/8] vhost-user-gpu: fix OOB write in
 'virgl_cmd_get_capset' (CVE-2021-3546)
Date: Sat, 15 May 2021 20:04:02 -0700
Message-Id: <20210516030403.107723-8-liq3ea@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210516030403.107723-1-liq3ea@163.com>
References: <20210516030403.107723-1-liq3ea@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DcCowAC3evili6Bg85SBAw--.61303S11
X-Coremail-Antispam: 1Uf129KBjvdXoWrtw4fAr4rWFWrXr1xGry5CFg_yoWDtrc_ZF
 1fCr1rZr4DZryj9Fs8Ar1YyrW7ArW8AFn2vFyfKw1fXFy5K3W5X34fG34kCw43Z3ykCF1D
 Ary8tws5W3ZF9jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbUDG5UUUUU==
X-Originating-IP: [115.200.200.157]
X-CM-SenderInfo: 5oltjvrd6rljoofrz/xtbBZg+UbVaD74ALRwAAsm
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

If 'virgl_cmd_get_capset' set 'max_size' to 0,
the 'virgl_renderer_fill_caps' will write the data after the 'resp'.
This patch avoid this by checking the returned 'max_size'.

virtio-gpu fix: abd7f08b23 ("display: virtio-gpu-3d: check
virgl capabilities max_size")

Fixes: CVE-2021-3546
Reported-by: Li Qiang <liq3ea@163.com>
Reviewed-by: Prasad J Pandit <pjp@fedoraproject.org>
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




Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2782ACA1F
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 02:13:35 +0100 (CET)
Received: from localhost ([::1]:42708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcIE2-0008A8-Hi
	for lists+qemu-devel@lfdr.de; Mon, 09 Nov 2020 20:13:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lihaotian9@huawei.com>)
 id 1kcIBA-0007QM-H8
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 20:10:36 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lihaotian9@huawei.com>)
 id 1kcIB8-0006yt-8k
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 20:10:36 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CVVCf3VSVzhjtg;
 Tue, 10 Nov 2020 09:10:22 +0800 (CST)
Received: from [10.174.178.136] (10.174.178.136) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.487.0; Tue, 10 Nov 2020 09:10:23 +0800
Subject: [PATCH 1/2] tools/virtiofsd/buffer.c: check whether buf is NULL in
 fuse_bufvec_advance func
From: Haotian Li <lihaotian9@huawei.com>
To: <qemu-devel@nongnu.org>, <virtio-fs@redhat.com>
References: <eeb2fd1d-a53d-eae6-4727-7f1a6b20ac9e@huawei.com>
Message-ID: <743d931f-8d19-3368-9170-084f0f11b28e@huawei.com>
Date: Tue, 10 Nov 2020 09:10:23 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.1.0
MIME-Version: 1.0
In-Reply-To: <eeb2fd1d-a53d-eae6-4727-7f1a6b20ac9e@huawei.com>
Content-Type: text/plain; charset="gbk"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.136]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=lihaotian9@huawei.com; helo=szxga05-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/09 20:10:31
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: linfeilong@huawei.com, liuzhiqiang26@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In fuse_bufvec_advance func, calling fuse_bufvec_current func
may return NULL, so we should check whether buf is NULL before
using it.

Signed-off-by: Haotian Li <lihaotian9@huawei.com>
Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
---
 tools/virtiofsd/buffer.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/virtiofsd/buffer.c b/tools/virtiofsd/buffer.c
index 27c1377f22..c94993b936 100644
--- a/tools/virtiofsd/buffer.c
+++ b/tools/virtiofsd/buffer.c
@@ -246,6 +246,9 @@ static int fuse_bufvec_advance(struct fuse_bufvec *bufv, size_t len)
 {
     const struct fuse_buf *buf = fuse_bufvec_current(bufv);

+    if (!buf)
+        return 0;
+
     bufv->off += len;
     assert(bufv->off <= buf->size);
     if (bufv->off == buf->size) {
-- 


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9D72ACFCE
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 07:36:51 +0100 (CET)
Received: from localhost ([::1]:34674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcNGs-0000hb-5v
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 01:36:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lihaotian9@huawei.com>)
 id 1kcNFi-0008Aq-Kr
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 01:35:38 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:2088)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lihaotian9@huawei.com>)
 id 1kcNFg-0001TA-8J
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 01:35:38 -0500
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4CVdQj6t3xzhjJP;
 Tue, 10 Nov 2020 14:35:25 +0800 (CST)
Received: from [10.174.178.136] (10.174.178.136) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.487.0; Tue, 10 Nov 2020 14:35:21 +0800
Subject: [PATCH 1/2] tools/virtiofsd/buffer.c: check whether buf is NULL in
 fuse_bufvec_advance func
From: Haotian Li <lihaotian9@huawei.com>
To: <qemu-devel@nongnu.org>, <virtio-fs@redhat.com>
References: <4bfe8bbd-282f-f271-735d-8892791327e1@huawei.com>
Message-ID: <54579ad7-a07a-ebbd-7289-48b68883849c@huawei.com>
Date: Tue, 10 Nov 2020 14:35:21 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.1.0
MIME-Version: 1.0
In-Reply-To: <4bfe8bbd-282f-f271-735d-8892791327e1@huawei.com>
Content-Type: text/plain; charset="gbk"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.136]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32; envelope-from=lihaotian9@huawei.com;
 helo=szxga06-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 01:35:31
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
 tools/virtiofsd/buffer.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/virtiofsd/buffer.c b/tools/virtiofsd/buffer.c
index 27c1377f22..bdc608c221 100644
--- a/tools/virtiofsd/buffer.c
+++ b/tools/virtiofsd/buffer.c
@@ -246,6 +246,10 @@ static int fuse_bufvec_advance(struct fuse_bufvec *bufv, size_t len)
 {
     const struct fuse_buf *buf = fuse_bufvec_current(bufv);

+    if (!buf) {
+        return 0;
+    }
+
     bufv->off += len;
     assert(bufv->off <= buf->size);
     if (bufv->off == buf->size) {
-- 


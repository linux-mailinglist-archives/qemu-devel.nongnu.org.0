Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1831B2AE559
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 02:12:12 +0100 (CET)
Received: from localhost ([::1]:42730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcegF-0002he-5M
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 20:12:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lihaotian9@huawei.com>)
 id 1kcef6-0001rK-0s
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 20:11:00 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:2138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lihaotian9@huawei.com>)
 id 1kcef4-0008DP-5Y
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 20:10:59 -0500
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CW69V4ZHqz74nC;
 Wed, 11 Nov 2020 09:10:38 +0800 (CST)
Received: from [10.174.178.136] (10.174.178.136) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.487.0; Wed, 11 Nov 2020 09:10:39 +0800
Subject: [PATCH 3/3] virtiofsd: check whether strdup lo.source return NULL in
 main func
From: Haotian Li <lihaotian9@huawei.com>
To: <qemu-devel@nongnu.org>, <virtio-fs@redhat.com>
References: <3477d902-ace9-1aa1-531a-9d20d6e93a05@huawei.com>
Message-ID: <f1e48ca8-d6de-d901-63c8-4f4024bda518@huawei.com>
Date: Wed, 11 Nov 2020 09:10:38 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.1.0
MIME-Version: 1.0
In-Reply-To: <3477d902-ace9-1aa1-531a-9d20d6e93a05@huawei.com>
Content-Type: text/plain; charset="gbk"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.136]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=lihaotian9@huawei.com;
 helo=szxga07-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 20:10:47
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

In main func, strdup lo.source may fail. So check whether strdup
lo.source return NULL before using it.

Signed-off-by: Haotian Li <lihaotian9@huawei.com>
Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
---
 tools/virtiofsd/passthrough_ll.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index 3e9bbc7a04..0c11134fb5 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -3525,6 +3525,10 @@ int main(int argc, char *argv[])
         }
     } else {
         lo.source = strdup("/");
+        if (!lo.source) {
+            fuse_log(FUSE_LOG_ERR, "failed to strdup source\n");
+            goto err_out1;
+        }
     }

     if (lo.xattrmap) {
-- 


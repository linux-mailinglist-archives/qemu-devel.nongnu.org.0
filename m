Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7384145BFAE
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 13:57:52 +0100 (CET)
Received: from localhost ([::1]:46212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mprqR-0000zv-Ki
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 07:57:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1mprou-0007jS-HF; Wed, 24 Nov 2021 07:56:16 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:2958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1mpros-0002Py-0A; Wed, 24 Nov 2021 07:56:16 -0500
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Hzgww3vZNzcbKs;
 Wed, 24 Nov 2021 20:56:00 +0800 (CST)
Received: from kwepemm600002.china.huawei.com (7.193.23.29) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 24 Nov 2021 20:56:02 +0800
Received: from [10.174.185.187] (10.174.185.187) by
 kwepemm600002.china.huawei.com (7.193.23.29) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.20; Wed, 24 Nov 2021 20:56:01 +0800
Message-ID: <faa74343-998c-f054-fb9c-1ea42b7f82a4@huawei.com>
Date: Wed, 24 Nov 2021 20:56:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To: "qemu-block@nongnu.org" <qemu-block@nongnu.org>, QEMU Developers
 <qemu-devel@nongnu.org>
CC: xiexiangyou 00584000 <xiexiangyou@huawei.com>, zhengchuan
 <zhengchuan@huawei.com>, <wanghao232@huawei.com>, "Fangyi (Eric)"
 <eric.fangyi@huawei.com>, yebiaoxiang 00470486 <yebiaoxiang@huawei.com>
Subject: Questions about losing the write lock of raw-format disks after
 migration
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.185.187]
X-ClientProxiedBy: dggeme701-chm.china.huawei.com (10.1.199.97) To
 kwepemm600002.china.huawei.com (7.193.23.29)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=liangpeng10@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Peng Liang <liangpeng10@huawei.com>
From:  Peng Liang via <qemu-devel@nongnu.org>

Hi folks,

When we test migration with raw-format disk, we found that the QEMU
process in the dst will lose the write lock after migration.  However,
the QEMU process in the dst will still hold the write lock for
qcow2-format disk.

After reading some block layer's code, I found that the first
blk_set_perm in blk_root_activate will set blk->shared_perm to
BLK_PERM_ALL (disable all shared permissions?).  Then in
blk_vm_state_changed, blk_set_perm will set shared_perm to
blk->shared_perm, which is BLK_PERM_ALL.  And it makes
raw_handle_perm_lock not to get the write lock.

So I try the following patch and it will fix the problem:
diff --git a/block/block-backend.c b/block/block-backend.c
index 12ef80ea17..96518fd1f0 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -197,13 +197,6 @@ static void blk_root_activate(BdrvChild *child,
Error **errp)

     blk->disable_perm = false;

-    blk_set_perm(blk, blk->perm, BLK_PERM_ALL, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
-        blk->disable_perm = true;
-        return;
-    }
-
     if (runstate_check(RUN_STATE_INMIGRATE)) {
         /* Activation can happen when migration process is still
active, for
          * example when nbd_server_add is called during non-shared storage

I'm new to the block layer and I'm not sure that it's a right fix to the
problem.  Any idea about the problem and the patch?

Thanks,
Peng


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CE4252B39
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Aug 2020 12:16:09 +0200 (CEST)
Received: from localhost ([::1]:38272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAsTQ-0002el-Ku
	for lists+qemu-devel@lfdr.de; Wed, 26 Aug 2020 06:16:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kAsSj-0002Ei-53
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 06:15:25 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:46854 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kAsSg-0004lL-No
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 06:15:24 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 6FAC430402F0239D0259;
 Wed, 26 Aug 2020 18:15:09 +0800 (CST)
Received: from [127.0.0.1] (10.174.187.160) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.487.0;
 Wed, 26 Aug 2020 18:15:02 +0800
Message-ID: <5F463618.10000@huawei.com>
Date: Wed, 26 Aug 2020 18:14:48 +0800
From: AlexChen <alex.chen@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.2; WOW64;
 rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: <pbonzini@redhat.com>
Subject: =?UTF-8?B?b3NsaWItcG9zaXjvvJpGaXggaGFuZGxlIGZkIGxlYWsgaW4gcWVtdV8=?=
 =?UTF-8?B?d3JpdGVfcGlkZmlsZSgp?=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.187.160]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=alex.chen@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/26 06:15:10
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
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
Cc: zhengchuan@huawei.com, qemu-devel@nongnu.org,
 zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: alexchen <alex.chen@huawei.com>

The fd will leak when (a.st_ino == b.st_ino) is true, fix it.

Signed-off-by: AlexChen <alex.chen@huawei.com>
---
 util/oslib-posix.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index ad8001a4ad..74cf5e9c73 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -176,6 +176,7 @@ bool qemu_write_pidfile(const char *path, Error **errp)
         goto fail_unlink;
     }

+    close(fd);
     return true;

 fail_unlink:
-- 
2.19.1



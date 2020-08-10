Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B89C2407E8
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Aug 2020 16:55:51 +0200 (CEST)
Received: from localhost ([::1]:38200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k59DK-0000Vv-JH
	for lists+qemu-devel@lfdr.de; Mon, 10 Aug 2020 10:55:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yezhenyu2@huawei.com>)
 id 1k59B0-0006Vt-If; Mon, 10 Aug 2020 10:53:26 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:4172 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yezhenyu2@huawei.com>)
 id 1k59Ay-0002ij-HN; Mon, 10 Aug 2020 10:53:26 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id A38DBAEE90DE9EFF5AAA;
 Mon, 10 Aug 2020 22:53:07 +0800 (CST)
Received: from DESKTOP-KKJBAGG.china.huawei.com (10.174.186.173) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.487.0; Mon, 10 Aug 2020 22:53:00 +0800
From: Zhenyu Ye <yezhenyu2@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-block@nongnu.org>
Subject: [PATCH v1 0/2] Add timeout mechanism to qmp actions
Date: Mon, 10 Aug 2020 22:52:44 +0800
Message-ID: <20200810145246.1049-1-yezhenyu2@huawei.com>
X-Mailer: git-send-email 2.22.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.186.173]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=yezhenyu2@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/10 10:53:08
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_PASS=-0.001,
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
Cc: kwolf@redhat.com, fam@euphon.net, yezhenyu2@huawei.com, armbru@redhat.com,
 xiexiangyou@huawei.com, mreitz@redhat.com, stefanha@redhat.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Before doing qmp actions, we need to lock the qemu_global_mutex,
so the qmp actions should not take too long time.

Unfortunately, some qmp actions need to acquire aio context and
this may take a long time.  The vm will soft lockup if this time
is too long.

So add a timeout mechanism while doing qmp actions.

Zhenyu Ye (2):
  util: introduce aio_context_acquire_timeout
  qmp: use aio_context_acquire_timeout replace aio_context_acquire

 block/qapi-sysemu.c         |  7 ++++++-
 block/qapi.c                |  6 +++++-
 blockdev.c                  | 35 ++++++++++++++++++++++++++++++-----
 include/block/aio.h         |  6 ++++++
 include/qemu/thread-posix.h |  1 +
 include/qemu/thread.h       |  1 +
 util/async.c                | 10 ++++++++++
 util/qemu-thread-posix.c    |  6 ++++++
 8 files changed, 65 insertions(+), 7 deletions(-)

-- 
2.22.0.windows.1




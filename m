Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 708FE6A1DCA
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 15:50:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVZNW-0007hn-36; Fri, 24 Feb 2023 09:48:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1pVZNT-0007eO-7E; Fri, 24 Feb 2023 09:48:51 -0500
Received: from proxmox-new.maurer-it.com ([94.136.29.106])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1pVZNR-0002r3-PP; Fri, 24 Feb 2023 09:48:50 -0500
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 245B24851B;
 Fri, 24 Feb 2023 15:48:36 +0100 (CET)
From: Fiona Ebner <f.ebner@proxmox.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com, vsementsov@yandex-team.ru,
 jsnow@redhat.com, den@virtuozzo.com, t.lamprecht@proxmox.com,
 alexander.ivanov@virtuozzo.com
Subject: [PATCH 5/9] qapi/block-core: turn BlockJobInfo into a union
Date: Fri, 24 Feb 2023 15:48:21 +0100
Message-Id: <20230224144825.466375-6-f.ebner@proxmox.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230224144825.466375-1-f.ebner@proxmox.com>
References: <20230224144825.466375-1-f.ebner@proxmox.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=94.136.29.106; envelope-from=f.ebner@proxmox.com;
 helo=proxmox-new.maurer-it.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

In preparation to additionally return job-type-specific information.

Signed-off-by: Fiona Ebner <f.ebner@proxmox.com>
---
 qapi/block-core.json | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index c1ac6de238..adb43a4592 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -1342,13 +1342,15 @@
 #
 # Since: 1.1
 ##
-{ 'struct': 'BlockJobInfo',
-  'data': {'type': 'JobType', 'device': 'str', 'len': 'int',
+{ 'union': 'BlockJobInfo',
+  'base': {'type': 'JobType', 'device': 'str', 'len': 'int',
            'offset': 'int', 'busy': 'bool', 'paused': 'bool', 'speed': 'int',
            'io-status': 'BlockDeviceIoStatus', 'ready': 'bool',
            'status': 'JobStatus',
            'auto-finalize': 'bool', 'auto-dismiss': 'bool',
-           '*error': 'str' } }
+           '*error': 'str' },
+  'discriminator': 'type',
+  'data': {} }
 
 ##
 # @query-block-jobs:
-- 
2.30.2




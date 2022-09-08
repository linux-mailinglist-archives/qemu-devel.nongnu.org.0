Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 503405B1E43
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 15:13:48 +0200 (CEST)
Received: from localhost ([::1]:56870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWHLn-0004FX-Bk
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 09:13:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liuhaiwei9699@126.com>)
 id 1oWEh1-0005f2-4Z
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 06:23:31 -0400
Received: from mail-m964.mail.126.com ([123.126.96.4]:56746)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liuhaiwei9699@126.com>) id 1oWEgw-0001tF-0E
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 06:23:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=tYiVJ
 XNkwe/5MgEjOQHdOtglKFkmw6K8dFaMiHJM700=; b=pPkUnBxn55tchigG+WK1s
 rlYsdsExOB7jMrZv/aL4lgsJAykku+R36W8xRor/NVEJc1Kqpml+w560WD53OVZL
 d5N0JzImUaWZyyI4hY7nSFvemOB+F4qCufN0l0vP5YRpyUo4DDoRv6fGvEoHllFU
 Ddgvv1gTS7LqWmykKVPzL0=
Received: from localhost.localdomain (unknown [60.208.111.213])
 by smtp9 (Coremail) with SMTP id NeRpCgBnUKx6uxljMg6sBQ--.259S2;
 Thu, 08 Sep 2022 17:52:59 +0800 (CST)
From: liuhaiwei <liuhaiwei9699@126.com>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, eduardo@habkost.net, eblake@redhat.com,
 armbru@redhat.com, liuhaiwei <liuhaiwei@inspur.com>
Subject: [PATCH] Use QMP command object-add instead of object_add for memory
 hotplugin
Date: Thu,  8 Sep 2022 05:52:47 -0400
Message-Id: <20220908095247.2582144-1-liuhaiwei9699@126.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: NeRpCgBnUKx6uxljMg6sBQ--.259S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tF1fCFWDurWDWw4kCFy7trb_yoW8WFWDpr
 1fGw1a9r98Ar9xKw4vkwn3JFy8tay8uasFvF9avanakrn3Ar1kZF1rtw1rKa48ZFyxJr90
 qFWqkFyYqa4kZ3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07bzlk3UUUUU=
X-Originating-IP: [60.208.111.213]
X-CM-SenderInfo: xolxxt5lzhxmqwzzqiyswou0bp/1tbi3Bt21lpEEOcWDwAAsX
Received-SPF: pass client-ip=123.126.96.4; envelope-from=liuhaiwei9699@126.com;
 helo=mail-m964.mail.126.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 08 Sep 2022 08:59:46 -0400
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

From: liuhaiwei <liuhaiwei@inspur.com>

Signed-off-by: liuhaiwei <liuhaiwei@inspur.com>
---
 docs/memory-hotplug.txt | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/docs/memory-hotplug.txt b/docs/memory-hotplug.txt
index 6aa5e17e26..85ed4d8f3d 100644
--- a/docs/memory-hotplug.txt
+++ b/docs/memory-hotplug.txt
@@ -34,15 +34,15 @@ hotplugged by using any combination of the available memory slots.
 
 Two monitor commands are used to hotplug memory:
 
- - "object_add": creates a memory backend object
+ - "object-add": creates a memory backend object
  - "device_add": creates a front-end pc-dimm device and inserts it
                  into the first empty slot
 
 For example, the following commands add another 1GB to the guest
 discussed earlier:
 
-  (qemu) object_add memory-backend-ram,id=mem1,size=1G
-  (qemu) device_add pc-dimm,id=dimm1,memdev=mem1
+  (qemu) object-add qom-type=memory-backend-ram id=mem1 size=1073741824
+  (qemu) device_add driver=pc-dimm id=dimm1 memdev=mem1
 
 Using the file backend
 ----------------------
@@ -55,7 +55,7 @@ For example, assuming that the host has 1GB hugepages available in
 the /mnt/hugepages-1GB directory, a 1GB hugepage could be hotplugged
 into the guest from the previous section with the following commands:
 
-  (qemu) object_add memory-backend-file,id=mem1,size=1G,mem-path=/mnt/hugepages-1GB
+  (qemu) object-add qom-type=memory-backend-file id=mem1  size=1073741824 mem-path=/mnt/hugepages-1GB 
   (qemu) device_add pc-dimm,id=dimm1,memdev=mem1
 
 It's also possible to start a guest with memory cold-plugged into the
-- 
2.27.0



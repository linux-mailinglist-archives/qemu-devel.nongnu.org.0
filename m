Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B5D2457E3
	for <lists+qemu-devel@lfdr.de>; Sun, 16 Aug 2020 16:24:33 +0200 (CEST)
Received: from localhost ([::1]:48266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k7JaA-0007wj-0s
	for lists+qemu-devel@lfdr.de; Sun, 16 Aug 2020 10:24:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liq3ea@163.com>) id 1k7JYu-0007Vc-3l
 for qemu-devel@nongnu.org; Sun, 16 Aug 2020 10:23:04 -0400
Received: from mail-m971.mail.163.com ([123.126.97.1]:58462)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liq3ea@163.com>) id 1k7JYn-0003AW-RP
 for qemu-devel@nongnu.org; Sun, 16 Aug 2020 10:23:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=rkb688O88uHRL5QYIV
 YDOq+QkTP56Vx3kSuamuOXlIs=; b=OsVOSdlueHuaUy0hLWIaQzg0Ycggmdd8dO
 onw/eu2ilyrYSblhQCyMjuUEHVa7l8juh7ETknPAp1N4TaqDyHML8qt5aM5KURH7
 XdkE76hERSk1Z1P0SJsdJp3AwLAdzI97Hcz4OYMa2RxoGSPkleHXmc5MnSsjVC+o
 U3XGphk7M=
Received: from localhost.localdomain (unknown [115.204.244.155])
 by smtp1 (Coremail) with SMTP id GdxpCgAnVsk4QTlf6NxcAQ--.460S4;
 Sun, 16 Aug 2020 22:22:50 +0800 (CST)
From: Li Qiang <liq3ea@163.com>
To: mst@redhat.com,
	david@redhat.com
Subject: [PATCH v2] virtio-mem: detach the element from the virtqueue when
 error occurs
Date: Sun, 16 Aug 2020 07:22:45 -0700
Message-Id: <20200816142245.17556-1-liq3ea@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: GdxpCgAnVsk4QTlf6NxcAQ--.460S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7tF18XrykJw4Utw43XFy3XFb_yoW8Gw45pr
 48AFWqyan7Ja9FqF4rJF4UWr1UAws7Kr17Kw1Ivw15GF1kJFn7Jr4jyryUKr1fZrZ5Za1x
 ZFnYgrsIqr1v9w7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U2385UUUUU=
X-Originating-IP: [115.204.244.155]
X-CM-SenderInfo: 5oltjvrd6rljoofrz/1tbiFAWCbVaD6-QXjAABsu
Received-SPF: pass client-ip=123.126.97.1; envelope-from=liq3ea@163.com;
 helo=mail-m971.mail.163.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/16 10:22:51
X-ACL-Warn: Detected OS   = Linux 3.1-3.10
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: Li Qiang <liq3ea@163.com>, liq3ea@gmail.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If error occurs while processing the virtio request we should call
'virtqueue_detach_element' to detach the element from the virtqueue
before free the elem.

Signed-off-by: Li Qiang <liq3ea@163.com>
---
Change since v1:
Change the subject
Avoid using the goto label

 hw/virtio/virtio-mem.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
index 7740fc613f..e6ffc781b3 100644
--- a/hw/virtio/virtio-mem.c
+++ b/hw/virtio/virtio-mem.c
@@ -318,6 +318,7 @@ static void virtio_mem_handle_request(VirtIODevice *vdev, VirtQueue *vq)
         if (iov_to_buf(elem->out_sg, elem->out_num, 0, &req, len) < len) {
             virtio_error(vdev, "virtio-mem protocol violation: invalid request"
                          " size: %d", len);
+            virtqueue_detach_element(vq, elem, 0);
             g_free(elem);
             return;
         }
@@ -327,6 +328,7 @@ static void virtio_mem_handle_request(VirtIODevice *vdev, VirtQueue *vq)
             virtio_error(vdev, "virtio-mem protocol violation: not enough space"
                          " for response: %zu",
                          iov_size(elem->in_sg, elem->in_num));
+            virtqueue_detach_element(vq, elem, 0);
             g_free(elem);
             return;
         }
@@ -348,6 +350,7 @@ static void virtio_mem_handle_request(VirtIODevice *vdev, VirtQueue *vq)
         default:
             virtio_error(vdev, "virtio-mem protocol violation: unknown request"
                          " type: %d", type);
+            virtqueue_detach_element(vq, elem, 0);
             g_free(elem);
             return;
         }
-- 
2.17.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78ABF59879D
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 17:39:34 +0200 (CEST)
Received: from localhost ([::1]:52114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOhcK-0002KJ-GW
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 11:39:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qtxuning1999@sjtu.edu.cn>)
 id 1oOhKL-0001HQ-CC
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 11:20:57 -0400
Received: from smtp236.sjtu.edu.cn ([202.120.2.236]:49192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qtxuning1999@sjtu.edu.cn>)
 id 1oOhKJ-0000Nz-2b
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 11:20:57 -0400
Received: from proxy02.sjtu.edu.cn (smtp188.sjtu.edu.cn [202.120.2.188])
 by smtp236.sjtu.edu.cn (Postfix) with ESMTPS id E6B411008B38D;
 Thu, 18 Aug 2022 23:12:52 +0800 (CST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by proxy02.sjtu.edu.cn (Postfix) with ESMTP id 0DE1A2391A011;
 Thu, 18 Aug 2022 23:12:52 +0800 (CST)
X-Virus-Scanned: amavisd-new at 
Received: from proxy02.sjtu.edu.cn ([127.0.0.1])
 by localhost (proxy02.sjtu.edu.cn [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 5UXXuEM98XcP; Thu, 18 Aug 2022 23:12:51 +0800 (CST)
Received: from localhost.localdomain (unknown [202.120.40.82])
 (Authenticated sender: qtxuning1999@sjtu.edu.cn)
 by proxy02.sjtu.edu.cn (Postfix) with ESMTPSA id 124892391A010;
 Thu, 18 Aug 2022 23:12:44 +0800 (CST)
From: Guo Zhi <qtxuning1999@sjtu.edu.cn>
To: eperezma@redhat.com, jasowang@redhat.com, sgarzare@redhat.com,
 mst@redhat.com
Cc: qemu-devel@nongnu.org,
	Guo Zhi <qtxuning1999@sjtu.edu.cn>
Subject: [RFC 0/2] Virtio in order feature support for virtio-net device.
Date: Thu, 18 Aug 2022 23:12:42 +0800
Message-Id: <20220818151244.2050-1-qtxuning1999@sjtu.edu.cn>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=202.120.2.236;
 envelope-from=qtxuning1999@sjtu.edu.cn; helo=smtp236.sjtu.edu.cn
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_SORBS_WEB=1.5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

In virtio-spec 1.1, new feature bit VIRTIO_F_IN_ORDER was introduced.
When this feature has been negotiated, virtio driver will use
descriptors in ring order: starting from offset 0 in the table, and
wrapping around at the end of the table. Virtio devices will always use
descriptors in the same order in which they have been made available.
This can reduce virtio accesses to used ring.

Based on updated virtio-spec, this series realized IN_ORDER prototype
for virtio-net device in QEMU.

Some work haven't been done in this patch series:
1. Virtio device in_order support for packed vq is left for the future.

Related patches:
In order feature in Linux(support virtio driver, vhost_test and vsock device): https://lkml.org/lkml/2022/8/17/643

Guo Zhi (2):
  virtio: expose used buffers
  virtio: enable f_in_order feature for virtio-net

 hw/net/virtio-net.c        | 30 +++++++++++++++++++++++++++---
 include/hw/virtio/virtio.h |  4 +++-
 2 files changed, 30 insertions(+), 4 deletions(-)

-- 
2.17.1



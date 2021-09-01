Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B68523FDDED
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 16:44:56 +0200 (CEST)
Received: from localhost ([::1]:49008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLRTz-00062K-ON
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 10:44:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.davydov@virtuozzo.com>)
 id 1mLMEF-0003bF-Ls
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 05:08:19 -0400
Received: from relay.sw.ru ([185.231.240.75]:35408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.davydov@virtuozzo.com>)
 id 1mLME6-0005OX-35
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 05:08:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=virtuozzo.com; s=relay; h=MIME-Version:Message-Id:Date:Subject:From:
 Content-Type; bh=3YSujolLv/yWWqLflRXJooQucC4DZ5eW6P/XDDgLrAc=; b=jABRzTji6P2U
 qkK4B7ftcesTAYuItfdTamLRpdKOH/DPwsQ/nxhnFQLYKkCUSFvyYQLuzEN1ERJGne5tNzFP9TrNt
 dYGhVnEQBj2HSLsnOSUiYCCj1sjisPgxGq7zj5xpEHZuK8phG6MqwzpvPLbIM6ZFJFPTWq1AHud1i
 X5VrI=;
Received: from [192.168.15.100] (helo=max-Swift-SF314-57.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.94.2)
 (envelope-from <maxim.davydov@virtuozzo.com>)
 id 1mLME0-000RwD-Fq; Wed, 01 Sep 2021 12:08:04 +0300
From: Maxim Davydov <maxim.davydov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: den@openvz.org, mst@redhat.com, stefanha@redhat.com, fam@euphon.net,
 amit@kernel.org, kraxel@redhat.com, berrange@redhat.com,
 Maxim Davydov <maxim.davydov@virtuozzo.com>
Subject: [PATCH v1 0/8] Virtio features acknowledged by guest
Date: Wed,  1 Sep 2021 12:07:56 +0300
Message-Id: <20210901090804.7139-1-maxim.davydov@virtuozzo.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=185.231.240.75;
 envelope-from=maxim.davydov@virtuozzo.com; helo=relay.sw.ru
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 01 Sep 2021 10:43:12 -0400
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In some situations (for instance, debug), we want to be able to see the
features that were confirmed by the guest. At the same time, we would like
to do this safely, without the possibility of setting bits of guest
features from the outside.

Maxim Davydov (8):
  qdev-properties: Add read-only 64 bit property
  virtio: Add tracking of the common virtio guest features
  virtio-gpu: Add tracking of the virtio guest feature bits
  virtio-serial: Add tracking of the virtio guest feature bits
  virtio-net: Add tracking of the virtio guest feature bits
  scsi: Add tracking of the acknowledged feature bits
  virtio-blk: Add tracking of the virtio guest feature bits
  virtio-balloon: Add tracking of the virtio guest feature bits

 hw/block/virtio-blk.c          |  20 ++++---
 hw/char/virtio-serial-bus.c    |   5 +-
 hw/core/qdev-properties.c      |  32 +++++++++++
 hw/display/vhost-user-gpu.c    |   3 +-
 hw/display/virtio-gpu.c        |   8 +--
 hw/net/virtio-net.c            | 118 +++++++++++++++++++++++++----------------
 hw/scsi/vhost-scsi.c           |   6 +--
 hw/scsi/vhost-user-scsi.c      |  18 +++----
 hw/scsi/virtio-scsi.c          |  10 ++--
 hw/virtio/virtio-balloon.c     |  20 ++++---
 hw/virtio/virtio.c             |   2 +-
 include/hw/qdev-properties.h   |   5 ++
 include/hw/virtio/virtio-gpu.h |  10 ++--
 include/hw/virtio/virtio.h     |  39 +++++++++-----
 14 files changed, 193 insertions(+), 103 deletions(-)

-- 
1.8.3.1



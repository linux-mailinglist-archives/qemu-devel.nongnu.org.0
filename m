Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CB614CC1C
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jan 2020 15:08:34 +0100 (CET)
Received: from localhost ([::1]:47046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iwo1B-0002j6-Bq
	for lists+qemu-devel@lfdr.de; Wed, 29 Jan 2020 09:08:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40531)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dplotnikov@virtuozzo.com>) id 1iwo09-0001Kr-JW
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 09:07:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dplotnikov@virtuozzo.com>) id 1iwo08-0001DJ-GL
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 09:07:29 -0500
Received: from relay.sw.ru ([185.231.240.75]:53606)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dplotnikov@virtuozzo.com>)
 id 1iwo08-00013R-8y; Wed, 29 Jan 2020 09:07:28 -0500
Received: from dptest2.qa.sw.ru ([10.94.4.71])
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <dplotnikov@virtuozzo.com>)
 id 1iwnzs-0003j6-US; Wed, 29 Jan 2020 17:07:13 +0300
From: Denis Plotnikov <dplotnikov@virtuozzo.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 0/4] Increase default virtqueue size to improve performance
Date: Wed, 29 Jan 2020 17:06:58 +0300
Message-Id: <20200129140702.5411-1-dplotnikov@virtuozzo.com>
X-Mailer: git-send-email 2.17.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 185.231.240.75
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
Cc: fam@euphon.net, kwolf@redhat.com, vsementsov@virtuozzo.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, mst@redhat.com,
 stefanha@redhat.com, mreitz@redhat.com, pbonzini@redhat.com, den@virtuozzo.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The goal is to increase the performance of the block layer on
1M reads/writes up to 4% by reducing the amount of requests issued by a guest
using virtio-scsi or virtio-blk devices.

Original problem description:
https://lists.gnu.org/archive/html/qemu-devel/2017-12/msg03721.html


Denis Plotnikov (4):
  virtio: introduce VIRTQUEUE_DEFUALT_SIZE instead of hardcoded
    constants
  virtio: increase virtuqueue size for virtio-scsi and virtio-blk
  tests: add virtuqueue size checking to virtio_seg_max_adjust test
  tests: rename virtio_seg_max_adjust to virtio_check_params

 hw/block/virtio-blk.c                         |  6 ++--
 hw/core/machine.c                             |  3 ++
 hw/scsi/virtio-scsi.c                         |  5 +--
 include/hw/virtio/virtio.h                    |  1 +
 ...g_max_adjust.py => virtio_check_params.py} | 33 ++++++++++++-------
 5 files changed, 32 insertions(+), 16 deletions(-)
 rename tests/acceptance/{virtio_seg_max_adjust.py => virtio_check_params.py} (79%)

-- 
2.17.0



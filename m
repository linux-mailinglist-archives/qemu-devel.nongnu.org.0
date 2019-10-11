Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E2DD39CF
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Oct 2019 09:06:21 +0200 (CEST)
Received: from localhost ([::1]:46376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIp0G-0000oX-RF
	for lists+qemu-devel@lfdr.de; Fri, 11 Oct 2019 03:06:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58066)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <its@irrelevant.dk>) id 1iIow6-0007CH-PN
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 03:02:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <its@irrelevant.dk>) id 1iIow5-0007lu-C4
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 03:02:02 -0400
Received: from charlie.dont.surf ([128.199.63.193]:46522)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <its@irrelevant.dk>) id 1iIow4-0007hO-Px
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 03:02:00 -0400
Received: from apples.localdomain (unknown [194.62.217.57])
 by charlie.dont.surf (Postfix) with ESMTPSA id 948C0BF450;
 Fri, 11 Oct 2019 07:01:57 +0000 (UTC)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/1] pci: pass along the return value of dma_memory_rw
Date: Fri, 11 Oct 2019 09:01:40 +0200
Message-Id: <20191011070141.188713-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 128.199.63.193
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

While working on fixing the emulated nvme device to pass more tests in
the blktests suite, I discovered that the pci_dma_rw function ignores
the return value of dma_memory_rw.

The nvme device needs to handle DMA errors gracefully in order to pass
the block/011 test ("disable PCI device while doing I/O") in the
blktests suite. This is only possible if the device knows if the DMA
transfer was successful or not.

I can't see what the reason for ignoring the return value would be. But
if there is a good reason, please enlighten me :)


Klaus Jensen (1):
  pci: pass along the return value of dma_memory_rw

 include/hw/pci/pci.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

--=20
2.23.0



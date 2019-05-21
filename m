Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A950E253A9
	for <lists+qemu-devel@lfdr.de>; Tue, 21 May 2019 17:19:43 +0200 (CEST)
Received: from localhost ([127.0.0.1]:55410 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hT6YI-0000Hj-Oz
	for lists+qemu-devel@lfdr.de; Tue, 21 May 2019 11:19:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54090)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <liq3ea@163.com>) id 1hT6VQ-0007Vh-Q1
	for qemu-devel@nongnu.org; Tue, 21 May 2019 11:16:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <liq3ea@163.com>) id 1hT6VP-0001Yz-W9
	for qemu-devel@nongnu.org; Tue, 21 May 2019 11:16:44 -0400
Received: from m12-16.163.com ([220.181.12.16]:57266)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <liq3ea@163.com>)
	id 1hT6VP-0001VV-Di; Tue, 21 May 2019 11:16:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=3MoRSJyCsIFKNNUCfB
	vEtOAISeqVYFTvmBIb424LSkw=; b=cMHjRLnT2kh/sil4TjDYpZl/kFJhguuj/b
	rvDUaMpzX6OJhrXgzlyCdnu2XOeljWEp39nxQfEjmZS2IkwA8VtopcQk7WrnUHt+
	+8NDAoMHWZE+4B5CGy98d11nV839ITTh3mhS7o/TqaDB6cvyxAefjAfL/ACS47wG
	KJhzggEZA=
Received: from localhost.localdomain (unknown [115.192.71.0])
	by smtp12 (Coremail) with SMTP id EMCowAC31lxJFuRcie7uGw--.4521S2;
	Tue, 21 May 2019 23:16:26 +0800 (CST)
From: Li Qiang <liq3ea@163.com>
To: alex.williamson@redhat.com,
	lvivier@redhat.com
Date: Tue, 21 May 2019 08:15:39 -0700
Message-Id: <20190521151543.92274-1-liq3ea@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: EMCowAC31lxJFuRcie7uGw--.4521S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7XFyUJF1rury8JFykAr1kXwb_yoW3GrcEk3
	4Fvws8GrZIgasIkFW2kr17Ww18Cw4rurn0y34rAryqvws8Jas8GF97CrWSgF17ur4SyF9x
	GrW7uryayr9xWjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjdHUPUUUUU==
X-Originating-IP: [115.192.71.0]
X-CM-SenderInfo: 5oltjvrd6rljoofrz/1tbiFAi7bVaD011gfAAAsN
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 220.181.12.16
Subject: [Qemu-devel] [PATCH v2 0/4] hw: vfio: some trivial fix
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-trivial@nongnu.org, philmd@redhat.com, liq3ea@gmail.com,
	qemu-devel@nongnu.org, Li Qiang <liq3ea@163.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These patchset fix some trivial issues,
The first patch makes the code more QOMConventions.
The second decouples VMStateDescription's name with
QOM TypeInfo's name.
The third fixes a typo.
The fourth reduce duplicated code.

Change since v1:
Add more commit message.

Li Qiang (4):
  vfio: pci: make "vfio-pci-nohotplug" as MACRO
  hw: vfio: drop TYPE_FOO MACRO in VMStateDescription
  vfio: platform: fix a typo
  pci: msix: move 'MSIX_CAP_LENGTH' to header file

 hw/pci/msix.c           | 2 --
 hw/vfio/amd-xgbe.c      | 2 +-
 hw/vfio/ap.c            | 2 +-
 hw/vfio/calxeda-xgmac.c | 2 +-
 hw/vfio/ccw.c           | 2 +-
 hw/vfio/pci.c           | 8 ++++----
 hw/vfio/platform.c      | 6 +++---
 include/hw/pci/msix.h   | 2 ++
 8 files changed, 13 insertions(+), 13 deletions(-)

-- 
2.17.1




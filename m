Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43AF226153E
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Sep 2020 18:46:58 +0200 (CEST)
Received: from localhost ([::1]:58410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFgll-0003oy-By
	for lists+qemu-devel@lfdr.de; Tue, 08 Sep 2020 12:46:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liq3ea@163.com>) id 1kFghY-00076Q-DV
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 12:42:36 -0400
Received: from mail-m975.mail.163.com ([123.126.97.5]:49854)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <liq3ea@163.com>) id 1kFghU-0002LO-J5
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 12:42:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=OiUWNBGb0Ru3yYy03Z
 Sn76FCRBvcPOrzw9+9YsfsfL8=; b=SAt6Rq3wBkdrl8BJ6V1Qnfd+7tKm2OPFbN
 l77EbVvU2y0Abjx0jb2KQ7z/ZVSZ6jZKf/RcA9tasflrDtiMZy5hUfWXFQj3GwoL
 TXvVGOE+M2jupSpTYoOCsIrE/VtnLBKohSmnY+zu7iG0t3km7SqKMkYyaa6dYe/s
 0xVU0VZ/o=
Received: from localhost.localdomain (unknown [183.158.94.209])
 by smtp5 (Coremail) with SMTP id HdxpCgCnGRhetFdf9j7RJg--.1087S4;
 Wed, 09 Sep 2020 00:42:07 +0800 (CST)
From: Li Qiang <liq3ea@163.com>
To: dmitry.fleytman@gmail.com, jasowang@redhat.com, kraxel@redhat.com,
 pbonzini@redhat.com, berrange@redhat.com, ehabkost@redhat.com,
 alxndr@bu.edu, peter.maydell@linaro.org, f4bug@amsat.org
Subject: [RFC 0/4] Add a 'in_mmio' device flag to avoid the DMA to MMIO
Date: Tue,  8 Sep 2020 09:41:53 -0700
Message-Id: <20200908164157.47108-1-liq3ea@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: HdxpCgCnGRhetFdf9j7RJg--.1087S4
X-Coremail-Antispam: 1Uf129KBjvdXoW7JrWUXrWrJw13KFykZryrJFb_yoWDWrc_Wa
 yFv3yrJw48Zas3JFy7Wr15ArW7tw4Ivw18WF13trWIgFyUWry3ur4kKry2gr1fXr4DZ34r
 Zr1qqrWSyw1UWjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUUrb15UUUUU==
X-Originating-IP: [183.158.94.209]
X-CM-SenderInfo: 5oltjvrd6rljoofrz/xtbCCgiZbV2MX35SRQAAsR
Received-SPF: pass client-ip=123.126.97.5; envelope-from=liq3ea@163.com;
 helo=mail-m975.mail.163.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/08 12:42:19
X-ACL-Warn: Detected OS   = Linux 3.1-3.10
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Currently the qemu device fuzzer find some DMA to MMIO issue. If the
device handling MMIO currently trigger a DMA which the address is MMIO,
this will reenter the device MMIO handler. As some of the device doesn't
consider this it will sometimes crash the qemu.

This patch tries to solve this by adding a per-device flag 'in_mmio'.
When the memory core dispatch MMIO it will check/set this flag and when
it leaves it will clean this flag.


Li Qiang (4):
  memory: add memory_region_init_io_with_dev interface
  memory: avoid reenter the device's MMIO handler while processing MMIO
  e1000e: use the new memory_region_init_io_with_dev interface
  hcd-xhci: use the new memory_region_init_io_with_dev interface

 hw/net/e1000e.c        |  8 ++++----
 hw/usb/hcd-xhci.c      | 25 ++++++++++++++---------
 include/exec/memory.h  |  9 +++++++++
 include/hw/qdev-core.h |  1 +
 softmmu/memory.c       | 46 +++++++++++++++++++++++++++++++++++++++---
 5 files changed, 72 insertions(+), 17 deletions(-)

-- 
2.17.1



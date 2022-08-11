Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C02590414
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 18:42:44 +0200 (CEST)
Received: from localhost ([::1]:37848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMBGd-0006Rp-IO
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 12:42:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oMBE0-0001DY-QT; Thu, 11 Aug 2022 12:40:00 -0400
Received: from mail-ua1-x930.google.com ([2607:f8b0:4864:20::930]:35656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oMBDy-0003V2-Iq; Thu, 11 Aug 2022 12:39:59 -0400
Received: by mail-ua1-x930.google.com with SMTP id f10so7156011uap.2;
 Thu, 11 Aug 2022 09:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=awyYdUNueaTLUWrcfnpkP3c+BR329PRR0N5mtdm/TnA=;
 b=FcLCIbXQj75TrfY4D50WXOlZHKMx8cXDfoHwxjZHq+3cGnlpYIPWyL5C4+XUEANuMY
 AgeIGCKHLC8jj8+yJ3KuxnHal63ZLV1GQubyJZEioYY2eru3aVMxyeASdlZl/kqvLXvy
 MuTf1lwH0qJ0p7zlkV5Smy6699w7+SaxDrH9+liDDjWhwpgFTEhz/8T/5GLnR8Rkwff7
 lGdRAYD5UOwETZfLu3R9n+9zlJladyhWJxkdtVW6WJAangPl7Qu8GE8FiywlxiveZJO1
 sYg89J9kI4t3WQCh3TaIenbzKabVv//uBc9Oq9gi0PdxUNMYdbvxZnkyPl9m0dNekd8V
 cRDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=awyYdUNueaTLUWrcfnpkP3c+BR329PRR0N5mtdm/TnA=;
 b=BzflkRECvSXFHwODJlbdMN339eE6sP4ekVCE8wu3VEQDYPKQcctaRRn2oWoarAA/ZZ
 cu+t99ldJ2olbtNd1pCZ5SQcw9HzJiDdVqAo2G6Fu4lv3ndWAv2gNSBRE3cxuBPofkCe
 DoUsmyt+b/r1nq3ZYF0MZcATRC6Wl10k1HA9tVPiIEkksjoh3Im1cSFtWrPPEruNNsZi
 07+z5zxnnITbmQ6iosV+kUvdlgPXQxYVE/yN/zdu5bh63JfcvTSs9QYVguKqXPKf1Miw
 JMhL9x6EkoX0iT4OJ5n7I8irOZb52xJGDOGalUDoRm48vSfiwemtCAJ9kJnhWXhOuOfo
 L30A==
X-Gm-Message-State: ACgBeo0DHXORRWZ56QxSeRowfklXg1KhF8A3hE/jClWzL51hqZczEXUa
 VMBungw9RDwe5SFtu0IPaQgeTKYCvmA=
X-Google-Smtp-Source: AA6agR5iGPDpzVfYrvxKRfAaXlM2vk2XWZ8VMhlw/DBoPvYIP5Lyg1P4q4WlQzR/r7p2QLA3FqyiuA==
X-Received: by 2002:ab0:7c46:0:b0:38c:8967:bd23 with SMTP id
 d6-20020ab07c46000000b0038c8967bd23mr9689276uaw.105.1660235995719; 
 Thu, 11 Aug 2022 09:39:55 -0700 (PDT)
Received: from balboa.COMFAST (201-43-216-47.dsl.telesp.net.br.
 [201.43.216.47]) by smtp.gmail.com with ESMTPSA id
 j9-20020a67fa49000000b00373d697e3e2sm1755013vsq.19.2022.08.11.09.39.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Aug 2022 09:39:55 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, fbarrat@linux.ibm.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH for-7.2 v4 00/11] enable pnv-phb user created devices
Date: Thu, 11 Aug 2022 13:39:39 -0300
Message-Id: <20220811163950.578927-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::930;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x930.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hi,

This version contains changes based on Cedric's v3 feedback. The biggest
change was made in patch 4, where a new helper was added to handle the
logic where a PHB is added to a chip. 

Changes from v3:
- patch 4:
  - added Error **errp parameter to pnv_parent_bus_fixup() and pnv_phb_user_device_init()
  - added pnv_chip_add_phb() helper
- patch 5:
  - changed pnv_chip_power8_instance_init() to use an 'Object *phb' pointer
- patch 6:
  - added the default PHBs under an "if (defaults_enabled())" case
- patch 7:
  - pnv_phb4_get_pec() was moved to hw/ppc/pnv.c 
- patch 9:
  - use g_assert_not_reached() in pnv_phb4_get_pec()
- v3 link: https://lists.gnu.org/archive/html/qemu-devel/2022-08/msg01548.html

Daniel Henrique Barboza (11):
  ppc/pnv: add phb-id/chip-id PnvPHB3RootBus properties
  ppc/pnv: add phb-id/chip-id PnvPHB4RootBus properties
  ppc/pnv: set root port chassis and slot using Bus properties
  ppc/pnv: add helpers for pnv-phb user devices
  ppc/pnv: turn chip8->phbs[] into a PnvPHB* array
  ppc/pnv: enable user created pnv-phb for powernv8
  ppc/pnv: add PHB4 helpers for user created pnv-phb
  ppc/pnv: enable user created pnv-phb for powernv9
  ppc/pnv: change pnv_phb4_get_pec() to also retrieve chip10->pecs
  ppc/pnv: user creatable pnv-phb for powernv10
  ppc/pnv: fix QOM parenting of user creatable root ports

 hw/pci-host/pnv_phb.c          | 120 +++++++++++++++++++++++++++------
 hw/pci-host/pnv_phb3.c         |  50 ++++++++++++++
 hw/pci-host/pnv_phb4.c         |  51 ++++++++++++++
 hw/pci-host/pnv_phb4_pec.c     |   6 +-
 hw/ppc/pnv.c                   | 103 +++++++++++++++++++++++++---
 include/hw/pci-host/pnv_phb3.h |   9 ++-
 include/hw/pci-host/pnv_phb4.h |  10 +++
 include/hw/ppc/pnv.h           |   7 +-
 8 files changed, 325 insertions(+), 31 deletions(-)

-- 
2.36.1



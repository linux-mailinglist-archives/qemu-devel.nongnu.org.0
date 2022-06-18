Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E65955041D
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Jun 2022 13:04:56 +0200 (CEST)
Received: from localhost ([::1]:44560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2WG7-0002GY-Jc
	for lists+qemu-devel@lfdr.de; Sat, 18 Jun 2022 07:04:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o2WDU-0007h5-IL; Sat, 18 Jun 2022 07:02:12 -0400
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29]:34412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o2WDS-0005cp-MV; Sat, 18 Jun 2022 07:02:12 -0400
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-101ab23ff3fso4734952fac.1; 
 Sat, 18 Jun 2022 04:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DpJkhjsu0D5tiHYgx/WidGQr8oCzKcEmE1XV6ROLi00=;
 b=mxiizExt9snFdhWo5x1siRuDewOci8cOma9IY1IoNOXFBCYPCAuxW6rBGwIT6t7DXT
 uTKZiUvAYHjY0vtqqcuY38m1QsCARKFE4K2G3Hc09Du7X4eF5iANjozuAGZHlXAfLuIq
 38Ss3ksKBx2A/PNPsOCmveMd/lamZ2ufMqo04y22k5wIQe58yBOYu7T2plEfICsOef7I
 T7sa5gLcQGz2fCW3swyXkyIwME87kVS9DCB0oM5acFB8E8GfrNkYFFsmDneKfa80v8Ny
 na7q+aV7d3sNipv6/uFOjnW+3M7KoYzNn/TNKAlDcrLCVEqtRn3RkQkXD8LK1mR+8S8H
 44IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DpJkhjsu0D5tiHYgx/WidGQr8oCzKcEmE1XV6ROLi00=;
 b=j2dhF8Bq1WROtOHk4BBc3etQ4vmDPH229h6lTYSAh+jK8ccOt30fQfJtcMezomKCJj
 Zo8SEFxQglWI2FWO9ZOtfdF0Oij5Bs5rP5tUB2b0V9ygPE1VF3yhhTdnQfe1w0hw6C4s
 FDRY/4zavWLtCmcrMrLgJi0Nq9NTrcJN2UjyQKkwo0q8HE+KJB6dFxpTm7Hmhktcm8gW
 iuXawg+g6Is1J9gw2kuOTVa+Ufp1fccsYUX4XuybPGL5BppAC6tauvpWvaE1mrrmND6w
 gquC87jCvTkJNjWZEBWsKjImAXlAruhqw0k8cmy+E4k/8qmIPYPP80c27hqUojWRsteX
 mGoA==
X-Gm-Message-State: AJIora9JNdV7kOsMlyYAR/rChuGV/7pn/RlETc/eqqXjtdHbVI2dy5gR
 SKZ/80q55LTD0AdY7X7UXHyr9HuIkV0=
X-Google-Smtp-Source: AGRyM1swCut7A/mqjWELN/1XSzA4Jpvu0GPA0L3aVKGmuhdWmzWtQLSPQJntERlBznJyU1cwcxhPhA==
X-Received: by 2002:a05:6870:582a:b0:fe:436b:d94 with SMTP id
 r42-20020a056870582a00b000fe436b0d94mr8115859oap.38.1655550128877; 
 Sat, 18 Jun 2022 04:02:08 -0700 (PDT)
Received: from balboa.ibmmodules.com ([2804:431:c7c6:ccc8:8e07:268b:a09:2834])
 by smtp.gmail.com with ESMTPSA id
 w16-20020a9d5a90000000b0060603221280sm4075456oth.80.2022.06.18.04.02.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Jun 2022 04:02:08 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, fbarrat@linux.ibm.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v2 0/9] pnv-phb related cleanups
Date: Sat, 18 Jun 2022 08:01:53 -0300
Message-Id: <20220618110202.87735-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x29.google.com
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

This second version contains changes and fixes suggested by Frederic and Cedric
in the v1 review.

As I've mentioned in the v1, I cropped patches that are more related with
the user created device logic. Patches 8-11 will be resend later in another
series.

I ended up sliding in a couple of new patches (8 and 9) to fix an issue I found
while spinning this new version.

No functional changes, aside from the QOM change in patch 2, were made
intentionally.

changes from v2:
- patch 3:
  * removed 'if (dev)' check in pnv_phb3_root_port_realize()
- patch 5:
  * opencoded pnv_ics_get_phb_ics() into pnv_ics_get()
  * removed pnv_ics_get_phb_ics()
  * removed ForeachPhb3Args struct
- patch 6:
  * restore the 'ics_resend()' call back in pnv_ics_resend()
- patch 8 (new):
  * remove INTERFACE_PCIE_DEVICE from pnv-phb3-root-bus
- patch 9 (new):
  * remove INTERFACE_PCIE_DEVICE from pnv-phb4-root-bus
- v1 link: https://lists.gnu.org/archive/html/qemu-devel/2022-06/msg02333.html 


Daniel Henrique Barboza (9):
  ppc/pnv: move root port attach to pnv_phb4_realize()
  ppc/pnv: attach phb3/phb4 root ports in QOM tree
  ppc/pnv: use dev->parent_bus->parent to get the PHB
  ppc/pnv: use dev instead of pci->qdev in root_port_realize()
  ppc/pnv: make pnv_ics_get() use the chip8->phbs[] array
  ppc/pnv: make pnv_ics_resend() use chip8->phbs[]
  ppc/pnv: make pnv_chip_power8_pic_print_info() use chip8->phbs[]
  ppc/pnv: remove 'INTERFACE_PCIE_DEVICE' from phb3 root bus
  ppc/pnv: remove 'INTERFACE_PCIE_DEVICE' from phb4 root bus

 hw/pci-host/pnv_phb3.c     | 20 ++++-----
 hw/pci-host/pnv_phb4.c     | 23 +++++-----
 hw/pci-host/pnv_phb4_pec.c |  3 --
 hw/ppc/pnv.c               | 89 ++++++++++++++------------------------
 include/hw/ppc/pnv.h       |  2 +-
 5 files changed, 57 insertions(+), 80 deletions(-)

-- 
2.36.1



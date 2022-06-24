Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B465595CF
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 10:54:48 +0200 (CEST)
Received: from localhost ([::1]:58600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4f5U-0007q3-2Q
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 04:54:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o4f0N-00024x-Be; Fri, 24 Jun 2022 04:49:31 -0400
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f]:45719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o4f0L-0000AU-Hq; Fri, 24 Jun 2022 04:49:30 -0400
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-1048b8a38bbso2861299fac.12; 
 Fri, 24 Jun 2022 01:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TgBc0Sr6iv2b16WY3NwXZrqfdNYJwDbLPHOw4r7XsW4=;
 b=JHBIKLEQIoRZjyH1YD8mGKYelyQk6LEFELXaswS6/LgIxg9jmTtaCVoYaLBG8mPnbb
 RT0kE2DwhZwOOngbyFu83NpwgGZ5YtrmXtE8sVbjl/0CgiyIo/0U+M4yY0TJj5JPMgYb
 z8mzcn5WvDtbmZaAhlwimnwSbpVJqb3T/BEnHr1qz6NB3Q9ptdwfoMTyh+8jlhr71CqJ
 6p5TZQTsoBDFuPsRyk1WRqxaa/0hITRGIfBfS430RsUh8uuliaSdu+XOOS+h1VqLBMsw
 9bfB36+ED5dPHzVDUULpYrewkc6rjPxCFnfkCKthRp3Z9bFyJZ51aZ3atoY1FWYBFrM4
 TmRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TgBc0Sr6iv2b16WY3NwXZrqfdNYJwDbLPHOw4r7XsW4=;
 b=VNFy5sA9jm/Wos1mg9zZKbh9gbPdPwR/lHKZqVlSatSx09VnRddXkVKRe/s0KG1gdY
 mb+nTxoGSgR+bjf7+5WovdfQXeoA8nc5wGeZa3ZWxhTkIejfQdHSlBFa/9p5We4k74lt
 vaKG47MNFXVrC2MF9OL54kq4Ce2464FDxAAGjGn8Ws/Za3uwpkUxPq4Tnuioif1Qwhmt
 Qq4zvtHfMF6KKdZt/dZ6uOnqvQUMUoSQOD+tPTi8+qWJgRf0scuG3hPSekfQeG7sIjip
 LeTrsByoBvFytJo6ogKNboON1MXpzs1lf1gVOCG++RjmWm14W5n1rgZdhkTIKuXILczG
 Q6RQ==
X-Gm-Message-State: AJIora9XhgQpyaqshnUuOtZl9wrYCke3mukR4gxqkzd/27EPG8PmPSNG
 kU64dU7+6XCUmIeRUP0tGq1wzQCjMnU=
X-Google-Smtp-Source: AGRyM1sWw3VIy+DqjD9sttjw07zJ+HBqIs5oyRbE40QREHk3TM7jsAszS54U1GpVWcabM794TNsO0g==
X-Received: by 2002:a05:6870:659e:b0:101:a9f6:86af with SMTP id
 fp30-20020a056870659e00b00101a9f686afmr1400866oab.120.1656060567161; 
 Fri, 24 Jun 2022 01:49:27 -0700 (PDT)
Received: from balboa.ibmmodules.com ([191.193.1.105])
 by smtp.gmail.com with ESMTPSA id
 u8-20020a056830230800b0061698ef90e5sm1192768ote.31.2022.06.24.01.49.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jun 2022 01:49:26 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, fbarrat@linux.ibm.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v3 00/12] powernv: introduce pnv-phb base/proxy devices
Date: Fri, 24 Jun 2022 05:49:09 -0300
Message-Id: <20220624084921.399219-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2f;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2f.google.com
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

This is the version 3 of the pnv-phb proxy device which has the
following main differences from v2:

- it's rebased on top of "[PATCH v3 0/8] pnv-phb related cleanups"
- it doesn't have any patches related to user-created devices

There is no user visible change made here yet. We're making device
changes that are effective using default settings.

Changes from v2:
- all related changes made with the rebase on top of "[PATCH v3 0/8]
pnv-phb related cleanups"
- the following user devices patches were removed:
  - ppc/pnv: user created pnv-phb for powernv8
  - ppc/pnv: user created pnv-phb for powernv9
  - ppc/pnv: change pnv_phb4_get_pec() to also retrieve chip10->pecs 
  - ppc/pnv: user creatable pnv-phb for powernv10 
- v2 link: https://lists.gnu.org/archive/html/qemu-devel/2022-05/msg06254.html

Daniel Henrique Barboza (12):
  ppc/pnv: add PHB3 bus init helper
  ppc/pnv: add PnvPHB base/proxy device
  ppc/pnv: turn PnvPHB3 into a PnvPHB backend
  ppc/pnv: add PHB4 bus init helper
  ppc/pnv: turn PnvPHB4 into a PnvPHB backend
  ppc/pnv: add pnv-phb-root-port device
  ppc/pnv: remove pnv-phb3-root-port
  ppc/pnv: remove pnv-phb4-root-port
  ppc/pnv: remove root port name from pnv_phb_attach_root_port()
  ppc/pnv: remove pecc->rp_model
  ppc/pnv: remove PnvPHB4.version
  ppc/pnv: move attach_root_port helper to pnv-phb.c

 hw/pci-host/meson.build        |   3 +-
 hw/pci-host/pnv_phb.c          | 244 +++++++++++++++++++++++++++++++++
 hw/pci-host/pnv_phb.h          |  55 ++++++++
 hw/pci-host/pnv_phb3.c         | 106 ++++----------
 hw/pci-host/pnv_phb4.c         | 144 ++++---------------
 hw/pci-host/pnv_phb4_pec.c     |   5 +-
 hw/ppc/pnv.c                   |  68 ++++-----
 include/hw/pci-host/pnv_phb3.h |  12 +-
 include/hw/pci-host/pnv_phb4.h |  18 +--
 include/hw/ppc/pnv.h           |   5 +-
 10 files changed, 401 insertions(+), 259 deletions(-)
 create mode 100644 hw/pci-host/pnv_phb.c
 create mode 100644 hw/pci-host/pnv_phb.h

-- 
2.36.1



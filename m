Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91155480CD1
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Dec 2021 20:44:21 +0100 (CET)
Received: from localhost ([::1]:36862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2IOQ-0006hv-Ge
	for lists+qemu-devel@lfdr.de; Tue, 28 Dec 2021 14:44:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n2IIe-0003iN-FR; Tue, 28 Dec 2021 14:38:20 -0500
Received: from [2607:f8b0:4864:20::833] (port=45781
 helo=mail-qt1-x833.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n2IIc-00043c-7x; Tue, 28 Dec 2021 14:38:20 -0500
Received: by mail-qt1-x833.google.com with SMTP id p19so17021331qtw.12;
 Tue, 28 Dec 2021 11:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YSuZZP4Pavigk1uaydCMo6TBO9tkTdWagOhCQs42diU=;
 b=WG9VxcFKxourdeRqv0RMpLIPleb+IIOcQL+OIpbWBQ5910A9mHSQ5eZGiKds9G6/Xq
 bDuMPRKAnWQQ+3ZU1fynPd3rnmQJ1/8Awy7zUSHGwIleoc74K6UejKmEBjbn7KHP9dT/
 vT+zS0yQPE66JwykcBXXZWTKFRDpnE+jhOtB9lzJGz9DUy/QoTvL40z3jjDxpMgspbgu
 iCjOHZP1EWHkWz4lAdbC0Uz6dVGtUdh98+M1tjfbDV4QM9p1L6rWzG3G96gEyiXLX+cP
 BaB5n+yS1w8EbDJSRdnvB8feSJtKhwtzvt7/WcOb+jI9qpKsrYonYbvhesPM0hDZ3Rz+
 P1FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YSuZZP4Pavigk1uaydCMo6TBO9tkTdWagOhCQs42diU=;
 b=jMnRehVwo143KWKmnfpxWKmFP7xOb8O9RDKsUr6aEytGkU8+zGw10wJOSkRsfHdIYW
 cxCGcdZDtJeIidOYSIQeB1Vl/YH48VJ458paDY1TmTpQnHIvEF4PLHP5bmMaCNakfkhu
 SR7ZLfB0xQaqPuBZM4UF3WqqoBzW74vP7vdWzOr2n2Bpt9+8zlqkNzSXwtqpzJL5FLen
 ZKpAYCqYCE7OyThZZJnhGSDM8i8iuTelSzm8gfuD8M5Nba30aScdhwIUWcjdepuK/8/D
 iUS/ypf/xNqDDWy0T68L6o+Geq7d6zYI3Y3fliVu8yqRxr1GZKEC1/A/Y+kpTaur7Kbc
 H1mA==
X-Gm-Message-State: AOAM532wsj3csZW98J1Hsk+FEOvUMCshyLjVhDOn74+FOhl0g4Hk+rwo
 /GV9YD56qDC37MT6LEAvVbUWicUMfa0=
X-Google-Smtp-Source: ABdhPJyHy8AnZDcU3cPRWokFxkDJA0X+iEXc4lrakbta5NbsYydEtzTm+IUCiYnQMRayt8Mn2uqpbw==
X-Received: by 2002:ac8:7505:: with SMTP id u5mr19285567qtq.449.1640720296392; 
 Tue, 28 Dec 2021 11:38:16 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:7ce4:b718:2cc0:32df:97ee])
 by smtp.gmail.com with ESMTPSA id r20sm16924059qkp.21.2021.12.28.11.38.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 11:38:16 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/17] ppc/pnv: enable pnv-phb4 user devices
Date: Tue, 28 Dec 2021 16:37:49 -0300
Message-Id: <20211228193806.1198496-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::833
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::833;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x833.google.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This series implements pnv-phb4 user devices for the powernv9 machine.
It also includes a couple of pnv-phb3 and pnv-phb3-root-port fixes that
were also applied for the pnv4 equivalents.

During the enablement I had to rollback from the previously added
support for user creatable pnv-phb4-pec devices. The most important
reason is user experience. PEC devices that doesn't spawn the PHB
devices will be just a placeholder to add PHBs, having no use of their
own as far as the user sees it. From this standpoint it makes more sense
to just create all PECs and attach the PHBs the user wants on them.
Patch 14 also describes technical reasons to rollback this support.

The series is rebased using Cedric's 'powernv-6.2' branch [1]i, which
includes the '[PATCH 0/5] ppc/pnv: Preliminary cleanups before user
created PHBs' patches [2].

[1] https://github.com/legoater/qemu/tree/powernv-6.2
[2] https://lists.gnu.org/archive/html/qemu-devel/2021-12/msg03810.html


Daniel Henrique Barboza (17):
  pnv_phb3.c: add unique chassis and slot for pnv_phb3_root_port
  pnv_phb3.c: do not set 'root-bus' as bus name
  pnv_phb3.h: change TYPE_PNV_PHB3_ROOT_BUS name
  pnv_phb4.c: add unique chassis and slot for pnv_phb4_root_port
  pnv.c: simplify pnv_phb_attach_root_port()
  pnv_phb4.c: attach default root port in phb4 realize()
  pnv_phb4.c: check if root port exists in rc_config functions
  pnv_phb4.c: introduce pnv_phb4_set_stack_phb_props()
  pnv_phb4_pec.c: move pnv_pec_phb_offset() to pnv_phb4.c
  pnv_phb4.c: introduce pnv_pec_init_stack_xscom()
  pnv_phb4_pec.c: use pnv_pec_get_phb_id() in pnv_pec_dt_xscom()
  pnv_phb4_pec.c: use 'default_enabled()' to init stack->phb
  pnv_phb4.h: turn phb into a pointer in struct PnvPhb4PecStack
  Revert "ppc/pnv: Introduce support for user created PHB4 devices"
  ppc/pnv: Introduce user creatable pnv-phb4 devices
  pnv_phb4.c: do not set 'root-bus' as bus name
  pnv_phb4.c: change TYPE_PNV_PHB4_ROOT_BUS name

 hw/pci-host/pnv_phb3.c         |  19 +++-
 hw/pci-host/pnv_phb4.c         | 188 +++++++++++++++++++++++++++++++--
 hw/pci-host/pnv_phb4_pec.c     | 107 ++++++-------------
 hw/ppc/pnv.c                   |  31 ++----
 include/hw/pci-host/pnv_phb3.h |   2 +-
 include/hw/pci-host/pnv_phb4.h |  13 ++-
 include/hw/ppc/pnv.h           |   1 +
 7 files changed, 252 insertions(+), 109 deletions(-)

-- 
2.33.1



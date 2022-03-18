Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 794C04DE00B
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 18:36:04 +0100 (CET)
Received: from localhost ([::1]:42746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVGWB-0007CG-Ie
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 13:36:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nVGTj-0004Oi-Q2; Fri, 18 Mar 2022 13:33:32 -0400
Received: from [2607:f8b0:4864:20::c2b] (port=39820
 helo=mail-oo1-xc2b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nVGTi-00029t-At; Fri, 18 Mar 2022 13:33:31 -0400
Received: by mail-oo1-xc2b.google.com with SMTP id
 q1-20020a4a7d41000000b003211b63eb7bso10934040ooe.6; 
 Fri, 18 Mar 2022 10:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZSBDvCmduhB8ruac4cuK0i15qx+G/Jt4NVS8OJmUmmc=;
 b=kee2ZkBBNrF/K63/JBOYTtVAoj3s0015s5eyGh2SAlNJmIAP6wj8FzUmfouPf9zG1v
 XlqrPdzJ4GS8vK/jHxfV48GqtDYTOVt3NlbikuSekutPVSxfp3Krbc/+e7P6HAW1Bqpu
 XNQQ2N92FTdcnbAbmAaT71aMab5p3mDoz1BR+ptQCEQwDdZVCSzyAwUEYMZvJk03JdCT
 1tJl2QWf9LrjNTbYRhlJfrkXjTAMQZD4pUUczBGGDlJSARVDz4AgahbSHxT16DOd4RVz
 vBRppWWYoNZ8d/wHKX5640n6kjQPEbSo55hN9CZryzOMBfHyM3E+1FXkY8dRyUxnTp6c
 UBkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZSBDvCmduhB8ruac4cuK0i15qx+G/Jt4NVS8OJmUmmc=;
 b=XLovRI2w1HjT7DsviuXnz9SdWUq2CWEL/orwLgP+vCZgbQPnUPNi31ybHYLTKC1EOR
 m2Cot4cfc65hDwOk8vPNs8cpIxiqHfvFfEs52vSShPH/ej6+k+QVVXuGxrayL3hzpnOd
 ntI5AmZEv+T5l8nK/hFK35H5v/WWB56NRcTfKJKi+5bt5p1egHEhx8ew1AgfN0EfuZrd
 /aOINIEIZ7wT3zte4OEXo/MTK/KvU1sYrJrv+m4Y7FmDQCUnkZPTzH+COx66YgGu+lZy
 2XY6a3P2uFHK0tRf4c0V6AXZTZjquH8tTcpPv8kwNXUbun54T+MYzFW/ZtlO23fQRToo
 XwPg==
X-Gm-Message-State: AOAM531YWqmQ1USzJyl5dxOskAEwISwKrQ3FDPMGGpnqoiP975TkGKiY
 oNSiqaz97BkpMdLYDj6UPRBs+BJJvGw=
X-Google-Smtp-Source: ABdhPJzrafdXJzQCav2I3ph0eUQzMhowEAcdqoaMWeaVRUNzWwuC24TGxX3haeLWjN6r2xOJ+H1hKw==
X-Received: by 2002:a05:6870:41c7:b0:da:df9:2039 with SMTP id
 z7-20020a05687041c700b000da0df92039mr3790107oac.75.1647624808544; 
 Fri, 18 Mar 2022 10:33:28 -0700 (PDT)
Received: from rekt.ibmmodules.com ([2804:431:c7c6:daa8:d948:1d15:1451:398f])
 by smtp.gmail.com with ESMTPSA id
 d2-20020a05683025c200b005c93d78e1f6sm4324662otu.29.2022.03.18.10.33.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Mar 2022 10:33:28 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.1 0/9] spapr: add drc->index, remove spapr_drc_index()
Date: Fri, 18 Mar 2022 14:33:11 -0300
Message-Id: <20220318173320.320541-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c2b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2b;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc2b.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

I decided to make this change after realizing that (1) spapr_drc_index()
always return the same index value for the DRC regardless of machine or
device state and (2) we call spapr_drc_index() a lot throughout the
spapr code.

This means that a new attribute to store the generated index in the DRC
object time will spare us from calling a function that always returns
the same value.

No functional changes were made.

 
Daniel Henrique Barboza (9):
  hw/ppc/spapr_drc.c: add drc->index
  hw/ppc/spapr_drc.c: redefine 'index' SpaprDRC property
  hw/ppc/spapr_drc.c: use drc->index in trace functions
  hw/ppc/spapr_drc.c: use drc->index
  hw/ppc/spapr.c: use drc->index
  hw/ppc/spapr_events.c: use drc->index
  hw/ppc/spapr_nvdimm.c: use drc->index
  hw/ppc/spapr_pci.c: use drc->index
  hw/ppc/spapr_drc.c: remove spapr_drc_index()

 hw/ppc/spapr.c             | 18 ++++-----
 hw/ppc/spapr_drc.c         | 79 +++++++++++++++-----------------------
 hw/ppc/spapr_events.c      |  4 +-
 hw/ppc/spapr_nvdimm.c      | 10 ++---
 hw/ppc/spapr_pci.c         |  5 +--
 include/hw/ppc/spapr_drc.h |  2 +-
 6 files changed, 48 insertions(+), 70 deletions(-)

-- 
2.35.1



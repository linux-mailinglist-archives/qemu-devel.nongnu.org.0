Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67CD83A8E5A
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 03:28:51 +0200 (CEST)
Received: from localhost ([::1]:55052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltKMM-0005ay-C5
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 21:28:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ltKDq-0003BM-Om; Tue, 15 Jun 2021 21:20:02 -0400
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732]:40481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ltKDn-0004E4-51; Tue, 15 Jun 2021 21:20:02 -0400
Received: by mail-qk1-x732.google.com with SMTP id u30so954587qke.7;
 Tue, 15 Jun 2021 18:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Er3LOWmzXte7aCXHk4raCht4YVgubpokxIjgp0L2vok=;
 b=p7yVsJqZ0fDBGrVVCboZ+j9Pv+6hdpQNQah1Oxxj1xT+k7B9JPXP5xLsw+zg9j0ONF
 MdzKNro7Yln4kQjzFdLVhJI5uM/kXXmja9psPcwO1L4g47+Z7vuj3EsiUb00/FYab6l9
 mnfR5GpOhXoDcrpSE7Vw3GA+z8pGkhC/d9i5+VvjXkHoEkLzPcL/KTr/6hpMKOQNf2Tj
 ZOWvodgSKGjOK3mNl0XULFMINrYRwa0A25eVBE8AiTPATWzrVbRMDvbsk2AWmi6r+yD1
 o01tkmEC5x/5AmOT8vEvaHm/kWi1Wdw4O+3UQ4RoD5t96eQZx5yL/yJOFM+GubwbNn8S
 KROg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Er3LOWmzXte7aCXHk4raCht4YVgubpokxIjgp0L2vok=;
 b=YQvIDRivHuOEqqATkovWcN/qwG1EmLDKUKPfgYp1ynflidzxV51f1E0XdxYC15O3K9
 46WLc5/RAtPVB0q/OIlenP5Bnx9G91c079gTmH+Y9ZMv3u1d4/ce844T8o2hFeVdOmfd
 izep39AwutUhXrzziSuLnHdHAQTtGGxkQGoaNetEa0s3VgckLqv1iJ9V01QTugY5iAUU
 ClIyh6Ims/PfA6VQvdvgHrEkuLl1rLTPbInbJMOdzLnOpdDgYyhfttcgwfjvyJ/x6acx
 88A0+0I6ptVPiw8i++FXndPQJ/zIVmVoUH27jsJBOIvafs/8xPSdG1oLnIS6LZdDBzmc
 1ltw==
X-Gm-Message-State: AOAM5332G4x5bCqiIADpfl2tcV2+wte+O2kipkm8aRgBHxT5YNSzzAP4
 nxx9oSRQevJ3oqENlgqvXF8My/TDdP8=
X-Google-Smtp-Source: ABdhPJxLv7Tlqsa+o2LBsTPZRCsyX1pxM2Fl8ZAhmrpIa0vj8D1r0Jo1WBum81SI9NpqMr7WphB9Lg==
X-Received: by 2002:a05:620a:136b:: with SMTP id
 d11mr2570086qkl.423.1623806397169; 
 Tue, 15 Jun 2021 18:19:57 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7c6:4d9a:784f:a7de:c020:5f1e])
 by smtp.gmail.com with ESMTPSA id f19sm627994qkg.70.2021.06.15.18.19.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 18:19:56 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 0/7] pSeries base FORM2 NUMA affinity support
Date: Tue, 15 Jun 2021 22:19:37 -0300
Message-Id: <20210616011944.2996399-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::732;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x732.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: aneesh.kumar@linux.ibm.com, Daniel Henrique Barboza <danielhb413@gmail.com>,
 qemu-ppc@nongnu.org, groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This new version contains changes made after reviews from Aneesh
and David in v1.

changes from v1:
- patches 1 and 2: switched places
- patch 3: folded into patch 2
- patch 2:
    * only make CAS related changes when using the newest
    machine version
- patch 3 (former 4):
    * only advertise FORM2 support for the newest machine version
- patches 5 and 6 (former 6 and 7):
    * detect if 'device-node' was set in the command line, and if not,
    use the 'node' value when writing in the device tree

v1 link: https://lists.gnu.org/archive/html/qemu-devel/2021-06/msg03617.html



Daniel Henrique Barboza (7):
  spapr_numa.c: split FORM1 code into helpers
  spapr: move NUMA data init to post-CAS
  spapr_numa.c: base FORM2 NUMA affinity support
  spapr: simplify spapr_numa_associativity_init params
  nvdimm: add PPC64 'device-node' property
  spapr_numa, spapr_nvdimm: write secondary NUMA domain for nvdimms
  spapr: move memory/cpu less check to spapr_numa_FORM1_affinity_init()

 hw/mem/nvdimm.c             |  31 +++++
 hw/ppc/spapr.c              |  60 ++++-----
 hw/ppc/spapr_hcall.c        |   4 +
 hw/ppc/spapr_numa.c         | 257 +++++++++++++++++++++++++++++++++---
 hw/ppc/spapr_nvdimm.c       |   5 +-
 include/hw/mem/nvdimm.h     |  12 ++
 include/hw/ppc/spapr.h      |   1 +
 include/hw/ppc/spapr_numa.h |   6 +-
 include/hw/ppc/spapr_ovec.h |   1 +
 9 files changed, 318 insertions(+), 59 deletions(-)

-- 
2.31.1



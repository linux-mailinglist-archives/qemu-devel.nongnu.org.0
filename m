Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E61407233
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 21:58:20 +0200 (CEST)
Received: from localhost ([::1]:41380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOmfC-0007uh-Ln
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 15:58:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mOmcy-0005K6-IS; Fri, 10 Sep 2021 15:56:00 -0400
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730]:40902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mOmcx-00064z-2w; Fri, 10 Sep 2021 15:56:00 -0400
Received: by mail-qk1-x730.google.com with SMTP id t190so3314305qke.7;
 Fri, 10 Sep 2021 12:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v7x3yIU2XPxdzxIhB6rQ/zeto9dRlHQXK30m/Vv0AK0=;
 b=SSVUW6c0h93qo3kLaPdLpA4a9Gwiroz0YTxLB/xR1ZqEPIAbvmjUt1j5P24DV33+sV
 azXCjKprGyxyqxrvW+Fm9kcG7JyNsV2EEpXCjv0yMromHM9Z/rSroTCxnUcbbHWfOg0/
 E2Ss9BYwMjeVstLzsEJ853xG2DZKreONbeIgGGeyog/uNnkgbJqGMcSZOHDK1Xb5E4nM
 2CpcF1Jn81yXBw+KkseyDiFUvQb9s/ZpQ3EpZHEogK/gllotJGVujRIxMKiRmATSF1BQ
 wbXlo0h7L1shI6AeDel8ZOLWhZcbNbgWom50sp4P9aT8WaGJzAIyBdvsL+4xriUXWB9X
 x5fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v7x3yIU2XPxdzxIhB6rQ/zeto9dRlHQXK30m/Vv0AK0=;
 b=2Y+PxArD17WG+7OxjQcRPR7eD3Hnw9khaDy2KGKtZSfKQyVmuTkqS1+4xEyP9MJzlQ
 EtSoNYo4GcIIlXnsMr6IU0SSmVsCO2x6WMjUmhRSMTsnvYtLlC3YQY7E91c6w/v0BnM9
 CE+F89mFCBsNw8orv6IXUgFm7ThcfUusFd/P/dw8Y6+SLHDinANE/pEolHLMLsUViFf4
 tdPyx88HJg/1UYG3OJQqHgYJNxilJuFJeC52jgCEUjgfNKebkrvyPnIUhJ/yg/Xzw0Vo
 E7ySip7DtEvqSQ207fY1mapui24LOAXMrDBBPGh8h2xaq5Gn2Af1EAQUmczZt504hTYF
 xz3A==
X-Gm-Message-State: AOAM531JIFD9qS5+Uv+/Rx7QQTapCfz/+bdvWo9mTPf/BVYRBSID99pn
 EumsaAJQcslXVRXoSijg7/sSQuhZDbQ=
X-Google-Smtp-Source: ABdhPJxXvGiieI6Q6y0Q88dACCGM0Hx+4AxwgYPTg49WQ/XdC2CyFYSfHcgHINSy6F6UB0TIjIls4Q==
X-Received: by 2002:ae9:ef48:: with SMTP id d69mr9107433qkg.232.1631303756880; 
 Fri, 10 Sep 2021 12:55:56 -0700 (PDT)
Received: from rekt.COMFAST ([191.193.98.206])
 by smtp.gmail.com with ESMTPSA id k10sm3873356qth.44.2021.09.10.12.55.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 12:55:56 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 0/6] pSeries FORM2 affinity support
Date: Fri, 10 Sep 2021 16:55:33 -0300
Message-Id: <20210910195539.797170-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::730;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x730.google.com
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

In this version there was significant design changes after the
v5 review. Only patches 1 and 5 were present in the last version.

changes from v5:
- patch order was changed to make all the preliminary work without
adding FORM2 code;
- FORM1 and FORM2 data now co-exists. Both are being initialized in
spapr_numa_associativity_init() in two static arrays called
'FORM1_assoc_array' and 'FORM2_assoc_array'. 'numa_assoc_array' is now a
pointer that toggles between those 2;
- spapr_numa_associativity_reset() switches the NUMA affinity data to be
used. It is not a replace for associativity_init() as it was in v5;
- 'legacy_numa' concept was removed;
- FORM2 affinity init() is now completely separated from FORM1;
- FORM2 ibm,associativity array only contains size and numa_id for non-CPU
resources, and an extra vcpu_id for CPUs;
- FORM2 reference-points is { 1 };
- FORM2 maxdomain has size = 2;
- several other changes to accomodate the new design of having to deal with
2 different data structures, while minimizing changes in the write_dt()
functions 


Daniel Henrique Barboza (6):
  spapr_numa.c: split FORM1 code into helpers
  spapr_numa.c: scrap 'legacy_numa' concept
  spapr: introduce spapr_numa_associativity_reset()
  spapr_numa.c: parametrize FORM1 macros
  spapr: move FORM1 verifications to post CAS
  spapr_numa.c: FORM2 NUMA affinity support

 hw/ppc/spapr.c              |  55 +++---
 hw/ppc/spapr_hcall.c        |   7 +
 hw/ppc/spapr_numa.c         | 382 ++++++++++++++++++++++++++++++------
 include/hw/ppc/spapr.h      |  25 +--
 include/hw/ppc/spapr_numa.h |   2 +
 include/hw/ppc/spapr_ovec.h |   1 +
 6 files changed, 362 insertions(+), 110 deletions(-)

-- 
2.31.1



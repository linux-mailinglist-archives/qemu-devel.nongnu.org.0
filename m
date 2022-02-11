Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C28944B2D0B
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 19:37:10 +0100 (CET)
Received: from localhost ([::1]:52916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIan7-0006bS-CA
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 13:37:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nIakK-0004Eu-Ki; Fri, 11 Feb 2022 13:34:16 -0500
Received: from [2607:f8b0:4864:20::32d] (port=40720
 helo=mail-ot1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nIakJ-00046J-15; Fri, 11 Feb 2022 13:34:16 -0500
Received: by mail-ot1-x32d.google.com with SMTP id
 x52-20020a05683040b400b0059ea92202daso6677484ott.7; 
 Fri, 11 Feb 2022 10:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UAjxn9NTl029pHKX2saYnuROr2lmSx0YzVX/ZQH8miI=;
 b=HI7E5fZBsXgO8ubDtjh3beTA0TC9Sij/E3mKZlD7RbdlE3siiP2P2X1Bk+ftCAS0oz
 r2Aq4ChkrzdXfAVefJ2SXmibHHAJN4nh0xFn8+zHPui4n4H6Ibjw3c6zl7YRPxNO/VQV
 beRXzOdhxW7RP83AGgSK85Taoy+uCYgydGyhlLyqO8aav860gDTigP2CGmHAA7s/TBXa
 U860rIBwKpbo4ncslOnZ6XInQjn7crXnpO8c++yfLc9hN29OA9Ot5eMh9COanZrCEyY4
 SZl1hnpET26b6NX1zQ4uTy0zq1whDxIFEwfF/SEpHgRG8wC/wSF9mTNbAG1Xli1K+ug9
 rl6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UAjxn9NTl029pHKX2saYnuROr2lmSx0YzVX/ZQH8miI=;
 b=m8FN4woI6dwwZyd4vNFNQOmRz3Y46tMTLFTyqgtBE/Mf6FA/PrRLVbEbWOd7kxDa6V
 6pGHNGA5s6uVU4VzRXvt172AXj7bujWZ/LXiQ6pJGJWXEg4sfzMi7rcQE4md8uJf+N9B
 mVIwVGu72JfC86HBfRoF2MiwHROfGvpitsTDWWnwOIhV19n8WZIyn/kYOBj6irKXZ4uX
 Jf95oqaiIPduQPZli1L9PUXSuDyg0fxnp2e831eAH2App0IGbYpopvMZSUhaVDmRoikZ
 Jqb1TGBgEuD4CxcdoqqLRzi1owipjgQ5/Zv1dlOiKOTNLhlstrzCK3pKbV4hRhyL3fTm
 QzpA==
X-Gm-Message-State: AOAM531GBGsSHhPGJi/MvE6A5YMqAPm1iACWbkvWsf5DIARgmR3TJtkm
 v5yyde8YM3YacJeWF4WOg3+vt8tdG7Y=
X-Google-Smtp-Source: ABdhPJxzYkO0G8t5f5jQZ4Zo3b3E8LL0zpvsIbiD3GPFvij9mrjY0lvLlCrcTogVPoPjn7Z5TUrz8w==
X-Received: by 2002:a05:6830:457:: with SMTP id
 d23mr1083495otc.371.1644604451998; 
 Fri, 11 Feb 2022 10:34:11 -0800 (PST)
Received: from rekt.COMFAST ([191.205.140.35])
 by smtp.gmail.com with ESMTPSA id t22sm10008145oiw.2.2022.02.11.10.34.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 10:34:11 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v11 0/4] PMU-EBB support for PPC64 TCG
Date: Fri, 11 Feb 2022 15:33:50 -0300
Message-Id: <20220211183354.563602-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::32d;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x32d.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
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

This new version makes a few modifications to make the EBB support more
generic.

A new patch (3) was added to implement PPC_INTERRUPT_EBB and its two
internal exceptions described by ISA v3.1: POWERPC_EXCP_PERFM_EBB and
POWERPC_EXCP_EXTERNAL_EBB. When receiving an EBB interrupt we check
BESCR bits to fire the appropriate exception. They are doing the same
thing ATM (clear GE and enter the branch with env->nip = SPR_EBBHR).
PPC_INTERRUPT_EBB will be used for the future XIVE IC EBB lane as well.

Patch 4 (previous 3) contains the helpers used by the PMU to fire the
PERFM_EBB exception, but now we're checking msr_pr and either throwing
the exception immediately or queueing it up for later via
PPC_INTERRUPT_EBB.  This change covers all the race conditions that the
kernel EBB selftests seems to trigger, and without using ppc_set_irq()
to handle BQL.

Changes from v10:
- patch 1:
  * added David's r-b
- patch 3 (new):
  * add PPC_INTERRUPT_EBB, POWERPC_EXCP_PERFM_EBB and
    POWERPC_EXCP_EXTERNAL_EBB
- patch 4:
  * all EBB bits are now being checked in the helper
  * a new static do_ebb() helper was created to handle the common
    EBB logic
  * we're now checking msr_pr and either throwing the exception immediately
    or queueing it for later using PPC_INTERRUPT_EBB
  * ppc_set_irq() call was removed
- v10 link: https://lists.gnu.org/archive/html/qemu-devel/2022-02/msg01856.html


Daniel Henrique Barboza (4):
  target/ppc: fix indent of function parameters
  target/ppc: finalize pre-EBB PMU logic
  target/ppc: add PPC_INTERRUPT_EBB and EBB exceptions
  target/ppc: trigger PERFM EBBs from power8-pmu.c

 target/ppc/cpu.h         |  5 ++-
 target/ppc/cpu_init.c    |  4 ++
 target/ppc/excp_helper.c | 89 ++++++++++++++++++++++++++++++++++++++--
 target/ppc/helper.h      |  1 +
 target/ppc/power8-pmu.c  | 39 ++++++++++++++++--
 5 files changed, 129 insertions(+), 9 deletions(-)

-- 
2.34.1



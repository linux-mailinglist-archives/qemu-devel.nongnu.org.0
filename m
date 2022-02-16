Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4F14B85D0
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 11:32:50 +0100 (CET)
Received: from localhost ([::1]:42144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKHc9-0007Z6-Mw
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 05:32:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nKHVZ-0000IF-SK; Wed, 16 Feb 2022 05:26:01 -0500
Received: from [2607:f8b0:4864:20::629] (port=44999
 helo=mail-pl1-x629.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nKHVX-0005GA-Tp; Wed, 16 Feb 2022 05:26:01 -0500
Received: by mail-pl1-x629.google.com with SMTP id y18so1645452plb.11;
 Wed, 16 Feb 2022 02:25:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qmov1erC5oV8qzxH2zpKWljMV6vyVweSN9Ekyp9AcSU=;
 b=ScXI/P+wLAkGKIo3W2HizhIVEqZP2I/g0ckQwZPm1c5+fG0yFd53k9+qL7dC5FPk3E
 C8JnA2kQBusV11HvC6INmgPdmrZ7YcsmdALH+XapvH8KdrpGlKtpgQl0XlJUuRRDVinO
 b7erlo5h9nGcvzS4pMvfabdAmywFsUPRhA3w6rB7TdBPEtAB7lAR5VSQjDo1QRFLMqiL
 9Mov3S96lVkSiCL8iTmLNFV2J1P2+R8ozpYeIH5ER3EFp1ro0UXibONl86HF8u8Q0g86
 gifnVCCVBkSGbHfg3y6dXcRuBAaS7w2Ckd8fRkC2X/3BXeldwiDjPly7KlbwpkCdmx/a
 BEPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qmov1erC5oV8qzxH2zpKWljMV6vyVweSN9Ekyp9AcSU=;
 b=szfTszr6LGyIVjC9teXNAffk8+5KXKmk3Oiq7ttFdQE+7tgd5xQSZ8TrHVZffRd8Wx
 2d+/cApPwL1Pjn2He4FGY5pD8EYJqFaK9yJseyYhtaqQG/MQWEA8tcs30kZi/VS0x4U+
 TGrpCPAuGc/jG5J/EifEz9Ktzlf4EpWpDeoeMrSsZwoiCle6JH+KfitjuzHFx+nE8pXh
 xgsiaCqrIsPk9KZ5oS2UbM812VFDpqXKhbDqYFZokxtvf5Uwz6kx4szFnIEgEdGfHtG1
 A6E4oImwhkNWALWrVejPkc9xhXBRAncSl2Y/t7TUR10cjv7wcF+T4A7FLTCdBuYT9HOc
 C1Ng==
X-Gm-Message-State: AOAM531EPBOjoZ2EFxixgJYtMq/ndvlRyjR/wLeBxVaZzX3f/iyrQ3QS
 2NSalKEuSy3XOc6g8mMOEGsX6RnY+nQ=
X-Google-Smtp-Source: ABdhPJxdbkP6dhvRgZWta3bTJjbJPxasjVCVlZggRrF4udbfYsQkjDaagOKN3PSVRSmXV8g+3SbBUw==
X-Received: by 2002:a17:902:e80f:b0:14d:c482:66a3 with SMTP id
 u15-20020a170902e80f00b0014dc48266a3mr1802769plg.41.1645007157963; 
 Wed, 16 Feb 2022 02:25:57 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-225-41.tpgi.com.au.
 [193.116.225.41])
 by smtp.gmail.com with ESMTPSA id j3sm5214474pgs.0.2022.02.16.02.25.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 02:25:57 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Subject: [PATCH v2 0/9] ppc: nested KVM HV for spapr virtual hypervisor
Date: Wed, 16 Feb 2022 20:25:36 +1000
Message-Id: <20220216102545.1808018-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::629
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=npiggin@gmail.com; helo=mail-pl1-x629.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 Fabiano Rosas <farosas@linux.ibm.com>, qemu-devel@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This should account for AFAIKS all comments, except maybe some
about naming.

Changes since v1:
- Per-CPU spapr nested state moved to SpaprCpuState from PowerPCCPU.
- address_space_map ops are used, small rearrangement to make any
  given access region store-only or load-only.
- Some style, naming, etc cleanups and fixes.

Hopefully I didn't miss anything.

Thanks,
Nick


Nicholas Piggin (9):
  target/ppc: raise HV interrupts for partition table entry problems
  spapr: prevent hdec timer being set up under virtual hypervisor
  ppc: allow the hdecr timer to be created/destroyed
  target/ppc: add vhyp addressing mode helper for radix MMU
  target/ppc: make vhyp get_pate method take lpid and return success
  target/ppc: add helper for books vhyp hypercall handler
  target/ppc: Add powerpc_reset_excp_state helper
  target/ppc: Introduce a vhyp framework for nested HV support
  spapr: implement nested-hv capability for the virtual hypervisor

 hw/ppc/pegasos2.c               |   6 +
 hw/ppc/ppc.c                    |  23 ++-
 hw/ppc/spapr.c                  |  46 ++++-
 hw/ppc/spapr_caps.c             |  14 +-
 hw/ppc/spapr_cpu_core.c         |   6 +-
 hw/ppc/spapr_hcall.c            | 333 ++++++++++++++++++++++++++++++++
 include/hw/ppc/ppc.h            |   3 +
 include/hw/ppc/spapr.h          |  74 ++++++-
 include/hw/ppc/spapr_cpu_core.h |   5 +
 target/ppc/cpu.h                |  10 +-
 target/ppc/excp_helper.c        | 117 ++++++++---
 target/ppc/mmu-radix64.c        |  37 +++-
 12 files changed, 621 insertions(+), 53 deletions(-)

-- 
2.23.0



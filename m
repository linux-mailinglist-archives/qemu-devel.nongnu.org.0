Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB046F86DC
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 18:36:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puyOZ-0000TO-N7; Fri, 05 May 2023 12:34:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1puyOU-0000SR-BN; Fri, 05 May 2023 12:34:57 -0400
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1puyOS-0004sZ-JP; Fri, 05 May 2023 12:34:54 -0400
Received: by mail-ot1-x330.google.com with SMTP id
 46e09a7af769-6a5f03551fdso1518371a34.0; 
 Fri, 05 May 2023 09:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683304491; x=1685896491;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2PrC6YOLsLcAVwdcgf7zf6r9gkSfkFUlbq4IQ/7Ptbk=;
 b=BMyHYpXYyTTYXGRiowxQkD0MdB0sYfSBk2q7SoKjhHZqgpdQrXnXhMNYflyYDhNTQg
 sVdqcbNwLH5q+jllff3WTR26hsOZ6XOkJUe+1+1V10MdbTAkoTbYQouMBS3OwC4mYJQa
 WgC/1DFo88SezMRIv62l5LP8vRt0wsVN1wseVKuDqgEyL46FkKlmYG8qeHOJLaY+gRCA
 NP6q1uep/VOrduSJtpUzsieXFOEO27KnQWVw92ryidW1GcnB4cq3B4uwLnuITpibr25Q
 qPXFWRNwfZKbg4cJ3Bu7XpJi6856jo8B/7lbK70PKVcBKnVknd+r7kaMnQKJk49ahV5/
 /gSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683304491; x=1685896491;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2PrC6YOLsLcAVwdcgf7zf6r9gkSfkFUlbq4IQ/7Ptbk=;
 b=cOeRafTUB+lP6DOGAQHT8W8QeoIK/gmBgerXXqquhdO8r5Z/MsqBNH0GN8+UkBVK8U
 plz7OLuJymH952bJMER9LcPJXQIZxpPDkKLi9UUWC+kS41yM1+xrM+skLZ5hRK1QXz3n
 T9Pv4NbEdFphIkKB3pwVnglx9zz1CkGKllGgQt6fU0zD8i59cPKFMLjJhRtqzAbsLJj6
 qx7zufT0GPczJQnQX9HsY7dEQ7PblazvbwnYgBljKATGqtUg3tHyWtc9GPbudGEMFDCe
 PJbjvv2HmhCVVVcAUUsv9cet4G173HOv1r/d05+UQM6oFuj5KEtwnmQkgXAM9f5Xno0O
 MTbg==
X-Gm-Message-State: AC+VfDwePy+JjfD/9p2cStLpZ5rLYljl9IynxDDiTxYtY2/gOyXLmMQB
 9IabridykdJfylKEWYjKpfu8SnUreFM=
X-Google-Smtp-Source: ACHHUZ5Inx/7MAWKEs7ZRHNELufrm07cXNiJEd4w369xkOKF9xRWwiNhLKpHJgdpdzHj8uxvGpN6Sw==
X-Received: by 2002:a05:6830:135a:b0:6a5:f8b6:ccd2 with SMTP id
 r26-20020a056830135a00b006a5f8b6ccd2mr980673otq.16.1683304490785; 
 Fri, 05 May 2023 09:34:50 -0700 (PDT)
Received: from grind.. (189-46-207-53.dsl.telesp.net.br. [189.46.207.53])
 by smtp.gmail.com with ESMTPSA id
 z3-20020a9d62c3000000b006a43519523fsm1033475otk.1.2023.05.05.09.34.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 09:34:50 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
	danielhb413@gmail.com,
	peter.maydell@linaro.org
Subject: [PULL 0/6] ppc queue
Date: Fri,  5 May 2023 13:34:38 -0300
Message-Id: <20230505163444.347006-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x330.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The following changes since commit a9fe9e191b4305b88c356a1ed9ac3baf89eb18aa:

  Merge tag 'pull-riscv-to-apply-20230505-1' of https://github.com/alistair23/qemu into staging (2023-05-05 09:25:13 +0100)

are available in the Git repository at:

  https://gitlab.com/danielhb/qemu.git tags/pull-ppc-20230505

for you to fetch changes up to b35261b1a6c2729fa7e7a6ca34b9489eda62b744:

  hw/ppc/Kconfig: NVDIMM is a hard requirement for the pseries machine (2023-05-05 12:34:22 -0300)

----------------------------------------------------------------
ppc patch queue for 2023-05-05:

This queue includes fixes for ppc and spapr emulation, a build fix for
the pseries machine and a new reviewer for ppc/spapr.

We're also carrying a Coverity fix for the sm501 display.

----------------------------------------------------------------
BALATON Zoltan (1):
      hw/display/sm501: Remove unneeded increment from loop

Harsh Prateek Bora (2):
      ppc: spapr: cleanup cr get/set with helpers.
      MAINTAINERS: Adding myself in the list for ppc/spapr

Shivaprasad G Bhat (2):
      tcg: ppc64: Fix mask generation for vextractdm
      tests: tcg: ppc64: Add tests for Vector Extract Mask Instructions

Thomas Huth (1):
      hw/ppc/Kconfig: NVDIMM is a hard requirement for the pseries machine

 MAINTAINERS                         |  1 +
 hw/display/sm501.c                  |  2 +-
 hw/ppc/Kconfig                      |  2 +-
 hw/ppc/spapr_hcall.c                | 18 ++-----------
 linux-user/elfload.c                |  4 +--
 linux-user/ppc/signal.c             |  9 ++-----
 target/ppc/cpu.c                    | 17 +++++++++++++
 target/ppc/cpu.h                    |  2 ++
 target/ppc/gdbstub.c                | 22 +++-------------
 target/ppc/kvm.c                    | 13 ++--------
 target/ppc/ppc-qmp-cmds.c           |  6 +----
 target/ppc/translate/vmx-impl.c.inc |  2 +-
 tests/tcg/ppc64/Makefile.target     |  5 +++-
 tests/tcg/ppc64/vector.c            | 51 +++++++++++++++++++++++++++++++++++++
 14 files changed, 90 insertions(+), 64 deletions(-)
 create mode 100644 tests/tcg/ppc64/vector.c


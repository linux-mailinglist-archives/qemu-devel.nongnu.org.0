Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D464CF256
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 08:00:01 +0100 (CET)
Received: from localhost ([::1]:48886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR7Lc-0005ML-8P
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 02:00:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nR7HO-0006P7-M6; Mon, 07 Mar 2022 01:55:39 -0500
Received: from [2607:f8b0:4864:20::102a] (port=55892
 helo=mail-pj1-x102a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nR7HN-0007jP-2P; Mon, 07 Mar 2022 01:55:38 -0500
Received: by mail-pj1-x102a.google.com with SMTP id k92so3343648pjh.5;
 Sun, 06 Mar 2022 22:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BNJI30v9ykLl/5lBg/LPnuoVv6Q0jEfjIzl1GzQTQ7c=;
 b=kvRO8jDEKwJQBeG1drQbJFONBj8nKH7IbZ4G8ALS1oYaHVLg7GV4J+4lslH7npgZIs
 3zBqcuDaVQ3AZbhoPrJgexxbnFmdOsnpp5Nw4eE84I63cqjlbgNPwwHwb1M+pkME57XX
 C1fnyeIpEoh2iFl+XJZYNIuGCQn6AeZE4nSYgWUKAYjIyWPE/m+3cSj/HcoGTaBSddaI
 iZTsQZYvd7fbifnW2RWkdzxwk+mE3cJUVUG2c3hAScViElxg1QLi06H18JelEnUECqLi
 2KhYFc0UF/u/UNPdvGD0LOSZnjxVOFvig77HqUfE8MXUgncrxfYfkH08nVNzJiKXNRLT
 WBBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BNJI30v9ykLl/5lBg/LPnuoVv6Q0jEfjIzl1GzQTQ7c=;
 b=L92r/MWZaVM/iD3E2TtUkgHqehOln+XTk2ATtNbetlMtK+OypzXODJ+r63ZAduTy73
 6fKkuAcOSUIdzee3bYVSirwPatddXy4UnfKXyWS92rXM6YSz7WLrdLJyLWYC6Exy0S5C
 M+hjuG1Q0oy6uoQjlbUf258wkb4vclrIXFW+2D+23mEZWk3aWdDivyA9IFMcTxWt0rLw
 mdnoUuGHvoZauvqdcaHON5TQhCNL8uRhd+pdp7rvZS7eRoOsaCAYRZYwtuLdCsEWKNlx
 dUc4984ZXjY1VmlMzaasIjO4uKcqRedmOasyqbea8aE3zXS8HjvCMpa1KGO5hvuclxGl
 8RHg==
X-Gm-Message-State: AOAM533fVX3Z/JotSjvhUOl1eWldgPiKgJxlmMf1cjdBBEhhScJPS4U+
 EXE3TUF4VIZ6Xe/vSHam0ASADMebQdA=
X-Google-Smtp-Source: ABdhPJwWwfAiw46aH3VpQ7LzYONEpL4ExcpkIOFwT/WYQPVkppjI+t/Jqv1B6TFhTMxnAEaoVGAXhg==
X-Received: by 2002:a17:90a:ad88:b0:1be:ec99:a695 with SMTP id
 s8-20020a17090aad8800b001beec99a695mr11399922pjq.119.1646636134902; 
 Sun, 06 Mar 2022 22:55:34 -0800 (PST)
Received: from bobo.ibm.com (61-68-211-196.tpgi.com.au. [61.68.211.196])
 by smtp.gmail.com with ESMTPSA id
 o1-20020a637e41000000b003804d0e2c9esm1902477pgn.35.2022.03.06.22.55.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Mar 2022 22:55:34 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Subject: [PATCH v3 0/4] Fix PVR matching, add AIL cap compatibility
Date: Mon,  7 Mar 2022 16:55:23 +1000
Message-Id: <20220307065527.156132-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=npiggin@gmail.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@fr.ibm.com>, qemu-devel@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ended up running into some interesting PVR matching issues which I
think are now fixed (although have not tested full matrix of all CPUs
affected by patch 1).

Since last post, I have dropped the KVM cap for now. The KVM CAP is
allocated in kvm.git next but it won't be a big deal to wait until
it hits upstream then sync the headers and do the incremental patch.

Thanks,
Nick

Nicholas Piggin (4):
  target/ppc: Fix masked PVR matching
  target/ppc: Remove chip type field from POWER9 DD2.0 PVR
  target/ppc: Add POWER9 DD2.2 model
  spapr: Add SPAPR_CAP_AIL_MODE_3 for AIL mode 3 support for H_SET_MODE
    hcall

 hw/ppc/pnv.c                   |  2 +-
 hw/ppc/pnv_core.c              |  2 +-
 hw/ppc/spapr.c                 |  7 +++-
 hw/ppc/spapr_caps.c            | 37 ++++++++++++++++++
 hw/ppc/spapr_cpu_core.c        |  1 +
 hw/ppc/spapr_hcall.c           | 24 ++++++------
 include/hw/ppc/pnv.h           |  2 +-
 include/hw/ppc/spapr.h         |  4 +-
 target/ppc/cpu-models.c        |  4 +-
 target/ppc/cpu-models.h        |  3 +-
 target/ppc/cpu_init.c          | 68 +++++++++++++++++++++++++---------
 target/ppc/kvm.c               | 32 ++++++++++++++++
 target/ppc/kvm_ppc.h           |  6 +++
 tests/qtest/device-plug-test.c |  4 +-
 14 files changed, 159 insertions(+), 37 deletions(-)

-- 
2.23.0



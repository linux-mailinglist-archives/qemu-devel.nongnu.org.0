Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11FA641DD05
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 17:11:20 +0200 (CEST)
Received: from localhost ([::1]:48638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVxiR-00060D-35
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 11:11:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mVxfz-0003vR-S2
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 11:08:47 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:40587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mVxfy-00013k-9R
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 11:08:47 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 t16-20020a1c7710000000b003049690d882so8698551wmi.5
 for <qemu-devel@nongnu.org>; Thu, 30 Sep 2021 08:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=w4h7/Ss4Ha60rWKYGJeIua0QA6I0Dk/czC85h6uCkXY=;
 b=AYjlDdivBT7Fz8wCFWarbw5PIsgZ/CbcVxj6bV95lPJtbVU4H3VGen02kg0sGFbe/r
 jzQo/lU47Kx/n/lFTqfnuyiW/1sR0EnVH9VmCS/GJEHWrTH/G8NOcOoeGL9kO3CSwRFo
 yoydVhR4+U9eDed2nPKV5TI0XK00pSyOas8IRLc8cDd8JkoFx4e29DY8MGv3NeQA++lV
 iaSOqMlPY2vb/iGeg1NaSxmwgSnenD0eUCNB6Wiz6FfHLT0AlA42uUs9wmUvi+prfiUJ
 rAbDRFcWwhZAdKNnkJyucn4ZSOTbQR3Po9WnXyJdPWGQbz0VZfNDzG5wPbVMwtbUnvvE
 M/dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=w4h7/Ss4Ha60rWKYGJeIua0QA6I0Dk/czC85h6uCkXY=;
 b=XMOq/ME1Dkgo5GihJhQFj7jVqK5ZV7dxhh91/Cw7hq016r4Pm+YQj6ZBZBkuoIWuj1
 gfdy7GhFEujgyO29mlRESep5EBnLsyrZ8FS1cWs+H7awjSTQP9aFM+CK0nnApmiSY8N3
 ZFg5u+OUVilZgulfoINBZ1F1z+DriRmZJlyVxQSzvqQ+plEqXH+TifgerxmjxGBJR6Nt
 2Jhc+w5VVjhKiAHKWXCSC5zqHchATp2lRSpwfplXpwmeONm5pdLcqE4k45sNJxySaGSV
 XgOWfNs1b+1QsX5bybvHM1W0m4dXjGD4SHH5pFLjpCK0cbtjW3AGhMsc5ReQxSiQSLWg
 QmTQ==
X-Gm-Message-State: AOAM533Cllep8w22FzXDLGA0YYJAHq/pKCiq+ZqMY6CZNDI/O/UohbvW
 ysLYDcDE0w1LRLVwMyMy/cFMDK+go58BLw==
X-Google-Smtp-Source: ABdhPJwnYzHNOsAcPaeE1pDob+/sew8VVxpGesfTDR2BHPmCiTvnD9pPbpx0lHaAi9TFCmsDYRqrPQ==
X-Received: by 2002:a7b:c7ce:: with SMTP id z14mr1018897wmk.91.1633014524555; 
 Thu, 30 Sep 2021 08:08:44 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id o26sm5085942wmc.17.2021.09.30.08.08.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 08:08:44 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/3] arm_gicv3: Support multiple redistributor regions
Date: Thu, 30 Sep 2021 16:08:39 +0100
Message-Id: <20210930150842.3810-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Our GICv3 QOM interface includes an array property
redist-region-count which allows board models to specify that the
registributor registers are not in a single contiguous range, but
split into multiple pieces.  We implemented this for KVM, but
currently the TCG GICv3 model insists that there is only one region.
You can see the limit being hit with a setup like:
  qemu-system-aarch64 -machine virt,gic-version=3 -smp 124

This patchset adds support for multiple regions to the emulated
GICv3, which means that the virt board now supports more than
123 CPUs for TCG as well as for KVM.

Patches 1 and 2 are smaller initial cleanup; patch 3 is the
bulk of the feature work.

(This turned out to be pretty simple; we should probably have
done it before...)

-- PMM

Peter Maydell (3):
  hw/intc/arm_gicv3: Move checking of redist-region-count to
    arm_gicv3_common_realize
  hw/intc/arm_gicv3: Set GICR_TYPER.Last correctly when
    nb_redist_regions > 1
  hw/intc/arm_gicv3: Support multiple redistributor regions

 include/hw/intc/arm_gicv3_common.h | 14 ++++++--
 hw/intc/arm_gicv3.c                | 12 +------
 hw/intc/arm_gicv3_common.c         | 56 +++++++++++++++++++-----------
 hw/intc/arm_gicv3_kvm.c            | 10 ++----
 hw/intc/arm_gicv3_redist.c         | 40 +++++++++++----------
 5 files changed, 73 insertions(+), 59 deletions(-)

-- 
2.20.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C123ACD42
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 16:13:33 +0200 (CEST)
Received: from localhost ([::1]:56314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luFFU-0001qQ-Ea
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 10:13:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1luFCf-0007Tu-Es
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 10:10:37 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:44795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1luFCV-0001vZ-1n
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 10:10:37 -0400
Received: by mail-wr1-x42d.google.com with SMTP id f2so10905625wri.11
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 07:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tdUucB5BOCpJ6E3JxIjK20ADbLtoFnSSrqH01ahrtRM=;
 b=rOzsD1eABNTldWnGcw6XbeYjehqskOsuv0NkESg7RXjLvgdjRXAK4JyQEm3X697HIj
 q8Di8VplVdhpB6MIouUWnWhctivVU/iJMRIH51K7D754fCqDv6CE+JB8dldzSpqKooDj
 Ng3rIWIS8X8zde5j7DFRGkX6+7XzLIcCCvR5CvUP/MoSnGe5S4E5ziJFI2ASr6ntCH37
 7DO7N+ToGc8Gxf149uzopeQB1885edA7mLe4+l2LH5Sh5LReVG8aH7n4bHFNPOwjerHw
 OEeLZmIbeBmL95Jq0MKUpXm+srtwt+8z7Lqt9H8gJPwFgPpq0HFftto46bjwcPOSCs9P
 BCPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tdUucB5BOCpJ6E3JxIjK20ADbLtoFnSSrqH01ahrtRM=;
 b=AwyHTdmZF1TcPAJ+sJJOFggu0KXk6fNhgT1X+qqOJxtoJNoabH2zgM8rBkD+pzvO0p
 IYw01NkgbBnxwhyktOK59mxh5FnUVp+5FIvoAo8dqIiwCXnGFiSYq8400tt7iHZeureJ
 R+tNWgQuTYotURfHm6w1MVGGUUd14+YmIMSCYVX+s69HT9TcZcSYuJz1ueqC2qs7KSKR
 Qc7f9L4HCAuDHCHOW184u+s8igQKgJhxsyPXFVJ07bEle4UPhpbp5OkuAWijRCWKH6YZ
 RaBGQzskaSjb4Z5mtYEe+2Wd1fujeLKz8s/1F0IKKaXb/DiJZVML6fIeJxwBBYRBZEbo
 wYVg==
X-Gm-Message-State: AOAM531H+gU2LDjd+msxaIcFfaGLHnDhzlFjUWElSioXAW+Du2wC4aQw
 ywJ/buszXvtRARVUZQcdZiGjtg==
X-Google-Smtp-Source: ABdhPJzpkd9QqKLcSIipMx+tqpHzxd9ETxE7pFc/VrPLkDuRsv+NpqNmuEj45sHQ7THEL4hnsjwq6Q==
X-Received: by 2002:adf:a1c8:: with SMTP id v8mr12870935wrv.300.1624025421661; 
 Fri, 18 Jun 2021 07:10:21 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j11sm7751661wmq.4.2021.06.18.07.10.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 07:10:21 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/7] target/arm: Fix FPCXT_NS accesses when FPU disabled
Date: Fri, 18 Jun 2021 15:10:12 +0100
Message-Id: <20210618141019.10671-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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

This patchseries fixes some bugs in v8.1M M-profile sysreg accesses:

 (1) When the FPU is disabled and there is no active FP context
     (as defined by the pseudocode fpInactive flag), accesses to
     FPCXT_NS should not fail with a NOCP exception
 (2) For cases where VLDR/VSTR sysreg don't perform a memory access
     (VLDR/VSTR of VPR when unprivileged, and VLDR to FPCXT_NS
     when fpInactive), the "side effects" of the load (update of
     writeback base register, and stack limit check) still need
     to happen, but we were skipping them

This patchseries fixes those bugs. Since these were detected by
running tests from the gcc testsuite, I've marked the first four
patches as cc: stable. The last three are a refactoring which
isn't part of the bugfix proper.

Note for backport to stable: the patchset has a semantic dependency
on commit 9a486856e9173af, which was not marked as cc-stable because
we didn't know we'd need it for a for-stable bugfix. So that needs
to be taken as well if this series goes to stable.

thanks
-- PMM

Peter Maydell (7):
  target/arm/translate-vfp.c: Whitespace fixes
  target/arm: Handle FPU being disabled in FPCXT_NS accesses
  target/arm: Don't NOCP fault for FPCXT_NS accesses
  target/arm: Handle writeback in VLDR/VSTR sysreg with no memory access
  target/arm: Factor FP context update code out into helper function
  target/arm: Split vfp_access_check() into A and M versions
  target/arm: Handle FPU check for FPCXT_NS insns via
    vfp_access_check_m()

 target/arm/translate-a32.h    |   1 +
 target/arm/m-nocp.decode      |  24 ++
 target/arm/vfp.decode         |  14 -
 target/arm/translate-m-nocp.c | 550 ++++++++++++++++++++++++++++
 target/arm/translate-vfp.c    | 664 ++++++----------------------------
 5 files changed, 681 insertions(+), 572 deletions(-)

-- 
2.20.1



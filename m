Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFBD15F3399
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 18:31:03 +0200 (CEST)
Received: from localhost ([::1]:53858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofOLO-0004vc-2x
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 12:31:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ofOE4-0007sQ-3p
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 12:23:28 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:56147)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ofODv-0000GI-6n
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 12:23:27 -0400
Received: by mail-wm1-x330.google.com with SMTP id t4so7350065wmj.5
 for <qemu-devel@nongnu.org>; Mon, 03 Oct 2022 09:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date;
 bh=lCZHg5x4HGzTZDn3BalI2idxXb7plNTlyEM9gtVZfKw=;
 b=TubP/lmUcxD1ZHcVPJeSi948QQMZK+VtJdHvLaguR8qoDwUXhNd9shXGIaOhyUn7UD
 8Mj1DbbEu7Ya/IbrXnpey5ZUgMa9opouk50w/dDvRW6Gj6eC1RrJXR7lvoV21dC4mIej
 oCYwdLOMJ3PokgHtbRjVphz0D0ji0KNaJNHR1IT5Ndn03VEJAA6LnGcnaDmIkoz09I0J
 6kPQZspVp/N9yLi+8IuTaR8+XtMx8nWfoEneJczatHEqQhalVngmg4Ftr8WeZ+8qh2KK
 YINyQOpYD27stKqL38PVA0+qt3Eh+jwuxLm1hncGEvrNmCa16Toy+OI3Wr6ONvbmiRBD
 fB9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date;
 bh=lCZHg5x4HGzTZDn3BalI2idxXb7plNTlyEM9gtVZfKw=;
 b=KwhZKNuSFZ0U0HWW/nDhQ/KMPLdEvE7eWImV57jOumNihA/g565kSRa05NgsN96V+X
 Y0e/fo0P2aVhP79y8xL8qtWQQWRpEQ3mqX2/+lgNsJruR1end4+e0JkV17NJlyRWkiin
 KGj+fGLormHAia6ymzGDpz4vtZb9O1vCIYTRCgy1uWIsDyd53EYl9fXj3E5gzRnbriBc
 4uBWSINwarLPHnivKJ1h4f+VYe1f0zHRJoOYHwgg4tYKPRdGk/WW42WtiE7lUZB8vtE0
 ZaYFyQ6rjPjXS+rmi3CxvBcgJbC4meh+61V/4Kv7doe53Rzr8mGwvOwRt3XffXfIcITx
 W1Pw==
X-Gm-Message-State: ACrzQf0kXbe4gzizOH+hXAqmSjohMcTk9mRNk0cQx/8Y9UQ60fW2hGVD
 TXZSGW/nJPNjG9rMQ9so0piTzmDIE57U6A==
X-Google-Smtp-Source: AMsMyM6aS/aE896UVLmMkLuX7IWgTWdaqRPrl458VjIqevFaxAWsqkF6Vcj4L8grSYa1RkhwePFROg==
X-Received: by 2002:a05:600c:27d1:b0:3b4:5e9c:23ed with SMTP id
 l17-20020a05600c27d100b003b45e9c23edmr7150650wmb.180.1664814197511; 
 Mon, 03 Oct 2022 09:23:17 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a5d62c2000000b0022afce9ea93sm9897856wrv.40.2022.10.03.09.23.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Oct 2022 09:23:16 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 0/3] target/arm: Enforce implemented granule size limits
Date: Mon,  3 Oct 2022 17:23:12 +0100
Message-Id: <20221003162315.2833797-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Arm CPUs support some subset of the granule (page) sizes 4K, 16K and
64K.  The guest selects the one it wants using bits in the TCR_ELx
registers.  If it tries to program these registers with a value that
is either reserved or which requests a size that the CPU does not
implement, the architecture requires that the CPU behaves as if the
field was programmed to some size that has been implemented.
Currently we don't implement this, and instead let the guest use any
granule size, even if the CPU ID register fields say it isn't
present.

Patch 1 in this series makes us enforce this architectural
requirement (the main effect will be that we stop incorrectly
implementing 16K granules on most of the non-cpu-max CPUs).

Patch 2 is new in v2, and extends the use of the new ARMGranuleSize
enum to the ARMVAParameters struct.

Patch 3 adds FEAT_GTG to the list of supported features, because
all this feature really is is the definition of the separate
fields for stage1 and stage2 granule support in ID_AA64MMFR0_EL1,
and we already updated -cpu max to report its granule support
that way when we were adding the LPA2 support.

v1->v2 changes:
 * renamed the enum to ARMGranuleSize, moved it to internals.h
 * new patch 2

Patch 2 is the only unreviewed one.

thanks
-- PMM

Peter Maydell (3):
  target/arm: Don't allow guest to use unimplemented granule sizes
  target/arm: Use ARMGranuleSize in ARMVAParameters
  docs/system/arm/emulation.rst: Report FEAT_GTG support

 docs/system/arm/emulation.rst |   1 +
 target/arm/cpu.h              |  33 ++++++++
 target/arm/internals.h        |  32 +++++++-
 target/arm/helper.c           | 137 +++++++++++++++++++++++++++++-----
 target/arm/ptw.c              |   8 +-
 5 files changed, 185 insertions(+), 26 deletions(-)

-- 
2.25.1



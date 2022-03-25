Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D79564E7590
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 16:01:05 +0100 (CET)
Received: from localhost ([::1]:46390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXlR2-0006zK-Lk
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 11:01:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nXlNb-0004rC-6o
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 10:57:31 -0400
Received: from [2a00:1450:4864:20::32c] (port=51994
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nXlNZ-0004D3-Em
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 10:57:30 -0400
Received: by mail-wm1-x32c.google.com with SMTP id q20so4608129wmq.1
 for <qemu-devel@nongnu.org>; Fri, 25 Mar 2022 07:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ycuaiNbW6tDaoW3cd7YbsF+JC6c2NbwVdMgvtLk/lhc=;
 b=ALRsgkwqzuVwuFf1niCb+01F7EKhOAvH6FXxebrGpe3GCHMUG4uuNrjfCb6BzJVney
 2fOEvRNuXIXipnBzwqFof9nhCA6gZyVPGFJAQlHnqxavt1vpSdGlN0RLYI8oO+NFfEtq
 gb16CVCbo694AnDgI7BxNO5DBvsbQKmZL5XEV0Q1DWbsiPCWbma89Y22JVZwPui1Q+ta
 MJgX7Otr5vp9ljB7cNqZyU/GFs2lnyjXsM5b/ZkBG+OysTu5wd72yooDvg94UpfyuKGg
 f9RQzTFIIAgWgLu/sUd2QyIttNOQ8+4ed0INON2JJ0w8OPH0ZioHhdsDlHGZZoMzyl13
 /syQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ycuaiNbW6tDaoW3cd7YbsF+JC6c2NbwVdMgvtLk/lhc=;
 b=R3zK8JzKgz7GZ++g+TklCyWDv+5AlAwTKRJim7M8NIHp4dHpzgxxFP+7JTzImIRnUA
 MFFNMPDxEc8bfMrRfhwCxhLNlflGq34yvLQjUlNcA9Le5wGD9KR48It76qIKszYoebxt
 W5oQeQ2iYMCtn4ayYnMDKc3A6gNAh8R3tJNekCTmY2FdSmrK5XTgzqr6mvpsa7YUCPY7
 GBXD2Xjebq76+dYOgPrgh1pIIwUrd5LoBvGgzpRgFgCZKoBlaMUENt8KYgV8Q38/6Pyc
 8FUvRfIszUKKHQ8/cQi+0xa2/5pK5ymqyNKBlvyzi75W9GVLs/0Vdz6bRY3OTxL6dKvw
 VTIA==
X-Gm-Message-State: AOAM533+6rlTixR0xO4LCtN2RE0qEt09S0O8yBIxxtsDgqsvya8T6Cj3
 uF4CBsK2JbAn1sPJwaCiFMI7pCoNyVHJMA==
X-Google-Smtp-Source: ABdhPJw30TA37XwJmvSxCA1H9BbZr+s3up9WmOoYAeqTLh6yDhOBD3u+CiCf/K92iO21K56o1cIYCA==
X-Received: by 2002:a05:600c:1c84:b0:38c:abf0:c1c8 with SMTP id
 k4-20020a05600c1c8400b0038cabf0c1c8mr10186396wms.111.1648220247569; 
 Fri, 25 Mar 2022 07:57:27 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c7-20020a5d4f07000000b00203db8f13c6sm5200583wru.75.2022.03.25.07.57.26
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Mar 2022 07:57:26 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 0/2] target-arm queue
Date: Fri, 25 Mar 2022 14:57:23 +0000
Message-Id: <20220325145725.3891659-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Just two small bug fixes for the next rc.

The following changes since commit f345abe36527a8b575482bb5a0616f43952bf1f4:

  Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging (2022-03-25 10:14:47 +0000)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20220325

for you to fetch changes up to c7ca3ad5e756e263daf082c315e311593ccec3d1:

  hw/intc/arm_gicv3_its: Add missing newlines to process_mapc() logging (2022-03-25 14:41:06 +0000)

----------------------------------------------------------------
target-arm queue:
 * hw/intc/arm_gicv3_its: Add missing newlines to process_mapc() logging
 * target/arm: Fix sve_ld1_z and sve_st1_z vs MMIO

----------------------------------------------------------------
Peter Maydell (1):
      hw/intc/arm_gicv3_its: Add missing newlines to process_mapc() logging

Richard Henderson (1):
      target/arm: Fix sve_ld1_z and sve_st1_z vs MMIO

 hw/intc/arm_gicv3_its.c |  4 ++--
 target/arm/sve_helper.c | 10 ++++++++--
 2 files changed, 10 insertions(+), 4 deletions(-)


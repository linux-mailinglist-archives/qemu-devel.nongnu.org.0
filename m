Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F4A6E317D
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Apr 2023 15:08:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnfcU-0004op-RB; Sat, 15 Apr 2023 09:07:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jszhang@kernel.org>)
 id 1pnbZe-0006gZ-Aa; Sat, 15 Apr 2023 04:47:58 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jszhang@kernel.org>)
 id 1pnbZZ-000304-Q7; Sat, 15 Apr 2023 04:47:55 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5BB3260A05;
 Sat, 15 Apr 2023 08:47:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05A22C433D2;
 Sat, 15 Apr 2023 08:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681548471;
 bh=eWQIR4pDjW5W0LBVxz11mFgQNASZOEMMkzX3EPueH38=;
 h=From:To:Cc:Subject:Date:From;
 b=X6Ng6Xyfxe9z+3CVY16jXKvJeu1oqMz6l/KjkZURnk0oiet3hTVc2aiwcbKqCNgJ+
 kGpqh74URHXFIGW5ZRO1ZXvdFE3GHhOuVMhpAo5n5IiD4kIAKoPREzJovPFQOOpAZF
 Fj3mPqwGA1W9mYHYH3+tdESKjSajMGsTBkb77PvpyBKj54REYWA2bFzGlXHlzTH9mh
 e0qJsxLRV4gLim88iryCi3uU7hsy7Dy1l3B1TXF1RF2614B1JUAQz+PxHDzibFKwAe
 6uLk3YdGC8kesse/K21h7BCEZJvVfW9Hn39L/THqXj6b0KFMEwLbClUTRRk0Zwmq69
 +OpZEvtPO/N7A==
From: Jisheng Zhang <jszhang@kernel.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/2] Remove CBAR from A55/A76 and add A78
Date: Sat, 15 Apr 2023 16:36:55 +0800
Message-Id: <20230415083657.2308-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=jszhang@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 15 Apr 2023 09:07:08 -0400
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

patch1 removes CBAR from A55 and A76
patch2 adds A78 CPU

Jisheng Zhang (2):
  target/arm: Remove ARM_FEATURE_CBAR_RO from A55 and A76
  target/arm: Add Cortex-A78 CPU

 docs/system/arm/virt.rst |  1 +
 hw/arm/virt.c            |  1 +
 target/arm/cpu64.c       | 71 ++++++++++++++++++++++++++++++++++++++--
 3 files changed, 71 insertions(+), 2 deletions(-)

-- 
2.40.0



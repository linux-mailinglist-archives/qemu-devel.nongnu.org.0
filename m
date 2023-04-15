Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4729B6E317A
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Apr 2023 15:08:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnfcU-0004oX-No; Sat, 15 Apr 2023 09:07:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jszhang@kernel.org>)
 id 1pnbRU-000521-T6; Sat, 15 Apr 2023 04:39:32 -0400
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jszhang@kernel.org>)
 id 1pnbRT-0000tr-1l; Sat, 15 Apr 2023 04:39:32 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5D2AD60DBB;
 Sat, 15 Apr 2023 08:39:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 123E3C4339B;
 Sat, 15 Apr 2023 08:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681547961;
 bh=eWQIR4pDjW5W0LBVxz11mFgQNASZOEMMkzX3EPueH38=;
 h=From:To:Cc:Subject:Date:From;
 b=fQVLxNHNRcYpNxvRDVGM9juvvOWl6Heb7LKUC0p01D2nXAoGFPj5CLiruxO9Xt0Vg
 A+q6476a/X75kQXzSNt82zBtJIQix8QDHaRDJUumAvsTDd2MmzYNGETsm8mthEHvFY
 66Bm6966i+BIH874LDO7p8ap+qgQa5kh6ZqK0ZNzc79GYLJk6HJfQMsPYx0GECKiDd
 9BZWkt2a+qQh4I+55K08M6gsYntx+boqDPIZHpWitcrPDiQ+5QAvzv1oX0pKXCunAy
 oBcZvo/TJjzKMF1tKvL0a1RJiwqeQd7N8RMbq/UaoP9EHscNPlLRF6KZmWe98r331u
 Y1yfEDSn4XTfg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Peter Maydell <peer.maydell@linaro.org>
Cc: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/2] Remove CBAR from A55/A76 and add A78
Date: Sat, 15 Apr 2023 16:28:25 +0800
Message-Id: <20230415082827.2054-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=139.178.84.217; envelope-from=jszhang@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55ED8654DFE
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Dec 2022 10:02:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8dvp-0002SR-3Q; Fri, 23 Dec 2022 04:01:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1p8dvU-0002R6-Ml; Fri, 23 Dec 2022 04:01:12 -0500
Received: from mail.csgraf.de ([85.25.223.15] helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1p8dvS-0001Ou-ME; Fri, 23 Dec 2022 04:01:12 -0500
Received: from localhost.localdomain
 (dynamic-095-118-065-151.95.118.pool.telefonica.de [95.118.65.151])
 by csgraf.de (Postfix) with ESMTPSA id CFD6E608042C;
 Fri, 23 Dec 2022 10:01:07 +0100 (CET)
From: Alexander Graf <agraf@csgraf.de>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Zenghui Yu <yuzenghui@huawei.com>, Eric Auger <eric.auger@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v3 0/2] hw/arm/virt: Handle HVF in finalize_gic_version()
Date: Fri, 23 Dec 2022 10:01:05 +0100
Message-Id: <20221223090107.98888-1-agraf@csgraf.de>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The finalize_gic_version() function tries to determine which GIC version
the current accelerator / host combination supports. During the initial
HVF porting efforts, I didn't realize that I also had to touch this
function. Then Zenghui brought up this function as reply to my HVF GICv3
enablement patch - and boy it is a mess.

This patch set cleans up all of the GIC finalization so that we can
easily plug HVF in and also hopefully will have a better time extending
it in the future. As second step, it explicitly adds HVF support and
fails loudly for any unsupported accelerators.

Alex

v1 -> v2:

  - Leave VIRT_GIC_VERSION defines intact, we need them for MADT generation
  - Include TCG header for tcg_enabled()

v2 -> v3:

  - Fix comment
  - Flip kvm-enabled logic for host around

Alexander Graf (2):
  hw/arm/virt: Consolidate GIC finalize logic
  hw/arm/virt: Make accels in GIC finalize logic explicit

 hw/arm/virt.c         | 200 ++++++++++++++++++++++--------------------
 include/hw/arm/virt.h |  15 ++--
 2 files changed, 115 insertions(+), 100 deletions(-)

-- 
2.37.1 (Apple Git-137.1)



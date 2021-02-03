Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18AB130E059
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 17:59:40 +0100 (CET)
Received: from localhost ([::1]:46056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7LVD-0007jm-6O
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 11:59:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Nawrocki@gtri.gatech.edu>)
 id 1l7LS2-0004w4-Qh; Wed, 03 Feb 2021 11:56:22 -0500
Received: from unifiededge.gtri.gatech.edu ([130.207.205.170]:44154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Nawrocki@gtri.gatech.edu>)
 id 1l7LS0-00082P-BU; Wed, 03 Feb 2021 11:56:22 -0500
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; d=gtri.gatech.edu; s=unifiededge;
 c=simple/simple; t=1612371378; h=from:subject:to:date:message-id;
 bh=mUq59LVIm5msU4it45CjWCiRqsKM6ni1g0p3xkZw228=;
 b=f79UTi1fF1Habu/5+nzkLs1VJb0ozJpgM6t0qDkCOc/9nEK1cVobUlUqBvM8DewKPbBIqEVokMy
 ZZJ/g922liOx3Vh5zR1QqfND30u3Ol+C1rEuK1ikx4y9fr4nk48PtCb5u7CGEJMq2iLY/GnUPRu4N
 MsrwSzPgzxwQxtnBz4InaxMzw6WQBtTlNLe1GCoF7u2N8jcbl4koUcTaJCQn9rPTgcWgWhzNLw0OH
 UcHEkVL2d5x/fVojPaKacgRsVntd47keq1n95rurHD19e2i1g+bdZf4kP7DOex2EvTp4+/JkUH1dh
 7CpuUtiQJbxsZDeu4WQiE4+bKZvyheqobNOQ==
Received: from tybee.core.gtri.org (10.41.1.49) by exedge07.gtri.dmz
 (10.41.104.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.2.721.2; Wed, 3 Feb 2021
 11:56:18 -0500
Received: from localhost.localdomain (10.41.0.30) by tybee.core.gtri.org
 (10.41.1.49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2106.2; Wed, 3 Feb
 2021 11:56:18 -0500
To: <qemu-arm@nongnu.org>
Subject: [PATCH v2 0/1] target/arm: Fix SCR_EL3 migration issue
Date: Wed, 3 Feb 2021 11:55:51 -0500
Message-ID: <20210203165552.16306-1-michael.nawrocki@gtri.gatech.edu>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-ClientProxiedBy: hatteras.core.gtri.org (10.41.22.72) To tybee.core.gtri.org
 (10.41.1.49)
Received-SPF: pass client-ip=130.207.205.170;
 envelope-from=Michael.Nawrocki@gtri.gatech.edu;
 helo=unifiededge.gtri.gatech.edu
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org,
 Mike Nawrocki <michael.nawrocki@gtri.gatech.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Mike Nawrocki <michael.nawrocki@gtri.gatech.edu>
From: michael.nawrocki--- via <qemu-devel@nongnu.org>

The SCR_EL3 register reset value (0)  and the value produced when
writing 0 via the scr_write function (set as writefn in the register
struct) differ. This causes migration to fail.

Ultimately, this is due to incorrect handling of context-dependent
behavior of the RES1 bits of SCR_EL3. The FW and AW bits should be
forced to 1 only if there is no support for AArch32 at EL1 or above.

This patch improves the scr_write RES1 bit handling and adds a reset
function which will initialize SCR_EL3 to 0x30 on AArch64-only CPUs, and
0 if AArch32 is supported at EL1 or above.

Failing invocation:
$ qemu-system-arm -machine vexpress-a9 -cpu cortex-a9 -nographic
QEMU 5.2.0 monitor - type 'help' for more information
(qemu) migrate "exec:cat > img"
(qemu) q
$ qemu-system-arm -machine vexpress-a9 -cpu cortex-a9 -nographic -incoming "exec:cat img"
qemu-system-arm: error while loading state for instance 0x0 of device 'cpu'
qemu-system-arm: load of migration failed: Operation not permitted


Mike Nawrocki (1):
  target/arm: Fix SCR RES1 handling

 target/arm/cpu.h    |  5 +++++
 target/arm/helper.c | 16 ++++++++++++++--
 2 files changed, 19 insertions(+), 2 deletions(-)

-- 
2.20.1



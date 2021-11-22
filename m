Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B93CD458D0E
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 12:09:44 +0100 (CET)
Received: from localhost ([::1]:46534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp7Ch-00062k-RY
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 06:09:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mp767-00009e-HF; Mon, 22 Nov 2021 06:02:56 -0500
Received: from out28-76.mail.aliyun.com ([115.124.28.76]:35106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mp763-0001d0-64; Mon, 22 Nov 2021 06:02:55 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.2830681|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0102072-0.000321792-0.989471;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047207; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.LxAa8CH_1637578961; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.LxAa8CH_1637578961)
 by smtp.aliyun-inc.com(10.147.44.118);
 Mon, 22 Nov 2021 19:02:41 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v2 0/5] Check PMP rules num before propagation
Date: Mon, 22 Nov 2021 19:02:25 +0800
Message-Id: <20211122110230.38783-1-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.28.76; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-76.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: palmer@dabbelt.com, bin.meng@windriver.com, Alistair.Francis@wdc.com,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In this patch set, fix pmp propagation to tlb and replace pmp_is_range_in_tlb
with a more straightforward function pmp_adjust_tlb_size.

v2:
  move pmp rules num check to pmp_is_range_in_tlb
  define pmp_adjust_tlb_size to replace pmp_is_range_in_tlb


LIU Zhiwei (5):
  target/riscv: Check PMP rules num before propagation
  target/riscv: Give a more generic size for tlb
  target/riscv: Discard return value for pmp_is_range_in_tlb
  target/riscv: Rename pmp_is_range_in_tlb
  target/riscv: Modify return and parameter type for pmp_adjust_tlb_size

 target/riscv/cpu_helper.c |  6 ++----
 target/riscv/pmp.c        | 21 ++++++++++-----------
 target/riscv/pmp.h        |  4 ++--
 3 files changed, 14 insertions(+), 17 deletions(-)

-- 
2.25.1



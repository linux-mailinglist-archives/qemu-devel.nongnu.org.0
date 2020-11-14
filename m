Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 766402B2BB1
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Nov 2020 06:57:55 +0100 (CET)
Received: from localhost ([::1]:51972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdoZO-0005zX-1r
	for lists+qemu-devel@lfdr.de; Sat, 14 Nov 2020 00:57:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=58086a3e2=alistair.francis@wdc.com>)
 id 1kdoYT-0005BC-Sa
 for qemu-devel@nongnu.org; Sat, 14 Nov 2020 00:56:57 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:27199)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=58086a3e2=alistair.francis@wdc.com>)
 id 1kdoYR-0004LV-BC
 for qemu-devel@nongnu.org; Sat, 14 Nov 2020 00:56:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1605333415; x=1636869415;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IS0cvR6JD28Nwk+M8hWPd4ZLpGDhrZkEcFcvsBOawvs=;
 b=UjJ6GRw5GyuWKhyK/YZTph8pQf3avUQ5n3z9Lhy0GrZXhogj/yennFkD
 aHLwY5JS5JAjCemwLVgGo7ZjKxREVFSs7K0zQfA4z7rnr7chwhLQ3ntG1
 J8QGwNp+78uyIP9rmUrxOcNF7eAwnJkGaogu9Jr5DPOB1IXIeCMcqgqi2
 yQGF9xNGGVBedTzYWOEf66lyuBH9dVBtuei74oOCNxxIcUQQvbgvI072z
 i1FbG1r2uzlE2hnK7WqLfJ7GZU+9f/LXU9741d+V7rppF/Poj5DEVFm1a
 ACaIp9tLLOc3Fq2PXgV1A/WLeAfKyLfgHs3ZnBAysGFa7hzYYMZRuOLZJ A==;
IronPort-SDR: GP4fgAiYx3ESXR/0Np5SLCiSxLkAjF6sRkuCowwGt/LNG1zeZ3sfbqfYxiKkMgyI1Y5/U+9J8d
 C0Gr6QFCV3LTJacR6rfwkTPV9WDcrUubgCuDa31tOHMvkOJW9tH7l6EAm70n67sgSYo6K3TOga
 fR5mFffgdlSkMxXbgi9rO9IJciDGv7Lnz/HTEvrXm7j2uWRSs6sILXCw/50ssHHkSdAlBLn3cG
 EsOWemih+MJk4XZZL2eYDlOmu0BLKce28VXDdDDGlIORFIb4LRHohJaDgUI1sZHpzjSv0t41B7
 TUY=
X-IronPort-AV: E=Sophos;i="5.77,477,1596470400"; d="scan'208";a="152517555"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 14 Nov 2020 13:56:52 +0800
IronPort-SDR: vRQazAWF7WKY0uA/05CjX8F4tUuAOgtQUq2ZsHvHaVwoplQ8NHoN5llsmphvXBerhS1vnzQLa5
 /X7tnUZadsIWWMl+kfttIAYFACm+lUfL/dMTfYnpm25t95saD9+Sr+tz4AYnLlthTLxepxcoK+
 81sTYGNdPE/+7Twpc7RwlxQhhZn+Q7zCkgDKFTasEDTqj760P3tnOfKlmu7UbVrdS7OU7qwGKE
 l70sUqSo6XFRUT8odlh/r4DbaqF8AlLmxMVC3EoJpK05ZUI/yhDYGdNMT4ciV2+EjiXwy+VTc3
 pcUry2nxPTmlhTZ0E0fyx9by
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2020 21:41:31 -0800
IronPort-SDR: oh26hB2vaJsYM8ddJJSUZZdC0VmZfjhDONSM94K7mLPCVQqVJQCnqd0voC4ZTBSUMgJuWnHIhE
 pCSpwwQ0ngNZ7kPgP223mNkrMEKAFOMjhGyrZqEBRQaE+tvAsunp6x/BTYc9XLq+onPsJAgAcn
 jSy0sU+pvgEIuZwOjQmzUS4g7SiGRYn0TdGXjfUCYPB1musivVzE7V0QuW4veFISonrvaciQFh
 yMizUtUsBDvrhguFXt8fW0Dr76POn+B68Ni/WBfJuFdYPoXdic4JRDI/26N6MtTav4Vvu5ydxq
 bWg=
WDCIronportException: Internal
Received: from cne130336.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.61.81])
 by uls-op-cesaip02.wdc.com with ESMTP; 13 Nov 2020 21:56:51 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 0/2] riscv-to-apply queue
Date: Fri, 13 Nov 2020 21:45:07 -0800
Message-Id: <20201114054509.180352-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=58086a3e2=alistair.francis@wdc.com;
 helo=esa4.hgst.iphmx.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/14 00:56:52
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 5ececc3a0b0086c6168e12f4d032809477b30fe5:

  Merge remote-tracking branch 'remotes/dgilbert/tags/pull-hmp-20201113' into staging (2020-11-13 13:40:23 +0000)

are available in the Git repository at:

  git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20201113-1

for you to fetch changes up to deef3d2568a7fbaa62d9bee07708cf3a4dc3ac53:

  intc/ibex_plic: Ensure we don't loose interrupts (2020-11-13 21:43:48 -0800)

----------------------------------------------------------------
Two small additional fixes for the Ibex PLIC.

----------------------------------------------------------------
Alistair Francis (2):
      intc/ibex_plic: Fix some typos in the comments
      intc/ibex_plic: Ensure we don't loose interrupts

 include/hw/intc/ibex_plic.h |  1 +
 hw/intc/ibex_plic.c         | 21 ++++++++++++++++++---
 2 files changed, 19 insertions(+), 3 deletions(-)


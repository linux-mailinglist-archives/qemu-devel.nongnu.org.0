Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC682ACE6D
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 05:11:40 +0100 (CET)
Received: from localhost ([::1]:59490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcL0N-000698-93
	for lists+qemu-devel@lfdr.de; Mon, 09 Nov 2020 23:11:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=57671029a=alistair.francis@wdc.com>)
 id 1kcKxu-0004rt-Ud
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 23:09:06 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:21664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=57671029a=alistair.francis@wdc.com>)
 id 1kcKxr-0000TQ-Pn
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 23:09:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1604981593; x=1636517593;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=11rhY9JpQG3jAWSRcxsx0nHnaB6TJ5Qit5eSAq/+HCU=;
 b=Ror13eLoEoyDtq4saRGYWpmihOd4IYNzA2Nd8CYoh+FMIm17MQUwlU0Y
 Z4uV1g+uCqJguPBZSa5LOnGIhtvXKebjV5VVpwz/6n8n/dMpoNSNlTUgr
 3aCw0nAycUqootPgBZhIhcLlFoqltwsfWZdAtWwyvGQe/nbSmTxvafAse
 wgKvbReiHkn78hkL7L7SW/0Yg4op29Ey9G0CdRLYIwQp3XE3r7ouX1258
 TYtpdO4xQkCI59OOFb+jVv/20SEFsuoXVgk6KndpZyHZeOvuqsTh+rmCv
 he6kLV8kWyiD7yxlj6OsFfndjjF6IyPFFlBvNRCJiIZ0yd4jPuPRpEPu+ Q==;
IronPort-SDR: 1GiyGc4nU5pK1KllP662F6SF+FWDUnypdw286TGvNi/Q6zE6TruQcmW5PEG3bXL+Sxe16xWbqg
 8hN0LmunptD7ganim63UTW7FahN9MjMxt4upjShNyIsQb/pnxrQ80PN0pbYaaTnedcGZRYoj7K
 MSmKbssxFOGpsxv6aVxPKPlebBlG+uADTrKACzOY/0nS3BWZFe4ReKDxRJEn7Dr4VUTzMBJUDr
 UszOvm2rATtMjtVeChABqfhbRyOcJ6YGXp5KByc1elomASGj4ZQfjpar+MUiUP3qRt3cx+0Tpg
 n+I=
X-IronPort-AV: E=Sophos;i="5.77,465,1596470400"; d="scan'208";a="255803591"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 10 Nov 2020 12:13:07 +0800
IronPort-SDR: M7Ouq/9PmwS99UspN5Cd/TOYNjkgPbSdVVSTjyEL2sOmGRBn8NYIWK+8ectFs2JLAppBgoc3MU
 rmlazkm1fxGcmJPGivHJmYm4+ZMrq0WkCa9Lc8XKcCp28GsSWoDG7EqYxkFLW4JkrECi2thqnx
 uNBeOh7IqyigfyyM5uevlCkyVUYHG5YOWWbg5zR1WB69nlJQA9C+t02/OayMnQ8G613nlnfF3C
 fyYfsSs6yp/5amRMoiT4JRHkIBcV0xSZsI1hIA6oMUhA8WXofNodVMbIc+xnlaZZyARLr2y7G7
 I1UFdEqBpFX+8f7R0RktXV0k
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2020 19:55:00 -0800
IronPort-SDR: G0tVie29Sxqpx2MO0X2eis6tEp4T+MSA78f/qdz3izlBDUlAK39dhuxzoRsQuVR68tnJOcSb1i
 DngG+zimU9Qn66qtftztRYKhW3kuO4GQwuTA9ESa124MEG7TRkgmLo6Ri2N+5XC8fyKLJObRM7
 lSzo/1TORUgMIqWKgX0QYtjG/WoMdD73l5K+R4gYh0zXIL+ZJ0HlCuOMvb+3vcc/tt7uEpSpwX
 0KnSlgZBJO/MIEqNNs0mFWdxpKevjaJvv3fnv5wNIXDVgiI3BsbJojYa+gag+UWR8Ivco6awRV
 wps=
WDCIronportException: Internal
Received: from usa001882.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.60.209])
 by uls-op-cesaip01.wdc.com with ESMTP; 09 Nov 2020 20:08:59 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 0/6] riscv-to-apply queue
Date: Mon,  9 Nov 2020 19:56:57 -0800
Message-Id: <20201110035703.83786-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=57671029a=alistair.francis@wdc.com;
 helo=esa2.hgst.iphmx.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/09 23:09:00
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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

The following changes since commit 3c8c36c9087da957f580a9bb5ebf7814a753d1c6:

  Merge remote-tracking branch 'remotes/kraxel/tags/ui-20201104-pull-request' into staging (2020-11-04 16:52:17 +0000)

are available in the Git repository at:

  git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20201109

for you to fetch changes up to 96338fefc19a143abdc91f6c44f37683274b08d4:

  hw/intc/ibex_plic: Clear the claim register when read (2020-11-09 15:09:53 -0800)

----------------------------------------------------------------
This fixes two bugs in the RISC-V port. One is a bug in the
Ibex PLIC, the other fixes the Hypvervisor access functions.

----------------------------------------------------------------
Alistair Francis (6):
      target/riscv: Add a virtualised MMU Mode
      target/riscv: Set the virtualised MMU mode when doing hyp accesses
      target/riscv: Remove the HS_TWO_STAGE flag
      target/riscv: Remove the hyp load and store functions
      target/riscv: Split the Hypervisor execute load helpers
      hw/intc/ibex_plic: Clear the claim register when read

 target/riscv/cpu-param.h                |  11 ++-
 target/riscv/cpu.h                      |  19 ++++-
 target/riscv/cpu_bits.h                 |   1 -
 target/riscv/helper.h                   |   5 +-
 hw/intc/ibex_plic.c                     |   3 +
 target/riscv/cpu_helper.c               |  62 ++++++--------
 target/riscv/op_helper.c                | 124 ++-------------------------
 target/riscv/translate.c                |   2 +
 target/riscv/insn_trans/trans_rvh.c.inc | 143 ++++++++++++--------------------
 9 files changed, 115 insertions(+), 255 deletions(-)


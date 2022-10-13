Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2495FD69C
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 11:06:31 +0200 (CEST)
Received: from localhost ([::1]:46162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiuAg-0006NJ-FN
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 05:06:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1oitaV-00060E-0K
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 04:29:07 -0400
Received: from mail.loongson.cn ([114.242.206.163]:53716 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1oitaR-0004Pe-9B
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 04:29:05 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8DxvmtGzEdjCdwsAA--.18330S2; 
 Thu, 13 Oct 2022 16:28:54 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, peter.maydell@linaro.org,
 alex.bennee@linaro.org, maobibo@loongson.cn
Subject: [RISU PATCH v2 0/5] Add LoongArch architectures support
Date: Thu, 13 Oct 2022 16:28:49 +0800
Message-Id: <20221013082854.878546-1-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8DxvmtGzEdjCdwsAA--.18330S2
X-Coremail-Antispam: 1UD129KBjvJXoW7AF4DCw48AFW3XF4DZry8AFb_yoW8Gw4kpr
 W3ury5Gr18Jry2qwsxKayUWrnYvr4xWry7WFnIgr1xGrW0yr1vqr18tFyDZF15Aay8Wry0
 vr18tw1UWF13JFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

hi,

This series adds LoongArch architectures support, we had tested two
mode:
1. LoongArch host server +  LoongArch host client;
2. LoongArch host server  + qemu client.

You can find all LoongArch instructions at [1].
This series not contains all LoongArch instructions,
such as pcadd, syscalls, rdtime and jumps.

[1]:
https://github.com/loongson/LoongArch-Documentation/releases/download/2022.08.12/LoongArch-Vol1-v1.02-EN.pdf

V2:

- rewrite write_mov_ri();
- get_risuop return a RisuOp;
- test again with 1 million instructions.

Thanks.
Song Gao

Song Gao (5):
  risu: Use alternate stack
  loongarch: Add LoongArch basic test support
  loongarch: Implement risugen module
  loongarch: Add risufile with loongarch instructions
  loongarch: Add block 'safefloat' and nanbox_s()

 loongarch64.risu           | 612 +++++++++++++++++++++++++++++++++++++
 risu.c                     |  16 +-
 risu_loongarch64.c         |  50 +++
 risu_reginfo_loongarch64.c | 183 +++++++++++
 risu_reginfo_loongarch64.h |  25 ++
 risugen                    |   2 +-
 risugen_loongarch64.pm     | 509 ++++++++++++++++++++++++++++++
 test_loongarch64.s         |  92 ++++++
 8 files changed, 1487 insertions(+), 2 deletions(-)
 create mode 100644 loongarch64.risu
 create mode 100644 risu_loongarch64.c
 create mode 100644 risu_reginfo_loongarch64.c
 create mode 100644 risu_reginfo_loongarch64.h
 create mode 100644 risugen_loongarch64.pm
 create mode 100644 test_loongarch64.s

-- 
2.31.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BAB5BB701
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Sep 2022 09:45:50 +0200 (CEST)
Received: from localhost ([::1]:58146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZSWL-0001Lc-CH
	for lists+qemu-devel@lfdr.de; Sat, 17 Sep 2022 03:45:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1oZSU5-0004dz-FS
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 03:43:29 -0400
Received: from mail.loongson.cn ([114.242.206.163]:55858 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1oZSU3-0006B8-0S
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 03:43:29 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Cx72uVeiVjfgQcAA--.38083S2; 
 Sat, 17 Sep 2022 15:43:18 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, peter.maydell@linaro.org,
 alex.bennee@linaro.org, maobibo@loongson.cn
Subject: [RISU PATCH 0/5] Add LoongArch architectures support
Date: Sat, 17 Sep 2022 15:43:12 +0800
Message-Id: <20220917074317.1410274-1-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cx72uVeiVjfgQcAA--.38083S2
X-Coremail-Antispam: 1UD129KBjvJXoW7AF4DCw48AFy5ZFy3Xr13urg_yoW8Gr4xpr
 Wfury5Jr18try2qwsxKayUWr9Yvr4xWr17WFnIgryxGrW0yr1vqr18JFWDZFyUAay8Wry0
 vr18tw1jg3W3JaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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

This series adds LoongArch architectures support, we had tested two mode:
1. LoongArch host server +  LoongArch host client;
2. LoongArch host server  + qemu client.

You can find all LoongArch instructions at [1].
This series not contains all LoongArch instructions,
such as pcadd, syscalls, rdtime and jumps.

[1]: https://github.com/loongson/LoongArch-Documentation/releases/download/2022.08.12/LoongArch-Vol1-v1.02-EN.pdf


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
 risugen_loongarch64.pm     | 532 ++++++++++++++++++++++++++++++++
 test_loongarch64.s         |  92 ++++++
 8 files changed, 1510 insertions(+), 2 deletions(-)
 create mode 100644 loongarch64.risu
 create mode 100644 risu_loongarch64.c
 create mode 100644 risu_reginfo_loongarch64.c
 create mode 100644 risu_reginfo_loongarch64.h
 create mode 100644 risugen_loongarch64.pm
 create mode 100644 test_loongarch64.s

-- 
2.31.1



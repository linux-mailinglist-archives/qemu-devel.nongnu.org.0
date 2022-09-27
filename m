Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4675EBBFB
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 09:51:21 +0200 (CEST)
Received: from localhost ([::1]:36344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od5NA-0006Rr-HL
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 03:51:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1od4Oh-0002ze-84
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 02:48:54 -0400
Received: from mail.loongson.cn ([114.242.206.163]:47474 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1od4OY-0003ps-HW
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 02:48:45 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8DxPGvGnDJj8aEiAA--.2457S2; 
 Tue, 27 Sep 2022 14:48:38 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, yangxiaojuan@loongson.cn, huqi@loongson.cn,
 peter.maydell@linaro.org, alex.bennee@linaro.org, maobibo@loongson.cn
Subject: [PATCH v2 0/4] Fix some loongarch tcg bugs
Date: Tue, 27 Sep 2022 14:48:34 +0800
Message-Id: <20220927064838.3570928-1-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8DxPGvGnDJj8aEiAA--.2457S2
X-Coremail-Antispam: 1UD129KBjvdXoWrWw4DWryDKw1kuF4kAFy7KFg_yoWxGFc_WF
 WxAr98Cr48Way5GFZIkry5t345AFW8K3ZIyFWqqayxWa43XF13CFs0gan5Zr1Yva18XFn5
 AFZ7tryrCFnIqjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJ3UbIYCTnIWIevJa73UjIFyTuYvj4RJUUUUUUUU
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

Hi,

This series fix some bugs find from RISU test.

v2:
  -remove patch5 div if x/0 set dividend to 0.

Song Gao (4):
  target/loongarch: ftint_xxx insns set the result high 32bit 0xffffffff
  target/loongarch: bstrins.w need set dest register EXT_SIGN
  target/loongarch: Fix fnm{sub/add}_{s/d} set wrong flags
  target/loongarch: flogb_{s/d} add set float_flag_divbyzero

 target/loongarch/fpu_helper.c                 | 32 +++++++++++++------
 target/loongarch/insn_trans/trans_bit.c.inc   |  4 +--
 .../loongarch/insn_trans/trans_farith.c.inc   | 12 +++----
 3 files changed, 31 insertions(+), 17 deletions(-)

-- 
2.31.1


